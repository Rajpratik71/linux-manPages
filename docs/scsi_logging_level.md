SCSI_LOGGING_LEVEL(8)                                                                             SG3_UTILS                                                                             SCSI_LOGGING_LEVEL(8)



NAME
       scsi_logging_level - access Linux SCSI logging level information

SYNOPSIS
       scsi_logging_level  [--all=LEV]  [--create]  [--error=LEV]  [--get]  [--help]  [--highlevel=LEV]  [--hlcomplete=LEV] [--hlqueue=LEV] [--ioctl=LEV] [--llcomplete=LEV] [--llqueue=LEV] [--lowlevel=LEV]
       [--midlevel=LEV] [--mlcomplete=LEV] [--mlqueue=LEV] [--scan=LEV] [--set] [--timeout=LEV] [--version]

DESCRIPTION
       This bash shell script accesses the Linux SCSI subsystem logging level. The current values can be shown (e.g. with --get) or changed (e.g.  with  --set).  Superuser  permissions  will  typically  be
       required to set the logging level.

       One of these options: --create, --get or --set is required. Only one of them can be given.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --all=LEV
              LEV is used for all SCSI_LOG fields.

       -c, --create
              Options are parsed and placed in internal fields that are displayed but no logging levels are changed within the Linux kernel.

       -E, --error=LEV
              LEV is placed in the SCSI_LOG_ERROR field.

       -g, --get
              Fetches the current SCSI logging levels from the Linux kernel and displays them.

       -h, --help
              print out the usage message then exit.

       -H, --highlevel=LEV
              LEV is placed in the SCSI_LOG_HLQUEUE and SCSI_LOG_HLCOMPLETE fields.

       --hlcomplete=LEV
              LEV is placed in the SCSI_LOG_HLCOMPLETE field.

       --hlqueue=LEV
              LEV is placed in the SCSI_LOG_HLQUEUE field.

       -I, --ioctl=LEV
              LEV is placed in the SCSI_LOG_IOCTL field.

       --llcomplete=LEV
              LEV is placed in the SCSI_LOG_LLCOMPLETE field.

       --llqueue=LEV
              LEV is placed in the SCSI_LOG_LLQUEUE field.

       -L, --lowlevel=LEV
              LEV is placed in the SCSI_LOG_LLQUEUE and SCSI_LOG_LLCOMPLETE fields.

       -M, --midlevel=LEV
              LEV is placed in the SCSI_LOG_MLQUEUE and SCSI_LOG_MLCOMPLETE fields.

       --mlcomplete=LEV
              LEV is placed in the SCSI_LOG_MLCOMPLETE field.

       --mlqueue=LEV
              LEV is placed in the SCSI_LOG_MLQUEUE field.

       -S, --scan=LEV
              LEV is placed in the SCSI_LOG_SCAN field.

       -s, --set
              Uses the fields specified in this command's options and attempts to apply them to the Linux SCSI subsystem logging levels. Typically superuser permissions will be required to do this.

       -T, --timeout=LEV
              LEV is placed in the SCSI_LOG_TIMEOUT field.

       -v, --version
              Outputs the version information and then exits.

NOTES
       The --get and --set options access the /proc/sys/dev/scsi/logging_level pseudo file.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Any other exit status indicates that an error has occurred.

EXAMPLES
       The following will set SCSI_LOG_ERROR to level 5 in the Linux kernel. It requires root permissions:

         scsi_logging_level -s -E 5

       So  as to not interfere with other SCSI subsystem upper level drivers (ULDs) which most likely will be active at the same time, the Linux sg driver uses SCSI_LOG_TIMEOUT for logging purposes. To see
       full debugging and trace from the sg driver use:

         scsi_logging_level -s -T 7

       The output from the sg driver caused by this will go to the system logs (e.g. /var/log/syslog). To reduce the amount of output use a number lower than 7. Using 0 will turn off the tracing and debug.

AUTHORS
       Written by IBM. Small alterations by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © IBM Corp. 2006
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

       The software was obtained from an IBM package called s390-tools-1.6.2 found on that company's "developerworks" site. The most recent version of that package at this time is 1.8.3 .



sg3_utils-1.41                                                                                   January 2014                                                                           SCSI_LOGGING_LEVEL(8)
