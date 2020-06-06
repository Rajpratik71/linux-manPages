BIOSDEVNAME(1)                                                                             General Commands Manual                                                                             BIOSDEVNAME(1)



NAME
       biosdevname - give BIOS-given name of a device

SYNOPSIS
       biosdevname [options] [args]...

DESCRIPTION
       biosdevname takes a kernel device name as an argument, and returns the BIOS-given name it "should" be.

OPTIONS
       -i, --interface
              Treat [args] as ethernet devs

       -d, --debug
              Enable debugging

       -p, --policy [physical|all_ethN]

       -P, --prefix [string]
              string use for embedded NICs in the physical policy (default=em)

       -x, --nopirq
              Do not use $PIR table for mapping PCI device to slot. Some BIOS have incorrect values.

       -s, --smbios [x.y]
              Require minimum SMBIOS version x.y

POLICIES
       The physical policy is the current default.  However, when invoking biosdevname in udev rules, one should always specify the policy you want, as the default has changed over time.
       The physical policy uses the following scheme:

       em<port>[_<virtual instance>]
              for embedded NICs

       p<slot>p<port>[_<virtual instance>]
              for cards in PCI slots

       The  all_ethN  policy  makes  a  best  guess  at what the device order should be, with embedded devices first, PCI cards in ascending slot order, and ports in ascending PCI bus/device/function order
       breadth-first.  However, this policy does not work if your PCI devices are hot-plugged or hot-pluggable, including the virtual functions on an SR-IOV device.  In a hot-plug scenario,  each  separate
       udev instance will be invoked in parallel, while the device tree is still being populated with new devices.  Each udev instance will see a different PCI tree, and thus cannot provide consistent enu‐
       meration.  Use of this policy should be limited to only scenarios where all PCI devices are present at boot (cold-plug).


EXIT CODES
       Returns 0 on success, with BIOS-suggested name printed to stdout.
       Returns 1 on provided device name lookup failure.
       Returns 2 if system BIOS does not provide naming information.  biosdevname requires system BIOS to provide naming information, either via SMBIOS or sysfs files.
       Returns 3 if not run as root but requires root privileges.
       Returns 4 if running in a virtual machine.


SEE ALSO
       http://linux.dell.com/wiki/index.php/Oss/libnetdevname
       http://linux.dell.com/files/biosdevname/
       git://linux.dell.com/biosdevname.git


RELATED PROGRAMS
       The dmidecode package contains two tools useful for debugging BIOS features that biosdevname uses, specifically dmidecode to read the SMBIOS Type 9 and Type 41 tables, and biosdecode to read the PCI
       IRQ Routing Table.  Please include the output of each of these programs in any bug reports.

AUTHOR
       biosdevname was written by  Matt Domsch <Matt_Domsch@dell.com>

       This manual page was written by Rudy Gevaert <Rudy.Gevaert@UGent.be>, for the Debian project (but may be used by others).



                                                                                                 Nov 28, 2010                                                                                  BIOSDEVNAME(1)
