SSHFS(1)                                     User Commands                                    SSHFS(1)

NAME
       SSHFS - filesystem client based on ssh

SYNOPSIS
   mounting
       sshfs [user@]host:[dir] mountpoint [options]

   unmounting
        mountpoint

DESCRIPTION
       SSHFS  (Secure SHell FileSystem) is a file system for Linux (and other operating systems with a
       FUSE implementation, such as Mac OS X or FreeBSD) capable of operating on  files  on  a  remote
       computer  using  just  a secure shell login on the remote computer. On the local computer where
       the SSHFS is mounted, the implementation makes use of the FUSE (Filesystem in Userspace) kernel
       module.  The  practical effect of this is that the end user can seamlessly interact with remote
       files being securely served over SSH just as if they were local files on his/her  computer.  On
       the remote computer the SFTP subsystem of SSH is used.

       If host is a numeric IPv6 address, it needs to be enclosed in square brackets.

OPTIONS
   general options:
       -o opt,[opt...]
              mount options

       -h   --help
              print help

       -V   --version
              print version

   SSHFS options:
       -p PORT
              equivalent to '-o port=PORT'

       -C     equivalent to '-o compression=yes'

       -F ssh_configfile
              specifies alternative ssh configuration file

       -1     equivalent to '-o ssh_protocol=1'

       -o reconnect
              reconnect to server

       -o delay_connect
              delay connection to server

       -o sshfs_sync
              synchronous writes

       -o no_readahead
              synchronous reads (no speculative readahead)

       -o sync_readdir
              synchronous readdir

       -o sshfs_debug
              print some debugging information

       -o cache=BOOL
              enable caching {yes,no} (default: yes)

       -o cache_timeout=N
              sets timeout for caches in seconds (default: 20)

       -o cache_X_timeout=N
              sets timeout for {stat,dir,link} cache

       -o workaround=LIST
              colon separated list of workarounds

               none   no workarounds enabled

               all    all workarounds enabled

               [no]rename
                      fix renaming to existing file (default: off)

               [no]nodelaysrv
                      set nodelay tcp flag in ssh (default: off)

               [no]truncate
                      fix truncate for old servers (default: off)

               [no]buflimit
                      fix buffer fillup bug in server (default: on)

       -o idmap=TYPE
              user/group ID mapping (default: "none")

               none   no translation of the ID space

               user   only translate UID/GID of connecting user

               file   translate UIDs/GIDs based upon the contents of uidfile  and gidfile

       -o uidfile=FILE
              file containing username:uid mappings for idmap=file

       -o gidfile=FILE
              file containing groupname:gid mappings for idmap=file

       -o nomap=TYPE
              with idmap=file, how to handle missing mappings

               ignore don't do any re-mapping

               error  return an error (default)

       -o ssh_command=CMD
              execute CMD instead of 'ssh'

       -o ssh_protocol=N
              ssh protocol to use (default: 2)

       -o sftp_server=SERV
              path to sftp server or subsystem (default: sftp)

       -o directport=PORT
              directly connect to PORT bypassing ssh

       -o slave
              communicate over stdin and stdout bypassing network

       -o disable_hardlink
              link(2) will return with errno set to ENOSYS.  Hard links don't currently work perfectly
              on sshfs, and this confuses some programs.  If that happens  try  disabling  hard  links
              with this option.

       -o transform_symlinks
              transform absolute symlinks to relative

       -o follow_symlinks
              follow symlinks on the server

       -o no_check_root
              don't check for existence of 'dir' on server

       -o password_stdin
              read password from stdin (only for pam_mount!)

       -o SSHOPT=VAL
              ssh options (see man ssh_config)

   FUSE options:
       -d   -o debug
              enable debug output (implies -f)

       -f     foreground operation

       -s     disable multi-threaded operation

       -o allow_other
              allow access to other users

       -o allow_root
              allow access to root

       -o nonempty
              allow mounts over non-empty file/dir

       -o default_permissions enable permission checking by kernel

       -o fsname=NAME
              set filesystem name

       -o subtype=NAME
              set filesystem type

       -o large_read
              issue large read requests (2.4 only)

       -o max_read=N
              set maximum size of read requests

       -o hard_remove
              immediate removal (don't hide files)

       -o use_ino
              let filesystem set inode numbers

       -o readdir_ino
              try to fill in d_ino in readdir

       -o direct_io
              use direct I/O

       -o kernel_cache
              cache files in kernel

       -o [no]auto_cache
              enable caching based on modification times

       -o umask=M
              set file permissions (octal)

       -o uid=N
              set file owner (number)

       -o gid=N
              set file group (number)

       -o entry_timeout=T
              cache timeout for names (1.0s)

       -o negative_timeout=T
              cache timeout for deleted names (0.0s)

       -o attr_timeout=T
              cache timeout for attributes (1.0s)

       -o ac_attr_timeout=T
              auto cache timeout for attributes (attr_timeout)

       -o intr
              allow requests to be interrupted

       -o intr_signal=NUM
              signal to send on interrupt (10)

       -o modules=M1[:M2...]
              names of modules to push onto filesystem stack

       -o max_write=N
              set maximum size of write requests

       -o max_readahead=N
              set maximum readahead

       -o async_read
              perform reads asynchronously (default)

       -o sync_read
              perform reads synchronously

   Module options:
       [subdir]

       -o subdir=DIR
              prepend this directory to all paths (mandatory)

       -o [no]rellinks
              transform absolute symlinks to relative

       [iconv]

       -o from_code=CHARSET
              original encoding of file names (default: UTF-8)

       -o to_code=CHARSET
              new encoding of the file names (default: ISO-8859-2)

AUTHORS
       SSHFS has been written by Miklos Szeredi <miklos@szeredi.hu>.

       This man page was written by Bartosz Fenski <fenio@debian.org> for the Debian GNU/Linux distri‐
       bution (but it may be used by others).

SSHFS version 2.0                             April 2008                                      SSHFS(1)
