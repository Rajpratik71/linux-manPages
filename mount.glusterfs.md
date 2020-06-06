GlusterFS(8)                                                                                    Red Hat, Inc.                                                                                    GlusterFS(8)



NAME
       mount.glusterfs - script to mount native GlusterFS volume

SYNOPSIS
       mount -t glusterfs [-o <options>] <volumeserver>:/<volume>[/<subdir>] <mountpoint>

       mount -t glusterfs [-o <options>] <server1>,<server2>,
              <server3>,..<serverN>:/<volname>[/<subdir>] <mount_point>


       mount -t glusterfs [-o <options>] <path/to/volumefile> <mountpoint>

DESCRIPTION
       This tool is part of glusterfs(8) package, which is used to mount using GlusterFS native binary.

       mount.glusterfs  is  meant to be used by the mount(8) command for mounting native GlusterFS client. This subcommand, however, can also be used as a standalone command with limited functional‐
       ity.


OPTIONS
   Basic options
       log-file=LOG-FILE
              File to use for logging [default:/var/log/glusterfs/glusterfs.log]

       log-level=LOG-LEVEL
              Logging severity.  Valid options are TRACE, DEBUG, WARNING, ERROR, CRITICAL INFO and NONE [default: INFO]

       acl    Mount the filesystem with POSIX ACL support

       fopen-keep-cache
              Do not purge the cache on file open

       worm   Mount the filesystem in 'worm' mode

       aux-gfid-mount
              Enable access to filesystem through gfid directly

       ro     Mount the filesystem read-only

       enable-ino32=BOOL
              Use 32-bit inodes when mounting to workaround broken applications that don't support 64-bit inodes

       mem-accounting
              Enable internal memory accounting

       capability
              Enable file capability setting and retrival


   Advanced options
       attribute-timeout=SECONDS
              Set attribute timeout to SECONDS for inodes in fuse kernel module [default: 1]

       entry-timeout=SECONDS
              Set entry timeout to SECONDS in fuse kernel module [default: 1]

       background-qlen=N
              Set fuse module's background queue length to N [default: 64]

       gid-timeout=SECONDS
              Set auxiliary group list timeout to SECONDS for fuse translator [default: 0]

       negative-timeout=SECONDS
              Set negative timeout to SECONDS in fuse kernel module [default: 0]

       volume-name=VOLUME-NAME
              Volume name to be used for MOUNT-POINT [default: top most volume in VOLUME-FILE]

       direct-io-mode=disable
              Disable direct I/O mode in fuse kernel module

       congestion-threshold=N
              Set fuse module's congestion threshold to N [default: 48]

       ubdir-mount=N
              Set the subdirectory mount option [default: NULL, ie, no subdirectory mount]


       backup-volfile-servers=SERVERLIST
              Provide list of backup volfile servers in the following format [default: None]

              $ mount -t glusterfs -obackup-volfile-servers=<server2>:
                     <server3>:...:<serverN> <server1>:/<volname> <mount_point>



       backupvolfile-server=SERVER
              Provide list of backup volfile servers in the following format [default: None]

               $ mount -t glusterfs -obackupvolfile-server=<server2>
                       <server1>:/<volname> <mount_point>



       fetch-attempts=N
              Deprecated option - placed here for backward compatibility [default: 1]


       lru-limit=N
              Set fuse module's limit for number of inodes kept in LRU list to N [default: 131072]


       background-qlen=N
              Set fuse module's background queue length to N [default: 64]

       no-root-squash=BOOL
              disable root squashing for the trusted client [default: off]

       root-squash=BOOL
              enable root squashing for the trusted client [default: on]

       dump-fuse=PATH
              Dump fuse traffic to PATH

       use-readdirp=BOOL
              Use readdirp() mode in fuse kernel module [default: on]

FILES
       /etc/fstab
              A typical GlusterFS entry in /etc/fstab looks like below

              server1:/mirror  /mnt/mirror  glusterfs log-file=/var/log/mirror.log,acl   0  0


       /proc/mounts
              An example entry of a GlusterFS mountpoint in /proc/mounts looks like below

              server1:/mirror /mnt/glusterfs fuse.glusterfs rw,allow_other,default_permissions,max_read=131072 0 0


SEE ALSO
       glusterfs(8), mount(8), gluster(8)


COPYRIGHT
       Copyright(c) 2006-2013   Red Hat, Inc.   <http://www.redhat.com>



14 September 2013                                                                             Cluster Filesystem                                                                                 GlusterFS(8)
