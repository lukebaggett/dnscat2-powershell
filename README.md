**Edit: This tool has not been updated to support the newer versions of [dnscat2](https://github.com/iagox86/dnscat2). If you experience problems, try using an [older version of dnscat2](https://github.com/iagox86/dnscat2/tree/839c9ba432472d8d58f938a477fe7e8808c96ad2).** Some updates will come in mid-December.

[dnscat2](https://github.com/iagox86/dnscat2) is a DNS covert channel tool by [@iagox86 (Ron Bowes)](https://blog.skullsecurity.org/) which is used to transfer data over DNS requests.

This is a work in progress powershell version of dnscat2.  Support for the command protocol will be added soon.

To use this script, you'll need the ruby [dnscat2 server](https://github.com/iagox86/dnscat2).

###dnscat2.ps1
    -Domain <domain>          The domain of the dnscat2 server
    -DNSServer <host>         The DNS Server [default: Windows default]
    -DNSPort -p <port>        The DNS port [default: 53]
    -Exec -e <process>        Execute the given process
    -Help                     Display this help message

