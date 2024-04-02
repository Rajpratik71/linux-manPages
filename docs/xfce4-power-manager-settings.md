XFCE4-POWER-MANAGER(1)                                                                    1.3.1"                                                                   XFCE4-POWER-MANAGER(1)

NAME
       xfce4-power-manager-settings - Settings dialog for the Xfce 4 Power manager

SYNOPSIS
       xfce4-power-manager-settings [options]

DESCRIPTION
       xfce4-power-manager-settings is a utility that comes with the Xfce4 power manager to access/change its configuration.  It is a separate program that uses xfconf to load/save set‐
       tings according to the user's choices.  xfce4-power-manager-settings requires the Xfce4 power manager to be running because it connects to it via DBus and gets information  about
       which  settings should and should not be displayed; for  example,  the xfce4-power-manager-settings utility will not show the LCD brightness settings if no device was detected by
       the running instance of the Xfce4 power manager.
       You can run xfce4-power-manager-settings from the command line without specifying any extra arguments.

OPTIONS
       --debug
              Have the power manager print debug messages to the console; useful if you have to send in a bug report.

       --socket-id=SOCKET ID
              Settings manager socket, used when xfce4-power-manager-settings is embedded in the settings manager.

       --device-id=UpDevice object path
              Display a specific device by a specific UPower UpDevice object path.

BUGS
       Please report any bugs to http://bugzilla.xfce.org/.  Development discussion should be conducted on the xfce4-dev@xfce.org  mailing  list.   Usage  related  questions  should  be
       directed to the xfce@xfce.org mailing list. See: https://mail.xfce.org/mailman/listinfo/

HOMEPAGE
       http://goodies.xfce.org/

AUTHOR
       Ali Abdallah <aliov@xfce.org>, Eric Koegel <eric@xfce.org>, Simon Steinbeiss <simon@xfce.org>, Harald Judt <h.judt@gmx.at>

MANPAGE AUTHORS
       Ali Abdallah <aliov@xfce.org>, Robby Workman <rworkman@slackware.com>, Eric Koegel <eric@xfce.org>.

Version                                                                                                                                                            XFCE4-POWER-MANAGER(1)
