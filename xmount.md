xmount(1)                                                             xmount                                                             xmount(1)

NAME
       xmount - Tool to crossmount between multiple input and output harddisk image files

SYNOPSIS
       xmount [fopts] <xopts> <mntp>

DESCRIPTION
       xmount  allows  you  to  convert  on-the-fly between multiple input and output harddisk image formats. xmount creates a virtual file system
       using FUSE (Filesystem in Userspace) that contains a virtual representation of the input image.

       The virtual representation can be in raw DD, Apple's Disk Image format (DMG), VirtualBox's virtual disk file format (VDI), Microsoft's Vir‐
       tual Hard Disk Image format (VHD) or in VmWare's VMDK file format.

       Input images can be raw DD, EWF (Expert Witness Compression Format) or AFF (Advanced Forensic Format) files.

       In  addition,  xmount  also supports virtual write access to the output files that is redirected to a cache file. This makes it possible to
       boot acquired harddisk images using QEMU, KVM, VirtualBox, VmWare or alike.

OPTIONS
       fopts: (Options specific to FUSE)
         -d: Enable FUSE's and xmount's debug mode.
         -h: Display this help message.
         -s: Run single threaded.
         -o no_allow_other: Disable automatic addition of FUSE's allow_other option.
         -o <fmopts> :
           Specify fuse mount options. Will also disable automatic addition of FUSE's
           allow_other option!

       xopts: (Options specific to xmount)
         --cache <cfile> : Enable virtual write support.
           <cfile> specifies the cache file to use.
         --in <itype> <ifile> : Input image format and source file(s). May be specified multiple times.
           For a list of supported <itype> types, run xmount --info and look under "loaded input libraries".
           <ifile> specifies the source file. If your image is split into multiple files, you have to specify them all!
         --inopts <iopts> : Specify input library specific options.
           <iopts> specifies a comma separated list of key=value options.
         --info : Print out infos about used compiler and loaded libraries.
         --morph <mtype> : Morphing function to apply to input image(s). If not specified, defaults to "combine".
           For a list of supported <mtype> types, run xmount --info and look under "loaded morphing libraries".
         --morphopts <mopts> : Specify morphing library specific options.
           <mopts> specifies a comma separated list of key=value options.
         --offset <off> : Move the output image data start <off> bytes into the input image(s).
         --out <otype> : Output image format. If not specified, defaults to "raw".
           <otype> can be "raw", "dmg", "vdi", "vhd", "vmdk", "vmdks".
         --owcache <file> : Same as --cache <file> but overwrites existing cache file.
         --sizelimit <size> : The data end of input image(s) is set to no more than <size> bytes after the data start.
         --version : Same as --info.

       mntp:
         Mount point where virtual files should be located.

BUGS
       Hopefully none. If you find any, please e-mail to <bugs@pinguin.lu>.

EXAMPLE
       To xmount an EWF image from your acquired disk as a raw DD image under /mnt, use the following command:

         xmount --in ewf ./acquired_disk.E?? /mnt

       To xmount the same ewf image as vdi file, you would use a command like this:

         xmount --in ewf ./acquired_disk.E?? --out vdi /mnt

       And to enable virtual write support on a raw DD input image xmounted as VDI file:

         xmount --in raw ./acquired_disk.dd --out vdi --cache ./disk.cache /mnt

Daniel Gillen                                                      Sep 26, 2014                                                          xmount(1)
