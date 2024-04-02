cupsaddsmb(8)                                                                                 Apple Inc.                                                                                 cupsaddsmb(8)

NAME
       cupsaddsmb - export printers to samba for windows clients

SYNOPSIS
       cupsaddsmb [ -H samba-server ] [ -U samba-user[%samba-password] ] [ -h cups-server[:port] ] [ -v ] -a
       cupsaddsmb [ -H samba-server ] [ -U samba-user[%samba-password] ] [ -h cups-server[:port] ] [ -v ] printer [ ...  printer ]

DESCRIPTION
       The cupsaddsmb program exports printers to the SAMBA software (version 2.2.0 or higher) for use with Windows clients.  Depending on the SAMBA configuration, you may need to provide a password
       to export the printers.  This program requires the Windows printer driver files described below.

   SAMBA CONFIGURATION
       cupsaddsmb uses the RPC-based printing support in SAMBA to provide printer drivers and PPD files to Windows client machines.  In order to use this functionality, you must first configure  the
       SAMBA smb.conf(5) file to support printing through CUPS and provide a printer driver download share, as follows:

           [global]
            load printers = yes
            printing = cups
            printcap name = cups

           [printers]
            comment = All Printers
            path = /var/spool/samba
            browseable = no
            public = yes
            guest ok = yes
            writable = no
            printable = yes

           [print$]
            comment = Printer Drivers
            path = /etc/samba/drivers
            browseable = yes
            guest ok = no
            read only = yes
            write list = root

       This configuration assumes a FHS-compliant installation of SAMBA; adjust the [printers] and [print$] share paths accordingly on your system as needed.

   MICROSOFT POSTSCRIPT DRIVERS FOR WINDOWS
       The base driver for Windows 2000 and higher is the Microsoft PostScript driver, which is available on any system running Windows 2000 or higher in the %WINDIR%\SYSTEM32\SPOOL\DRIVERS\W32X86\3
       folder for 32-bit drivers and %WINDIR%\SYSTEM32\SPOOL\DRIVERS\X64\3 folder for 64-bit drivers.

       Copy the 32-bit drivers to the /usr/share/cups/drivers directory and the 64-bit drivers to the /usr/share/cups/drivers/x64 directory exactly as named below:

           ps5ui.dll
           pscript.hlp
           pscript.ntf
           pscript5.dll

       Note: Unlike Windows, case is significant - make sure that you use the lowercase filenames shown above, otherwise cupsaddsmb will fail to export the drivers.

OPTIONS
       cupsaddsmb supports the following options:

       -H samba-server
            Specifies the SAMBA server which defaults to the CUPS server.

       -U samba-user[%samba-password]
            Specifies the SAMBA print admin username which defaults to your current username.  If the username contains a percent (%) character, then the text following the percent is treated as the
            SAMBA password to use.

       -a   Exports all known printers.  Otherwise only the named printers are exported.

       -h cups-server[:port]
            Specifies a different CUPS server to use.

       -v   Specifies that verbose information should be shown.  This is useful for debugging SAMBA configuration problems.

SEE ALSO
       rpcclient(1), smbclient(1), smbd(8), smb.conf(5), CUPS Online Help (http://localhost:631/help)

COPYRIGHT
       Copyright © 2007-2017 by Apple Inc.

11 June 2014                                                                                     CUPS                                                                                    cupsaddsmb(8)
