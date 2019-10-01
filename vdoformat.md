VDOFORMAT(8)                                                                               System Manager's Manual                                                                               VDOFORMAT(8)



NAME
       vdoformat - format a VDO device

SYNOPSIS
       vdoformat [options...]  filename

DESCRIPTION
       vdoformat  formats  the  file  named by filename as a VDO device. This is analogous to low-level device formatting.  The device will not be formatted if it already contains a VDO, unless the --force
       flag is used.

       vdoformat can also modify some of the formatting parameters.

OPTIONS
       --format
              Format the block device, even if there is already a VDO formatted thereupon.

       --help Print this help message and exit.

       --logical-size=size
              Set the logical (provisioned) size of the VDO device to size.  A size suffix of K for kilobytes, M for megabytes, G for gigabytes, T for terabytes, or P for petabytes is optional. The default
              unit is megabytes.

       --slab-bits=bits
              Specify the slab size in bits. The maximum size is 23, and the default is 19.

       --uds-checkpoint-frequency=frequency
              Specify the frequency of checkpoints. The default is never.

       --uds-memory-size=gigabytes
              Specify the amount of memory, in gigabytes, to devote to the index. Accepted options are .25, .5, .75, and all positive integers.

       --uds-sparse
              Specify whether or not to use a sparse index.

       --verbose
              Describe what is being formatted and with what parameters.

       --version
              Show the version of vdoformat.

SEE ALSO
       vdo(8).



Red Hat                                                                                           2017-09-12                                                                                     VDOFORMAT(8)
