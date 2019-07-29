IM-LAUNCH(1)                                                                            General Commands Manual                                                                           IM-LAUNCH(1)

NAME
       im-launch - launch input method end execute session program

SYNOPSIS
       im-launch SESSION-PROGRAM

DESCRIPTION
       The  im-launch  command  is  used  to  start a input method framework server daemon such as ibus-daemon, set up the appropriate environment variables for the client programs, and execute SES‐
       SION-PROGRAM such as x-session-manager.

       This command is usually not invoked from the console of a normal user but is normally invoked by the /etc/X11/Xsession.d/70im-config_launch.

TROUBLESHOOT
       If you have any problem, see the first part of ~/.xsession-errors and look for the cause.  If you are running im-config while Debian (sid) system is undergoing a major library transition, you
       may need to manually set up ~/.xinputrc with adjusted library version number etc.  Please file a bug report to the im-config package using reportbug(1) describing your resolution experience.

SEE ALSO
       im-config(8), /usr/share/doc/im-config/README.Debian.gz

AUTHOR
       This manual page was written by Aron Xu <aron@debian.org>, and Osamu Aoki <osamu@debian.org> for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                                                                          IM-LAUNCH(1)
