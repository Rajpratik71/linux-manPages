RAW(8)                      System Administration                      RAW(8)

NAME
       raw - bind a Linux raw character device

SYNOPSIS
       raw /dev/raw/raw<N> <major> <minor>

       raw /dev/raw/raw<N> /dev/<blockdev>

       raw -q /dev/raw/raw<N>

       raw -qa

DESCRIPTION
       raw  is  used  to bind a Linux raw character device to a block device.
       Any block device may be used: at  the  time  of  binding,  the  device
       driver does not even have to be accessible (it may be loaded on demand
       as a kernel module later).

       raw is used in two modes: it either sets raw device  bindings,  or  it
       queries existing bindings.  When setting a raw device, /dev/raw/raw<N>
       is the device name of an existing raw device node in  the  filesystem.
       The block device to which it is to be bound can be specified either in
       terms of its major and  minor  device  numbers,  or  as  a  path  name
       /dev/<blockdev> to an existing block device file.

       The  bindings  already in existence can be queried with the -q option,
       which is used either with a raw device  filename  to  query  that  one
       device, or with the -a option to query all bound raw devices.

       Unbinding can be done by specifying major and minor 0.

       Once  bound  to  a  block device, a raw device can be opened, read and
       written, just like the block device it is bound to.  However, the  raw
       device  does not behave exactly like the block device.  In particular,
       access to the raw device bypasses  the  kernel's  block  buffer  cache
       entirely:  all  I/O  is done directly to and from the address space of
       the process performing the I/O.  If the underlying block device driver
       can  support  DMA, then no data copying at all is required to complete
       the I/O.

       Because raw I/O involves direct hardware access to a process's memory,
       a few extra restrictions must be observed.  All I/Os must be correctly
       aligned in memory and on disk: they must start at a sector  offset  on
       disk,  they must be an exact number of sectors long, and the data buf‐
       fer in virtual memory must also be aligned to a multiple of the sector
       size.  The sector size is 512 bytes for most devices.

OPTIONS
       -q, --query
              Set  query mode.  raw will query an existing binding instead of
              setting a new one.

       -a, --all
              With -q , specify that all bound raw devices should be queried.

       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.

BUGS
       The Linux dd(1) command should be used without the bs= option, or  the
       blocksize needs to be a multiple of the sector size of the device (512
       bytes usually), otherwise it will fail with  "Invalid  Argument"  mes‐
       sages (EINVAL).

       Raw  I/O  devices do not maintain cache coherency with the Linux block
       device buffer cache.  If you use raw I/O to overwrite data already  in
       the  buffer  cache,  the buffer cache will no longer correspond to the
       contents of the actual storage device underneath.  This is deliberate,
       but is regarded either a bug or a feature depending on who you ask!

NOTES
       Rather  than  using  raw  devices  applications  should prefer open(2)
       devices, such as /dev/sda1, with the O_DIRECT flag.

AUTHOR
       Stephen Tweedie (sct@redhat.com)

AVAILABILITY
       The raw command is part of the util-linux  package  and  is  available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                       August 1999                           RAW(8)
