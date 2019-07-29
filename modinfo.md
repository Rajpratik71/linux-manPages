MODINFO(8)                                                            modinfo                                                           MODINFO(8)

NAME
       modinfo - Show information about a Linux Kernel module

SYNOPSIS
       modinfo [-0] [-F field] [-k kernel] [modulename|filename...]

       modinfo -V

       modinfo -h

DESCRIPTION
       modinfo extracts information from the Linux Kernel modules given on the command line. If the module name is not a filename, then the
       /lib/modules/version directory is searched, as is also done by modprobe(8) when loading kernel modules.

       modinfo by default lists each attribute of the module in form fieldname : value, for easy reading. The filename is listed the same way
       (although it's not really an attribute).

       This version of modinfo can understand modules of any Linux Kernel architecture.

OPTIONS
       -V, --version
           Print the modinfo version.

       -F, --field
           Only print this field value, one per line. This is most useful for scripts. Field names are case-insensitive. Common fields (which may
           not be in every module) include author, description, license, parm, depends, and alias. There are often multiple parm, alias and
           depends fields. The special field filename lists the filename of the module.

       -b basedir, --basedir basedir
           Root directory for modules, / by default.

       -k kernel
           Provide information about a kernel other than the running one. This is particularly useful for distributions needing to extract
           information from a newly installed (but not yet running) set of kernel modules. For example, you wish to find which firmware files are
           needed by various modules in a new kernel for which you must make an initrd/initramfs image prior to booting.

       -0, --null
           Use the ASCII zero character to separate field values, instead of a new line. This is useful for scripts, since a new line can
           theoretically appear inside a field.

       -a --author, -d --description, -l --license, -p --parameters, -n --filename
           These are shortcuts for the --field flag's author, description, license, parm and filename arguments, to ease the transition from the
           old modutils modinfo.

COPYRIGHT
       This manual page originally Copyright 2003, Rusty Russell, IBM Corporation. Maintained by Jon Masters and others.

SEE ALSO
       modprobe(8)

AUTHORS
       Jon Masters <jcm@jonmasters.org>
           Developer

       Lucas De Marchi <lucas.de.marchi@gmail.com>
           Developer

kmod                                                                11/12/2018                                                          MODINFO(8)
