NEW-KERNEL-PKG(8)                                                                          System Manager's Manual                                                                          NEW-KERNEL-PKG(8)



NAME
       new-kernel-pkg - tool to script kernel installation


SYNOPSIS
       new-kernel-pkg [-v] [--mkinitrd] [--rminitrd] [--dracut]
              [--initrdfile=initrd-image [--depmod] [--rmmoddep]
              [--kernel-args=args] [--remove-args=args]
              [--banner=banner] [--multiboot=multiboot]
              [--mbargs=mbargs] [--make-default] [--add-dracut-args]
              [--add-plymouth-initrd] [--host-only]
              <--install | --remove | --update | --rpmposttrans> <kernel-version>


DESCRIPTION
       new-kernel-pkg  is  a  tool used in packaging to automate the installation of a new kernel, including the creation of an initial ram filesystem image, updating of bootloader configuration, and other
       associated tasks.


OPTIONS
       -v     Be verbose.


       --mkinitrd
              Create a new initial ram filesystem image.


       --rminitrd
              Remove an initial ram filesystem image.


       --dracut
              When creating a new initial ram filesystem image, use dracut(8) rather than mkinitrd(8).  Used in conjunction with --mkinitrd .


       --initrdfile=initrd-image
              Use the specified file as the initial ram filesystem image.


       --depmod
              Create modules.dep and related files.


       --rmmoddep
              Remove modules.dep and related files.


       --kernel-args=args
              Use args as the boot command line for this kernel.


       --remove-args=args
              Remove specified kernel arguments for this kernel.


       --banner=banner
              Display banner as the banner text in the bootloader.


       --multiboot=multiboot-image
              Use multiboot-image as a multiboot image.


       --mbargs=mbargs
              Use mbargs as arguments to the multiboot image.


       --make-default
              Make this kernel the default boot option.


       --add-dracut-args
              Automatically generate dracut options and add them to the kernel command line.


       --add-plymouth-initrd
              Automatically add plymouth to the initial ram filesystem image.


       --host-only
              Make an initial ram filesystem image that is specific to the running system.


       --install kernel-version
              Install a new kernel.


       --remove kernel-version
              Remove an installed kernel.


       --update kernel-version
              Update the specified kernel.


       --rpmposttrans kernel-version
              Run the rpmposttrans for the specified kernel.


SEE ALSO
       grubby(8) installkernel(8)


AUTHORS
       Erik Troan
       Jeremy Katz
       Peter Jones



                                                                                               Wed Apr 14 2010                                                                              NEW-KERNEL-PKG(8)
