GRUBBY(8)                                                                                  System Manager's Manual                                                                                  GRUBBY(8)



NAME
       grubby - command line tool used to configure bootloader menu entries across multiple architectures


SYNOPSIS
       grubby [OPTIONS]


DESCRIPTION
   General Information
       grubby  is  a command line tool for updating and displaying information about the configuration files for various architecture specific bootloaders.  It is primarily designed to be used from scripts
       which install new kernels and need to find information about the current boot environment.


   Architecture Support
       The grubby executable has full support for the grub2 bootloader on x86_64 systems using legacy BIOS or modern UEFI firmware and ppc64 and ppc64le hardware using OPAL or SLOF as firmware.

       Legacy s390 and the current s390x architectures and their zipl bootloader are fully supported.

       Support for yaboot has been deprecated as all ppc architecture hardware since the Power8 uses grub2 or petitboot which both use the grub2 configuration file format.

       Legacy bootloaders LILO, SILO, and ELILO are deprecated and no longer receiving active support in favor of previously mentioned bootloaders.


   Default Behavior
       The default bootloader target is primarily determined by the architecture for which grubby has been built.  Each architecture has a preferred bootloader, and each bootloader has its  own  configura‐
       tion  file.   If  no bootloader is selected on the command line, grubby will use these default settings to search for an existing configuration.  If no bootloader configuration file is found, grubby
       will use the default value for that architecture.  These defaults are listed in the table below.


       ┌────────────────┬────────────┬─────────────────────────────────┐
       │ Arch           │ Bootloader │ Configuration File              │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ x86_64 [BIOS]  │ grub2      │ /boot/grub2/grub.cfg            │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ x86_64 [UEFI]  │ grub2      │ /boot/efi/EFI/redhat/grub.cfg   │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ i386           │ grub2      │ /boot/grub2/grub.cfg            │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ ia64           │ elilo      │ /boot/efi/EFI/redhat/elilo.conf │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ ppc [>=Power8] │ grub2      │ /boot/grub2/grub.cfg            │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ ppc [<=Power7] │ yaboot     │ /etc/yaboot.conf                │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ s390           │ zipl       │ /etc/zipl.conf                  │
       ├────────────────┼────────────┼─────────────────────────────────┤
       │ s390x          │ zipl       │ /etc/zipl.conf                  │
       └────────────────┴────────────┴─────────────────────────────────┘


   Special Arguments
       There are a number of ways to specify the kernel used for --info, --remove-kernel, and --update-kernel. Specifying DEFAULT or ALL selects the default entry and all of the entries, respectively.   If
       a  comma  separated  list  of  numbers is given, the boot entries indexed by those numbers are selected. Finally, the title of a boot entry may be specified by using TITLE=title as the argument; all
       entries with that title are used.


OPTIONS
   Basic Options
       --add-kernel=kernel-path
              Add a new boot entry for the kernel located at kernel-path. A title for the boot entry must be set using --title. Most invocations should also include --initrd with  memtest86  as  a  notable
              exception.

              The --update-kernel option may not be used in the same invocation.


       --remove-kernel=kernel-path
              Remove all boot entries which match kernel-path. This may be used along with --add-kernel, in which case the new entry being added will not be removed.


       --update-kernel=kernel-path
              Update the entries for kernels matching kernel-path. Currently the only item that can be updated is the kernel argument list, which is modified via the --args and --remove-args options.


       --args=kernel-args
              When  a  new  kernel  is added, this specifies the command line arguments which should be passed to the kernel by default (note they are merged with the arguments from the template if --copy-
              default is used).  When --update-kernel is used, this specifies new arguments to add to the argument list. Multiple, space separated arguments may be used. If an argument already  exists  the
              new value replaces the old values. The root= kernel argument gets special handling if the configuration file has special handling for specifying the root filesystem (like lilo.conf does).


       --remove-args=kernel-args
              The  arguments  specified  by kernel-args are removed from the kernels specified by --update-kernel. The root argument gets special handling for configuration files that support separate root
              filesystem configuration.


       --copy-default
              grubby will copy as much information (such as kernel arguments and root device) as possible from the current default kernel. The kernel path and initrd path will never be copied.


       --title=entry-title
              When a new kernel entry is added entry-title is used as the title (lilo label) for the entry. If entry-title is longer then maximum length allowed by the bootloader (15  for  lilo,  unlimited
              for grub and elilo) the title is shortened to a (unique) entry.


       --initrd=initrd-path
              Use initrd-path as the path to an initial ram disk for a new kernel being added.


       --efi  Use appropriate bootloader commands for EFI on this architecture.


       --set-default=kernel-path
              The first entry which boots the specified kernel is made the default boot entry. This may not be invoked with --set-default-index.


       --set-default-index=entry-index
              Makes the given entry number the default boot entry. This may not be invoked with --set-default.  The given value represents the index in the post-modification boot entry list.


       --make-default
              Make the new kernel entry being added the default entry.


       --set-index=entry-index
              Set the position at which to add a new entry created with --add-kernel.


       --debug
              Display extra debugging information for failures.


       -i, --extra-initrd=initrd-path
              Use initrd-path as the path for an auxiliary initrd image.


   Display Options
       Passing  the  display option to grubby will cause it to print out the requested information about the current bootloader configuration and then immediately exit.  These options should not be used in
       any script intended to update the bootloader configuration.


       --default-kernel
              Display the full path to the current default kernel and exit.


       --default-index
              Display the numeric index of the current default boot entry and exit.


       --default-title
              Display the title of the current default boot entry and exit.


       --info=kernel-path
              Display information on all boot entries which match kernel-path. If kernel-path is DEFAULT, then information on the default kernel is displayed. If kernel-path is ALL, then information on all
              boot entries are displayed.


       --bootloader-probe
              Attempt  to probe for installed bootloaders.  If this option is specified, grubby tries to determine if grub or lilo is currently installed. When one of those bootloaders is found the name of
              that bootloader is displayed on stdout.  Both could be installed (on different devices), and grubby will print out the names of both bootloaders, one per line. The probe for grub  requires  a
              commented  out boot directive grub.conf identical to the standard directive in the lilo configuration file. If this is not present grubby will assume grub is not installed (note that anaconda
              places this directive in grub.conf files it creates).

              This option is only available on x86 BIOS platforms.


       -v, --version
              Display the version of grubby being run and then exit immediately.


   Output Format Options
       Sane default options for the current platform are compiled into grubby on a per platform basis. These defaults determine the format and layout of the generated bootloader configuration file. A  dif‐
       ferent configuration file format may be specified on the command line if the system uses a supported alternative bootloader.


       --elilo
              Use an elilo style configuration file. This is the default on ia64 platforms. This format is deprecated.


       --extlinux
              Use an extlinux style configuration file. This format is deprecated.


       --grub Use a grub style configuration file. This is the default on the i386 architecture.


       --grub2
              Use a grub2 style configuration file. This is the default on x86_64 architecture as well as the ppc64 and ppc64le architectures running on Power8 or later hardware.


       --lilo Use a lilo style configuration file.


       --silo Use a silo style configuration file. This is the default on SPARC systems. This format is legacy, deprecated, and unsupported.


       --yaboot
              Use a yaboot style configuration file. This is the default for the ppc architecture on on Power7 and earlier hardware.


       --zipl Use a zipl style configuration file. This is the default on the legacy s390 and current s390x architectures.


   Override Options
       --bad-image-okay
              When  grubby is looking for a entry to use for something (such as a template or a default boot entry) it uses sanity checks, such as ensuring that the kernel exists in the filesystem, to make
              sure entries that obviously won't work aren't selected. This option overrides that behavior, and is designed primarily for testing.


       --boot-filesystem=bootfs
              The grub boot loader expects file paths listed in its configuration path to be relative to the top of the filesystem they are on, rather then relative  to  the  current  root  filesystem.  By
              default  grubby searches the list of currently mounted filesystems to determine this. If this option is given grubby acts as if the specified filesystem was the filesystem containing the ker‐
              nel (this option is designed primarily for testing).


       --env=path
              Path for the file where grub environment data is stored.


       -c, --config-file=path
              Use path as the configuration file rather then the default.


       -o, --output-file=file_path
              The destination path for the updated configuration file. Use "-" to send it to stdout.


   Multiboot Options
       The Multiboot Specification provides a generic interface for boot loaders and operating systems.  It is supported by the GRUB bootloader.


       --add-multiboot=multiboot-path
              Add a new boot entry for the multiboot kernel located at multiboot-path.  Note that this is generally accompanied with a --add-kernel option.


       --remove-multiboot=multiboot-path
              Removes all boot entries which match multiboot-path.


       --mbargs=multiboot-args
              When a new multiboot kernel is added, this specifies the command line arguments which should be passed to that kernel by default When --update-kernel is used, this specifies new arguments  to
              add to the argument list. Multiple, space separated arguments may be used. If an argument already exists the new value replaces the old values.


       --remove-mbargs=multiboot-args
              The arguments specified by multiboot-args are removed from the kernels specified by --update-kernel.


BUGS
       The command line syntax is more than a little baroque. This probably won't be fixed as grubby is only intended to be called from shell scripts which can get it right.


EXAMPLE
       The following examples assume the following:


       ┌────────────────┬─────────────────────────────────────────────┐
       │       cfg_file │ Full path to bootloader config file         │
       ├────────────────┼─────────────────────────────────────────────┤
       │     new_kernel │ Full path to kernel image to be installed   │
       ├────────────────┼─────────────────────────────────────────────┤
       │     old_kernel │ Full path to old kernel image to be removed │
       ├────────────────┼─────────────────────────────────────────────┤
       │ current_kernel │ Full path to a currently installed kernel   │
       ├────────────────┼─────────────────────────────────────────────┤
       │    entry_title │ Title that appears on bootloader menu       │
       ├────────────────┼─────────────────────────────────────────────┤
       │     new_initrd │ Full path to initrd for a new kernel        │
       ├────────────────┼─────────────────────────────────────────────┤
       │    kernel_args │ Set of arguments for the kernel             │
       ├────────────────┼─────────────────────────────────────────────┤
       │     menu_index │ Index number of a menu entry                │
       └────────────────┴─────────────────────────────────────────────┘
       The examples below quote strings that may have spaces or other whitespace in them. It is also perfectly valid to backslash escape these strings if that is more convenient.


       Add a new kernel entry and copy all options from the current default kernel.  This is the behavior that most users will want.

              grubby --add-kernel=new_kernel --title="entry_title" --initrd="new_initrd" --copy-default

       Add a new kernel entry with custom arguments

              grubby --add-kernel=new_kernel --title="entry_title" --initrd="new_initrd" --args=kernel_args

       Remove all menu entries for a specified kernel.

              grubby --remove-kernel=old_kernel

       Target a single menu entry to remove without targetting other entries with the same kernel.

              grubby --info=old_kernel

              grubby --remove-kernel=menu_index

       Update the arguments for all entries of a specific kernel. New arguments get added while existing arguments get updated values.

              grubby --update-kernel=current_kernel --args="kernel_args"

       Remove the arguments for a single entry of a specific kernel.

              grubby --info=current_kernel

              grubby --remove-args=menu_index --args="kernel_args"


SEE ALSO
       grub(8), lilo(8), yaboot(8), zipl(8), dracut(8), mkinitrd(8)


AUTHORS
       Erik Troan
       Jeremy Katz
       Peter Jones
       Robert Marshall



                                                                                               Tue Jan 18 2005                                                                                      GRUBBY(8)
