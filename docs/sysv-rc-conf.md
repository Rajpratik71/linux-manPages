SYSV-RC-CONF(8)                                                                                                                    SYSV-RC-CONF(8)

NAME
       sysv-rc-conf - Run-level configuration for SysV like init script links

SYNOPSIS
       sysv-rc-conf [ options ]

       sysv-rc-conf  --list  [ service ]

       sysv-rc-conf [ --level levels ] service <on|off>

DESCRIPTION
       sysv-rc-conf gives an easy to use interface for managing "/etc/rc{runlevel}.d/" symlinks. The interface comes in two different flavors, one
       that simply allows turning services on or off and another that allows for more fine tuned management of the symlinks. It's a replacement
       for programs like ntsysv(8) or rcconf(8).

       sysv-rc-conf can also be used at the command line when the desired changes to the symlinks are already known. The syntax is borrowed from
       chkconfig(8), although it does not follow it exactly.

GENERAL OPTIONS
       -c DIRECTORY, --cache=DIRECTORY
           The directory where the priority numbers, old runlevel configuration, etc.  should be stored. This defaults to "/var/lib/sysv-rc-conf".
           See the FILES section below and the --Purge option.

       -r DIRECTORY, --root=DIRECTORY
           The root directory to use. This defaults to "/". This comes in handy if the root file system is mounted somewhere else, such as when
           using a rescue disk.

       -P, --Purge
           Purge the information stored in the cache file. See the FILES section below and the --cache option.

       -v FILE, --verbose=FILE
           Print verbose information to "FILE"

       -V, --Version
           Print version information to STDOUT and exit

GUI RELATED OPTIONS
       -o [ see description ], --order=[ see description ]
           Allows various sorting orders and ways to display the rows. The argument can be made up of any of the following:

           a   Sort the rows alphabetically. This is the default if the -o option isn't specified.

           n   Show the priority numbers along with the name of the service.

           p   Sorts by the priority numbers.

           level
               level can be any runlevel, 0-9 or S. This controls which runlevel the priority numbers are sorted at. It only makes sense to use
               this in conjuntion with p. If omitted the priority numbers are sorted by the current runlevel the system is in.

       -p, --priority
           Alternate layout. Instead of just showing a checkbox, the priority of the service and the S or K are allowed to be edited. This is for
           more fine tuned control then the default layout allows.

       -s levels, --show=levels
           Which runlevels to show. This defaults to up to 8 of the runlevels available on the system. Usually this means it will show 1, 2, 3, 4,
           5, 0, 6, and S.  The syntax calls for the runlevels to be allruntogether. For instance, to show runlevels 3, 4, and 5 the syntax would
           be "--show=345". Also see --order.

CLI RELATED OPTIONS
       --level levels
           The runlevels this operation will affect. levels can be any number from 0-9 or S. For example, --level 135 will affect runlevels 1, 3,
           and 5.  If --level is not set, the default is to affect runlevels 2, 3, 4, and 5.  This option is only used for the command line inter‐
           face, see the section below labled USING THE CLI for more information.

       --list [name]
           This option will list all of the services and if they are stopped or started when entering each runlevel. If name is specified, only
           the information for that service is displayed.

USING THE GUI
       Note

       When using either GUI layout described below, all configuration changes to the symlinks will happen immediately, not when the program
       exits.

       Using the Default layout

       The default (simple) layout shows in a grid fashion all of the services that are in "init.d" and which runlevels they are turned on at. For
       example, where the "ssh" row and 3 column intersect, if there is an 'X' in the box there that means the ssh service will be turned on when
       entering runlevel 3. If there is no checkbox it can mean that either there are no links to the service in that specific runlevel, or that
       the service is turned off when entering that runlevel. If more configuration detail is needed, see the next paragraph and the --priority
       option.

       Using the Priority layout

       The priority (advanced) layout also uses a grid fashion, but instead of checkboxes there are text boxes that can have a few different val‐
       ues. If the text box is blank, that means there isn't a symlink in that runlevel for that service. This means that when changing into that
       runlevel that the service will not be started or stopped, which is significant. If the text box starts with the letter K that means that
       the service will be stopped when entering that runlevel. If the text box starts with the letter S that means the service will be started
       when entering that runlevel. The two digits following is the order in which the services are started. That means that "S08iptables" would
       start before "S20ssh". For more information see your system documentation.

       Controls

       To move around use the arrow keys, or if the terminal support it, the mouse.  Typically there is more then one page of services (unless the
       terminal screen is large), to move between the pages use CTRL-n or CTRL-p, or simply arrow key down or up at the bottom or top of the
       screen, respectively. The bottom of the screen also shows these movement commands for quick reference. To restore the symlinks back to
       their original state before the sysv-rc-conf was run, press the r key.  The h key will display a quick reference help screen.

       Default layout

       When using the default layout use the space bar to toggle the service on / off.  An 'X' in the checkbox indicates that the service is on.

       Priority layout

       The priority layout uses the default movement keys. In order to edit the fields you can use CTRL-d to delete the character in front of the
       cursor or backspace to backspace. Use CTRL-b or CTRL-f to move the cursor backwards or forwards within the field. Note that only S, K, or
       any digit is allowed to be entered into the field.

       Starting / Stopping Services

       To start a service now, press the "+" or "=" key.  To stop  a service now, press the "-" key.

       This will call "/etc/init.d/service start" or "/etc/init.d/service stop".

USING THE CLI
       If the desired modifications to the symlinks are known and only one quick change is needed, then you can use a CLI interface to sysv-rc-
       conf.  Examples:

         # sysv-rc-conf --level 35 ssh off
         # sysv-rc-conf atd on

       The first example will turn ssh off on levels 3 and 5. The second example turns atd on for runlevels 2, 3, 4, and 5.

FILES
       Note: Feel free to skip this section

       sysv-rc-conf stores a cache of all the symlink information from "/etc/rc{runlevel}.d/" in "/var/lib/sysv-rc-conf/services" (See the --cache
       option to change the location of this file). It uses this cache to make an intelligent decision on what priority number to give the K or S
       link when they are changed in the simple layout. This cache is updated/created everytime the program is launched. The program needs to run
       with root privileges in order to update the cache. The format of the file is as follows:

         RUNLEVEL S|K PRIORITY SERVICE

       Here's a few examples:

         2 K 74 ntpd
         2 K 50 xinetd
         3 S 08 iptables
         3 S 80 sendmail

       sysv-rc-conf will first see if it can get an exact match from the cache.  For example, if the symlink for "cron" in runlevel 3 is S89cron
       and you uncheck it, sysv-rc-conf will first see if there is an entry in the cache that looks like "3 K nn cron", if so it will use nn for
       the priority number.

       If there wasn't a match, sysv-rc-conf will then see if there is another S or K (whichever you're switching to, so in this example, K) entry
       on a different runlevel - so an entry like "i K nn cron", where i is any runlevel. If found, the link will use nn.

       If there still wasn't a match, sysv-rc-conf will look for the opposite of S or K in any run level, and use 100 - that priority. So in our
       example, "i S nn cron". If nn is 20, then it will use 80 (100 - 20), since that is typically the way that the priority numbers are used.

       If there still isn't a match, the default priority of 20 for S links is used, and the default priority of 80 for K links is used.

COMPATIBILITY
       sysv-rc-conf should work on any Unix like system that manages services when changing runlevels by using symlinks in "/etc/rc{runlevel}.d/".
       Refer to your system documentation to see if that's the case (usually there's a "/etc/init.d/README").

CAVEATS
       sysv-rc-conf only manages the symlinks in the "rc{runlevel}.d" directories. It's possible that packages may have other ways of being dis‐
       abled or enabled.

       Because Curses takes over the screen sometimes error messages won't be seen on the terminal. If you run across any weird problems try redi‐
       recting STDERR to a file when you execute the program.

       For example:
         # sysv-rc-conf 2> err.out

REPORTING BUGS
       Report bugs to Joe Oppegaard <joe@pidone.org>

SEE ALSO
       init(8), runlevel(8), chkconfig(8), "/etc/init.d/README"

         www: http://sysv-rc-conf.sourceforge.net
         ftp: ftp://ftp.pidone.org/sysv-rc-conf

AUTHOR
       Joe Oppegaard <joe@pidone.org>

perl v5.8.8                                                         2005-05-11                                                     SYSV-RC-CONF(8)
