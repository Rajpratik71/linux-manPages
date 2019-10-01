cups-browsed(8)                                                                                                                                                                               cups-browsed(8)



NAME
       cups-browsed - A daemon for browsing the Bonjour broadcasts of shared, remote CUPS printers

SYNOPSIS
       cups-browsed [-v | -d | --debug]


DESCRIPTION
       cups-browsed has three independently switchable functions:

       1.  Browse Bonjour broadcasts of remote printers and create/remove local raw queues pointing to these printers.

       2.  Browse CUPS broadcasts of remote printers and create/remove local raw queues pointing to these printers.

       3.  Broadcast local queues with the CUPS protocol.

OPTIONS
       -v, -d, --debug
              Debug mode

FILES
       /etc/cups/cups-browsed.conf

NOTES
       Please take references to cups 1.6.x to include newer versions.  Similarily, cups 1.5.x is intended to encompass older versions too.

       In  environments  with  only  cups 1.6.x servers and clients (plus cups-browsed on either server or client or both) the function described in 1.  enables the automatic discovery of remote queues and
       their display in printing dialogues of applications and with command line tools.

       The facility provided by 3. means that servers running cups 1.6.x plus cups-browsed can broadcast their local queues so that clients with cups 1.5.x get these  queues  automatically  available.  The
       outcome  of 2. is that clients running cups 1.6.x plus cups-browsed can use the CUPS broadcasts from servers with cups 1.5.x. As with browsing of Bonjour broadcasts, the created local raw queues are
       available to applications and command line tools.

SEE ALSO
       cups-browsed.conf(5)

       /usr/share/doc/cups-filters-1.0.35/README

AUTHOR
       The authors of cups-browsed are listed in /usr/share/doc/cups-filters-1.0.35/AUTHORS.

       This manual page was written for the Debian Project, but it may be used by others.



                                                                                                 29 June 2013                                                                                 cups-browsed(8)
