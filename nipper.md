nipper(1)                                                     General Commands Manual                                                    nipper(1)

NAME
       nipper - Network Infrastructure Parser. Produces reports based of network device configuration file settings.

SYNOPSIS
       nipper [OPTIONS]

DESCRIPTION
       Nipper  processes network infrastructure device configuration files, performs a security audit and produces a report based on the findings.
       The default report will contain sections on the security related issues identified, the configuration of the device and an appendicies with
       additional information. Nipper currently supports the following device types:

       * Cisco Switches (IOS)                  * Juniper NetScreen Firewall
       * Cisco Routers (IOS)                   * CheckPointer Firewall-1
       * Cisco Catalyst (IOS)                  * Nortel Passport
       * Cisco Firewall (PIX)                  * Sonicwall Firewall
       * Cisco Firewall (ASA)
       * Cisco Firewall (FWSM)
       * Cisco Catalyst (CatOS)
       * Cisco Catalyst (NMP)
       * Cisco Content Service Switches

OPTIONS
       --help For help on all the options.

EXAMPLES
       To produce an HTML formatted report for a Juniper NetScreen device:

       nipper --screenos --input=config.txt --output=report.html

       To produce an XML formatted report for a Cisco PIX firewall:

       nipper --pix --xml --input=pix-config.txt --output=report.xml

       To produce an HTML formatted report for a CheckPoint Firewall-1:

       nipper --fw1 --input=/root/config-backups/fw1/conf/ --output=report.html

       To produce an HTML formatted report for a Cisco IOS-based router using an external configuration file:

       nipper --config=nipper.conf --input=router.txt --output=report.html

AUTHOR
       Nipper was developed by Ian Ventura-Whiting (Fizz).

COPYRIGHT
       Copyright © 2006-2008 Ian Ventura-Whiting.
       This  is  free  software.   You  may  redistribute  copies  of  it  under  the  terms  of  the  GNU  General  Public  License  v3  or above
       <http://www.gnu.org/licenses/gpl.html>. There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       nipper.conf(5)

                                                                   January 2008                                                          nipper(1)
