mkzimage_cmdline(8)                                                                        System Manager's Manual                                                                        mkzimage_cmdline(8)



NAME
       mkzimage_cmdline - edit the built-in kernel cmdline in a PowerPC CHRP zImage

SYNOPSIS
       mkzimage_cmdline [-a 0|1] [-s 'kernel cmdline'] [-c] zImage

DESCRIPTION
       mkzimage_cmdline adds a kernel cmdline to a zImage. This string will be passed to the kernel, the contents in /options/boot-file will be overwritten with the provided cmdline.

OPTIONS
       -a 0|1 activate or deactivate the the cmdline

       -s 'kernel cmdline'
              pass this string to the kernel. It can be up to 511 chars long.

       -c     clear cmdline area in zImage

AUTHOR
       Olaf Hering <olh@suse.de>



                                                                                                                                                                                          mkzimage_cmdline(8)
