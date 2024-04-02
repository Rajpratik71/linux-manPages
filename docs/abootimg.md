ABOOTIMG(1)                                                   General Commands Manual                                                  ABOOTIMG(1)

NAME
       abootimg - manipulate Android Boot Images.

DESCRIPTION
       Tool to read/write/update android boot images

SYNOPSIS
       abootimg
        -i <bootimg>
       abootimg
        -x <bootimg> [<bootimg.cfg> [<kernel> [<ramdisk> [<secondstage>]]]]
       abootimg
        -u <bootimg> [-c "param=value"] [-f <bootimg.cfg>] [-k <kernel>] [-r <ramdisk>] [-s <secondstage>]
       abootimg
        --create <bootimg> [-c "param=value"] [-f <bootimg.cfg>] -k <kernel> -r <ramdisk> [-s <secondstage>]

OPTIONS
       -i     print boot imgage informations

       -x     Extract a boot image

       -u     Update a boot image

       --create
              Create a boot image

   Options for extracting boot images
       bootimg
              Existing bootimage to use

       bootimg.cfg
              Name for the bootimg.cfg file, defaults to bootimg.cfg

       kernel Name for the kernel image, defaults to zImage

       ramdisk
              Name for the ramdisk image, defaults to initrd.img

       secondstage
              Name for the second-stage image, defaults to stage2.img

   Options for updating and creating boot images
       bootimg
              Existing bootimage to use

       -c param=value
              Existing bootimage to use

       -f <bootimg.cfg>
              Update bootimg.cfg with the named file

       -k <kernel>
              Update kernel with the named file

       -r <ramdisk>
              Update ramdisk with the named file

       -s <secondstage>
              Update secondstage image with the named file

                                                                                                                                       ABOOTIMG(1)
