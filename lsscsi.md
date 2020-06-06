lsscsi(8)                                                                                         LSSCSI                                                                                        lsscsi(8)

NAME
       lsscsi - list SCSI devices (or hosts) and their attributes

SYNOPSIS
       lsscsi  [--classic] [--device] [--generic] [--help] [--hosts] [--kname] [--list] [--lunhex] [--long] [--protection] [--protmode] [--scsi_id] [--size] [--sysfsroot=PATH] [--transport] [--verbose]
       [--version] [--wwn] [H:C:T:L]

DESCRIPTION
       Uses information in sysfs (Linux kernel series 2.6 and later) to list SCSI devices (or hosts) currently attached to the system. Options can be used to control the amount and form of  information
       provided for each device.

       If  a  H:C:T:L  argument  is  given then it acts as a filter and only devices that match it are listed. The colons don't have to be present, and '-', '*', '?' or missing arguments at the end are
       interpreted as wildcards. The default is '*:*:*:*' which means to match everything. Any filter string using '*' of '?' should be surrounded by single or double quotes to stop  shell  expansions.
       If  '-'  is used as a wildcard then the whole filter argument should be prefixed by '-- ' to tell this utility there are no more options on the command line to be interpreted.  A leading '[' and
       trailing ']' are permitted (e.g. '[1:0:0]' matches all LUNs on 1:0:0). May also be used to filter --hosts in which case only the H is active and may be either a number or in the  form  "host<n>"
       where <n> is a host number.

       By default in this utility device node names (e.g. "/dev/sda" or "/dev/root_disk") are obtained by noting the major and minor numbers for the listed device obtained from sysfs (e.g. the contents
       of "/sys/block/sda/dev") and then looking for a match in the "/dev" directory. This "match by major and minor" will allow devices that have been given a different name by udev (for  example)  to
       be correctly reported by this utility.

       In  some  situations  it may be useful to see the device node name that Linux would produce by default, so the --kname option is provided.  An example of where this may be useful is kernel error
       logs which tend to report disk error messages using the disk's default kernel name.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -c, --classic
              The output is similar to that obtained from 'cat /proc/scsi/scsi'

       -d, --device
              After outputting the (probable) SCSI device name the device node major and minor numbers are shown in brackets (e.g. "/dev/sda[8:0]").

       -g, --generic
              Output the SCSI generic device file name. Note that if the sg driver is a module it may need to be loaded otherwise '-' may appear.

       -h, --help
              Output the usage message and exit.

       -H, --hosts
              List the SCSI hosts currently attached to the system. If this option is not given then SCSI devices are listed.

       -k, --kname
              Use Linux default algorithm for naming devices (e.g. block major 8, minor 0 is "/dev/sda") rather than the "match by major and minor" in the "/dev" directory as discussed above.

       -L, --list
              Output additional information in <attribute_name>=<value> pairs, one pair per line preceded by two spaces. This option has the same effect as '-lll'.

       -l, --long
              Output additional information for each SCSI device (host). Can be used multiple times for more output in which case the shorter option form is more convenient  (e.g.  '-lll').  When  used
              three times (i.e. '-lll') outputs SCSI device (host) attributes one per line; preceded by two spaces; in the form "<attribute_name>=<value>".

       -x, --lunhex
              when  this option is used once the LUN in the tuple (at the start of each device line) is shown in "T10" format which is up to 16 hexadecimal digits. It is prefixed by "0x" to distinguish
              the LUN from the decimal value shown in the absence of this option. Also hierarchal LUNs are  shown  with  a  "_"  character  separating  the  levels.  For  example  the  two  level  LUN:
              0x0355006600000000  will  appear  as  0x0355_0066. If this option is given twice (e.g. using the short form: '-xx') then the full 16 hexadecimal digits are shown for each LUN, prefixed by
              "0x".

       -p, --protection
              Output target (DIF) and initiator (DIX) protection types.

       -P, --protmode
              Output effective protection information mode for each disk device.

       -i, --scsi_id
              outputs the udev derived matching id found in /dev/disk/by-id/scsi* .  This is only for disk (and disk like) devices. If no match is found then "dm-uuid-mpath*" and "usb*" are searched in
              the  same  directory.  If there is still no match then the /sys/class/block/<disk>/holders directory is searched. The matching id is printed following the device name (e.g.  /dev/sdc) and
              if there is no match "-" is output.

       -s, --size
              Print disk capacity in human readable form.

       -t, --transport
              Output transport information. This will be a target related information or, if --hosts is given, initiator related information. When used without --list, a name or  identifier  (or  both)
              are  output  on  a single line, usually prefixed by the type of transport. For devices this information replaces the normal vendor, product and revision strings. When the --list option is
              also given then additionally multiple lines of attribute_name=value pairs are output, each indented by two spaces. See the section on transports below.

       -v, --verbose
              outputs directory names where information is found. Use multiple times for more output.

       -V, --version
              outputs version information then exits.

       -w, --wwn
              outputs the WWN for disks instead of manufacturer, model and revision (or instead of transport information). The World Wide Name (WWN) is typically 64 bits long (16 hex digits) but  could
              be up to 128 bits long. To indicate the WWN is hexadecimal, it is prefixed by "0x".

       -y, --sysfsroot=PATH
              assumes sysfs is mounted at PATH instead of the default '/sys' . If this option is given PATH should be an absolute path (i.e. start with '/').

TRANSPORTS
       This  utility  lists  SCSI  devices  which  are known as logical units (LU) in the SCSI Architecture Model (ref: SAM-4 at http://www.t10.org) or hosts when the --hosts option is given. A host is
       called an initiator in SAM-4. A SCSI command travels out via an initiator, across some transport to a target and then onwards to a logical unit. A  target  device  may  contain  several  logical
       units.  A target device has one or more ports that can be viewed as transport end points. Each FC and SAS disk is a single target that has two ports and contains one logical unit. If both target
       ports on a FC or SAS disk are connected and visible to a machine, then lsscsi will show two entries. Initiators (i.e. hosts) also have one or more ports and some HBAs in Linux have a host  entry
       per initiator port while others have a host entry per initiator device.

       When  the  --transport  option  is  given for devices (i.e.  --hosts not given) then most of the information produced by lsscsi is associated with the target, or more precisely: the target port,
       through which SCSI commands pass that access a logical unit.

       Typically this utility provides one line of output per "device" or host.  Significantly more information can be obtained by adding the --list option. When  used  together  with  the  --transport
       option,  after  the  summary  line, multiple lines of transport specific information in the form "<attribute_name>=<value>" are output, each indented by two spaces.  Using a filter argument will
       reduce the volume of output if a lot of devices or hosts are present.

       The transports that are currently recognized are: IEEE 1394, ATA, FC, iSCSI, SAS, SATA, SPI and USB.

       For IEEE 1394 (a.k.a. Firewire and "SBP" when storage is involved), the EUI-64 based target port name is output when --transport is given, in the absence of the --hosts option. When the  --hosts
       option is given then the EUI-64 initiator port name is output. Output on the summary line specific to the IEEE 1394 transport is prefixed by "sbp:".

       to  detect ATA and SATA a crude check is performed on the driver name (after the checks for other transports are exhausted). Based on the driver name either ATA or SATA transport type is chosen.
       Output on the summary line is either "ata:" or "sata:". No other attributes are given.  Most device and hosts flagged as "ata:" will use the parallel ATA transport (PATA).

       For Fibre Channel (FC) the port name and port identifier are output when --transport is given. In the absence of the --hosts option these ids will be for the  target  port  associated  with  the
       device (logical unit) being listed. When the --hosts option is given then the ids are for the initiator port used by the host. Output on the summary line specific to the FC transport is prefixed
       by "fc:".  If FCoE (over Ethernet) is detected the prefix is changed to "fcoe:".

       For iSCSI the target port name is output when --transport is given, in the absence of the --hosts option. This is made up of the iSCSI name and the target portal group tag. Since the iSCSI  name
       starts with "iqn" no further prefix is used. When the --hosts option is given then only "iscsi:" is output on the summary line.

       For Serial Attached SCSI the SAS address of the target port (or initiator port if --hosts option is also given) is output. This will be a naa-5 address. For SAS HBAs and SAS targets (such as SAS
       disks and tape drives) the SAS address will be world wide unique. For SATA disks attached to a SAS expander, the expander provides the SAS address by adding a non zero value  to  its  (i.e.  the
       expander's)  SAS  address (e.g. expander_sas_address + phy_id + 1). SATA disks directly attached to SAS HBAs seem to have an indeterminate SAS address. Output on the summary line specific to the
       SAS transport is prefixed by "sas:".

       For the SCSI Parallel Interface (SPI) the target port identifier (usually a number between 0 and 15 inclusive) is output when --transport is given, in the absence of the --hosts option. When the
       --hosts option is given then only "spi:" is output on the summary line.

       When  a  USB transport is detected, the summary line will contain "usb:" followed by a USB device name. The USB device name has the form "<b>-<p1>[.<p2>[.<p3>]]:<c>.<i>" where <b> is the USB bus
       number, <p1> is the port on the host. <p2> is a port on a host connected hub, if present.  If needed <p3> is a USB hub port closer to the USB storage device. <c> refers to the configuration num‐
       ber  while  <i> is the interface number. There is a separate SCSI host for each USB (SCSI) target. A USB SCSI target may contain multiple logical units. Thus the same "usb: <device_name>" string
       appears for a USB SCSI host and all logical units that belong to the USB SCSI target associated with that USB SCSI host.

LUNS
       For historical reasons and as used by several other Unix based Operating Systems, Linux uses a tuple of integers to describe (a path to) a SCSI device (also know as a  Logical  Unit  (LU)).  The
       last element of that tuple is the so-called Logical Unit Number (LUN). And originally in SCSI a LUN was an integer, at first 3 bits long, then 8 then 16 bits. SCSI LUNs today (SAM-5 section 4.7)
       are 64 bits but SCSI standards now consider a LUN to be an array of 8 bytes.

       Up until 2013, Linux mapped SCSI LUNs to a 32 bit integer by taking the first 4 bytes of the SCSI LUN and ignoring the last 4 bytes. Linux treated the first two bytes of the SCSI LUN as  a  unit
       (a word) and it became the least significant 16 bits in the Linux LUN integer. The next two bytes of the SCSI LUN became the upper 16 bits in the Linux LUN integer. The rationale for this was to
       keep commonly used LUNs small Linux LUN integers. The most common LUN (by far) in SCSI LUN (hex) notation is 00 00 00 00 00 00 00 00 and this becomes the Linux LUN integer 0. The next most  com‐
       mon LUN is 00 01 00 00 00 00 00 00 and this becomes the Linux LUN integer 1.

       In  2013  it  is proposed to increase Linux LUNs to a 64 bit integer by extending the mapping outlined above. In this case all information that is possible to represent in a SCSI LUN is mapped a
       Linux LUN (64 bit) integer. And the mapping can be reversed without losing information.

       This version of the utility supports both 32 and 64 bit Linux LUN integers.  By default the LUN shown at the end of the tuple commencing each line is a Linux LUN as a decimal integer.  When  the
       --lunhex  option  is given then the LUN is in SCSI LUN format with the 8 bytes run together, with the output in hexadecimal and prefixed by '0x'. The LUN is decoded according to SAM-5's descrip‐
       tion and trailing zeros (i.e. digits to the right) are not shown. So LUN 0 (i.e. 00 00 00 00 00 00 00 00) is shown as 0x0000 and LUN 65 (i.e. 00 41 00 00 00 00 00 00) is shown as 0x0041.  If the
       --lunhex option is given twice then the full 64 bits (i.e. 16 hexadecimal digits) are shown.

       If  the  --lunhex option is not given on the command line then the environment variable LSSCSI_LUNHEX_OPT is checked. If LSSCSI_LUNHEX_OPT is present then its associated value becomes the number
       of times the --lunhex is set internally. So, for example, 'LSSCSI_LUNHEX_OPT=2  lsscsi' and 'lsscsi -xx' are equivalent.

EXAMPLES
       Information about this utility including examples can also be found at: http://sg.danny.cz/scsi/lsscsi.html .

NOTES
       Information for this command is derived from the sysfs file system, which is assumed to be mounted at /sys unless specified otherwise by the user.  SCSI (pseudo) devices that have been  detected
       by  the  SCSI mid level will be listed even if the required upper level drivers (i.e. sd, sr, st, osst or ch) have not been loaded. If the appropriate upper level driver has not been loaded then
       the device file name will appear as '-' rather than something like '/dev/st0'. Note that some devices (e.g. scanners and medium changers) do not have a primary upper level driver and can only be
       accessed via a SCSI generic (sg) device name.

       Generic  SCSI devices can also be accessed via the bsg driver in Linux.  By default, the bsg driver's device node names are of the form '/dev/bsg/H:C:T:L'. So, for example, the SCSI device shown
       by this utility on a line starting with the tuple '6:0:1:2' could be accessed via the bsg driver with the '/dev/bsg/6:0:1:2' device node name.

       lsscsi version 0.21 or later is required to correctly display SCSI devices in Linux kernel 2.6.26 (and possibly later) when the CONFIG_SYSFS_DEPRECATED_V2 kernel option is not defined.

AUTHOR
       Written by Doug Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2003-2013 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       lspci lsusb

lsscsi-0.27                                                                                     March 2013                                                                                      lsscsi(8)
