KDUMPTOOL(8)                                                                                     User Manuals                                                                                    KDUMPTOOL(8)



NAME
       kdumptool - Binary to support kdump saving and loading

SYNOPSIS
       kdumptool [globals] command [options] [arguments]

DESCRIPTION
       kdumptool provides various subcommands to support following actions for kdump. It can:

       ·   help to identify a kernel (whether it’s relocatable or not, whether it’s ELF or x86-style independent of the file name),

       ·   save a dump over various transports (local file, SSH2, FTP, NFS, SMB),

       ·   copy the kernel including debugging information from one directory to the dump directory over the same transports as the dump itself,

       ·   delete old dumps,

       ·   read the VMCOREINFO (see makedumpfile(8) of kernel core dumps),

       ·   show the progress over the keyboard LED.

       Because most functionality is needed in the initrd, the design decision was to provide that functionality in one binary without huge dependencies and without a scripting language.

USAGE
       To select which functionality is needed, one has to provide a command. So, for example kdump save_dump and kdump copy_kernel is used to copy the kernel. There are global options which are valid for
       all (sub)commands and there are normal options which are only valid for a specific command. Also, the command can take an arbitrary number of arguments.

       Additional to the command line options described in that manual page, the behavior is influenced by configuration options in /etc/sysconfig/kdump (or a different configuration file specified with
       the -F (--configfile) option. Please read kdump(5) for documentation about the configuration options.

GLOBAL OPTIONS
       All option parsing is done via the getopt_long(5) function, and therefore follows all standard command line parsing rules.

       -h | --help
           Shows help output and exits.

       -v | --version
           Shows version information and exits.

       -b | --background
           Run in daemon mode. This option is useful for the led_blink subcommand.

       -D | --debug
           Prints debugging information (to stderr). If the output is redirected to a terminal, then the various levels of debug information are colored. Use -L (--logfile) to redirect the debug output to
           a file.

       -L filename | --logfile filename
           Redirects the debugging output to the logfile specified with filename.

       -F filename | --configfile filename
           Use a different configuration file instead of /etc/sysconfig/kdump.

       -C filename | --cmdline filename
           Modify the configuration with options read from filename, which is treated as a kernel-style command line (e.g.  /proc/cmdline). This file is read after the main configuration file, so file
           options can be overridden on the kernel command line.

IDENTIFYING A KERNEL
       When finding a kernel that is suitable for kdump on the system, it’s necessary to know if that is a relocatable kernel. Historically, on every platform except Itanium (IA64) kdump used a special
       kernel compiled with another start address. That kernel had always "kdump" in its name on SUSE systems. If such a kernel is found, that kernel is preferred. However, if there is no such kernel, the
       kdump init script (/etc/init.d/kdump) looks for normal kernels that are relocatable.

   Syntax
       kdumptool [globals] identify_kernel [-r] [-t]

       It’s necessary to provide either -r, -t or both.

   Options
       -r | --relocatable
           Checks if the kernel is relocatable. If it is, it prints the string Relocatable on stdout and exits with error code 0. If it’s not relocatable, then it prints Not relocatable and exits with 2.

       -t | --type
           Prints the type of the kernel. There are following types: x86 for the bzImage format, ELF for a normal ELF binary and ELF gzip for gzipped ELF binary.

DUMP SAVING
       This command is used to save the dump to the specified KDUMP_DUMPDIR in the configuration file with KDUMP_DUMPLEVEL in KDUMP_DUMPFORMAT.

       When KDUMP_DUMPFORMAT is not "ELF" and the KDUMP_DUMPLEVEL is not 0, the makedumpfile tool will be used to save the dump. For NFS and CIFS, kernel support of mounting these shares is required. For
       NFS, the showmount tool is required to check the exported file systems first.

       This command also checks if the dump is too large to fit on disk (see KDUMP_FREE_DISK_SIZE). If that is the case, the dump is deleted afterwards. It’s not possible to know the dump size in advance
       (if dump filtering and/or dump compression is used).

       After the dump has been saved, a notification email is sent via the SMTP server specified as KDUMP_SMTP_SERVER (with the authentication credentials specified as KDUMP_SMTP_USER and KDUMP_SMTP_USER)
       to the mail addresses specified in KDUMP_NOTIFICATION_TO and KDUMP_NOTIFICATION_CC. You can skip the mail part with the --nomail option. Also, if you don’t specify an SMTP server or a recipient, the
       mail part is silently skipped.

   Syntax
       kdumptool [globals] save_dump [-u dumpfile] [-R root] [-k ver] [-q fqdn]

   Options
       -u dumpfile | --dump dumpfile
           Don’t use /proc/vmcore as dump file but dumpfile. This is mostly for debugging.

       -R root | --root root
           Use root instead of / as root directory. That option is useful in initrd where the system root is not mounted to / but needs to be mounted externally.

       -k version | --kernelversion version
           Use version as kernel version (which is necessary if the dump saving process also copies the kernel binary) instead of the auto-detected one via VMCOREINFO.

       -H hostname | --hostname hostname
           Use hostname as host name in the README.txt file (in the dump directory). This is because the initrd often lacks proper network configuration, and we want the hostname of the old system in that
           README.txt file, not the initrd hostname (which may be an DHCP auto-generated host name).

       -M | --nomail
           Don’t send the notification email even if mail has been configured in the configuration file.

LED BLINKING
       To indicate that kdump initrd is booted, the keyboard LEDs should be blinking because VGA may be broken when dumping from X. That subcommand is used to achieve that.

       The command can only be executed as root. Consider using the -b (--background) option.

   Syntax
       kdumptool [globals] led_blink [-i interval]

   Options
       -i interval | --interval interval
           Use interval ms for the blink interval instead of the default 250 ms.

PRINTING VMCOREINFO
       In current kernel versions (starting from 2.6.25), the /proc/vmcore has a new PT_NOTE section called VMCOREINFO. This is a textual representation of key/value pairs read from makedumpfile to get
       some parameters of the running kernel in the crashed environment. This mechanism replaces the old VMCOREINFO file.

   Syntax
       kdumptool [globals] read_vmcoreinfo [-u dumpfile] [key]

       When no key is specified, this command just prints all key/value pairs in the form KEY=VALUE. The order is random and has nothing to do with the order the values appear in the PT_NOTE section.

   Options
       -u dumpfile | --dump dumpfile
           Don’t use /proc/vmcore as dump file but dumpfile. This is mostly for debugging.

DELETE OLD DUMPS
       The delete_dumps subcommands deletes as many old dumps in KDUMP_SAVEDIR as specified in KDUMP_KEEP_OLD_DUMPS.

   Syntax
       kdumptool [globals] delete_dumps [-y] [-R root]

   Options
       -y | --dry-run
           Don’t delete anything, just print out what would be deleted.

       -R root | --root root
           Use root instead of / as root directory. That option is useful in initrd where the system root is not mounted to / but needs to be mounted externally.

PRINT DUMP TARGET
       For usage in scripts, the target URL can be printed and parsed by kdumptool.

   Syntax
       kdumptool [globals] print_target [-R root]

   Options
       -R root | --root root
           Use root instead of / as root directory. That option is useful in initrd where the system root is not mounted to / but needs to be mounted externally.

PRINT KERNEL CONFIGURATION
       For kernels that have been compiled with CONFIG_IKCONFIG (usually also with CONFIG_IKCONFIG_PROC to display the kernel configuration in the running kernel in /proc/config.gz), that command dumps the
       embedded kernel configuration from a kernel image to standard output.

       All usual kernel image formats (ELF, compressed ELF, bzImage) are supported.

   Syntax
       kdumptool [globals] read_ikconfig kernelimage

DUMP KDUMPTOOL CONFIGURATION
       All configuration variables can be dumped to the standard output in a form that can be process by a shell or that can be passed as kernel parameters.

   Syntax
       kdumptool [globals] dump_config [-f format]

   Options
       -f format | --format format
           Use the specified output format. It must be one of:

           shell
               The output can be read as a shell script. (default)

           kernel
               The output can be passed as a kernel parameter.

       -u usage | --usage usage
           Show only configuration variables that are used for a specific stage. It is possible to specify multiple stages delimited by commas. Recognized stages are:

           mkinitrd
               Variables which control how the kdump initrd is created, e.g. which driver modules must be included.

           kexec
               Variables which are needed when loading the secondary kernel with kexec. Note that fadump does not use these variables.

           dump
               Variables used in the secondary kernel when saving the dump.

           all
               Show all variables. (default)

MODIFY MULTIPATH CONFIGURATION
       If multipath devices are used on a machine, then they should be also configured in the dump kernel. However, each multipath device needs some amount of RAM at run time, increasing the necessary size
       of the crash reserved area. That way it is even possible to exceed the maximum size of that area on machines with a very large number of multipath devices,

       This subcommand reads an existing multipath configuration on standard input, blacklists all devices except those specified on the command line, and sends the modified configuration to standard
       output. This allows to let the dump kernel initialize only multipath devices that are necessary for saving the dump.

   Syntax
       kdumptool [globals] multipath device[...]

       device is a multipath device specification (e.g. "wwid 360060e801531f800000131f80000a001"). See multipath.conf(5) for details.

RETURN VALUE
       0
           Success.

       255
           Unknown Error.

       2
           Kernel has been identified but is not relocatable.

FILES
       /etc/sysconfig/kdump
           Configuration file, see kdump(5).

BUGS
       Please report bugs and enhancement requests at https://bugzilla.novell.com.

COPYING
       Copyright (c) 2008 Bernhard Walle <bwalle@suse.de>. Free use of this software is granted under the terms of the GNU General Public License (GPL), version 2 or later.

SEE ALSO
       kexec(8), kdump(5), makedumpfile(8), http://en.opensuse.org/Kdump

AUTHOR
       Bernhard Walle <bwalle@suse.de>
           Author.



kdump 0.8.16                                                                                      07/04/2017                                                                                     KDUMPTOOL(8)
