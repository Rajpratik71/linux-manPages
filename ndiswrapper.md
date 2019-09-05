NDISWRAPPER(8)                                                System Manager's Manual                                               NDISWRAPPER(8)

NAME
       ndiswrapper - Linux kernel module and user space tool to load and run Windows XP drivers for wireless cards

SYNOPSIS
       ndiswrapper

DESCRIPTION
       ndiswrapper is two parts: user space tool that is used to install Windows XP drivers and kernel module to load the Windows XP drivers. Both
       are called ndiswrapper.

ndiswrapper - tool
       The user space tool (/usr/sbin/ndiswrapper) is used whenever a new Windows XP driver is to be installed. This program takes  the  following
       options:

       OPTIONS

       -i <inf file>
              installs new Windows XP driver, where <inf file> is full path to INF file for that driver.

       -l     lists the currently installed drivers.

       -e <driver>
              removes an installed Windows XP driver named <driver>.

       -m     writes an alias for wlan0 (default wireless device) into module configuration file so that ndiswrapper kernel module is loaded auto‐
              matically when this interface is used.

ndiswrapper - kernel module
       The kernel module loads the installed Windows drivers and executes them so that the wireless cards can be used in Linux. The  module  takes
       the following options:

       OPTIONS

       if_name=<basename>
              The default basename for the interface is wlan%d, so that the wireless cards will be configured as wlan0, wlan1, ... (%d is replaced
              with lowest available number). You may use any other basename or fixed name, such as eth%d, ndis2 etc.

       proc_uid=<uid>
              The module creates files in /proc/net/ndiswrapper that provide some useful information. These files are created so that they can  be
              read  only  by  root  by default. If some other user needs to access these files without having to login as root, then replace <uid>
              with the user ID of that user.

       proc_gid=<gid>
              The module creates files in /proc/net/ndiswrapper that provide some useful information. These files are created so that they can  be
              read  only  by  people  in root group by default. If users from other groups need to access these files, then replace <gid> with the
              group ID of those users.

              ndiswrapper kernel module uses loadndisdriver user space tool to load all the Windows drivers. This tool is not  to  be  used  under
              normal  circumstances.  Only when ndiswrapper module is already loaded and a new Windows XP driver is installed (by ndiswrapper user
              space tool) and you want the kernel module to load that driver without having to unload the module that you need to use it.

AUTHOR
       This manual page was written by Giridhar Pemmasani <ndiswrapper-general@lists.sourceforge.net>, for the Debian project (but may be used  by
       others).

                                                                   June 25, 2004                                                    NDISWRAPPER(8)
