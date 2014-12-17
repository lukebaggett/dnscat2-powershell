[dnscat2](https://github.com/iagox86/dnscat2) is a DNS covert channel tool by [@iagox86 (Ron Bowes)](https://blog.skullsecurity.org/) which is used to transfer data over DNS requests.

This is a work in progress powershell version of dnscat2.  Support for the command protocol will be added soon.

To use this script, you'll need the ruby [dnscat2 server](https://github.com/iagox86/dnscat2).

###dnscat2.ps1
    -Domain <domain>          The domain of the dnscat2 server
    -DNSServer <host>         The DNS Server [default: 10.1.1.1]
    -DNSPort -p <port>        The DNS port [default: 53]
    -Exec -e <process>        Execute the given process
    -Help                     Display this help message

