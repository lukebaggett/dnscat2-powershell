[dnscat2](https://github.com/iagox86/dnscat2) is a DNS covert channel tool by [@iagox86 (Ron Bowes)](https://blog.skullsecurity.org/) which is used to transfer data over DNS requests.

This is a work in progress powershell version of dnscat2.

To use this dnscat2 client, you'll need to install the ruby [dnscat2 server](https://github.com/iagox86/dnscat2).

### Start-Dnscat2

    -Domain <String>          The Domain being used by the dnscat2 server.
    -DNSServer <String>       The hostname or IP Address to send DNS queries to. (Default: Set by Windows)
    -DNSPort <Int32>          The port to send DNS queries to. (Default: 53)
    
    -Command <Switch>         Start a command session. (Default)
    -Exec <String>            Link the I/O of a process with the Dnscat2 session.
    -Console <Switch>         Link the I/O of the console with the Dnscat2 session.
    
    -Delay <Int32>            Set a delay between each request, in milliseconds. (Default: 0)
    -MaxPacketSize <Int32>    Maximum length of a dnscat2 packet. (Default: 240)
    -Name <String>            The name of your dnscat2 session. (Default: hostname)
