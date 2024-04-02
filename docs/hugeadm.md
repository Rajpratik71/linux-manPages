HUGEADM(8)                                                                                 System Manager's Manual                                                                                 HUGEADM(8)



NAME
       hugeadm - Configure the system huge page pools

SYNOPSIS
       hugeadm [options]

DESCRIPTION
       hugeadm displays and configures the systems huge page pools. The size of the pools is set as a minimum and maximum threshold.  The minimum value is allocated up front by the kernel and guaranteed to
       remain as hugepages until the pool is shrunk. If a maximum is set, the system will dynamically allocate pages if applications request more hugepages than the minimum size of the pool.  There  is  no
       guarantee that more pages than this minimum pool size can be allocated.

       The following options create mounts hugetlbfs mount points.


       --create-mounts

              This creates mount points for each supported huge page size under /var/lib/hugetlbfs.  After creation they are mounts and are owned by root:root with permissions set to 770.  Each mount point
              is named pagesize-<size in bytes>.


       --create-user-mounts=<user>

              This creates mount points for each supported huge page size under /var/lib/hugetlbfs/user/<user>.  Mount point naming is the same as --create-mounts.  After creation they are mounted and  are
              owned by <user>:root with permissions set to 700.


       --create-group-mounts=<group>

              This  creates  mount  points for each supported huge page size under /var/lib/hugetlbfs/group/<group>.  Mount point naming is the same as --create-mounts.  After creation they are mounted and
              are owned by root:<group> with permissions set to 070.


       --create-global-mounts

              This creates mount points for each supported huge page size under /var/lib/hugetlbfs/global.  Mount point naming is the same as --create-mounts.  After creation they are mounted and are owned
              by root:root with permissions set to 1777.

              The following options affect how mount points are created.


       --max-size

              This  option  is  used in conjunction with --create-*-mounts. It limits the maximum amount of memory used by files within the mount point rounded up to the nearest huge page size. This can be
              used for example to grant different huge page quotas to individual users or groups.


       --max-inodes

              This option is used in conjunction with --create-*-mounts. It limits the number of inodes (e.g. files) that can be created on the new mount points.  This limits the number  of  mappings  that
              can  be  created  on  a mount point. It could be used for example to limit the number of application instances that used a mount point as long as it was known how many inodes each application
              instance required.

              The following options display information about the pools.


       --pool-list

              This displays the Minimum, Current and Maximum number of huge pages in the pool for each pagesize supported by the system. The "Minimum" value is the size of the static pool  and  there  will
              always  be at least this number of hugepages in use by the system, either by applications or kept by the kernel in a reserved pool. The "Current" value is the number of hugepages currently in
              use, either by applications or stored on the kernels free list. The "Maximum" value is the largest number of hugepages that can be in use at any given time.


       --set-recommended-min_free_kbytes

              Fragmentation avoidance in the kernel depends on avoiding pages of different mobility types being mixed with a pageblock arena - typically the size of the default huge  page  size.  The  more
              mixing  that  occurs,  the  less likely the huge page pool will be able to dynamically resize. The easiest means of avoiding mixing is to increase /proc/sys/vm/min_free_kbytes. This parameter
              sets min_free_kbytes to a recommended value to aid fragmentation avoidance.


       --set-recommended-shmmax

              The maximum shared memory segment size should be set to at least the size of the largest shared memory segment size you want available for applications using huge  pages,  via  /proc/sys/ker‐
              nel/shmmax.  Optionally,  it  can  be  set  automatically  to match the maximum possible size of all huge page allocations and thus the maximum possible shared memory segment size, using this
              switch.


       --set-shm-group=<gid|groupname>

              Users in the group specified in /proc/sys/vm/hugetlb_shm_group are granted full access to huge pages. The sysctl takes a numeric gid, but this hugeadm option can set it for you, using  either
              a gid or group name.


       --page-sizes

              This displays every page size supported by the system and has a pool configured.


       --page-sizes-all

              This displays all page sizes supported by the system, even if no pool is available.


       --list-all-mounts

              This displays all active mount points for hugetlbfs.


       The following options configure the pool.


       --pool-pages-min=<size|DEFAULT>:[+|-]<pagecount|memsize<G|M|K>>

              This  option  sets  or  adjusts  the Minimum number of hugepages in the pool for pagesize size. size may be specified in bytes or in kilobytes, megabytes, or gigabytes by appending K, M, or G
              respectively, or as DEFAULT, which uses the system's default huge page size for size. The pool size adjustment can be specified by pagecount pages or by memsize, if postfixed with G, M, or K,
              for  gigabytes,  megabytes, or kilobytes, respectively. If the adjustment is specified via memsize, then the pagecount will be calculated for you, based on page size size.  The pool is set to
              pagecount pages if + or - are not specified. If + or - are specified, then the size of the pool will adjust by that amount.  Note that there is no guarantee that the system can  allocate  the
              hugepages requested for the Minimum pool. The size of the pools should be checked after executing this command to ensure they were successful.


       --obey-numa-mempol

              This  option  requests that allocation of huge pages to the static pool with --pool-pages-min obey the NUMA memory policy of the current process. This policy can be explicitly specified using
              numactl or inherited from a parent process.


       --pool-pages-max=<size|DEFAULT>:[+|-]<pagecount|memsize<G|M|K>>

              This option sets or adjusts the Maximum number of hugepages. Note that while the Minimum number of pages are guaranteed to be available to applications, there is not guarantee that the system
              can allocate the pages on demand when the number of huge pages requested by applications is between the Minimum and Maximum pool sizes. See --pool-pages-min for usage syntax.


       --enable-zone-movable

              This option enables the use of the MOVABLE zone for the allocation of hugepages. This zone is created when kernelcore= or movablecore= are specified on the kernel command line but the zone is
              not used for the allocation of huge pages by default as the intended use for the zone may be to guarantee that memory can be off-lined and hot-removed. The kernel guarantees  that  the  pages
              within  this  zone can be reclaimed unlike some kernel buffers for example. Unless pages are locked with mlock(), the hugepage pool can grow to at least the size of the movable zone once this
              option is set. Use sysctl to permanently enable the use of the MOVABLE zone for the allocation of huge pages.


       --disable-zone-movable

              This option disables the use of the MOVABLE zone for the future allocation of huge pages. Note that existing huge pages are not reclaimed from the zone.  Use sysctl to permanently disable the
              use of the MOVABLE zone for the allocation of huge pages.


       --hard


              This  option  is specified with --pool-pages-min to retry allocations multiple times on failure to allocate the desired count of pages. It initially tries to resize the pool up to 5 times and
              continues to try if progress is being made towards the resize.


       --add-temp-swap<=count>

              This options is specified with --pool-pages-min to initialize a temporary swap file for the duration of the pool resize. When increasing the size of the pool, it can be necessary  to  reclaim
              pages so that contiguous memory is freed and this often requires swap to be successful. Swap is only created for a positive resize, and is then removed once the resize operation is completed.
              The default swap size is 5 huge pages, the optional argument <count> sets the swap size to <count> huge pages.


       --add-ramdisk-swap

              This option is specified with --pool-pages-min to initialize swap in memory on ram disks.  When increasing the size of the pool, it can be necessary to reclaim pages so that contiguous memory
              is  freed  and  this often requires swap to be successful.  If there isn't enough free disk space, swap can be initialized in RAM using this option.  If the size of one ramdisk is not greater
              than the huge page size, then swap is initialized on multiple ramdisks.  Swap is only created for a positive resize, and by default is removed once the resize operation is completed.


       --persist

              This option is specified with the --add-temp-swap or --add-ramdisk-swap to make the swap space persist after the resize operation is completed.  The swap spaces can later be removed  manually
              using the swapoff command.


       The following options tune the transparent huge page usage


       --thp-always

              Enable transparent huge pages always


       --thp-madvise

              Enable transparent huge pages only on madvised regions


       --thp-never

              Disable transparent huge pages


       --thp-khugepaged-pages <pages to scan>

              Configure the number of pages that khugepaged should scan on each pass


       --thp-khugepaged-scan-sleep <milliseconds>

              Configure how many milliseconds khugepaged should wait between passes


       --thp-khugepages-alloc-sleep <milliseconds>

              Configure how many milliseconds khugepaged should wait after failing to allocate a huge page to throttle the next attempt.


       The following options affect the verbosity of libhugetlbfs.


       --verbose <level>, -v

              The  default value for the verbosity level is 1 and the range of the value can be set with --verbose from 0 to 99. The higher the value, the more verbose the library will be. 0 is quiet and 3
              will output much debugging information. The verbosity level is increased by one each time -v is specified.


SEE ALSO
       oprofile(1), pagesize(1), libhugetlbfs(7), hugectl(8),

AUTHORS
       libhugetlbfs was written by various people on the libhugetlbfs-devel mailing list.




                                                                                               October 1, 2009                                                                                     HUGEADM(8)
