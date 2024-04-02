MKINITRAMFS(8)                                                                            mkinitramfs manual                                                                            MKINITRAMFS(8)

NAME
       mkinitramfs - low-level tool for generating an initramfs image

SYNOPSIS
       mkinitramfs [-c compress] [-d confdir] [-k] -o outfile [-r root] [-v] [version]

       mkinitramfs [--supported-host-version= hversion]

       mkinitramfs [--supported-target-version= tversion]

DESCRIPTION
       The mkinitramfs script generates an initramfs image.  The initramfs is a compressed cpio archive. The archive can be used on a different box of the same arch with the corresponding Linux ker‐
       nel.  mkinitramfs is meant for advanced usage. On your local box update-initramfs calls mkinitramfs with the relevant parameters.  update-initramfs keeps sha1sum of  generated  initramfs.  It
       takes care to generate backups and eventually runs the bootloader.

       At boot time, the kernel unpacks that archive into RAM disk, mounts and uses it as initial root file system. All finding of the root device happens in this early userspace.

OPTIONS
        -c  compress
              Override the COMPRESS setting in initramfs.conf.

        -d  confdir
              Set an alternate configuration directory.

        -k    Keep the temporary directory used to make the image.

        -o  outfile
              Write the image to outfile.

        -r  root
              Override the ROOT setting in initramfs.conf.

        -v    Set the verbose mode output.

        version
              Set the kernel version of the initramfs image (defaults to the running kernel).

       --supported-host-version=hversion
              This option queries if mkinitramfs can create ramdisks on a running kernel of version hversion.

       --supported-target-version=tversion
              This option queries if mkinitramfs can create ramdisks for kernel version tversion.

ENVIRONMENT
       mkinitramfs  honours the TMPDIR environment variable. If set, it uses subdirectories in the given directory to create its temporary working directories. Else it uses /var/tmp as default value
       for that purpose. The given directory should be on a filesystem which allows the execution of files stored there, i.e.  should not be mounted with the noexec mount option.

FILES
       /etc/initramfs-tools/initramfs.conf
              The default configuration file for the script. See initramfs.conf(5) for a description of the available configuration parameter.

       /etc/initramfs-tools/modules
              Specified modules will be put in the generated image and loaded when the system boots. The format - one per line - is identical to that of /etc/modules,  which  is  described  in  mod‐
              ules(5).

       /etc/initramfs-tools/conf.d
              The  conf.d  directory  allows  one to hardcode bootargs at initramfs build time via config snippets. This allows one to set ROOT or RESUME.  This is especially useful for bootloaders,
              which do not pass an root bootarg.

       /etc/initramfs-tools/DSDT.aml
              If this file exists, it will be appended to the initramfs in a way that causes it to be loaded by ACPI.

EXAMPLES
       Create an initramfs for current running kernel:

       mkinitramfs -o ~/tmp/initramfs-$(uname -r)

       Create an initramfs for specific kernel and keep builddirs:

       mkinitramfs -k -o ~/tmp/initramfs-2.6.21-686 2.6.21-686

       Debug initramfs creation (check out written logfile)

       sh -x mkinitramfs -o ~/tmp/initramfs-$(uname -r) 2> ~/tmp/log

AUTHOR
       The initramfs-tools are written by Maximilian Attems <maks@debian.org>, Jeff Bailey <jbailey@raspberryginger.com> and numerous others.

SEE ALSO
        initramfs.conf(5), initramfs-tools(8), update-initramfs(8), lsinitramfs(8), unmkinitramfs(8).

Linux                                                                                         2010/04/07                                                                                MKINITRAMFS(8)
