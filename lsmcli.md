LSMCLI(1)                                                                                       libStorageMgmt                                                                                      LSMCLI(1)



NAME
       lsmcli - libStorageMgmt command line interface


SYNOPSIS
       lsmcli command [GLOBAL OPTIONS]...[COMMAND OPTIONS]...


DESCRIPTION
       lsmcli is the command line tool for the libStorageMgmt library.  This tool allows users to do one off storage related management operations or to script management of their storage.


PREREQUISITES
       * libStorageMgmt daemon.
               The daemon 'lsmd' is required by lsmcli.

       * URI(Uniform Resource Identifier)
               URI is used to identify which plugin to use and how the plugin should communicate with the storage array. The valid URI format is:
                   plugin://<username>@host:<port>?<query_string_parameters>
                   plugin+ssl://<username>@host:<port>?<query_string_parameters>
               Examples, please refer to "LibStorageMgmt User Guide" for more details:
                   * Simulator:
                       sim://
                       simc://
                   * NetApp ONTAP:
                       ontap://username@host
                       ontap+ssl://username@host
                   * SMI-S supported arrays (eg. EMC CX/VNX, HDS AMS, IBM SVC/DS, LSI MegaRAID and others):
                       smis://username@host:<port>?namespace=<namespace>
                       smis+ssl://username@host:<port>?namespace=<namespace>
               You can pass URI to lsmcli via one of these methods:
                   * Using '-u, --uri' argument.
                   * Using 'LSMCLI_URI' environment variable.
                   * Add this line into $HOME/.lsmcli:
                       uri=<URI>

       * Password
               For storage array password authentication you can pass it to lsmcli via one of the following methods:
                   * '-P, --prompt' argument to prompt for password.
                   * 'LSMCLI_PASSWORD' environment variable.

GLOBAL OPTIONS
       --version      Show program's version number and exit

       -h, --help     Show this help message and exit. Will show help message of specific command if specified.

       -u <URI>, --uri <URI>
                      Uniform Resource Identifier (env LSMCLI_URI)

       -P, --prompt   Prompt for password (env LSMCLI_PASSWORD)

       -H, --human    Print sizes in human readable format (e.g., KiB, MiB, GiB, TiB, PiB, EiB)

       -t <SEP>, --terse <SEP>
                      Print output in terse form with "SEP" as a record separator without header unless '--header' defined.

       --header       Include the header with terse

       -e, --enum     Display enumerated types as numbers instead of text

       -f, --force    Bypass confirmation prompt for data loss operations

       -w <WAIT>, --wait=<WAIT>
                      Command timeout value in ms (default = 30s)

       -b             Run the command asynchronously instead of waiting for completion. The lsmcli command will exit with exit code(7) and job id will be written to STDOUT when a command is still executing
                      on the storage array.  Use 'job-status --id <job id>' to inquire on the progress of the command.  Some arrays or plugins might not support asynchronous operations,  in  those  circum‐
                      stances, -b will be ineffective.  Command will wait until finished.

       -s, --script   Displaying data in script friendly way.
                      Without this option, data is displayed in this manner (default):

                          ID     | Name    | Element Type             ...
                          ------------------------------------------  ...
                          aggr0  | aggr0   | FS,SYSTEM_RESERVED,POOL  ...
                          iscsi  | iscsi   | FS,POOL                  ...


                      With this option, data is displayed in this manner.

                          -----------------------------------------------
                          ID               | aggr0
                          Name             | aggr0
                          Element Type     | FS,SYSTEM_RESERVED,POOL
                          ...
                          -----------------------------------------------
                          ID               | iscsi
                          Name             | iscsi
                          Element Type     | FS,POOL
                          ...

                      Please note:
                      To reduce the width of output, NOT all properties will be displayed in default column display.


COMMANDS
   list
       List information on LSM objects

       --type <TYPE>  Required. Valid values are (case insensitive):
                      VOLUMES, POOLS, FS, SNAPSHOTS, EXPORTS, NFS_CLIENT_AUTH,
                      ACCESS_GROUPS, SYSTEMS, DISKS, PLUGINS, TARGET_PORTS, BATTERIES.


       --fs <FS_ID>   Required for --type=SNAPSHOTS, list the snapshots of specific filesystem.  Optional for type EXPORTS, list the NFS export for specific filesystem.  Optional for type FS, list specific
                      filesystem.
                                                                                                                                                                                        , BATTERIES.
       --sys <SYS_ID> Optional.  Search resources from system with SYS_ID. Only supported when querying these types of resources: VOLUMES, POOLS, FS, DISKS, ACCESS_GROUPS, TARGET_PORTS

       --pool <POOL_ID>
                      Optional.  Search resources from pool with POOL_ID. Only supported by these types of resources: VOLUMES, POOLS, FS.

       --vol <VOL_ID> Search resources from volume with VOL_ID. Only supported by these types of resources: VOLUMES, ACCESS_GROUPS.
                      To query volume masking status, please use this command:
                         lsmcli list --type ACCESS_GROUPS --vol <VOL_ID>

       --disk <DISK_ID>
                      Search resources from disk with DISK_ID. Only supported by these types of resources: DISK.

       --ag <AG_ID>   Search resources from access group with AG_ID. Only supported by these types of resources: ACCESS_GROUPS, VOLUMES.
                      To query volume masking status, please use this command:
                         lsmcli list --type VOLUMES --ag <AG_ID>

       --nfs-export <NFS_EXPORT_ID>
                      Search resources from NFS export with NFS_EXPORT_ID. Only supported by these types of resources: EXPORTS.

       --tgt <TGT_ID> Search resources from target port with target port ID. Only supported by these types of resources: TARGET_PORTS.


   job-status
       Retrieve information about a job.  Please see user guide on how to use.

       --job <JOB_ID>


   capabilities
       Retrieves array capabilities.

       --sys <SYS_ID> Required. ID of the system to query for capabilities.


   plugin-info
       Retrieves plugin description and version for current URI.


   volume-create
       Creates a volume (AKA., logical volume, virtual disk, LUN).

       --name <NAME>  Required. Volume name.

       --size <SIZE>  Required. Volume size (See SIZE OPTION for allowed formats).

       --pool <POOL_ID>
                      Required. ID of pool.

       --provisioning <THINP_TYPE>
                      Optional. Provisioning type. Valid values are: DEFAULT, THIN, FULL.  DEFAULT means let plugin choose. THIN means requiring a Thin Provisioning enabled volume. FULL means  requiring  a
                      fully allocated volume.


   volume-raid-create
       Creates a volume on hardware RAID on given disks.

       --name <NAME>  Required. Volume name. Might be altered or ignored due to hardware RAID card vendor limitation.

       --raid-type <RAID_TYPE>
                      Required.  Could  be  one of these values: RAID0, RAID1, RAID5, RAID6, RAID10, RAID50, RAID60. The supported RAID types of current RAID card could be queried via command "volume-raid-
                      create-cap".

       --disk <DISK_ID>
                      Required. Repeatable. The disk ID for new RAID group.

       --strip-size <STRIP_SIZE>
                      Optional. The size in bytes of strip on each disks. If not defined, will let hardware card to use the vendor default value. The supported stripe size of current  RAID  card  could  be
                      queried via command "volume-raid-create-cap".


   volume-raid-create-cap
       Query support status of volume-raid-create command for current hardware RAID card.

       --sys <SYS_ID> Required. ID of the system to query for capabilities.


   volume-ident-led-on
       Enable the IDENT LEDs for all physical disks that compose a logical volume.

       --vol <VOL_ID> Required. ID of the volume being targeted.


   volume-ident-led-off
       Disable the IDENT LEDs for all physical disks that compose a logical volume.

       --vol <VOL_ID> Required. ID of the volume being targeted.


   volume-delete
       Delete a volume given its ID

       --vol <VOL_ID> Required. The ID of volume to delete.


   volume-resize
       Re-sizes a volume, requires:

       --vol <VOL_ID> Required. The ID of volume to resize.

       --size <NEW_SIZE>
                      Required. The new size of volume.(See SIZE OPTION for allowed formats).  Due to boundary alignment concern, array might return a volume with slightly bigger size than requested.


   volume-replicate
       Creates a new volume and replicates provided volume to it.

       --vol <VOL_ID> Required. The ID of volume to replicate.

       --name <NAME>  Required. The name for new volume to hold replicated data.

       --rep-type <REPL_TYPE> (see VOLUME REPLICATION TYPES)
                      Required. Valid types of replication are:
                      CLONE, COPY, MIRROR_ASYNC, MIRROR_SYNC.

       --pool <POOL_ID>
                      Optional. The ID of pool where the new volume should be created from. If not specified, plugin or array will choose appropriate pool.


   volume-replicate-range
       Replicates a portion of a volume to the same volume or to a different volume.

       --src-vol <SRC_VOL_ID>
                      Required. The ID of replication source volume.

       --dst-vol <DST_VOL_ID>
                      Required. The ID of replication destination volume.

       --rep-type <REPL_TYPE> (see VOLUME REPLICATION TYPES)
                      Required. Appropriate types of replication are:
                      CLONE, COPY.

       --src-start <SRC_START_BLK>
                      Required.  Replication  source  volume  start block number. Must in pair with --count and --dst-start.  If you have several non-continuous block ranges, you can define repeatly define
                      this arugument, like '--src-start 0 --dst-start 0 --count 1024 --src-start 2048 --dst-start 2048 --count 2048'

       --dst-start <DST_START_BLK>
                      Required. Replication destination volume start block number. Must in pair with --count and --src-start.

       --count <BLK_COUNT>                                                              R block.  Must in pair with --src-start and --dst-start.
                      Required. The count of replicated block startting from --src-start


   volume-replicate-range-block-size
       Size of each replicated block on a system in bytes.

       --sys <SYS_ID> Required. ID of the system to query for replicated block size.


   volume-dependants
       Returns True if volume has a dependant child, like replication.

       --vol <VOL_ID> Required. The ID of volume to query dependency.


   volume-dependants-rm
       Removes volume dependencies(like replication).

       --vol <VOL_ID> Required. The ID of volume to remove dependency.


   volume-access-group
       Lists the access group(s) that have access to the provided volume.

       --vol <VOL_ID> Required. The ID of volume to query access.


   volume-mask
       Grant access group RW access to specific volume. Like LUN masking
                      or NFS export.

       --vol <VOL_ID> Required. The ID of volume to access.

       --ag <AG_ID>   Required. The ID of access group to grant.


   volume-unmask
       Revoke access group RW access to specified volume.

       --vol <VOL_ID> Required. The ID of volume to revoke.

       --ag <AG_ID>   Required. The ID of access group to revoke.


   volume-enable
       Enable block access of specified volume.

       --vol <VOL_ID> Required. The ID of volume to enable access.


   volume-disable
       Disable block access of specified volume.

       --vol <VOL_ID> Required. The ID of volume to disable access.


   volume-raid-info
       Query RAID information for given volume.

       --vol <VOL_ID> Required. The ID of volume to query.


   pool-member-info
       Query RAID information for given pool.

       --pool <POOL_ID>
                      Required. The ID of pool to query.


   access-group-create
       Create an access group.

       --name <AG_NAME>
                      Required. The human friendly name for new access group.

       --init <INIT_ID>
                      Required. The first initiator ID of new access group. WWPN or iSCSI IQN.

       --sys <SYS_ID> Required. The ID of system where this access group should reside on.


   access-group-add
       Adds an initiator to an access group.

       --ag <AG_ID>   Required. ID of access group.

       --init <INIT_ID>
                      Required. ID of initiator to add. WWPN or iSCSI IQN.


   access-group-remove
       Removes an initiator from an access group.

       --ag <AG_ID>   Required. ID of access group.

       --init <INIT_ID>
                      Required. ID of initiator to remove.


   access-group-delete
       Delete an access group.

       --ag <AG_ID>   Required. ID of access group to delete.


   access-group-volumes
       Lists the volumes that the access group has been granted access to.

       --ag <AG_ID>   Required. The ID of access group to query.


   iscsi-chap
       Configures ISCSI inbound/outbound CHAP authentication.

       --init <INIT_ID>
                      Required. The ID of iSCSI initiator to configure.

       --in-user <IN_USER>
                      Optional. Inbound CHAP user name.

       --in-pass <IN_PASS>
                      Optional. Inbound CHAP password.

       --out-user <OUT_USER>
                      Optional. Outbound CHAP user name.

       --out-pass <OUT_PASS>
                      Optional. Outbound CHAP password.


   fs-create
       Creates a filesystem.

       --name <NAME>  Required. Human friendly name for new filesystem.

       --size <SIZE>  Required. Volume size(See SIZE OPTION for allowed formats).

       --pool <POOL_ID>
                      Required. ID of pool to hold the new filesystem.


   fs-delete
       Delete a filesystem.

       --fs <FS_ID>   Required. ID of the filesystem to delete.


   fs-resize
       Resizes a filesystem.

       --fs <FS_ID>   Required. ID of the filesystem to resize.

       --size <NEW_SIZE>
                      Required. New size of filesystem. See SIZE OPTION for allowed formats.


   fs-export
       Export a filesystem via NFS.

       --fs <FS_ID>   Required. ID of the filesystem to export.

       --exportpath <EXPORT_PATH>
                      Optional. NFS server export path. e.g. '/foo/bar'.

       --anonuid <ANONY_UID>
                      Optional. The UID(User ID) to map to anonymous user.

       --anongid <ANONY_GID>
                      Optional. The GID(Group ID) to map to anonymous user.

       --auth-type <AUTH_TYPE>
                      Optional. NFS client authentication type. This is just a place holder, not supported yet.

       --root-host <ROOT_HOST>
                      Optional. Repeatable. The host/IP has root access. For two or more hosts/IPs: --root-host hostA --root-host hostB.

       --ro-host <RO_HOST>
                      Optional. Repeatable. The host/IP has read only access. For two or more hosts/IPs: '--ro-host hostA --ro-host hostB'.

       --rw-host <RW_HOST>
                      Optional. The host/IP has read/write access. For two or more hosts/IPs: --rw-host hostA --rw-host hostB.


   fs-unexport
       Remove an NFS export.

       --export <EXPORT_ID>
                      Required. ID of the export to unexport.


   fs-clone
       Creates a file system clone. The 'clone' means point in time read writeable space efficient copy of data, AKA. read-writable snapshot.

       --src-fs <SRC_FS_ID>
                      Required. The ID of the filesystem to clone.

       --dst-name <DST_FS_NAME>
                      Required. The name for newly created destination file system.

       --backing-snapshot <BE_SS_ID>
                      Optional. Make a FS clone using a previously created snapshot.


   fs-snap-create
       Creates a snapshot of specified filesystem.  A snapshot is defined as a read only space efficient point in time copy (PIT) of a filesystem.  The source filesystem remains modifiable.

       --name <SNAP_NAME>
                      Required. The human friendly name of new snapshot.

       --fs <FS_ID>   Required. The ID of filesystem to create snapshot against.


   fs-snap-delete
       Deletes a snapshot.

       --snap <SNAP_ID>
                      Required. The ID of snapshot to delete.

       --fs <FS_ID>   Required. The ID of filesystem.


   fs-snap-restore
       Restores a FS or specified files to previous snapshot state. This will discard all the changes to filesystem since snapshot if specific files are not specified in restore.

       --fs <FS_ID>   Required. The ID of filesystem to restore.

       --snap <SNAP_ID>
                      Required. The ID of snapshot to restore.

       --file <FILE_PATH>
                      Optional. Repeatable. With this option defined, will only restore the defined file(s).  --file fileA --file pathB.

       --fileas <NEW_FILE_PATH>
                      Optional. Repeatable. With this option defined, the restored file will be saved to specified path and filename, eg. '--file fileA --fileas old_fileA '.


   fs-dependants
       Returns True if a child dependency (snapshot or clone) exists.

       --fs <FS_ID>   Required. The ID of filesystem to query.

       --file <FILE_PATH>
                      Optional. Repeatable. Only check for dependencies on specific file(s), eg. '--file fileA --file pathB'.


   fs-dependants-rm
       Removes filesystem dependencies(snapshot or clone).

       --fs <FS_ID>   Required. The ID of filesystem to remove dependency.

       --file <FILE_PATH>
                      Optional. Repeatable. Only remove dependencies on specific file(s), eg. '--file fileA --file pathB'.


   file-clone
       Creates a clone of a file (thin provisioned).  Note: --src and --dst need to be paired
        eg. '--src fileA --src fileB --dst fileA_clone --dst fileB_clone'.

       --fs <FS_ID>   Required. The ID of filesystem to clone.

       --src <SRC_FILE_PATH>
                      Required. Repeatable. Source file to clone (relative path).

       --dst <DST_FILE_PATH>
                      Required. Repeatable. Destination file for clone (relative path).

       --backing-snapshot <SNAP_ID>
                      Optional. Use the source file from previously created snapshot.


   system-read-cache-pct-update
       Change the read cache percentage for a system.

       --sys <SYS_ID> Required. ID of the system being targeted.

       --read-pct <READ_PCT>
                      The desired percentage of read cache for the targeted system. Write cache will be automatically changed to the remaining percentage available after updating the read  cache  (if  sup‐
                      ported by the system).


   local-disk-list
       List all disks found on current local operating system.  Require permission to open /dev/sdX as read-only, normally root user or disk group would have sufficient permission.


   volume-cache-info
       Query RAM cache information for the desired volume.

       --vol <VOL_ID> Required. ID of the volume to query cache information.


   volume-phy-disk-cache-update
       Disable or enable RAM physical disk cache of specific volume.

       --vol <VOL_ID> Required. ID of the volume to change.

       --policy <POLICY>
                      Required. Enable or Disable.


   volume-read-cache-policy-update
       Disable or enable RAM read cache of specific volume.

       --vol <VOL_ID> Required. ID of the volume to change.

       --policy <POLICY>
                      Required. Enable or Disable.


   volume-write-cache-policy-update
       Change volume write cache policy.

       --vol <VOL_ID> Required. ID of the volume to change.

       --policy <POLICY>
                      Required. WB for write back mode, WT for write through mode, AUTO for auto mode which use WB mode when any battery is OK and use WT mode else.


   local-disk-ident-led-on
       Turn on the identification LED for specified disk path.  Require permission to open disk path as read-write, normally root user or disk group would have sufficient permission.

       --path <DISK_PATH>
                      Required. Disk path, like /dev/sdb.


   local-disk-ident-led-off
       Turn off the identification LED for specified disk path.  Require permission to open disk path as read-write, normally root user or disk group would have sufficient permission.

       --path <DISK_PATH>
                      Required. Disk path, like /dev/sdb.


   local-disk-fault-led-on
       Turn on the fault LED for specified disk path.  Require permission to open disk path as read-write, normally root user or disk group would have sufficient permission.

       --path <DISK_PATH>
                      Required. Disk path, like /dev/sdb.


   local-disk-fault-led-off
       Turn off the fault LED for specified disk path.  Require permission to open disk path as read-write, normally root user or disk group would have sufficient permission.

       --path <DISK_PATH>
                      Required. Disk path, like /dev/sdb.


ALIAS
   ls
       Alias of 'list --type systems'

   lp
       Alias of 'list --type pools'

   lv
       Alias of 'list --type volumes'

   ld
       Alias of 'list --type disks'

   la
       Alias of 'list --type access_groups'

   lf
       Alias of 'list --type fs'

   lt
       Alias of 'list --type target_ports'

   lb
       Alias of 'list --type batteries'

   c
        Alias of 'capabilities'

   p
        Alias of 'plugin-info'

   vc
       Alias of 'volume-create'

   vrc
       Alias of 'volume-raid-create'

   vrcc
       Alias of 'volume-raid-create-cap'

   vilon
       Alias of 'volume-ident-led-on'

   viloff
       Alias of 'volume-ident-led-off'

   vd
       Alias of 'volume-delete'

   vr
       Alias of 'volume-resize'

   vm
       Alias of 'volume-mask'

   vu
       Alias of 'volume-unmask'

   ve
       Alias of 'volume-enable'

   vi
       Alias of 'volume-disable'

   vri
       Alias of 'volume-raid-info'

   pmi
       Alias of 'pool-member-info'

   ac
       Alias of 'access-group-create'

   aa
       Alias of 'access-group-add'

   ar
       Alias of 'access-group-remove'

   ad
       Alias of 'access-group-delete'

   srcps
       Alias of 'system-read-cache-pct-update'

   ldl
       Alias of 'local-disk-list'

   vci
       Alias of 'volume-cache-info'

   vpdcu
       Alias of 'volume-phy-disk-cache-update'

   vrcpu
       Alias of 'volume-read-cache-policy-update'

   vwcpu
       Alias of 'volume-write-cache-policy-update'

   ldilon
       Alias of 'local-disk-ident-led-on'

   ldiloff
       Alias of 'local-disk-ident-led-off'

   ldflon
       Alias of 'local-disk-fault-led-on'

   ldfloff
       Alias of 'local-disk-fault-led-off'


SIZE OPTION
   --size <SIZE>
       Storage space size. Format is '<number>' + '<prefix>'. Example: "10GiB", "20.5MB". No postfix indicates bytes. Valid prefixes are:
           KiB,                    # 2^10 Bytes
           MiB,                    # 2^20 Bytes
           GiB,                    # 2^30 Bytes
           TiB,                    # 2^40 Bytes
           PiB,                    # 2^50 Bytes
           EiB,                    # 2^60 Bytes
           KB,                     # 10^3 Bytes
           MB,                     # 10^6 Bytes
           GB,                     # 10^9 Bytes
           TB,                     # 10^12 Bytes
           PB,                     # 10^15 Bytes
           EB,                     # 10^17 Bytes

       These prefixes are supported also, but not recommended:
           K, M, G, T, P, E,       # equal to KiB, MiB, and etc
           k, m, g, t, p, e,       # equal to KiB, MiB, and etc


FILES
       ~/.lsmcli      lsmcli configuration file, containing name-value pairs separated by '='. The only currently supported configuration option is 'uri', such as 'uri=ontap://user@filer.example.com'.

                      Configuration options in .lsmcli are only used if not overridden by command-line option or environment variable.


EXAMPLES (command output omitted for brevity)
       Simulator, list pools (no password required)
                      $ lsmcli -u sim:// -l POOLS

       NetApp, list volumes (prompting for password)
                      $ lsmcli -u ontap://root@host/ -l VOLUMES -P

       SMI-S, list systems (prompting for password)
                      $ lsmcli -u smispy://username@host:5988/?namespace=root/interop \
                              -l SYSTEMS -P

       Targetd, list pools (using env variables for URI and password)
                      $ export LSMCLI_URI=targetd://username@host:18700
                      $ export LSMCLI_PASSWORD=<password>
                      $ lsmcli -l POOLS

       NexentaStor, create volume (using environment variables for URI and password)
                      $ export LSMCLI_URI='nstor://user@host'
                      $ export LSMCLI_PASSWORD=<password>
                      $ lsmcli volume-create --name volume_name --size 1TiB --pool default

       SMI-S, create volume (using environment variables for URI and password)
                      $ export LSMCLI_URI='smispy+ssl://user@host:5989?namespace=root/emc'
                      $ export LSMCLI_PASSWORD=<password>
                      $ lsmcli volume-create --name volume_name --size 1TiB --pool default


ENVIRONMENT
       LSMCLI_URI       The URI for the storage array in question.

       LSMCLI_PASSWORD  The password to use for the array.


VOLUME REPLICATION TYPES
       CLONE            A point in time, read writeable, space efficent copy of data.

       COPY             A full bitwise copy of the data. It occupies the full space.

       MIRROR_SYNC      Continously updated, realtime with both copies having identical data.

       MIRROR_ASYNC     Continously updated, with a varying amount of delay and data delta between the source and target.



NOTES
       Optional search argument
               When specifying an optional search argument, it's not considered an error if no search results are found, eg. specifying a non-existent system id.  The exit code will be 0.


       Plugin installation
               Plugins are installed individually except for the simulators which are always included.


       Secure sockets layer (SSL)
               All of the plugins (except the simulator) support SSL when communicating from the plugin to the array.  This is accomplished by adding "+ssl" to the plugin and usually by selecting a differ‐
               ent port number from non-SSL communications.
               $ lsmcli -u smispy+ssl://username@host:5989/?namespace=interop \
                       list --type SYSTEMS -P


       SSL error: certificate verify failed
               When using SMI-S plugin with SSL against self-signed SMI-S provider, lsmcli normally quit with 'SSL error: certificate verify failed'. Please contact SMI-S  provider  support  to  setup  the
               self-signed certificate in your system. If you prefer to bypass the certificate check, add 'no_ssl_verify=yes' at the end of URI, for example:
                   smispy+ssl://admin@emc-smi:5989?namespace=root/emc&no_ssl_verify=yes


BUGS
       Please report bugs to <libstoragemgmt-devel@lists.fedorahosted.org>

AUTHOR
       Tony Asleson <tasleson@redhat.com>
       Gris Ge <fge@redhat.com>



lsmcli 1.7.3                                                                                    December 2018                                                                                       LSMCLI(1)
