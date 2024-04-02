SG_SAFTE(8)                                                                                       SG3_UTILS                                                                                       SG_SAFTE(8)



NAME
       sg_safte - access SCSI Accessed Fault-Tolerant Enclosure (SAF-TE) device

SYNOPSIS
       sg_safte [--config] [--devstatus] [--encstatus] [--flags] [--help] [--hex] [--insertions] [--raw] [--usage] [--verbose] [--version] DEVICE

DESCRIPTION
       Fetches  enclosure  status (via a SCSI READ BUFFER command).  The DEVICE should be a SAF-TE device which may be a storage array controller (INQUIRY peripheral device type 0xc) or a generic processor
       device (INQUIRY peripheral device type 0x3).

       If no options are given (only the DEVICE argument) then the overall enclosure status as reported by the option --config ®is reported.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -c, --config
              will issues a Read Enclosure Configuration ®(READ BUFFER ID 0) cdb to the device, which returns a list of the enclosure hardware resources.

       -d, --devstatus
              will issue a Read Device Slot Status ®(READ BUFFER ID 4) cdb to the device, which returns information about the current state of each drive or slot.

       -s, --encstatus
              will issue a Read Enclosure Status ®(READ BUFFER ID 1) cdb to the device, which returns the operational state of the components.

       -f, --flags
              will issue a Read Global Flags ®(READ BUFFER ID 5) cdb to the device, which read the most recent state of the global flags of the RAID processor device.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output the response to a READ BUFFER command in ASCII hex to stdout. If used once, output the response to the first READ BUFFER command (i.e. with buffer_id=0). This should be  the  enclosure
              configuration. If used twice (or more often), the response to subsequent READ BUFFER commands is output.

       -i, --insertions
              will  issue  a  Read Device Insertions ®(READ BUFFER ID 3) cdb to the device, which returns information about the number of times devices have been inserted whilst the RAID system was powered
              on.

       -r, --raw
              output the response to a READ BUFFER command in binary to stdout. If used once, output the response to the first READ BUFFER command (i.e. with buffer_id=0). This should be the enclosure con-
              figuration. If used twice (or more often), the response to subsequent READ BUFFER commands is output.

       -u, --usage
              will issue a Read Usage Statistics ®(READ BUFFER ID 2) cdb to the device, which returns the information on total usage time and number of power-on cycles of the RAID device.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       This  implementation  is  based  on the intermediate review document dated 19970414 and named "SR041497.pdf". So it is quite old. Intel and nStor are the authors. Intel have a zip archive containing
       this and related documents in the "SAF-TE: SCSI Accessed Fault Tolerant Enclosures Interface Specification" section of this page:

       http://www.intel.com/content/www/us/en/servers/ipmi/ipmi-technical-resources.html

       Similar functionality is provided by SPC-4 SCSI Enclosure Services (SES) devices (Peripheral device type 0xd), which can be queried with the sg_ses utility.

EXAMPLES
       To view the configuration:

          sg_safte /dev/sg1

       To view the device slot status:

          sg_safte --devstatus /dev/sg1

EXIT STATUS
       The exit status of sg_safte is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Hannes Reinecke and Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2016 Hannes Reinecke and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq, sg_ses (in sg3_utils package); safte-monitor (internet)



sg3_utils-1.43                                                                                    April 2016                                                                                      SG_SAFTE(8)
