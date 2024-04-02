KDESU(1)                                                                                      KDE User's Manual                                                                                      KDESU(1)



NAME
       kdesu - Runs a program with elevated privileges

SYNOPSIS
       kdesu [-c command] [-d] [-f file] [-i icon name] [-n] [-p priority] [-r] [-s] [-t] [-u user] [--noignorebutton] [--attach winid]

       kdesu [KDE Generic Options] [Qt Generic Options]

DESCRIPTION
       KDE su is a graphical front end for the UNIX®su command for the K Desktop Environment. It allows you to run a program as different user by supplying the password for that user.  KDE su is an
       unprivileged program; it uses the system's su.

       KDE su has one additional feature: it can optionally remember passwords for you. If you are using this feature, you only need to enter the password once for each command.

       This program is meant to be started from the command line or from .desktop files.

       Since kdesu is no longer installed in
        $(kde4-config --prefix)/bin but in kde4-config --path libexec and therefore not in your Path, you have to use $(kde4-config --path libexec)kdesu to launch kdesu.

OPTIONS
       -c command
           This specifies the command to run as root. It has to be passed in one argument. So if, for example, you want to start a new file manager, you would enter at the prompt: $(kde4-config --path
           libexec)kdesu -c  Dolphin

       -d
           Show debug information.

       -f file
           This option allow efficient use of KDE su in .desktop files. It tells KDE su to examine the file specified by file. If this file is writable by the current user, KDE su will execute the command
           as the current user. If it is not writable, the command is executed as user user (defaults to root).

           file is evaluated like this: if file starts with a /, it is taken as an absolute filename. Otherwise, it is taken as the name of a global KDE configuration file.

       -i icon name
           Specify icon to use in the password dialog. You may specify just the name, without any extension.

       -n
           Do not keep the password. This disables the keep password checkbox in the password dialog.

       -p priority
           Set priority value. The priority is an arbitrary number between 0 and 100, where 100 means highest priority, and 0 means lowest. The default is 50.

       -r
           Use realtime scheduling.

       -s
           Stop the kdesu daemon. This is the daemon that caches successful passwords in the background. This feature may also be disabled with -n when KDE su is initially run.

       -t
           Enable terminal output. This disables password keeping. This is largely for debugging purposes; if you want to run a console mode app, use the standard su instead.

       -u  user
           While the most common use for KDE su is to run a command as the superuser, you can supply any user name and the appropriate password.

       --noignorebutton
           Do not display an ignore button.

       --attach  winid
           Makes the dialog transient for an X app specified by winid.

SEE ALSO
       su(1)

       More detailed user documentation is available from help:/kdesu (either enter this URL into Konqueror, or run khelpcenter help:/kdesu).

EXAMPLES
       Run kfmclient as user jim, and show the Konqueror icon in the password dialog:

           $(kde4-config --path libexec)kdesu -u jim -i konqueror kfmclient

AUTHORS
       KDE su was written by Geert Jansen<jansen@kde.org> and Pietro Iglio<iglio@fub.it>.

AUTHOR
       Lauri Watts <lauri@kde.org>
           Author.



K Desktop Environment                                                                             2010-09-18                                                                                         KDESU(1)
