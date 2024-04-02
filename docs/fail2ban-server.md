FAIL2BAN-SERVER(1)                                                 User Commands                                                FAIL2BAN-SERVER(1)

NAME
       fail2ban-server - start the server

SYNOPSIS
       fail2ban-server [OPTIONS]

DESCRIPTION
       Fail2Ban v0.9.3 reads log file that contains password failure report and bans the corresponding IP addresses using firewall rules.

       Only use this command for debugging purpose. Start the server with fail2ban-client instead. The default behaviour is to start the server in
       background.

OPTIONS
       -b     start in background

       -f     start in foreground

       -s <FILE>
              socket path

       -p <FILE>
              pidfile path

       -x     force execution of the server (remove socket file)

       -h, --help
              display this help message

       -V, --version
              print the version

AUTHOR
       Written by Cyril Jaquier <cyril.jaquier@fail2ban.org>.  Many contributions by Yaroslav O. Halchenko <debian@onerussian.com>.

REPORTING BUGS
       Report bugs via Debian bug tracking system http://www.debian.org/Bugs/ .

COPYRIGHT
       Copyright © 2004-2008 Cyril Jaquier, 2008- Fail2Ban Contributors
       Copyright of modifications held by their respective authors.  Licensed under the GNU General Public License v2 (GPL).

SEE ALSO
       fail2ban-client(1)

fail2ban-server v0.9.3                                               July 2015                                                  FAIL2BAN-SERVER(1)
