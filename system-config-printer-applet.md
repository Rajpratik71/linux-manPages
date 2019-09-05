SYSTEM-CONFIG-PRIN(1)                                                                          Man pages                                                                         SYSTEM-CONFIG-PRIN(1)

NAME
       system-config-printer-applet - print job manager

SYNOPSIS
       system-config-printer-applet [--help] [--version] [--debug]

DESCRIPTION
       system-config-printer-applet is a print job manager for CUPS. Normally it will display a printer icon in the notification area, greyed out when there are no print jobs for the current user.
       Clicking on the icon displays a simple print job manager for cancelling or reprinting jobs.

       To save memory, the applet waits first of all until the user has printed a job before putting the icon in the notification area. To invoke the print job manager before a job has been printed,
       run the applet with the --no-tray-icon option: a desktop file is provided for this, so that it should appear in the system menu.

       As well as displaying a printer icon in the notification area, the applet also provides a D-BUS server for the com.redhat.PrintDriverSelection interface, to help configure a new printer when
       it is plugged in.

OPTIONS
       --help
           Display a short usage message.

       --version
           Display the version of the applet.

       --debug
           Show debugging information.

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Author.

system-config-printer                                                                         24 Nov 2010                                                                        SYSTEM-CONFIG-PRIN(1)
