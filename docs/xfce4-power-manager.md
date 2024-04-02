XFCE4-POWER-MANAGER(1)                                                           General Commands Manual                                                           XFCE4-POWER-MANAGER(1)

NAME
       xfce4-power-manager - The Xfce 4 Power manager

SYNOPSIS
       xfce4-power-manager [options]

DESCRIPTION
       xfce4-power-manager  manages  the  power  sources  on the computer and the devices that can be controlled to reduce their power consumption (such as LCD brightness level, monitor
       sleep). In addition,  xfce4-power-manager provides a set of freedesktop-compliant DBus interfaces to inform other applications about current power level so that  they can  adjust
       their  power  consumption, and it provides the inhibit  interface which allows applications to prevent automatic sleep actions via the power manager; as an example, the operating
       system's package manager should make use of this interface while it is performing update operations.
       You can run xfce4-power-manager from the command line without specifying any extra arguments.

OPTIONS
       --no-daemon
              Starts the power manager in non-daemon mode: useful for debugging.

       --debug
              Have the power manager print debug messages to the console; useful if you have to send in a bug report.

       --dump Have the power manager print the configuration information to the console.

       --restart
              Causes the running power manager to restart.

       --customize
              Shows the configuration dialog.

       --quit Causes any running instance of xfce4-power-manager to exit.

       --version
              Show the version information.

BUGS
       Please report any bugs to http://bugzilla.xfce.org/.  Development discussion should be conducted on the xfce4-dev@xfce.org  mailing  list.   Usage  related  questions  should  be
       directed to the xfce@xfce.org mailing list. See: https://mail.xfce.org/mailman/listinfo/

HOMEPAGE
       http://goodies.xfce.org/

AUTHOR
       Ali Abdallah <aliov@xfce.org>, Eric Koegel <eric@xfce.org>, Simon Steinbeiss <simon@xfce.org>, Harald Judt <h.judt@gmx.at>

MANPAGE AUTHORS
       Ali Abdallah <aliov@xfce.org>, Robby Workman <rworkman@slackware.com>, Eric Koegel <eric@xfce.org>.

9 August 2014                                                                         Version 1.3.1                                                                XFCE4-POWER-MANAGER(1)
