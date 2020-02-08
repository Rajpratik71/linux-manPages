vnclicense(1)                                     VNC                                    vnclicense(1)

NAME
       vnclicense - VNC® Server licensing utility

SYNOPSIS
       vnclicense [OPTION...] COMMAND

DESCRIPTION
       vnclicense  applies  license  key(s)  to VNC Server, and performs related auxiliary operations.
       Visit https://www.realvnc.com/docs/faq/#licensing for more on licensing.

       Run vnclicense -add KEY to apply a license key.  Note this operation can also be performed  via
       the VNC Server user interface. KEY must either be:

       • A license key code consisting of 25 alphanumeric characters, divided by hyphens into 5 groups
         of 5 each, for example XXXXX-XXXXX-XXXXX-XXXXX-XXXXX.

       • A license key file with a .vnclicense extension, containing a license key with a serial  num‐
         ber and a signature from RealVNC.

COMMANDS
       Valid commands are:

       -add KEY
              Applies  KEY to VNC Server; note vnclicense must be run with elevated privileges. By de‐
              fault, a form of the license key (modified to incorporate the MAC address) is stored  in
              /etc/vnc  (in a licensekey file for a license key code, and in the licensekeys directory
              for a license key file).

              Note that if VNC Server is hosted on a network share, you should specify the  LicenseDir
              parameter to nominate /<install-dir>/vnc/ instead; see Options for more information.

       -check Displays  the  total number of computers you are licensed to control. The number of com‐
              puters equates to the number of times you can start VNC Server in Virtual Mode  on  this
              computer.

       -info XXXXX-XXXXX-XXXXX-XXXXX-XXXXX | serial-number
              Lists  the  features, number of computers, and expiry dates (if any) of a particular li‐
              cense key.

              To find out the serial-number of a license key file, use -list. To find out the 25 char‐
              acters of a license key code, sign in to your RealVNC account.

       -list  Lists  the features, number of computers, and expiry dates (if any) of all license keys,
              in the order they were applied to VNC Server.

       -reload
              Re-applies all license keys and configuration files to  all  running  instances  of  VNC
              Server  started  by the current user. Run vnclicense -reload with elevated privileges to
              do the same for all users. See also Options.

       -remove [order-number | XXXXX-XXXXX-XXXXX-XXXXX-XXXXX | serial-number]
              Removes a particular license key; note elevated privileges are required.  You  can  omit
              the argument if only one license key has been applied.

              To  find  out  the  order-number of a license key, or the serial-number of a license key
              file, use -list. To find out the 25 characters in a license key code, sign  in  to  your
              RealVNC account.

OPTIONS
       Options are parameters, and also the following:

       -reload
              Use  as  an option in order to cause an -add or -remove operation to take effect immedi‐
              ately, for example:

                 vnclicense -reload -add KEY

              If omitted, a license key may not be applied until a VNC Viewer connects,  or  until  an
              hourly check is performed.

       To see a list of valid parameters, run vnclicense -help.

SEE ALSO
       vncserver-x11(1), vncserver-x11-serviced(1), vncserver-virtual(1), vncserver-virtuald(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC  and  VNC  are  trademarks  of RealVNC Ltd and are protected by trademark registrations
       and/or pending trademark applications in the European Union, United States of America and other
       jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                    June 2018                                 vnclicense(1)
