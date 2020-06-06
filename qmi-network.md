QMI-NETWORK(1)                                                                                  User Commands                                                                                  QMI-NETWORK(1)



NAME
       qmi-network - Simple network management of QMI devices

SYNOPSIS
       qmi-network [OPTIONS] [DEVICE] [COMMAND]

DESCRIPTION
       Simple network management of QMI devices

   Commands:
       start  Start network connection

       stop   Stop network connection

       status Query network connection status

OPTIONS
       --profile=[PATH]
              Use the profile in the specified path

       --help Show help options

       --version
              Show version

       Notes:

              1) [DEVICE] is given as the full path to the cdc-wdm character device, e.g.:

              /dev/cdc-wdm0

              2) The qmi-network script requires a profile to work. Unless explicitly specified with `--profile', the file is assumed to be available in the following path:

              /etc/qmi-network.conf

              3) The APN to use should be configured in the profile, in the following way (e.g. assuming APN is called 'internet'):

              APN=internet

              4) Optional APN user/password strings may be given in the following way:

              APN_USER=user APN_PASS=password

              5) If you want to instruct the qmi-network script to use the qmi-proxy setup, you can do so by configuring the following line in the profile:

              PROXY=yes

              6) Once the qmi-network script reports a successful connection you still need to run a DHCP client on the associated WWAN network interface.

COPYRIGHT
       Copyright (2013-2017) Aleksander Morgado License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for qmi-network is maintained as a Texinfo manual.  If the info and qmi-network programs are properly installed at your site, the command

              info qmi-network

       should give you access to the complete manual.



qmi-network 1.18.0                                                                                March 2017                                                                                   QMI-NETWORK(1)
