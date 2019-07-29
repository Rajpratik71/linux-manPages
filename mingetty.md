MINGETTY(8)                                                                               Linux Programmer's Manual                                                                               MINGETTY(8)



NAME
       mingetty - minimal getty for consoles

SYNOPSIS
       /sbin/mingetty  [--noclear]  [--nonewline]  [--noissue] [--nohangup] [--noreset] [--no-hostname] [--long-hostname] [--login login_binary] [--logopts "login_options"] [--nice number] [--delay number]
       [--chdir /home] [--chroot /chroot] [--autologin user] [--loginpause] [--old] tty [term]

DESCRIPTION
       mingetty is a minimal getty for use on virtual consoles.  Unlike agetty(8), mingetty is not suitable for serial lines.  For this purpose the usage of mgetty(8) is recommend.

OPTIONS
       --noclear
              Do not clear the screen before prompting for the login name (the screen is normally cleared).

       --noreset
              By default the terminal settings will be initialized to some sane default values.  With this option the terminal settings will not be changed.

       --nonewline
              Do not print a newline before writing out /etc/issue.

       --noissue
              Do not output /etc/issue.

       --nohangup
              Do not call vhangup() to disable writing to this tty by other applications.

       --no-hostname
              By default the hostname will be printed.  With this option enabled, no hostname at all will be shown.

       --long-hostname
              By default the hostname is only printed until the first dot.  With this option enabled, the full text from gethostname() is shown.

       --login login_binary
              Use the login_binary to log in instead of the default /bin/login.

       --logopts "login_options"
              Options that are passed to the login program.  \\u is replaced by the login name. Defaults to "-- \\u", which is suitable for /bin/login.  Please read the SECURITY NOTICE below if you want to
              use this.

       --nice 10
              Change the priority by calling nice().

       --delay 5
              Sleep this many seconds after startup of mingetty.

       --chdir /home
              Change into this directory before calling the login prog.

       --chroot /chroot
              Call chroot() with this directory name.

       --autologin username
              Log the specified user automatically in without asking for a login name and password. Check the -f option from /bin/login for this.

       --loginpause
              Wait for any key before dropping to the login prompt.  Can be combined with --autologin to save memory by lazily spawning shells.

       --old  Do  not  reset the terminal line to standard settings and do not hangup the /dev/vcs and /dev/vcsa virtual console memory devices which may remain from a former session.  This hangup requires
              access to the /proc file system because the linux kernel does not have a revoke() system call.  Please read the SECURITY NOTICE below if you want to use this.

SECURITY NOTICE
       If you use the --login and --logopts options, be aware that a malicious user may try to enter lognames with embedded options, which then get passed to the used login program.   mingetty  does  check
       for a leading - and makes sure the logname gets passed as one parameter (so embedded spaces will not create yet another parameter), but depending on how the login binary parses the command line that
       might not be sufficient. Check that the used login program can not be abused this way.

       Some programs use -- to indicate that the rest of the commandline should not be interpreted as options. Use this feature if available by passing -- before the username gets passed by \\u.

       If you use the --old be aware that remaining opened or memory mapped /dev/vcs<#> or /dev/vcsa<#> virtual console memory devices provide all infomation of the corresponding terminal line  /dev/tty<#>
       to a possible attacker.

ISSUE ESCAPES
       mingetty recognizes the following escapes sequences which might be embedded in the /etc/issue file:

       \d     insert current day (localtime),

       \l     insert line on which mingetty is running,

       \m     inserts machine architecture (uname -m),

       \n     inserts machine's network node hostname (uname -n),

       \o     inserts domain name,

       \r     inserts operating system release (uname -r),

       \t     insert current time (localtime),

       \s     inserts operating system name,

       \u     resp. \U the current number of users which are currently logged in.  \U inserts "n users", where as \u only inserts "n".

       \v     inserts operating system version (uname -v).

EXAMPLE
       "Linux eos i386 #1 Tue Mar 19 21:54:09 MET 1996" was produced by putting "\s \n \m \v" into /etc/issue.

FILES
       /etc/issue,
       /var/run/utmp,
       /etc/inittab.

SEE ALSO
       mgetty(8),
       agetty(8),
       inittab(5),
       vcs(8).

AUTHOR
       Copyright © 1996 Florian La Roche <florian@suse.de> or <florian@jurix.jura.uni-sb.de>.
       Copyright © 1999-2002 Werner Fink <feedback@suse.de>.  Man-page written by David Frey <David.Frey@eos.lugs.ch>, Florian La Roche, and updated by Werner Fink.



SuSE                                                                                             29 May 2007                                                                                      MINGETTY(8)
