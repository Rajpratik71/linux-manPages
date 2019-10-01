cupsaddsmb(8)                                                                                     Apple Inc.                                                                                    cupsaddsmb(8)



NAME
       cupsaddsmb - export printers to samba for windows clients


SYNOPSIS
       cupsaddsmb [ -H samba-server ] [ -U samba-user[%samba-password] ] [ -h cups-server[:port] ] [ -v ] -a
       cupsaddsmb [ -H samba-server ] [ -U samba-user[%samba-password] ] [ -h cups-server[:port] ] [ -v ] printer [ ... printer ]


DESCRIPTION
       cupsaddsmb  exports  printers  to  the  SAMBA  software (version 2.2.0 or higher) for use with Windows clients. Depending on the SAMBA configuration, you may need to provide a password to export the
       printers. This program requires the Windows printer driver files described below.


OPTIONS
       cupsaddsmb supports the following options:

       -H samba-server
            Specifies the SAMBA server which defaults to the CUPS server.

       -U samba-user[%samba-password]
            Specifies the SAMBA print admin username which defaults to your current username. If the username contains a percent (%) character, then the text following the percent is treated as  the  SAMBA
            password to use.

       -a
            Exports all known printers. Otherwise only the named printers are exported.

       -h cups-server[:port]
            Specifies a different CUPS server to use.

       -v
            Specifies that verbose information should be shown. This is useful for debugging SAMBA configuration problems.


SAMBA CONFIGURATION
       cupsaddsmb  uses  the  new RPC-based printing support in SAMBA 2.2.x to provide printer drivers and PPD files to Windows client machines. In order to use this functionality, you must first configure
       the SAMBA smb.conf(5) file to support printing through CUPS and provide a printer driver download share, as follows:

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
       The base driver for Windows 2000 and higher is the Microsoft PostScript driver, which is available on any system running Windows 2000 or higher in the %WINDIR%\SYSTEM32\SPOOL\DRIVERS\W32X86\3 folder
       for 32-bit drivers and %WINDIR%\SYSTEM32\SPOOL\DRIVERS\X64\3 folder for 64-bit drivers.

       The  CUPS  printer driver is preferred over the Microsoft driver since it supports the page-label, job-billing, and job-hold-until options fully on all printers. However, currently only Windows 2000
       and higher is supported by the Microsoft driver, so you will also need to get the Adobe driver to support Windows 95, 98, and Me clients. The Adobe and Microsoft drivers for Windows 2000 are identi‐
       cal.

       Once you have extracted the driver files, copy the 32-bit drivers to the /usr/share/cups/drivers directory and the 64-bit drivers to the /usr/share/cups/drivers/x64 directory exactly as named below:

           [Windows 2000 and higher]
           ps5ui.dll
           pscript.hlp
           pscript.ntf
           pscript5.dll

       Note: Unlike Windows, case is significant - make sure that you use the lowercase filenames shown above, otherwise cupsaddsmb will fail to export the drivers.


CUPS POSTSCRIPT DRIVERS FOR WINDOWS
       cupsaddsmb can use the CUPS v6 PostScript printer driver for Windows, which is available for download from the CUPS web site.

       The  CUPS  printer  driver  is preferred over the Adobe and Microsoft drivers since it supports the page-label, job-billing, and job-hold-until options fully on all printers. However, currently only
       Windows 2000 and higher is supported by the CUPS driver, so you will also need to get the Adobe driver to support Windows 95, 98, and Me clients.

       Once you have extracted the driver files, copy the 32-bit drivers to the /usr/share/cups/drivers directory and the 64-bit drivers to the /usr/share/cups/drivers/x64 directory exactly as named below:

           [Windows 2000 and higher]
           cups6.inf (from www.cups.org)
           cups6.ini (from www.cups.org)
           cupsps6.dll (from www.cups.org)
           cupsui6.dll (from www.cups.org)
           ps5ui.dll (from your Windows system)
           pscript.hlp (from your Windows system)
           pscript.ntf (from your Windows system)
           pscript5.dll (from your Windows system)

       Note: Unlike Windows, case is significant - make sure that you use the lowercase filenames shown above, otherwise cupsaddsmb will fail to export the drivers.


ADOBE POSTSCRIPT DRIVERS FOR WINDOWS 95, 98, AND ME
       cupsaddsmb can use the Adobe PostScript printer driver for Windows 95, 98, and ME, which are available for download from the Adobe web site (http://www.adobe.com).

       The Adobe driver does not support the page-label, job-billing, or job-hold-until options.

       Once you have installed the driver on a Windows system, copy the following files to the /usr/share/cups/drivers directory exactly as named below:

           [Windows 95, 98, and Me]
           ADFONTS.MFM
           ADOBEPS4.DRV
           ADOBEPS4.HLP
           ICONLIB.DLL
           PSMON.DLL

       Note: Unlike Windows, case is significant - make sure that you use the UPPERCASE filenames shown above, otherwise cupsaddsmb will fail to export the drivers.


KNOWN ISSUES
       Getting the full set of Windows driver files should be easier.


SEE ALSO
       smbd(8), smb.conf(5), http://localhost:631/help
       http://www.cups.org/windows/


COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



25 July 2007                                                                                         CUPS                                                                                       cupsaddsmb(8)
