xfs_io(8)                                                     System Manager's Manual                                                    xfs_io(8)

NAME
       xfs_io - debug the I/O path of an XFS filesystem

SYNOPSIS
       xfs_io [ -adfmrRstxT ] [ -c cmd ] ... [ -p prog ] file
       xfs_io -V

DESCRIPTION
       xfs_io  is  a  debugging  tool  like xfs_db(8), but is aimed at examining the regular file I/O paths rather than the raw XFS volume itself.
       These code paths include not only the obvious read/write/mmap interfaces for manipulating files, but also cover all of the  XFS  extensions
       (such as space preallocation, additional inode flags, etc).

OPTIONS
       -c cmd    xfs_io  commands  may be run interactively (the default) or as arguments on the command line. Multiple -c arguments may be given.
                 The commands are run in the sequence given, then the program exits.

       -p prog   Set the program name for prompts and some error messages, the default value is xfs_io.

       -f        Create file if it does not already exist.

       -r        Open file read-only, initially. This is required if file is immutable or append-only.

       -x        Expert mode. Dangerous commands are only available in this mode.  These commands also tend to require additional privileges.

       -V        Prints the version number and exits.

       The other open(2) options described below are also available from the command line.

CONCEPTS
       xfs_io maintains a number of open files and memory mappings.  Files can be initially opened on the command  line  (optionally),  and  addi‐
       tional files can also be opened later.

       xfs_io  commands can be broken up into three groups.  Some commands are aimed at doing regular file I/O - read, write, sync, space preallo‐
       cation, etc.

       The second set of commands exist for manipulating memory mapped regions of a file - mapping, accessing, storing, unmapping, flushing, etc.

       The remaining commands are for the navigation and display of data structures relating to the open  files,  mappings,  and  the  filesystems
       where they reside.

       Many commands have extensive online help. Use the help command for more details on any command.

FILE I/O COMMANDS
       file [ N ]
              Display a list of all open files and (optionally) switch to an alternate current open file.

       open [[ -acdfrstRT ] path ]
              Closes  the current file, and opens the file specified by path instead. Without any arguments, displays statistics about the current
              file - see the stat command.
                 -a  opens append-only (O_APPEND).
                 -d  opens for direct I/O (O_DIRECT).
                 -f  creates the file if it doesn't already exist (O_CREAT).
                 -r  opens read-only (O_RDONLY).
                 -s  opens for synchronous I/O (O_SYNC).
                 -t  truncates on open (O_TRUNC).
                 -n  opens in non-blocking mode if possible (O_NONBLOCK).
                 -T  create a temporary file not linked into the filesystem namespace (O_TMPFILE).  The pathname passed must refer to a  directory
                     which is treated as virtual parent for the newly created invisible file.  Can not be used together with the -r option.
                 -R  marks the file as a realtime XFS file after opening it, if it is not already marked as such.

       o      See the open command.

       close  Closes the current open file, marking the next open file as current (if one exists).

       c      See the close command.

       pread [ -b bsize ] [ -v ] [ -FBR [ -Z seed ] ] [ -V vectors ] offset length
              Reads a range of bytes in a specified blocksize from the given offset.
                 -b  can be used to set the blocksize into which the read(2) requests will be split. The default blocksize is 4096 bytes.
                 -v  dump the contents of the buffer after reading, by default only the count of bytes actually read is dumped.
                 -F  read the buffers in a forwards sequential direction.
                 -B  read the buffers in a reserve sequential direction.
                 -R  read the buffers in the give range in a random order.
                 -Z seed
                     specify the random number seed used for random reads.
                 -V vectors
                     Use  the vectored IO read syscall preadv(2) with a number of blocksize length iovecs. The number of iovecs is set by the vec‐
                     tors parameter.

       r      See the pread command.

       pwrite [ -i file ] [ -d ] [ -s skip ] [ -b size ] [ -S seed ] [ -FBR [ -Z zeed ] ] [ -wW ] [ -V vectors ] offset length
              Writes a range of bytes in a specified blocksize from the given offset.  The bytes written can be either a set pattern  or  read  in
              from another file before writing.
                 -i  allows an input file to be specified as the source of the data to be written.
                 -d  causes direct I/O, rather than the usual buffered I/O, to be used when reading the input file.
                 -s  specifies the number of bytes to skip from the start of the input file before starting to read.
                 -b  used to set the blocksize into which the write(2) requests will be split. The default blocksize is 4096 bytes.
                 -S  used  to  set the (repeated) fill pattern which is used when the data to write is not coming from a file.  The default buffer
                     fill pattern value is 0xcdcdcdcd.
                 -F  write the buffers in a forwards sequential direction.
                 -B  write the buffers in a reserve sequential direction.
                 -R  write the buffers in the give range in a random order.
                 -Z seed
                     specify the random number seed used for random write
                 -w  call fdatasync(2) once all writes are complete (included in timing results)
                 -W  call fsync(2) once all writes are complete (included in timing results)
                 -V vectors
                     Use the vectored IO write syscall pwritev(2) with a number of blocksize length iovecs. The number of iovecs  is  set  by  the
                     vectors parameter.

       w      See the pwrite command.

       bmap [ -adlpv ] [ -n nx ]
              Prints the block mapping for the current open file. Refer to the xfs_bmap(8) manual page for complete documentation.

       fiemap [ -alv ] [ -n nx ]
              Prints  the  block  mapping for the current open file using the fiemap ioctl.  Options behave as described in the xfs_bmap(8) manual
              page.

       extsize [ -R | -D ] [ value ]
              Display and/or modify the preferred extent size used when allocating space for the currently open file. If the -R option  is  speci‐
              fied,  a recursive descent is performed for all directory entries below the currently open file (-D can be used to restrict the out‐
              put to directories only).  If the target file is a directory, then the inherited extent size is set for that  directory  (new  files
              created  in  that directory inherit that extent size).  The value should be specified in bytes, or using one of the usual units suf‐
              fixes (k, m, g, b, etc). The extent size is always reported in units of bytes.

       allocsp size 0
              Sets the size of the file to size and zeroes any additional space allocated using  the  XFS_IOC_ALLOCSP/XFS_IOC_FREESP  system  call
              described in the xfsctl(3) manual page.  allocsp and freesp do exactly the same thing.

       freesp size 0
              See the allocsp command.

       fadvise [ -r | -s | [[ -d | -n | -w ] offset length ]]
              On platforms which support it, allows hints be given to the system regarding the expected I/O patterns on the file.  The range argu‐
              ments are required by some advise commands ([*] below), and the others must  have  no  range  arguments.   With  no  arguments,  the
              POSIX_FADV_NORMAL advice is implied (default readahead).
                 -d  the data will not be accessed again in the near future (POSIX_FADV_DONTNEED[*]).
                 -n  data will be accessed once and not be reused (POSIX_FADV_NOREUSE[*]).
                 -r  expect access to data in random order (POSIX_FADV_RANDOM), which sets readahead to zero.
                 -s  expect access to data in sequential order (POSIX_FADV_SEQUENTIAL), which doubles the default readahead on the file.
                 -w  advises the specified data will be needed again (POSIX_FADV_WILLNEED[*]) which forces the maximum readahead.

       fdatasync
              Calls fdatasync(2) to flush the file's in-core data to disk.

       fsync  Calls fsync(2) to flush all in-core file state to disk.

       s      See the fsync command.

       sync_range [ -a | -b | -w ] offset length
              On  platforms  which  support  it,  allows control of syncing a range of the file to disk. With no options, SYNC_FILE_RANGE_WRITE is
              implied on the range supplied.
                 -a  wait for IO in the given range to finish after writing (SYNC_FILE_RANGE_WAIT_AFTER).
                 -b  wait for IO in the given range to finish before writing (SYNC_FILE_RANGE_WAIT_BEFORE).
                 -w  start writeback of dirty data in the given range (SYNC_FILE_RANGE_WRITE).

       sync   Calls sync(2) to flush all filesystems' in-core data to disk.

       syncfs Calls syncfs(2) to flush this filesystem's in-core data to disk.

       resvsp offset length
              Allocates reserved, unwritten space for part of a file using the XFS_IOC_RESVSP system call described in the xfsctl(3) manual page.

       unresvsp offset length
              Frees reserved space for part of a file using the XFS_IOC_UNRESVSP system call described in the xfsctl(3) manual page.

       falloc [ -k ] offset length
              Allocates reserved, unwritten space for part of a file using the fallocate routine as described in the fallocate(2) manual page.
                 -k  will set the FALLOC_FL_KEEP_SIZE flag as described in fallocate(2).

       fcollapse offset length
              Call fallocate with FALLOC_FL_COLLAPSE_RANGE flag as described in the fallocate(2) manual page to de-allocates blocks and eliminates
              the hole created in this process by shifting data blocks into the hole.

       finsert offset length
              Call  fallocate  with  FALLOC_FL_INSERT_RANGE  flag as described in the fallocate(2) manual page to create the hole by shifting data
              blocks.

       fpunch offset length
              Punches (de-allocates) blocks in the file by calling fallocate with the FALLOC_FL_PUNCH_HOLE flag as described in  the  fallocate(2)
              manual page.

       fzero offset length
              Call  fallocate  with  FALLOC_FL_ZERO_RANGE flag as described in the fallocate(2) manual page to allocate and zero blocks within the
              range.

       truncate offset
              Truncates the current file at the given offset using ftruncate(2).

       sendfile -i srcfile | -f N [ offset length ]
              On platforms which support it, allows a direct in-kernel copy between two file descriptors. The current open file is the target, the
              source must be specified as another open file (-f) or by path (-i).

       readdir [ -v ] [ -o offset ] [ -l length ]
              Read a range of directory entries from a given offset of a directory.
                 -v  verbose mode - dump dirent content as defined in readdir(3)
                 -o  specify starting offset
                 -l  specify total length to read (in bytes)

       seek  -a | -d | -h [ -r ] [ -s ] offset
              On platforms that support the lseek(2) SEEK_DATA and SEEK_HOLE options, display the offsets of the specified segments.
                 -a  Display both data and hole segments starting at the specified offset.
                 -d  Display the data segment starting at the specified offset.
                 -h  Display the hole segment starting at the specified offset.
                 -r  Recursively display all the specified segments starting at the specified offset.
                 -s  Display  the starting lseek(2) offset. This offset will be a calculated value when both data and holes are displayed together
                     or performing a recusively display.

       reflink  [ -C ] [ -q ] src_file [src_offset dst_offset length]
              On filesystems that support the XFS_IOC_CLONE_RANGE or BTRFS_IOC_CLONE_RANGE ioctls, map length bytes at offset  dst_offset  in  the
              open  file  to  the same physical blocks that are mapped at offset src_offset in the file src_file , replacing any contents that may
              already have been there.  If a program writes into a reflinked block range of either file, the dirty blocks will be cloned,  written
              to, and remapped ("copy on write") in the affected file, leaving the other file(s) unchanged.  If src_offset, dst_offset, and length
              are omitted, all contents of src_file will be reflinked into the open file.
                 -C  Print timing statistics in a condensed format.
                 -q  Do not print timing statistics at all.

       dedupe  [ -C ] [ -q ] src_file src_offset dst_offset length
              On filesystems that support the XFS_IOC_FILE_EXTENT_SAME or BTRFS_IOC_FILE_EXTENT_SAME ioctls, map length bytes at offset dst_offset
              in the open file to the same physical blocks that are mapped at offset src_offset in the file src_file , but only if the contents of
              both ranges are identical.  This is known as block-based deduplication.  If a program writes into a reflinked block range of  either
              file,  the  dirty  blocks will be cloned, written to, and remapped ("copy on write") in the affected file, leaving the other file(s)
              unchanged.
                 -C  Print timing statistics in a condensed format.
                 -q  Do not print timing statistics at all.

MEMORY MAPPED I/O COMMANDS
       mmap [ N | [[ -rwx ] offset length ]]
              With no arguments, mmap shows the current mappings. Specifying a single numeric argument N sets the current mapping.  If  two  argu‐
              ments  are  specified (a range specified by offset and length), a new mapping is created spanning the range, and the protection mode
              can be given as a combination of PROT_READ (-r), PROT_WRITE (-w), and PROT_EXEC (-x).
       mm     See the mmap command.
       mremap [ -f ] [ -m ] new_length
              Changes the current mapping size to new_length.  Whether the mapping may be moved is controlled by the  flags  passed;  MREMAP_FIXED
              (-f), or MREMAP_MAYMOVE (-m).
       mrm    See the mremap command.
       munmap Unmaps the current memory mapping.
       mu     See the munmap command.
       mread [ -f | -v ] [ -r ] [ offset length ]
              Accesses  a  segment  of  the current memory mapping, optionally dumping it to the standard output stream (with -v or -f option) for
              inspection. The accesses are performed sequentially from the start offset by default, but can also be done from  the  end  backwards
              through  the  mapping if the -r option in specified.  The two verbose modes differ only in the relative offsets they display, the -f
              option is relative to file start, whereas -v shows offsets relative to the start of the mapping.
       mr     See the mread command.
       mwrite [ -r ] [ -S seed ] [ offset length ]
              Stores a byte into memory for a range within a mapping.  The default stored value is 'X', repeated to fill the range specified,  but
              this  can  be  changed  using the -S option.  The memory stores are performed sequentially from the start offset by default, but can
              also be done from the end backwards through the mapping if the -r option in specified.
       mw     See the mwrite command.
       msync [ -i ] [ -a | -s ] [ offset length ]
              Writes all modified copies of pages over the specified range (or entire mapping if no range  specified)  to  their  backing  storage
              locations.  Also, optionally invalidates (-i) so that subsequent references to the pages will be obtained from their backing storage
              locations (instead of cached copies).  The flush can be done synchronously (-s) or asynchronously (-a).
       ms     See the msync command.
       madvise [ -d | -r | -s | -w ] [ offset length ]
              Modifies page cache behavior when operating on the current mapping.  The range arguments are required by some advise  commands  ([*]
              below).  With no arguments, the POSIX_MADV_NORMAL advice is implied (default readahead).
                 -d  the pages will not be needed (POSIX_MADV_DONTNEED[*]).
                 -r  expect random page references (POSIX_MADV_RANDOM), which sets readahead to zero.
                 -s  expect sequential page references (POSIX_MADV_SEQUENTIAL), which doubles the default readahead on the file.
                 -w  advises the specified pages will be needed again (POSIX_MADV_WILLNEED[*]) which forces the maximum readahead.

       mincore
              Dumps a list of pages or ranges of pages that are currently in core, for the current memory mapping.

OTHER COMMANDS
       print  Display  a list of all open files and memory mapped regions.  The current file and current mapping are distinguishable from any oth‐
              ers.

       p      See the print command.

       quit   Exit xfs_io.

       q      See the quit command.

       lsattr [ -R | -D | -a | -v ]
              List extended inode flags on the currently open file. If the -R option is specified, a recursive descent is performed for all direc‐
              tory  entries  below  the  currently  open  file (-D can be used to restrict the output to directories only).  This is a depth first
              descent, it does not follow symlinks and it also does not cross mount points.

       chattr [ -R | -D ] [ +/-riasAdtPneEfS ]
              Change extended inode flags on the currently open file. The -R and -D options have the same meaning as above.  The  mapping  between
              each letter and the inode flags (refer to xfsctl(3) for the full list) is available via the help command.

       freeze Suspend all write I/O requests to the filesystem of the current file.  Only available in expert mode and requires privileges.

       thaw   Undo the effects of a filesystem freeze operation.  Only available in expert mode and requires privileges.

       flink path
              Link the currently open file descriptor into the filesystem namespace.

       inject [ tag ]
              Inject  errors  into  a filesystem to observe filesystem behavior at specific points under adverse conditions. Without the tag argu‐
              ment, displays the list of error tags available.  Only available in expert mode and requires privileges.

       resblks [ blocks ]
              Get and/or set count of reserved filesystem blocks using the XFS_IOC_GET_RESBLKS or XFS_IOC_SET_RESBLKS system calls.  Note --  this
              can be useful for exercising out of space behavior.  Only available in expert mode and requires privileges.

       shutdown [ -f ]
              Force the filesystem to shutdown (with or without flushing the log).  Only available in expert mode and requires privileges.

       stat [ -v ]
              Selected  statistics from stat(2) and the XFS_IOC_GETXATTR system call on the current file. If the -v option is specified, the atime
              (last access), mtime (last modify), and ctime (last change) timestamps are also displayed.

       statfs Selected statistics from statfs(2) and the XFS_IOC_FSGEOMETRY system call on the filesystem where the current file resides.

       chproj [ -R|-D ]
              Modifies the project identifier associated with the current path. The -R option will recursively descend if the current  path  is  a
              directory.  The  -D  option  will also recursively descend, only setting modifying projects on subdirectories.  See the xfs_quota(8)
              manual page for more information about project identifiers.

       lsproj [ -R|-D ]
              Displays the project identifier associated with the current path. The -R and -D options behave as described above, in chproj.

       parent [ -cpv ]
              By default this command prints out the parent inode numbers, inode generation numbers and basenames of all the hardlinks which point
              to the inode of the current file.
                 -p  the  output  is similar to the default output except pathnames up to the mount-point are printed out instead of the component
                     name.
                 -c  the file's filesystem will check all the parent attributes for consistency.
                 -v  verbose output will be printed.
              [NOTE: Not currently operational on Linux.]

SEE ALSO
       mkfs.xfs(8), xfsctl(3), xfs_bmap(8), xfs_db(8), xfs(5), fdatasync(2), fstat(2),  fstatfs(2),  fsync(2),  ftruncate(2),  mmap(2),  msync(2),
       open(2), pread(2), pwrite(2), readdir(3).

                                                                                                                                         xfs_io(8)
