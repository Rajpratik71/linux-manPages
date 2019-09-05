PPPCONFIG(8)                                                                            System Manager's Manual                                                                           PPPCONFIG(8)

NAME
       pppconfig - configure pppd to connect to the Internet

SYNOPSIS
       pppconfig [--version] | [--help] | [[--dialog] | [--whiptail] | [--gdialog] [--noname] | [providername]]

DESCRIPTION
       pppconfig  is a dialog based interactive, menu driven utility to help automate setting up a dial out ppp connection.  It provides extensive explanations at each step.  pppconfig supports PAP,
       CHAP, and chat methods of authentication.  It uses the standard ppp configuration files and sets ppp up so that the standard pon and poff commands can be used to control ppp.   Some  features
       supported by pppconfig are:
       - Multiple ISP's with separate nameservers.
       - Modem detection.
       - Dynamic DNS.
       - Dial on demand.
       - Allow non-root users to run ppp.
       - Uses the gdialog GUI dialog replacement if possible.

       Before  running pppconfig you should know what sort of authentication your isp requires, the username and password that they want you to use, and the phone number.  If they require you to use
       chat authentication, you will also need to know the login and password prompts and any other prompts and responses required for login.  If you can't get this information  from  your  isp  you
       could try dialing in with minicom and working through the procedure until you get the garbage that indicates that ppp has started on the other end.

       pppconfig allows you to configure connections to multiple providers.  For example, you might call your isp 'provider', your employer 'theoffice' and your university 'theschool'.  Then you can
       connect to your isp with 'pon', your office with 'pon theoffice', and your university with 'pon theschool'.

       It can determine which serial port your modem is on, but the serial port must already be configured.  This is normally done when installing Linux.

       It can help you set your nameservers, or, if your ISP uses 'dynamic DNS', it can set up ppp to use that.

       It can configure ppp for demand dialing, so that your ppp connection will come up automatically.  It will not, however, start pppd for you.  You must still start pppd yourself ('pon' will  do
       it).  Pppd will then wait in the background for you to attempt to access the Net and bring up the link.

       If  you  select "Static" in the "Configure Nameservers" screen pppconfig will create a file in the /etc/ppp/resolv directory named after the provider you are configuring and containing "name‐
       server" lines for each of the IP numbers you gave.  This file will be substituted for /etc/resolv.conf when the connection comes up.  The provider name is passed in the  ipparam  variable  so
       that 0dns-up knows which file to use.  The original resolv.conf will be put back when the connection goes down.  You can edit this file if you wish and add such things as "search" or "domain"
       directives or additional nameservers.  Be sure and read the resolv.conf man page first, though.  The "search" and "domain" directives probably do not do what you think they do.

       If you select "dynamic" in the "Configure Nameservers" screen pppconfig will configure pppd for 'dynamic DNS' and create a file in the /etc/ppp/resolv directory named after the  provider  you
       are configuring but containing nothing.  When the connection comes up the nameservers supplied by your ISP will be added and the file substituted for /etc/resolv.conf.  You can edit this file
       if you wish and add such things as "search" or "domain" directives or additional nameservers.

       If you select "None" in the "Configure Nameservers" screen pppconfig will create no file in /etc/ppp/resolv and will leave /etc/resolv.conf alone. ipparam is not set to the provider name  and
       so is free for the administrator to use.

FILES
       /etc/ppp/peers/provider is the standard pppd options file for the default service provider.

       /etc/ppp/peers/<name> is the pppd options file for the provider that you have named <name>.

       /etc/ppp/peers/provider.bak is a backup copy of /etc/ppp/peers/provider.

       /etc/chatscripts/provider is the standard chat script for the default service provider.

       /etc/chatscripts/<name> is the chat script for the provider that you have named <name>.

       /etc/chatscripts/provider.bak is a backup copy of /etc/chatscripts/provider.

       /etc/ppp/resolv is a directory where resolv.conf files for each provider are stored.

       /etc/ppp/ip-up.d/0dns-up is a script that arranges for the correct resolv.conf file to be copied into place when a connection comes up.

       /etc/ppp/ip-down.d/0dns-down is a script that arranges for the original resolv.conf file to be copied into place when a connection goes down.

       /etc/init.d/dns-clean is a script that runs 0dns-down at bootup to clean up any mess left by a crash.

       /var/run/pppconfig is a directory where temporary files created by 0dns-up are stored.

       /var/run/pppconfig/resolv.conf.bak.<provider> is a backup copy of the original resolv.conf file.  0dns-down restores /etc/resolv.conf from it.

       /var/run/pppconfig/0dns.<provider> is a backup copy of the resolv.conf file for <provider>.  0dns-down uses it to determine if /etc/resolv.conf has been overwritten by another process.

       /etc/ppp/pap-secrets and /etc/ppp/chap-secrets are described in the pppd documentation.  pppconfig may add lines to these files and will change lines that it previously added.

NOTES
       pppconfig requires pppd 2.3.7 or higher.

TO DO
       Add full support for MSCHAP.

BUGS
       Don't tell pppconfig to find your modem while pppd is running.

SEE ALSO
       chat(8), gpppon(1), plog(1), poff(1), pon(1), pppd(8), and whiptail(1).

AUTHOR
       pppconfig was written by John Hasler <jhasler@debian.org>.

COPYRIGHT
       This man page may be treated as if it were in the public domain. I waive all rights.

Debian GNU/Linux                                                                            Version 2.3.16                                                                                PPPCONFIG(8)
