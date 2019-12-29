LVMPOLLD(8)                             System Manager's Manual                            LVMPOLLD(8)

NAME
       lvmpolld — LVM poll daemon

SYNOPSIS
       lvmpolld  [-l|--log  {all|wire|debug}]  [-p|--pidfile  pidfile_path]  [-s|--socket socket_path]
       [-B|--binary  lvm_binary_path]  [-t|--timeout  timeout_value]   [-f|--foreground]   [-h|--help]
       [-V|--version]

       lvmpolld [--dump]

DESCRIPTION
       lvmpolld  is  polling  daemon for LVM. The daemon receives requests for polling of already ini‐
       tialised operations originating in LVM2 command line tool.  The requests for polling  originate
       in the lvconvert, pvmove, lvchange or vgchange LVM2 commands.

       The  purpose  of lvmpolld is to reduce the number of spawned background processes per otherwise
       unique polling operation. There should be only one. It also eliminates the possibility of unso‐
       licited termination of background process by external factors.

       lvmpolld  is used by LVM only if it is enabled in lvm.conf(5) by specifying the global/use_lvm‐
       polld setting. If this is not defined in the LVM configuration explicitly then default  setting
       is used instead (see the output of lvmconfig --type default global/use_lvmpolld command).

OPTIONS
       To  run  the  daemon  in a test environment both the pidfile_path and the socket_path should be
       changed from the defaults.

       -f, --foreground
              Don't fork, but run in the foreground.

       -h, --help
              Show help information.

       -l, --log {all|wire|debug}
              Select the type of log messages to generate.  Messages are logged by syslog.   Addition‐
              ally,  when  -f is given they are also sent to standard error.  There are two classes of
              messages: wire and debug. Selecting 'all' supplies both and is equivalent  to  a  comma-
              separated list -l wire,debug.

       -p, --pidfile pidfile_path
              Path  to  the  pidfile. This overrides both the built-in default (/run/lvmpolld.pid) and
              the environment variable LVM_LVMPOLLD_PIDFILE.  This file is used to prevent  more  than
              one instance of the daemon running simultaneously.

       -s, --socket socket_path
              Path  to  the  socket  file.  This  overrides  both  the built-in default (/run/lvm/lvm‐
              polld.socket) and the environment variable LVM_LVMPOLLD_SOCKET.

       -t, --timeout timeout_value
              The daemon may shutdown after being idle for the given time (in seconds). When  the  op‐
              tion is omitted or the value given is zero the daemon never shutdowns on idle.

       -B, --binary lvm_binary_path
              Optional path to alternative LVM binary (default: /lvm). Use for testing purposes only.

       -V, --version
              Display the version of lvmpolld daemon.

       --dump Contact  the  running lvmpolld daemon to obtain the complete state and print it out in a
              raw format.

ENVIRONMENT VARIABLES
       LVM_LVMPOLLD_PIDFILE
              Path for the pid file.

       LVM_LVMPOLLD_SOCKET
              Path for the socket file.

SEE ALSO
       lvm(8), lvm.conf(5)

Red Hat Inc                        LVM TOOLS 2.03.02(2) (2018-12-18)                       LVMPOLLD(8)
