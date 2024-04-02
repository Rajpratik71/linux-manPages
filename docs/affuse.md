affuse(1)                                                provide access to AFF containers                                                affuse(1)

NAME
       affuse - provide access to AFF containers

SYNOPSIS
       affuse [<FUSE library options>] aff_image mount_point

DESCRIPTION
       Provide access to AFF containers, allowing several advanced operations.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       FUSE options:

              -d -o debug
                     Enable debug output (implies in -f).

              -f     Foreground operation.

              -s     Disable multi-threaded operation.

              -o allow_other
                     Allow access to other users.

              -o allow_root
                     Allow access to root.

              -o auto_unmount
                     Auto unmount on process termination.

              -o nonempty
                     Allow mounts over non-empty file/dir.

              -o default_permissions
                     Enable permission checking by kernel.

              -o fsname=NAME
                     Set filesystem name.

              -o subtype=NAME
                     Set filesystem type.

              -o large_read
                     Issue large read requests (2.4 only).

              -o max_read=N
                     Set maximum size of read requests.

              -o hard_remove
                     Immediate removal (don't hide files).

              -o use_ino
                     Let filesystem set inode numbers.

              -o readdir_ino
                     Try to fill in d_ino in readdir.

              -o direct_io
                     Use direct I/O.

              -o kernel_cache
                     Cache files in kernel.

              -o [no]auto_cache
                     Enable caching based on modification times (off).

              -o umask=M
                     Set file permissions (octal).

              -o uid=N
                     Sset file owner.

              -o gid=N
                     Set file group.

              -o entry_timeout=T
                     Cache timeout for names (1.0s).

              -o negative_timeout=T
                     Cache timeout for deleted names (0.0s).

              -o attr_timeout=T
                     Cache timeout for attributes (1.0s).

              -o ac_attr_timeout=T
                     Auto cache timeout for attributes (attr_timeout).

              -o noforget
                     Never forget cached inodes.

              -o remember=T
                     Remember cached inodes for T seconds (0s).

              -o nopath
                     Don't supply path if not necessary.

              -o intr
                     Allow requests to be interrupted.

              -o intr_signal=NUM
                     Signal to send on interrupt (10).

              -o modules=M1[:M2...]
                     Names of modules to push onto filesystem stack.

              -o max_write=N
                     Set maximum size of write requests.

              -o max_readahead=N
                     Set maximum readahead.

              -o max_background=N
                     Set number of maximum background requests.

              -o congestion_threshold=N
                     Set kernel's congestion threshold.

              -o async_read
                     Perform reads asynchronously (default).

              -o sync_read
                     Perform reads synchronously.

              -o atomic_o_trunc
                     Enable atomic open+truncate support.

              -o big_writes
                     Enable larger than 4kB writes.

              -o no_remote_lock
                     Disable remote file locking.

              -o no_remote_flock
                     Disable remote file locking (BSD).

              -o no_remote_posix_lock
                     Disable remove file locking (POSIX).

              -o [no_]splice_write
                     Use splice to write to the fuse device.

              -o [no_]splice_move
                     Move data while splicing to the fuse device.

              -o [no_]splice_read
                     Use splice to read from the fuse device.

       Module options:

       [iconv]

              -o from_code=CHARSET
                     Original encoding of file names (default: UTF-8).

              -o to_code=CHARSET
                     New encoding of the file names (default: UTF-8).

       [subdir]

              -o subdir=DIR
                     Prepend this directory to all paths (mandatory).

              -o [no]rellinks
                     Transform absolute symlinks to relative.

NOTES
       Use fusermount -u mount_point, to unmount.

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1),  affinfo(1),  affix(1),  affrecover(1),  affsegment(1),
       affsign(1), affstats(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFUSE 3.7.4                                                         Oct 2014                                                            affuse(1)
