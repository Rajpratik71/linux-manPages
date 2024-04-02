E4DEFRAG(8)                                                                             System Manager's Manual                                                                            E4DEFRAG(8)

NAME
       e4defrag - online defragmenter for ext4 filesystem

SYNOPSIS
       e4defrag [ -c ] [ -v ] target ...

DESCRIPTION
       e4defrag  reduces  fragmentation  of  extent based file. The file targeted by e4defrag is created on ext4 filesystem made with "-O extent" option (see mke2fs(8)).  The targeted file gets more
       contiguous blocks and improves the file access speed.

       target is a regular file, a directory, or a device that is mounted as ext4 filesystem.  If target is a directory, e4defrag reduces fragmentation of all files in it. If  target  is  a  device,
       e4defrag gets the mount point of it and reduces fragmentation of all files in this mount point.

OPTIONS
       -c     Get  a  current  fragmentation count and an ideal fragmentation count, and calculate fragmentation score based on them. By seeing this score, we can determine whether we should execute
              e4defrag to target.  When used with -v option, the current fragmentation count and the ideal fragmentation count are printed for each file.

              Also this option outputs the average data size in one extent. If you see it, you'll find the file has ideal extents or not. Note that the  maximum  extent  size  is  131072KB  in  ext4
              filesystem (if block size is 4KB).

              If this option is specified, target is never defragmented.

       -v     Print error messages and the fragmentation count before and after defrag for each file.

NOTES
       e4defrag  does  not  support  swap  file, files in lost+found directory, and files allocated in indirect blocks. When target is a device or a mount point, e4defrag doesn't defragment files in
       mount point of other device.

       It safe to run e4defrag on a file while it is actively in use by another application.  Since the contents of file blocks are copied using the page cache, this  can  result  in  a  performance
       slowdown to both e4defrag and the application due to contention over the system's memory and disk bandwidth.

       If the file system's free space is fragmented, or if there is insufficient free space available, e4defrag may not be able to improve the file's fragmentation.

       Non-privileged users can execute e4defrag to their own file, but the score is not printed if -c option is specified. Therefore, it is desirable to be executed by root user.

AUTHOR
       Written by Akira Fujita <a-fujita@rs.jp.nec.com> and Takashi Sato <t-sato@yk.jp.nec.com>.

SEE ALSO
       mke2fs(8), mount(8).

e4defrag version 2.0                                                                           May 2009                                                                                    E4DEFRAG(8)
