qshutdown(1)             General Commands Manual            qshutdown(1)

NAME
       qshutdown - An avanced shutdown tool

SYNOPSIS
       qshutdown [options]

DESCRIPTION
       qshutdown  is  a simple tool to choose a time or a number of min‐
       utes to shutdown, reboot, suspend or hibernate after.

       qshutdown will show itself 3 times as a warning if there are less
       than  70   seconds   left.  (if  1 Minute or local time +1 Minute
       was set it'll appear only once.)

       This  program  uses  qdbus   to   send   a   shutdown/reboot/sus‐
       pend/hibernate request  to  either  the  gnome-  or  kde-session-
       manager,  to HAL/ConsoleKit/DeviceKit/UPower and if none of these
       works, the command  'sudo shutdown'  will  be  used.

OPTIONS
       -h --help
              Prints options with description.

       -i     Prints information about qshutdown.

       -v     Prints all errors and warnings.

NOTES
       When  sending  the  request to HAL or ConsoleKit, or the shutdown
       command is used, the Session will never be saved. If the shutdown
       command  is  used,  the program will only be able to shutdown and
       reboot.

       If nothing happens when the shutdown- or reboot-time is  reached,
       it  means  that one lacks the rights for the shutdown command. In
       this case one can do the following: Post the following in a  ter‐
       minal:

        $ EDITOR=nano sudo -E visudo

       and add this line:

        * ALL = NOPASSWD:/sbin/shutdown

       whereas * replaces the username or %groupname.

For admins:
       If you want qshutdown to run with "parental lock" for every user,
       you can do

           $    sudo    cp    /usr/share/qshutdown/autostart/99qshutdown
       /etc/X11/Xsession.d/

       and set the option Lock_all in /root/.qshutdown/qshutdown.conf to
       true. Note that qshutdown has to  start  once   to  generate  the
       qshutdown.conf. Furthermore there is a need to do

        $ EDITOR=nano sudo -E visudo

       and add the following line to the sudoers:

        * ALL = NOPASSWD:/usr/bin/qshutdown

       If  you  should  ever  forget  your set password, just remove the
       whole line  starting  with  Password  manually  from  the  qshut‐
       down.conf.

FILES
       The  configurationfile  (and logfile) is located at ~/.qshutdown/
       (under Linux/Unix).  The maximum Number of  countdown_minutes  is
       1440 (24 hours).

KNOWN ISSUES
       There is no system tray icon for qshutdown in Ubuntu 11.04.
       SOLUTION: Type the following line in a terminal:

         $  gsettings  set  com.canonical.Unity.Panel  systray-whitelist
       "['all']"

       For most systems using the Gnome Shell a certain DBus method  has
       been  removed, thus a shutdown dialog will be likely to appear if
       qshutdown's methods have been set to automatic or to  Gnome  ses‐
       sion.  If  you do not want this shutdown dialog to appear, please
       use ConsoleKit or something else.

HINTS ON USAGE
       If you want qshutdown to stop "bugging" you, just remove the hook
       from "warnings on?".

HOTKEYS
       Ctrl+I    information window

       Ctrl+Q    Quit

       Ctrl+P    Prefereces

       Ctrl+L    write the run time once into the logfile (works
              only  if  qshutdown  quits. To make it permanent set it in
              the preferences.)

       Ctrl+S    set to shutdown

       Ctrl+R    set to restart

       Ctrl+U    set to suspend to RAM

       Ctrl+H    set to hibernate

       Ctrl+E    stop timer (only if the countdown has started and
              the admin didn't restrict the access)

       Shift+E   to edit the config file (for this a password is
              necessary. If you are a user, you can set an "empty  pass‐
              word" (leave the password field empty)).

AUTHOR
       Christian Metscher <hakaishi@web.de>

                               2013-04-20                   qshutdown(1)
