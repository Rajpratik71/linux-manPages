QEMU-GA.8(8)                                                                                                                                                                                     QEMU-GA.8(8)



NAME
       qemu-ga - QEMU Guest Agent

SYNOPSIS
       qemu-ga [OPTIONS]

DESCRIPTION
       The QEMU Guest Agent is a daemon intended to be run within virtual machines. It allows the hypervisor host to perform various operations in the guest, such as:

       ·   get information from the guest

       ·   set the guest's system time

       ·   read/write a file

       ·   sync and freeze the filesystems

       ·   suspend the guest

       ·   reconfigure guest local processors

       ·   set user's password

       ·   ...

       qemu-ga will read a system configuration file on startup (located at /etc/qemu/qemu-ga.conf by default), then parse remaining configuration options on the command line. For the same key, the last
       option wins, but the lists accumulate (see below for configuration file format).

OPTIONS
       -m, --method=method
             Transport method: one of B<unix-listen>, B<virtio-serial>, or
             B<isa-serial> (B<virtio-serial> is the default).

       -p, --path=path
             Device/socket path (the default for virtio-serial is
             B</dev/virtio-ports/org.qemu.guest_agent.0>,
             the default for isa-serial is B</dev/ttyS0>)

       -l, --logfile=path
             Set log file path (default is stderr).

       -f, --pidfile=path
             Specify pid file (default is B</var/run/qemu-ga.pid>).

       -F, --fsfreeze-hook=path
             Enable fsfreeze hook. Accepts an optional argument that specifies
             script to run on freeze/thaw. Script will be called with
             'freeze'/'thaw' arguments accordingly (default is
             B</etc/qemu/fsfreeze-hook>). If using -F with an argument, do
             not follow -F with a space (for example:
             B<-F/var/run/fsfreezehook.sh>).

       -t, --statedir=path
             Specify the directory to store state information (absolute paths only,
             default is B</var/run>).

       -v, --verbose
             Log extra debugging information.

       -V, --version
             Print version information and exit.

       -d, --daemon
             Daemonize after startup (detach from terminal).

       -b, --blacklist=list
             Comma-separated list of RPCs to disable (no spaces, B<?> to list
             available RPCs).

       -D, --dump-conf
             Dump the configuration in a format compatible with F<qemu-ga.conf>
             and exit.

       -h, --help
             Display this help and exit.

FILES
       The syntax of the qemu-ga.conf configuration file follows the Desktop Entry Specification, here is a quick summary: it consists of groups of key-value pairs, interspersed with comments.

               # qemu-ga configuration sample
               [general]
               daemonize = 0
               pidfile = /var/run/qemu-ga.pid
               verbose = 0
               method = virtio-serial
               path = /dev/virtio-ports/org.qemu.guest_agent.0
               statedir = /var/run

       The list of keys follows the command line options:

       daemon= boolean
       method= string
       path= string
       logfile= string
       pidfile= string
       fsfreeze-hook= string
       statedir= string
       verbose= boolean
       blacklist= string list

SEE ALSO
       qemu(1)

AUTHOR
       Michael Roth <mdroth@linux.vnet.ibm.com>



                                                                                                  2019-08-08                                                                                     QEMU-GA.8(8)
