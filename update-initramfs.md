UPDATE-INITRAMFS(8)                      System Administration                     UPDATE-INITRAMFS(8)

NAME
       update-initramfs - generate an initramfs image

SYNOPSIS
       update-initramfs {-c|-d|-u} [-k version] [-v] [-b directory]
       update-initramfs -h

DESCRIPTION
       The update-initramfs script manages your initramfs images on your local box.  It keeps track of
       the existing initramfs archives in /boot.  There are three modes of operation create, update or
       delete.  You must at least specify one of those modes.

       The  initramfs  is  a gzipped cpio archive.  At boot time, the kernel unpacks that archive into
       RAM disk, mounts and uses it as initial root file system. All finding of the root  device  hap‐
       pens in this early userspace.

OPTIONS
       -k  version
              Set  the  specific kernel version for whom the initramfs will be generated.  For example
              the output of uname -r for your currently running kernel.  This argument is optional for
              update. The default is the latest kernel version.

              The use of "all" for the version string specifies update-initramfs to execute the chosen
              action for all kernel versions, that are already known to update-initramfs.

       -c     This mode creates a new initramfs.

       -u     This mode updates an existing initramfs.

       -d     This mode removes an existing initramfs.

       -v     This option increases the amount of information you are given during the chosen action.

       -b  directory
              Set an different bootdir for the image creation.

       -h, --help
              Print a short help page describing the available options in update-initramfs.

EXAMPLES
       Update the initramfs of the newest kernel:

       update-initramfs -u

       Create the initramfs for a specific kernel:

       update-initramfs -c -k 2.6.18-1-686

FILES
       /etc/initramfs-tools/update-initramfs.conf

AUTHOR
       The initramfs-tools are written by Maximilian  Attems  <maks@debian.org>,  Jeff  Bailey  <jbai‐
       ley@raspberryginger.com> and numerous others.

SEE ALSO
        initramfs.conf(5), initramfs-tools(7), mkinitramfs(8), lsinitramfs(8).

initramfs-tools                               2014/10/16                           UPDATE-INITRAMFS(8)
