APT-CDROM(8)                                                            APT                                                           APT-CDROM(8)

NAME
       apt-cdrom - APT CD-ROM management utility

SYNOPSIS
       apt-cdrom [-rmfan] [-d=cdrom_mount_point] [-o=config_string] [-c=config_file] {add | ident | {-v | --version} | {-h | --help}}

DESCRIPTION
       apt-cdrom is used to add a new CD-ROM to APT's list of available sources.  apt-cdrom takes care of determining the structure of the disc as
       well as correcting for several possible mis-burns and verifying the index files.

       It is necessary to use apt-cdrom to add CDs to the APT system; it cannot be done by hand. Furthermore each disc in a multi-CD set must be
       inserted and scanned separately to account for possible mis-burns.

       Unless the -h, or --help option is given, one of the commands below must be present.

       add
           add is used to add a new disc to the source list. It will unmount the CD-ROM device, prompt for a disc to be inserted and then proceed
           to scan it and copy the index files. If the disc does not have a proper .disk directory you will be prompted for a descriptive title.

           APT uses a CD-ROM ID to track which disc is currently in the drive and maintains a database of these IDs in /var/lib/apt/cdroms.list

       ident
           A debugging tool to report the identity of the current disc as well as the stored file name

OPTIONS
       All command line options may be set using the configuration file, the descriptions indicate the configuration option to set. For boolean
       options you can override the config file by using something like -f-,--no-f, -f=no or several other variations.

       --no-auto-detect, --cdrom
           Do not try to auto-detect the CD-ROM path. Usually combined with the --cdrom option. Configuration Item: Acquire::cdrom::AutoDetect.

       -d, --cdrom
           Mount point; specify the location to mount the CD-ROM. This mount point must be listed in /etc/fstab and properly configured.
           Configuration Item: Acquire::cdrom::mount.

       -r, --rename
           Rename a disc; change the label of a disc or override the disc's given label. This option will cause apt-cdrom to prompt for a new
           label. Configuration Item: APT::CDROM::Rename.

       -m, --no-mount
           No mounting; prevent apt-cdrom from mounting and unmounting the mount point. Configuration Item: APT::CDROM::NoMount.

       -f, --fast
           Fast Copy; Assume the package files are valid and do not check every package. This option should be used only if apt-cdrom has been run
           on this disc before and did not detect any errors. Configuration Item: APT::CDROM::Fast.

       -a, --thorough
           Thorough Package Scan; This option may be needed with some old Debian 1.1/1.2 discs that have Package files in strange places. It takes
           much longer to scan the CD but will pick them all up.

       -n, --just-print, --recon, --no-act
           No Changes; Do not change the sources.list(5) file and do not write index files. Everything is still checked however. Configuration
           Item: APT::CDROM::NoAct.

       -h, --help
           Show a short usage summary.

       -v, --version
           Show the program version.

       -c, --config-file
           Configuration File; Specify a configuration file to use. The program will read the default configuration file and then this
           configuration file. If configuration settings need to be set before the default configuration files are parsed specify a file with the
           APT_CONFIG environment variable. See apt.conf(5) for syntax information.

       -o, --option
           Set a Configuration Option; This will set an arbitrary configuration option. The syntax is -o Foo::Bar=bar.  -o and --option can be
           used multiple times to set different options.

SEE ALSO
       apt.conf(5), apt-get(8), sources.list(5)

DIAGNOSTICS
       apt-cdrom returns zero on normal operation, decimal 100 on error.

BUGS
       APT bug page[1]. If you wish to report a bug in APT, please see /usr/share/doc/debian/bug-reporting.txt or the reportbug(1) command.

AUTHORS
       Jason Gunthorpe

       APT team

NOTES
        1. APT bug page
           http://bugs.debian.org/src:apt

APT 1.2.32                                                       30 November 2013                                                     APT-CDROM(8)
