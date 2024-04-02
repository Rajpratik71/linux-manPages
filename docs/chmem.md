CHMEM(8)                                                                                 System Administration                                                                                CHMEM(8)

NAME
       chmem - configure memory

SYNOPSIS
       chmem [-h] [-V] [-v] [-e|-d] [SIZE|RANGE|-b BLOCKRANGE] [-z ZONE]

DESCRIPTION
       The chmem command sets a particular size or range of memory online or offline.

       ‐ Specify  SIZE  as <size>[m|M|g|G]. With m or M, <size> specifies the memory size in MiB (1024 x 1024 bytes). With g or G, <size> specifies the memory size in GiB (1024 x 1024 x 1024 bytes).
         The default unit is MiB.

       ‐ Specify RANGE in the form 0x<start>-0x<end> as shown in the output of the lsmem command. <start> is the hexadecimal address of the first byte and <end> is the  hexadecimal  address  of  the
         last byte in the memory range.

       ‐ Specify  BLOCKRANGE  in  the form <first>-<last> or <block> as shown in the output of the lsmem command. <first> is the number of the first memory block and <last> is the number of the last
         memory block in the memory range. Alternatively a single block can be specified. BLOCKRANGE requires the --blocks option.

       ‐ Specify ZONE as the name of a memory zone, as shown in the output of the lsmem -o +ZONES command. The output shows one or more valid memory zones for each memory range.  If  multiple  zones
         are  shown,  then  the  memory range currently belongs to the first zone. By default, chmem will set memory online to the zone Movable, if this is among the valid zones. This default can be
         changed by specifying the --zone option with another valid zone.  For memory ballooning, it is recommended to select the zone Movable for memory online and offline, if possible.  Memory  in
         this  zone is much more likely to be able to be offlined again, but it cannot be used for arbitrary kernel allocations, only for migratable pages (e.g. anonymous and page cache pages).  Use
         the --help option to see all available zones.

       SIZE and RANGE must be aligned to the Linux memory block size, as shown in the output of the lsmem command.

       Setting memory online can fail for various reasons. On virtualized systems it can fail if the hypervisor does not have enough memory left, for example because memory was  overcommitted.  Set‐
       ting  memory offline can fail if Linux cannot free the memory. If only part of the requested memory can be set online or offline, a message tells you how much memory was set online or offline
       instead of the requested amount.

       When setting memory online chmem starts with the lowest memory block numbers. When setting memory offline chmem starts with the highest memory block numbers.

OPTIONS
       -b, --blocks
              Use a BLOCKRANGE parameter instead of RANGE or SIZE for the --enable and --disable options.

       -d, --disable
              Set the specified RANGE, SIZE, or BLOCKRANGE of memory offline.

       -e, --enable
              Set the specified RANGE, SIZE, or BLOCKRANGE of memory online.

       -z, --zone
              Select the memory ZONE where to set the specified RANGE, SIZE, or BLOCKRANGE of memory online or offline. By default, memory will be set online to the zone Movable, if possible.

       -h, --help
              Print a short help text, then exit.

       -v, --verbose
              Verbose mode. Causes chmem to print debugging messages about it's progress.

       -V, --version
              Print the version number, then exit.

RETURN CODES
       chmem has the following return codes:

       0      success

       1      failure

       64     partial success

EXAMPLES
       chmem --enable 1024
              This command requests 1024 MiB of memory to be set online.

       chmem -e 2g
              This command requests 2 GiB of memory to be set online.

       chmem --disable 0x00000000e4000000-0x00000000f3ffffff
              This command requests the memory range starting with 0x00000000e4000000 and ending with 0x00000000f3ffffff to be set offline.

       chmem -b -d 10
              This command requests the memory block number 10 to be set offline.

SEE ALSO
       lsmem(1)

AVAILABILITY
       The chmem command is part of the util-linux package and is available from Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                   October 2016                                                                                     CHMEM(8)
