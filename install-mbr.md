INSTALL-MBR(8)                                             Linux Administrator's Manual                                             INSTALL-MBR(8)

NAME
       install-mbr - install a Master Boot Record manager

SYNOPSIS
       install-mbr  <target>    [--force]    [--install  <path>]    [--keep]   [--list]  [--no-act]  [--offset <offset>]  [--y2kbug[=utc|=local]]
       [--parameters <path>]  [--reset]  [--table <path>]  [--verbose]  [--version]  [--help]  [--drive <drive>]  [--enable <options>]   [--inter‐
       rupt <keys>]  [--partition <partition>]  [--timeout <timeout>]

DESCRIPTION
       install-mbr  installs  and  configures  a  Master  Boot Record manager on a device.  The behaviour of the boot manager is determined by the
       options given on the command line.  <target> is the path specifying the device (or file) that the boot manager should be installed onto.

MBR BEHAVIOUR
       When the MBR is first loaded it waits for a configurable length of time (1 second by default), monitoring the  keyboard  for  key  presses.
       The types of key which cause the MBR to be interrupted can be configured through the -i option to install-mbr.

       If  the  MBR  is interrupted, it will display its prompt.  Otherwise it will load the first sector of the default partition and execute it.
       If a disk error occurs or the boot signature is missing, the prompt will be displayed.

   The boot prompt
       The boot prompt looks something like this:

              14FA:

       This is the list of valid keys which may be pressed followed by a colon.  Numeric keys indicate primary partitions on  the  disk  beginning
       with  partition  1  and  'F'  indicates  the floppy disk.  Extended partitions cannot be booted.  The 'A' means that 'advanced' mode may be
       entered, in which case any partition may be booted.  The only other valid key which may be pressed is RETURN, which continues booting  with
       the default partition.

       The prompt for advanced mode looks like this and works just the same as the normal prompt.

              1234F:

       The list of valid partitions and the default partition can be configured through the -e and -p options to install-mbr.

OPTIONS
   Installation options
       These options change the way the installation program operates.

       --force, -f
              This option currently overrides a check to make sure the specified target is valid.

       --install <path>, -I <path>
              This  option may be used to install code other than that which is built in to install-mbr.  It is mainly useful for testing, but may
              be used to install older versions of the MBR.

       --keep, -k
              This option instructs the installer to modify the parameters stored in the MBR without updating the code.

       --list, -l
              This option may be used to view the parameters being installed in the MBR.  It implies the  --no-act  and  --keep  flags  unless  an
              option other than --offset, --verbose or --list is given.  This allows the contents of the MBR to be examined.

       --no-act, -n
              This option ensures that the target is not modified, as it is opened in read-only mode.

       --offset <offset>, -o <offset>
              This  option  may be used to install the MBR somewhere other than the start of the target.  The offset specifies the number of bytes
              from the start of the target at which the MBR should be installed.  For example, an offset of  128  may  be  used  for  DOSEMU  disk
              images.

       --y2kbug[=utc|=local|=off], -y[u|l|-]
              This  option  specifies  the status of the Y2K bug fix parameter.  When set, an alternative MBR is installed that fixes a Y2K bug in
              some BIOSes that causes them to always boot up the machine with the year ranging from 94 to 99.  This MBR stores the  current  month
              and  year  and  sets  the year based on this when the computer is booted.  It also increases the year automatically when the current
              month is lower than the month of the last boot.  The initial year and month are set based on the current system  time  converted  to
              UTC  or  the  local time as specified by the argument.  If the argument is not specified, the default is read from /etc/default/rcS.
              Due to space limitations, the alternative version of the MBR does not display the word MBR as it boots.  If the argument is =off  or
              -  the Y2K bug fix is disabled.  WARNING: The Y2K bug fix will work fine until you want to set the date backwards.  When you do want
              to do this, you will need to reinstall the MBR.  You cannot just set the date in the BIOS (since the whole point of this  option  is
              that the year provided by the BIOS is ignored).

       --parameters <path>, -P <path>
              This  option  may be used to copy parameters from somewhere other than the target.  The path specifies a location where a version of
              this MBR has been installed and parameters are read from there.  It could be used to copy parameters from one disk to another disk.

       --reset, -r
              This option is used to reset the boot parameters to the state found in the code being installed (or code which would be installed if
              --keep were not specified).

       --table <path>, -T <path>
              The master boot record currently uses the partition table in the sector which contains it to locate boot sectors (This behaviour may
              change with future versions of the MBR, in which case the option may be withdrawn).  The --table option is used to copy a  partition
              table from another location to the target location.  Any data stored on the target disk may be lost (as the partition table is over‐
              written), so this option should be used with extreme caution.  As the partition table is copied, any changes made  to  the  original
              partition table will not be noticed.  This option is only provided to make installation to floppy easy.

       --verbose, -v
              When invoked with this option, install-mbr will display some information about what it is doing.

       --version, -V
              This option will cause install-mbr to display it's version number and exit.

       --help, -h
              This option will cause install-mbr to display a help message and exit.

   Parameter options
       These options change the parameters stored within the Master Boot Record.

       --drive <drive>, -d <drive>
              This option instructs the MBR to boot a drive other than the first hard disk.  It may be specified in decimal or hexadecimal if pre‐
              fixed with 0x.  Hard disks are numbered starting from 128 (0x80).

       --enable <option>, -e <option>
              This option sets the list of boot sectors which may be loaded (or advanced mode).  A boot sector may be loaded from one of the first
              4 partitions of the disk, or from the first floppy drive.  Use --enable +<spec> to add a boot sector to the list or --enable -<spec>
              to remove a boot sector from the list.  Use --enable =<spec> to set the list to <spec>.  <spec> may contain:

              1, 2, 3, 4
                          The specified partition number.

              F           The first floppy disk.

              A           Advanced mode (not a boot sector).

       --interrupt <mode>, -i <mode>
              This option sets the list of events which will cause the MBR to display it's prompt.  Use -i +<event> to add an event to the list or
              -i -<event> to remove an event from the list.  Values of <event> are:

              s      A shift or control key is pressed.

              k      A non shift-like key is pressed

              a      The prompt is always displayed.

              n      Never display the prompt (unless an error occurs).

       -p <partn>, --partition <partn>
              This specifies the default boot sector to load.  Valid values of <partn> are:

              1, 2, 3, 4
                     The specified partition number.

              F      The first floppy disk.

              D      The partition marked with the bootable flag in the partition table.

       -t <timeout>, --timeout <timeout>
              This  option  changes  the  time which the MBR waits for before booting the default partition to the value specified in 1/18 seconds
              (approx).  The maximum timeout that can be specified is 65534 which is about an hour.

EXAMPLES
       install-mbr /dev/fd0 -T /dev/hda

       Install the default MBR image on /dev/fd0, taking the partition table from /dev/hda.

       install-mbr -kr /dev/hda

       Reset the parameters on /dev/hda without installing any new code.

       install-mbr -I my-mbr -T /dev/hda -P my-parameters /dev/fd0

       Install to /dev/fd0, taking code from my-mbr, partition table from /dev/hda and parameters from my-parameters.

       install-mbr -l -o 128 hdimage

       List the parameters stored at offset 128 in hdimage (may be a DOSEMU image).

       install-mbr -d 0x81 -T /dev/hdb /dev/fd0

       Install on /dev/fd0 to boot from BIOS drive 129 (0x81) with partition table copied from /dev/hdb.

       install-mbr -e 13 /dev/hda

       install-mbr -e 2 -e =13 /dev/hda

       install-mbr -e1 -e3 /dev/hda

       Enable booting from partitions 1 and 3 on /dev/hda.  Other locations are disabled.

       install-mbr -e +f-a -i sk /dev/hda

       Enabled booting from the floppy drive, and disable advanced mode.  Display the prompt if any  shift,  control  or  non  shift-like  key  is
       pressed.  Other settings are untouched.

DIAGNOSTICS
       Cannot handle MBR version n (backwards compatible to n)

              This  error  means  that  the  version of MBR which is being installed is not known about by this installer.  Such files cannot have
              their parameters read or written.  If such a newer version is installed, it can be  downgraded  by  specifying  the  --reset  option
              (without specifying --keep).

SEE ALSO
       grub(8), lilo(8)

BUGS
       The operation of --list may be confusing.

AUTHOR
       install-mbr was written for the Debian project by Neil Turton <neilt+mbr@chiark.greenend.org.uk>.

Linux                                                              16 April 2006                                                    INSTALL-MBR(8)
