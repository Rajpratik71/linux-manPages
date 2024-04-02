Ekiga(1)                                                                                         Version 2.00                                                                                        Ekiga(1)



NAME
       Ekiga - SIP and H.323 Voice over IP and Videoconferencing for UN*X

SYNOPSIS
       ekiga [-d level] [-c URL]

DESCRIPTION
       Ekiga is a SIP and H.323 VoIP, IP Telephony and Video Conferencing application which complies to the SIP and H.323 protocols. It can connect to a variety of other SIP and H323 applications including
       specific hardware. Ekiga can work with or without a webcam, and is able to create pure audio communications or traditional audio+video communications. Ekiga was formerly known as GnomeMeeting. Ekiga
       has  been  designed  for the GNOME desktop and therefore uses gconfd-2(1) for storing its userdata. It offers to configure almost every option from within the GUI. Command-line options include -d to
       turn on debugging during calls.  -c to call another URL.

OPTIONS
       -d level
              turn on debugging (on the console), level should be between 1 and 4.

       -c URL Calls the given URL. Ekiga can be running or not when invoking that option. SIP, H.323 and CALLTO URLs are supported.


FILES
       /etc/gconf/gconf.xml.defaults/apps/ekiga/
              The system wide configuration file. See gconf-config(1) for further details on gconf. (The actual place can differ depending on your system's configuration)
       ~/.gconf/apps/ekiga
              Per user configuration file. See gconf-config(1) for further details.

ENVIRONMENT
       On startup Ekiga reads the system-wide gconf schemas (like every other GNOME2 app should do) from /etc/gconf/gconf.xml.defaults/apps.  Every modification of the gconf keys using the  GUI,  gconftool
       or gconf-editor is reflected in real-time by Ekiga.


DOCUMENTATION
       More documentation is available in the manual available through Ekiga's Help menu. There is also a FAQ at: http://www.ekiga.org


GETTING HELP
       Feel free to join #ekiga on irc.gnome.org (GIMPnet) or the ML at:

       http://mail.gnome.org/mailman/listinfo/ekiga-list

       after having read the FAQ at

       http://www.ekiga.org/ .


AUTHOR
       Damien Sandras <dsandras at seconix dot com>


OTHER INFO
       The webpage for Ekiga is at http://www.ekiga.org.  You can find info about Ekiga there and download the latest version.  Either as packages for all major distributions or as sourcecode. Patched ver‐
       sion of the libs are available, if necessary.

COPYRIGHT
       Copyright © 2000-2008 Damien Sandras
       This is free software licensed under the GPLv2; see the LICENSE file in the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       gconf-config(1), gconfd-1(1), gconfd-2(1), gconftool-1(1), gconftool-2(1), gconfigger(1)




Linux                                                                                          10 January 2006                                                                                       Ekiga(1)
