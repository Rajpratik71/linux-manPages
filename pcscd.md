PCSCD(8)                                                            PC/SC Lite                                                            PCSCD(8)

NAME
       pcscd - PC/SC Smart Card Daemon

SYNOPSIS
       pcscd [options]

OPTIONS
       -a, --apdu
              log APDUs and SW using the debug method (see --debug).

       -c, --config file
              Specifies the file file as an alternate location for /etc/reader.conf.d/reader.conf.

       -f, --foreground
              Runs pcscd in the foreground and sends log messages to stderr instead of syslog(3).

       -T, --color
              force use of colored logs.

       -d, --debug
              use the lowest log level. Any log message of this level or above will be sent to stderr or syslog(3) depending on the use of --fore‐
              ground.

       --info use info log level. This is the default log level.

       -e, --error
              use error log level.

       -C, --critical
              use critical log level.

       The log levels are ordered as: debug < info < error < critical. Use a log level l will log this level and all the levels above it.

       --force-reader-polling
              ignore the IFD_GENERATE_HOTPLUG reader capability

       -t, --max-thread
              maximum number of threads (default 200).

              This is the maximum number of clients (SCardEstablishContext) that pcscd can handle.

       -s, --max-card-handle-per-thread
              maximum number of card handle per thread (default: 200).

              This is the maximum number of card handle (SCardConnect) per client (SCardEstablishContext).

       -r, --max-card-handle-per-reader
              maximum number of card handle per reader (default: 200)

              This is the maximum number of card handle (SCardConnect) per reader.

       -h, --help
              Displays information about the pcscd command line

       -v, --version
              Displays the program version number

       -H, --hotplug
              Ask pcscd to re-read the /etc/reader.conf.d/reader.conf file to detect added or removed non-USB readers (serial or PCMCIA).

       -x, --auto-exit
              pcscd will quit after 60 seconds of inactivity. This is used when pcscd os started on demand by systemd.

       -S, --reader-name-no-serial
              Do not include the USB serial number in the reader name.

       -I, --reader-name-no-interface
              Do not include the USB interface name in the reader name.

DESCRIPTION
       pcscd is the daemon program for pcsc-lite. It is a resource manager that coordinates communications with smart card readers and smart cards
       and cryptographic tokens that are connected to the system.

       It allows applications to access smart cards and readers using the winscard API but without knowing details of the card or reader.

       pcscd coordinates the loading of drivers for card readers.

SERIAL SMART CARD READER DRIVERS
       Smart  card  reader drivers are placed in the /usr/lib/pcsc/drivers directory. Each driver is simply an .so file.  pcscd locates the driver
       using the /etc/reader.conf.d/reader.conf file.  See the reader.conf(5) manual page for more information.

       Some drivers are available at http://pcsclite.alioth.debian.org/musclecard.com/drivers.html.

USB SMART CARD READER DRIVERS
       USB smart card reader drivers  are  located  in  /usr/lib/pcsc/drivers  directory  as  a  bundle.  You  shall  not  add  a  USB  driver  in
       /etc/reader.conf.d/reader.conf file.

FILES
       /etc/reader.conf.d/reader.conf : Reader configuration file

       /var/run/pcscd/pcscd.pid : process id of the running pcscd

       /usr/lib/pcsc/drivers : directory containing bundles for USB drivers

SEE ALSO
       bundleTool(8), reader.conf(5), syslog(3)

AUTHORS
       David Corcoran <corcoran@musclecard.com> and Ludovic Rousseau <ludovic.rousseau@free.fr>

Muscle                                                             January 2007                                                           PCSCD(8)
