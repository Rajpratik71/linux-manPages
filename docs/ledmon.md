ledmon(8)                                                                           Intel(R) Enclosure LED Monitor Service                                                                          ledmon(8)



NAME
       ledmon - Intel(R) LED monitor service for storage enclosures.

SYNOPSIS
       ledmon [OPTIONS]

DESCRIPTION
       The ledmon application is a daemon process used to monitor a state of software RAID devices (md only) or a state of block devices. The state is visualizing on LEDs associated to each slot in an
       enclosure or a drive bay. There are two types of system: 2-LEDs system (Activity LED, Status LED) and 3-LEDs system (Activity LED, Locate LED, Fail LED). This application has the highest priority
       when accessing the LEDs.

       The ledmon application uses SGPIO and SES-2 protocol to control LEDs. The program implements IBPI patterns of SFF-8489 specification for SGPIO. Please note some enclosures do not stick close to
       SFF-8489 specification. It might happen that enclosure processor will accept IBPI pattern but it will blink LEDs not according to SFF-8489 specification or it has limited number of patterns
       supported.

       LED management (AHCI) and SAF-TE protocols are not supported.

       There's no method provided to specify which RAID volume should be monitored and which not. The ledmon application monitors all RAID devices and visualizes their state.

       The ledmon application has been verified to work with Intel(R) storage controllers (i.e. Intel(R) AHCI controller and Intel(R) SAS controller).  The application might work with storage controllers
       of other vendors (especially SAS/SCSI controllers). However storage controllers of other vendors have not been tested.

       The ledmon application is part of Intel(R) Enclosure LED Utilities. Only single instance of the application is allowed.

OPTIONS
       -c or --config=path
               Sets a path to local configuration file. If this option is specified the global configuration file and user configuration file has no effect.

       -l or --log=path
               Sets a path to local log file. If this option is specified the global log file /var/log/ledmon.log is not used.

       -t or --interval=seconds
               Sets time interval between scans of sysfs. The value is given in seconds.  The minimum is 5 seconds the maximum is not specified.

       --quiet or --error or --warning or --info or --debug or --all
               Verbose level - 'quiet' means no logging at all and 'all' means to log everything. The levels are given in order. If user specifies more then one verbose option the last option comes into
               effect. The default level is 'warning'. Verbose level also can be set by --log-level=level.

       -h or --help
               Prints this text out and exits.

       -v or --version
               Displays version of ledmon and information about the license and exits.

FILES
       /var/log/ledmon.log
               Global log file, used by ledmon application. To force logging to user defined file use -l option switch.

       /etc/ledmon.conf
               Global configuration file, shared between ledmon and all ledctl application instances. Local configuration file can be used by running ledmon with -c switch.

LICENSE
       Copyright (c) 2009-2017 Intel Corporation.

       This program is distributed under the terms of the GNU General Public License as published by the Free Software Foundation. See the build-in help for details on the License and the lack of warranty.

BUGS
       The ledmon application does not recognize PFA state (Predicted Failure Analysis), hence the PFA pattern from SFF-8489 specification is not visualized.

SEE ALSO
       ledctl(8), ledmon.conf(5)

AUTHOR
       This manual page was written by Artur Wojcik <artur.wojcik@intel.com>. It may be used by others.



LEDMON Version 0.90                                                                             February 2018                                                                                       ledmon(8)
