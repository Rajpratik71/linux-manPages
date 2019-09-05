WLANCTL-NG(8)                                                 System Manager's Manual                                                WLANCTL-NG(8)

NAME
       wlanctl-ng - control utility for linux-wlan-ng 802.11 devices

SYNOPSIS
       wlanctl-ng interface|verson|commands|mibs cmd cmdarg [cmdarg..]

DESCRIPTION
       The wlanctl-ng utility program is used to set up linux-wlan-ng 802.11 devices. linux-wlan-ng devices are configured using a MIB.

       Only experts will want to use this program, as it is quite complicated.  Everyone else edits a config file and uses a script that runs this
       program as necessary.

OPTIONS
       commands
              Output a list of all available commands.

       mibs   Outputs a list of available mibs.

       version
              Outputs the version of the program.

       interface
              The name of a wireless network interface, such as wlan0.

SEE ALSO
       /usr/share/doc/linux-wlan-ng/README and README.Debian.

AUTHOR
       This minimal man page was written by Joey Hess.

                                                                                                                                     WLANCTL-NG(8)
