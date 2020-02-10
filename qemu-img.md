QEMU-IMG(1)                                                                                                                                                                                   QEMU-IMG(1)

NAME
       qemu-img - QEMU disk image utility

SYNOPSIS
       usage: qemu-img command [command options]

DESCRIPTION
       qemu-img allows you to create, convert and modify images offline. It can handle all image formats supported by QEMU.

       Warning: Never use qemu-img to modify images in use by a running virtual machine or any other process; this may destroy the image. Also, be aware that querying an image that is being modified by
       another process may encounter inconsistent state.

OPTIONS
       The following commands are supported:

       check [-q] [-f fmt] [--output=ofmt] [-r [leaks | all]] [-T src_cache] filename
       create [-q] [-f fmt] [-o options] filename [size]
       commit [-q] [-f fmt] [-t cache] [-b base] [-d] [-p] filename
       compare [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] filename1 filename2
       convert [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-o options] [-s snapshot_id_or_name] [-l snapshot_param] [-S sparse_size] filename [filename2 [...]]
       output_filename
       info [-f fmt] [--output=ofmt] [--backing-chain] filename
       map [-f fmt] [--output=ofmt] filename
       snapshot [-q] [-l | -a snapshot | -c snapshot | -d snapshot] filename
       rebase [-q] [-f fmt] [-t cache] [-T src_cache] [-p] [-u] -b backing_file [-F backing_fmt] filename
       resize [-q] filename [+ | -]size
       amend [-p] [-q] [-f fmt] [-t cache] -o options filename

       Command parameters:

       filename
            is a disk image filename

       fmt is the disk image format. It is guessed automatically in most cases. See below for a description of the supported disk formats.

       --backing-chain
           will enumerate information about backing files in a disk image chain. Refer below for further description.

       size
           is the disk image size in bytes. Optional suffixes "k" or "K" (kilobyte, 1024) "M" (megabyte, 1024k) and "G" (gigabyte, 1024M) and T (terabyte, 1024G) are supported.  "b" is ignored.

       output_filename
           is the destination disk image filename

       output_fmt
            is the destination format

       options
           is a comma separated list of format specific options in a name=value format. Use "-o ?" for an overview of the options supported by the used format or see the format descriptions below for
           details.

       snapshot_param
           is param used for internal snapshot, format is 'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'

       snapshot_id_or_name
           is deprecated, use snapshot_param instead

       -c  indicates that target image must be compressed (qcow format only)

       -h  with or without a command shows help and lists the supported formats

       -p  display progress bar (compare, convert and rebase commands only).  If the -p option is not used for a command that supports it, the progress is reported when the process receives a "SIGUSR1"
           signal.

       -q  Quiet mode - do not print any output (except errors). There's no progress bar in case both -q and -p options are used.

       -S size
           indicates the consecutive number of bytes that must contain only zeros for qemu-img to create a sparse image during conversion. This value is rounded down to the nearest 512 bytes. You may
           use the common size suffixes like "k" for kilobytes.

       -t cache
           specifies the cache mode that should be used with the (destination) file. See the documentation of the emulator's "-drive cache=..." option for allowed values.

       -T src_cache
           specifies the cache mode that should be used with the source file(s). See the documentation of the emulator's "-drive cache=..." option for allowed values.

       Parameters to snapshot subcommand:

       snapshot
           is the name of the snapshot to create, apply or delete

       -a  applies a snapshot (revert disk to saved state)

       -c  creates a snapshot

       -d  deletes a snapshot

       -l  lists all snapshots in the given image

       Parameters to compare subcommand:

       -f  First image format

       -F  Second image format

       -s  Strict mode - fail on different image size or sector allocation

       Parameters to convert subcommand:

       -n  Skip the creation of the target volume

       Command description:

       check [-f fmt] [--output=ofmt] [-r [leaks | all]] [-T src_cache] filename
           Perform a consistency check on the disk image filename. The command can output in the format ofmt which is either "human" or "json".

           If "-r" is specified, qemu-img tries to repair any inconsistencies found during the check. "-r leaks" repairs only cluster leaks, whereas "-r all" fixes all kinds of errors, with a higher
           risk of choosing the wrong fix or hiding corruption that has already occurred.

           Only the formats "qcow2", "qed" and "vdi" support consistency checks.

           In case the image does not have any inconsistencies, check exits with 0.  Other exit codes indicate the kind of inconsistency found or if another error occurred. The following table
           summarizes all exit codes of the check subcommand:

           0   Check completed, the image is (now) consistent

           1   Check not completed because of internal errors

           2   Check completed, image is corrupted

           3   Check completed, image has leaked clusters, but is not corrupted

           63  Checks are not supported by the image format

           If "-r" is specified, exit codes representing the image state refer to the state after (the attempt at) repairing it. That is, a successful "-r all" will yield the exit code 0, independently
           of the image state before.

       create [-f fmt] [-o options] filename [size]
           Create the new disk image filename of size size and format fmt. Depending on the file format, you can add one or more options that enable additional features of this format.

           If the option backing_file is specified, then the image will record only the differences from backing_file. No size needs to be specified in this case. backing_file will never be modified
           unless you use the "commit" monitor command (or qemu-img commit).

           The size can also be specified using the size option with "-o", it doesn't need to be specified separately in this case.

       commit [-q] [-f fmt] [-t cache] [-b base] [-d] [-p] filename
           Commit the changes recorded in filename in its base image or backing file.  If the backing file is smaller than the snapshot, then the backing file will be resized to be the same size as the
           snapshot.  If the snapshot is smaller than the backing file, the backing file will not be truncated.  If you want the backing file to match the size of the smaller snapshot, you can safely
           truncate it yourself once the commit operation successfully completes.

           The image filename is emptied after the operation has succeeded. If you do not need filename afterwards and intend to drop it, you may skip emptying filename by specifying the "-d" flag.

           If the backing chain of the given image file filename has more than one layer, the backing file into which the changes will be committed may be specified as base (which has to be part of
           filename's backing chain). If base is not specified, the immediate backing file of the top image (which is filename) will be used. For reasons of consistency, explicitly specifying base will
           always imply "-d" (since emptying an image after committing to an indirect backing file would lead to different data being read from the image due to content in the intermediate backing
           chain overruling the commit target).

       compare [-f fmt] [-F fmt] [-T src_cache] [-p] [-s] [-q] filename1 filename2
           Check if two images have the same content. You can compare images with different format or settings.

           The format is probed unless you specify it by -f (used for filename1) and/or -F (used for filename2) option.

           By default, images with different size are considered identical if the larger image contains only unallocated and/or zeroed sectors in the area after the end of the other image. In addition,
           if any sector is not allocated in one image and contains only zero bytes in the second one, it is evaluated as equal. You can use Strict mode by specifying the -s option. When compare runs
           in Strict mode, it fails in case image size differs or a sector is allocated in one image and is not allocated in the second one.

           By default, compare prints out a result message. This message displays information that both images are same or the position of the first different byte. In addition, result message can
           report different image size in case Strict mode is used.

           Compare exits with 0 in case the images are equal and with 1 in case the images differ. Other exit codes mean an error occurred during execution and standard error output should contain an
           error message.  The following table sumarizes all exit codes of the compare subcommand:

           0   Images are identical

           1   Images differ

           2   Error on opening an image

           3   Error on checking a sector allocation

           4   Error on reading data

       convert [-c] [-p] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-o options] [-s snapshot_id_or_name] [-l snapshot_param] [-S sparse_size] filename [filename2 [...]] output_filename
           Convert the disk image filename or a snapshot snapshot_param(snapshot_id_or_name is deprecated) to disk image output_filename using format output_fmt. It can be optionally compressed ("-c"
           option) or use any format specific options like encryption ("-o" option).

           Only the formats "qcow" and "qcow2" support compression. The compression is read-only. It means that if a compressed sector is rewritten, then it is rewritten as uncompressed data.

           Image conversion is also useful to get smaller image when using a growable format such as "qcow": the empty sectors are detected and suppressed from the destination image.

           sparse_size indicates the consecutive number of bytes (defaults to 4k) that must contain only zeros for qemu-img to create a sparse image during conversion. If sparse_size is 0, the source
           will not be scanned for unallocated or zero sectors, and the destination image will always be fully allocated.

           You can use the backing_file option to force the output image to be created as a copy on write image of the specified base image; the backing_file should have the same content as the input's
           base image, however the path, image format, etc may differ.

           If the "-n" option is specified, the target volume creation will be skipped. This is useful for formats such as "rbd" if the target volume has already been created with site specific options
           that cannot be supplied through qemu-img.

       info [-f fmt] [--output=ofmt] [--backing-chain] filename
           Give information about the disk image filename. Use it in particular to know the size reserved on disk which can be different from the displayed size. If VM snapshots are stored in the disk
           image, they are displayed too. The command can output in the format ofmt which is either "human" or "json".

           If a disk image has a backing file chain, information about each disk image in the chain can be recursively enumerated by using the option "--backing-chain".

           For instance, if you have an image chain like:

                   base.qcow2 <- snap1.qcow2 <- snap2.qcow2

           To enumerate information about each disk image in the above chain, starting from top to base, do:

                   qemu-img info --backing-chain snap2.qcow2

       map [-f fmt] [--output=ofmt] filename
           Dump the metadata of image filename and its backing file chain.  In particular, this commands dumps the allocation state of every sector of filename, together with the topmost file that
           allocates it in the backing file chain.

           Two option formats are possible.  The default format ("human") only dumps known-nonzero areas of the file.  Known-zero parts of the file are omitted altogether, and likewise for parts that
           are not allocated throughout the chain.  qemu-img output will identify a file from where the data can be read, and the offset in the file.  Each line will include four fields, the first
           three of which are hexadecimal numbers.  For example the first line of:

                   Offset          Length          Mapped to       File
                   0               0x20000         0x50000         /tmp/overlay.qcow2
                   0x100000        0x10000         0x95380000      /tmp/backing.qcow2

           means that 0x20000 (131072) bytes starting at offset 0 in the image are available in /tmp/overlay.qcow2 (opened in "raw" format) starting at offset 0x50000 (327680).  Data that is
           compressed, encrypted, or otherwise not available in raw format will cause an error if "human" format is in use.  Note that file names can include newlines, thus it is not safe to parse this
           output format in scripts.

           The alternative format "json" will return an array of dictionaries in JSON format.  It will include similar information in the "start", "length", "offset" fields; it will also include other
           more specific information:

           -   whether the sectors contain actual data or not (boolean field "data"; if false, the sectors are either unallocated or stored as optimized all-zero clusters);

           -   whether the data is known to read as zero (boolean field "zero");

           -   in order to make the output shorter, the target file is expressed as a "depth"; for example, a depth of 2 refers to the backing file of the backing file of filename.

           In JSON format, the "offset" field is optional; it is absent in cases where "human" format would omit the entry or exit with an error.  If "data" is false and the "offset" field is present,
           the corresponding sectors in the file are not yet in use, but they are preallocated.

           For more information, consult include/block/block.h in QEMU's source code.

       snapshot [-l | -a snapshot | -c snapshot | -d snapshot ] filename
           List, apply, create or delete snapshots in image filename.

       rebase [-f fmt] [-t cache] [-T src_cache] [-p] [-u] -b backing_file [-F backing_fmt] filename
           Changes the backing file of an image. Only the formats "qcow2" and "qed" support changing the backing file.

           The backing file is changed to backing_file and (if the image format of filename supports this) the backing file format is changed to backing_fmt. If backing_file is specified as "" (the
           empty string), then the image is rebased onto no backing file (i.e. it will exist independently of any backing file).

           cache specifies the cache mode to be used for filename, whereas src_cache specifies the cache mode for reading backing files.

           There are two different modes in which "rebase" can operate:

           Safe mode
               This is the default mode and performs a real rebase operation. The new backing file may differ from the old one and qemu-img rebase will take care of keeping the guest-visible content of
               filename unchanged.

               In order to achieve this, any clusters that differ between backing_file and the old backing file of filename are merged into filename before actually changing the backing file.

               Note that the safe mode is an expensive operation, comparable to converting an image. It only works if the old backing file still exists.

           Unsafe mode
               qemu-img uses the unsafe mode if "-u" is specified. In this mode, only the backing file name and format of filename is changed without any checks on the file contents. The user must take
               care of specifying the correct new backing file, or the guest-visible content of the image will be corrupted.

               This mode is useful for renaming or moving the backing file to somewhere else.  It can be used without an accessible old backing file, i.e. you can use it to fix an image whose backing
               file has already been moved/renamed.

           You can use "rebase" to perform a "diff" operation on two disk images.  This can be useful when you have copied or cloned a guest, and you want to get back to a thin image on top of a
           template or base image.

           Say that "base.img" has been cloned as "modified.img" by copying it, and that the "modified.img" guest has run so there are now some changes compared to "base.img".  To construct a thin
           image called "diff.qcow2" that contains just the differences, do:

                   qemu-img create -f qcow2 -b modified.img diff.qcow2
                   qemu-img rebase -b base.img diff.qcow2

           At this point, "modified.img" can be discarded, since "base.img + diff.qcow2" contains the same information.

       resize filename [+ | -]size
           Change the disk image as if it had been created with size.

           Before using this command to shrink a disk image, you MUST use file system and partitioning tools inside the VM to reduce allocated file systems and partition sizes accordingly.  Failure to
           do so will result in data loss!

           After using this command to grow a disk image, you must use file system and partitioning tools inside the VM to actually begin using the new space on the device.

       amend [-p] [-f fmt] [-t cache] -o options filename
           Amends the image format specific options for the image file filename. Not all file formats support this operation.

NOTES
       Supported image file formats:

       raw Raw disk image format (default). This format has the advantage of being simple and easily exportable to all other emulators. If your file system supports holes (for example in ext2 or ext3
           on Linux or NTFS on Windows), then only the written sectors will reserve space. Use "qemu-img info" to know the real size used by the image or "ls -ls" on Unix/Linux.

           Supported options:

           "preallocation"
               Preallocation mode (allowed values: "off", "falloc", "full").  "falloc" mode preallocates space for image by calling posix_fallocate().  "full" mode preallocates space for image by
               writing zeros to underlying storage.

       qcow2
           QEMU image format, the most versatile format. Use it to have smaller images (useful if your filesystem does not supports holes, for example on Windows), optional AES encryption, zlib based
           compression and support of multiple VM snapshots.

           Supported options:

           "compat"
               Determines the qcow2 version to use. "compat=0.10" uses the traditional image format that can be read by any QEMU since 0.10.  "compat=1.1" enables image format extensions that only QEMU
               1.1 and newer understand (this is the default). Amongst others, this includes zero clusters, which allow efficient copy-on-read for sparse images.

           "backing_file"
               File name of a base image (see create subcommand)

           "backing_fmt"
               Image format of the base image

           "encryption"
               If this option is set to "on", the image is encrypted with 128-bit AES-CBC.

               The use of encryption in qcow and qcow2 images is considered to be flawed by modern cryptography standards, suffering from a number of design problems:

               -<The AES-CBC cipher is used with predictable initialization vectors based>
                   on the sector number. This makes it vulnerable to chosen plaintext attacks which can reveal the existence of encrypted data.

               -<The user passphrase is directly used as the encryption key. A poorly>
                   chosen or short passphrase will compromise the security of the encryption.

               -<In the event of the passphrase being compromised there is no way to>
                   change the passphrase to protect data in any qcow images. The files must be cloned, using a different encryption passphrase in the new file. The original file must then be securely
                   erased using a program like shred, though even this is ineffective with many modern storage technologies.

               Use of qcow / qcow2 encryption is thus strongly discouraged. Users are recommended to use an alternative encryption technology such as the Linux dm-crypt / LUKS system.

           "cluster_size"
               Changes the qcow2 cluster size (must be between 512 and 2M). Smaller cluster sizes can improve the image file size whereas larger cluster sizes generally provide better performance.

           "preallocation"
               Preallocation mode (allowed values: "off", "metadata", "falloc", "full"). An image with preallocated metadata is initially larger but can improve performance when the image needs to
               grow. "falloc" and "full" preallocations are like the same options of "raw" format, but sets up metadata also.

           "lazy_refcounts"
               If this option is set to "on", reference count updates are postponed with the goal of avoiding metadata I/O and improving performance. This is particularly interesting with
               cache=writethrough which doesn't batch metadata updates. The tradeoff is that after a host crash, the reference count tables must be rebuilt, i.e. on the next open an (automatic)
               "qemu-img check -r all" is required, which may take some time.

               This option can only be enabled if "compat=1.1" is specified.

           "nocow"
               If this option is set to "on", it will turn off COW of the file. It's only valid on btrfs, no effect on other file systems.

               Btrfs has low performance when hosting a VM image file, even more when the guest on the VM also using btrfs as file system. Turning off COW is a way to mitigate this bad performance.
               Generally there are two ways to turn off COW on btrfs: a) Disable it by mounting with nodatacow, then all newly created files will be NOCOW. b) For an empty file, add the NOCOW file
               attribute. That's what this option does.

               Note: this option is only valid to new or empty files. If there is an existing file which is COW and has data blocks already, it couldn't be changed to NOCOW by setting "nocow=on". One
               can issue "lsattr filename" to check if the NOCOW flag is set or not (Capital 'C' is NOCOW flag).

       Other
           QEMU also supports various other image file formats for compatibility with older QEMU versions or other hypervisors, including VMDK, VDI, VHD (vpc), VHDX, qcow1 and QED. For a full list of
           supported formats see "qemu-img --help".  For a more detailed description of these formats, see the QEMU Emulation User Documentation.

           The main purpose of the block drivers for these formats is image conversion.  For running VMs, it is recommended to convert the disk images to either raw or qcow2 in order to achieve good
           performance.

SEE ALSO
       The HTML documentation of QEMU for more precise information and Linux user mode emulator invocation.

AUTHOR
       Fabrice Bellard

                                                                                                2019-11-05                                                                                    QEMU-IMG(1)
