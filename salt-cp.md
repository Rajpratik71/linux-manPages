SALT-CP(1)                                                             Salt                                                             SALT-CP(1)

NAME
       salt-cp - salt-cp Documentation

       Copy a file or files to one or more minions

SYNOPSIS
          salt-cp '*' [ options ] SOURCE [SOURCE2 SOURCE3 ...] DEST

          salt-cp -E '.*' [ options ] SOURCE [SOURCE2 SOURCE3 ...] DEST

          salt-cp -G 'os:Arch.*' [ options ] SOURCE [SOURCE2 SOURCE3 ...] DEST

DESCRIPTION
       salt-cp copies files from the master to all of the Salt minions matched by the specified target expression.

       NOTE:
          salt-cp  uses  Salt's  publishing mechanism. This means the privacy of the contents of the file on the wire is completely dependent upon
          the transport in use. In addition, if the master or minion is running with debug logging, the contents of the file  will  be  logged  to
          disk.

          In  addition,  this  tool  is  less  efficient  than  the  Salt  fileserver  when copying larger files. It is recommended to instead use
          cp.get_file to copy larger files to minions. However, this requires the file to be located within one of the fileserver directories.

       Changed in version 2016.3.7,2016.11.6,2017.7.0: Compression support added, disable with -n. Also, if the destination path ends  in  a  path
       separator  (i.e. /,  or \ on Windows, the desitination will be assumed to be a directory. Finally, recursion is now supported, allowing for
       entire directories to be copied.

       Changed in version 2016.11.7,2017.7.2: Reverted back to the old copy mode to preserve backward compatibility. The new  functionality  added
       in  2016.6.6  and  2017.7.0 is now available using the -C or --chunked CLI arguments. Note that compression, recursive copying, and support
       for copying large files is only available in chunked mode.

OPTIONS
       --version
              Print the version of Salt that is running.

       --versions-report
              Show program's dependencies and version number, and then exit

       -h, --help
              Show the help message and exit

       -c CONFIG_DIR, --config-dir=CONFIG_dir
              The location of the Salt configuration directory. This directory contains the configuration files for Salt master and  minions.  The
              default location on most systems is /etc/salt.

       -t TIMEOUT, --timeout=TIMEOUT
              The timeout in seconds to wait for replies from the Salt minions. The timeout number specifies how long the command line client will
              wait to query the minions and check on running jobs. Default: 5

   Logging Options
       Logging options which override any settings defined on the configuration files.

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Console logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/master.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

   Target Selection
       The    default    matching     that     Salt     utilizes     is     shell-style     globbing     around     the     minion     id.     See
       https://docs.python.org/2/library/fnmatch.html#module-fnmatch.

       -E, --pcre
              The target expression will be interpreted as a PCRE regular expression rather than a shell glob.

       -L, --list
              The target expression will be interpreted as a comma-delimited list; example: server1.foo.bar,server2.foo.bar,example7.quo.qux

       -G, --grain
              The  target  expression  matches values returned by the Salt grains system on the minions. The target expression is in the format of
              '<grain value>:<glob expression>'; example: 'os:Arch*'

              This was changed in version 0.9.8 to accept glob expressions instead of regular expression. To use regular expression matching  with
              grains, use the --grain-pcre option.

       --grain-pcre
              The  target  expression  matches values returned by the Salt grains system on the minions. The target expression is in the format of
              '<grain value>:< regular expression>'; example: 'os:Arch.*'

       -N, --nodegroup
              Use a predefined compound target defined in the Salt master configuration file.

       -R, --range
              Instead of using shell globs to evaluate the target, use a range expression to identify targets. Range expressions look like  %clus‐
              ter.

              Using  the Range option requires that a range server is set up and the location of the range server is referenced in the master con‐
              figuration file.

       -C, --chunked
              Use new chunked mode to copy files. This mode supports large files, recursive directories copying and compression.

              New in version 2016.11.7,2017.7.2.

       -n, --no-compression
              Disable gzip compression in chunked mode.

              New in version 2016.3.7,2016.11.6,2017.7.0.

SEE ALSO
       salt(1) salt-master(1) salt-minion(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                         SALT-CP(1)
