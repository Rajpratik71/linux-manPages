BLUETOOTHD(8)                                                                         System management commands                                                                         BLUETOOTHD(8)

NAME
       bluetoothd - Bluetooth daemon

SYNOPSIS
       bluetoothd [--version] | [--help]

       bluetoothd [--nodetach] [--compat] [--experimental] [--debug=<files>] [--plugin=<plugins>] [--noplugin=<plugins>]

DESCRIPTION
       This manual page documents briefly the bluetoothd daemon, which manages all the Bluetooth devices.  bluetoothd can also provide a number of services via the D-Bus message bus system.

OPTIONS
       -v, --version
              Print bluetoothd version and exit.

       -h, --help
              Print bluetoothd options and exit.

       -n, --nodetach
              Enable logging in foreground. Directs log output to the controlling terminal in addition to syslog.

       -f, --configfile
              Specifies an explicit config file path instead of relying on the default path (/etc/bluetooth/main.conf) for the config file.

       -d, --debug=<file1>:<file2>:...
              Sets  how much information bluetoothd sends to the log destination (usually syslog's "daemon" facility). If the file options are omitted, then debugging information from all the source
              files are printed. If file options are present, then only debug prints from that source file are printed. The option can be a pattern containing "*" and "?" characters.

              Example: --debug=src/adapter.c:src/agent.c

       -p, --plugin=<plugin1>,<plugin2>,..
              Load these plugins only. The option can be a pattern containing "*" and "?" characters.

       -P, --noplugin=<plugin1>,<plugin2>,..
              Never load these plugins. The option can be a pattern containing "*" and "?" characters.

       -C, --compat
              Provide deprecated command line interfaces.

       -E, --experimental
              Enable experimental interfaces. Those interfaces are not guaranteed to be compatible or present in future releases.

FILES
       /etc/bluetooth/main.conf
              Location of the global configuration file.

AUTHOR
       This manual page was written by Marcel Holtmann, Philipp Matthias Hahn and Fredrik Noring.

Bluetooth daemon                                                                              March 2004                                                                                 BLUETOOTHD(8)
