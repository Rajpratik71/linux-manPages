ABRT-ACTION-SAVE-(1)                                                                             ABRT Manual                                                                             ABRT-ACTION-SAVE-(1)



NAME
       abrt-action-save-kernel-data - Creates uReport mandatory files for kernel oopses.

SYNOPSIS
       abrt-action-save-kernel-data

DESCRIPTION
       The tool reads problem directory DIR. It analyzes contents of kernel element, checks database of installed packages, and creates new elements pkg_name, pkg_arch, pkg_version, pkg_release.

       These files are required by reporter-ureporter (mandatory in uReport).

   Integration with ABRT events
       This tool can be used as an ABRT reporter. Example fragment for /etc/libreport/report_event.conf:

           # Determine in which package/component the crash happened (if not yet done):
           EVENT=post-create analyzer=Kerneloops
                   abrt-action-save-kernel-data

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                             ABRT-ACTION-SAVE-(1)
