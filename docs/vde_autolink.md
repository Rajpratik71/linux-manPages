VDE_AUTOLINK(1)                                                    User Commands                                                   VDE_AUTOLINK(1)

NAME
       vde_autolink - automatically create and maintain vde connections

DESCRIPTION
       -h, --help
              Display this help

       -f, --rcfile
              Configuration file (overrides /etc/vde_autolink.rc and ~/.vde_autolinkrc)

       -d, --daemon
              Daemonize vde_autolink once run

       -p, --pidfile PIDFILE
              Write pid of daemon to PIDFILE

       -M, --mgmt SOCK
              Path of the management UNIX socket

       --mgmtmode MODE
              Management UNIX socket access mode (octal)

       -s, --sock
              [*] Attach to this vde_switch socket

       -S, --switchmgmt
              [*] Attach to this vde_switch management socket

              [*]  ==  Required  option!   -h,  --help                  Display this help -f, --rcfile               Configuration file (overrides
              /etc/vde_autolink.rc and ~/.vde_autolinkrc) -d,  --daemon                Daemonize  vde_autolink  once  run  -p,  --pidfile  PIDFILE
              Write pid of daemon to PIDFILE -M, --mgmt SOCK            Path of the management UNIX socket

       --mgmtmode MODE
              Management UNIX socket access mode (octal)

       -s, --sock
              [*] Attach to this vde_switch socket

       -S, --switchmgmt
              [*] Attach to this vde_switch management socket

              [*] == Required option!

NOTICE
       Virtual  Distributed  Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik und Informationstechnik"
       i.e. the German "Association for Electrical, Electronic & Information Technologies").

SEE ALSO
       vde_switch(1), vde_plug(1),

AUTHORS
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>.

       vde_autolink is a VDE component by Luca Bigliardi

vde_autolink 2.2.0-pre1                                            November 2007                                                   VDE_AUTOLINK(1)
