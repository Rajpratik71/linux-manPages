
Gluster(8)                                                                                       Gluster Inc.                                                                                      Gluster(8)



NAME
       gluster - Gluster Console Manager (command line utility)

SYNOPSIS
       gluster

       To run the program and display gluster prompt:

       gluster [--remote-host=<gluster_node>] [--mode=script] [--xml]

       (or)

       To specify a command directly:

       gluster [commands] [options] [--remote-host=<gluster_node>] [--mode=script] [--xml]

DESCRIPTION
       The  Gluster Console Manager is a command line utility for elastic volume management. You can run the gluster command on any export server. The command enables administrators to perform cloud opera‐
       tions, such as creating, expanding, shrinking, rebalancing, and migrating volumes without needing to schedule server downtime.

COMMANDS
   Volume Commands
        volume info [all|<VOLNAME>]
              Display information about all volumes, or the specified volume.

        volume list
              List all volumes in cluster

        volume status [all | <VOLNAME> [nfs|shd|<BRICK>|quotad|tierd]] [detail|clients|mem|inode|fd|callpool|tasks|client-list]
              Display status of all or specified volume(s)/brick

        volume create <NEW-VOLNAME> [stripe <COUNT>] [replica <COUNT>] [disperse [<COUNT>]] [redundancy <COUNT>] [transport <tcp|rdma|tcp,rdma>] <NEW-BRICK> ...
              Create a new volume of the specified type using the specified bricks and transport type (the default transport type is tcp).  To create a volume with both  transports  (tcp  and  rdma),  give
              'transport tcp,rdma' as an option.

        volume delete <VOLNAME>
              Delete the specified volume.

        volume start <VOLNAME>
              Start the specified volume.

        volume stop <VOLNAME> [force]
              Stop the specified volume.

        volume set <VOLNAME> <OPTION> <PARAMETER> [<OPTION> <PARAMETER>] ...
              Set the volume options.

        volume get <VOLNAME/all> <OPTION/all>
              Get the value of the all options or given option for volume <VOLNAME> or all option. gluster volume get all all is to get all global options

        volume reset <VOLNAME> [option] [force]
              Reset all the reconfigured options

        volume barrier <VOLNAME> {enable|disable}
              Barrier/unbarrier file operations on a volume

        volume clear-locks <VOLNAME> <path> kind {blocked|granted|all}{inode [range]|entry [basename]|posix [range]}
              Clear locks held on path

        volume help
              Display help for the volume command.

   Brick Commands
        volume add-brick <VOLNAME> <NEW-BRICK> ...
              Add the specified brick to the specified volume.

        volume remove-brick <VOLNAME> <BRICK> ...
              Remove the specified brick from the specified volume.

              Note: If you remove the brick, the data stored in that brick will not be available. You can migrate data from one brick to another using replace-brick option.

        volume reset-brick <VOLNAME> <SOURCE-BRICK> {{start} | {<NEW-BRICK> commit}}
              Brings down or replaces the specified source brick with the new brick.

        volume replace-brick <VOLNAME> <SOURCE-BRICK> <NEW-BRICK> commit force
              Replace the specified source brick with a new brick.

        volume rebalance <VOLNAME> start
              Start rebalancing the specified volume.

        volume rebalance <VOLNAME> stop
              Stop rebalancing the specified volume.

        volume rebalance <VOLNAME> status
              Display the rebalance status of the specified volume.

   Log Commands
        volume log filename <VOLNAME> [BRICK] <DIRECTORY>
              Set the log directory for the corresponding volume/brick.

        volume log locate <VOLNAME> [BRICK]
              Locate the log file for corresponding volume/brick.

        volume log rotate <VOLNAME> [BRICK]
              Rotate the log file for corresponding volume/brick.

        volume profile <VOLNAME> {start|info [peek|incremental [peek]|cumulative|clear]|stop} [nfs]
              Profile operations on the volume. Once started, volume profile <volname> info provides cumulative statistics of the FOPs performed.

        volume statedump <VOLNAME> [[nfs|quotad] [all|mem|iobuf|callpool|priv|fd|inode|history]... | [client <hostname:process-id>]]
              Dumps the in memory state of the specified process or the bricks of the volume.

        volume sync <HOSTNAME> [all|<VOLNAME>]
              Sync the volume information from a peer

   Peer Commands
        peer probe <HOSTNAME>
              Probe the specified peer. In case the <HOSTNAME> given belongs to an already probed peer, the peer probe command will add the hostname to the peer if required.

        peer detach <HOSTNAME>
              Detach the specified peer.

        peer status
              Display the status of peers.

        pool list
              List all the nodes in the pool (including localhost)

        peer help
              Display help for the peer command.

   Tier Commands
        volume tier <VOLNAME> attach [<replica COUNT>] <NEW-BRICK>...
              Attach to an existing volume a tier of specified type using the specified bricks.

        volume tier <VOLNAME> start [force]
              Start the tier service for <VOLNAME>

        volume tier <VOLNAME> status
              Display statistics on data migration between the hot and cold tiers.

        volume tier <VOLNAME> stop [force]
              Stop the tier service for <VOLNAME>

        volume tier <VOLNAME> detach start
              Begin detaching the hot tier from the volume. Data will be moved from the hot tier to the cold tier.

        volume tier <VOLNAME> detach commit [force]
              Commit detaching the hot tier from the volume. The volume will revert to its original state before the hot tier was attached.

        volume tier <VOLNAME> detach status
              Check status of data movement from the hot to cold tier.

        volume tier <VOLNAME> detach stop
              Stop detaching the hot tier from the volume.


   Quota Commands
        volume quota <VOLNAME> enable
              Enable  quota  on the specified volume. This will cause all the directories in the filesystem hierarchy to be accounted and updated thereafter on each operation in the the filesystem. To kick
              start this accounting, a crawl is done over the hierarchy with an auxiliary client.

        volume quota <VOLNAME> disable
              Disable quota on the volume. This will disable enforcement and accounting in the filesystem. Any configured limits will be lost.

        volume quota <VOLNAME> limit-usage <PATH> <SIZE> [<PERCENT>]
              Set a usage  limit on the given path. Any previously set limit is overridden to the new value. The soft limit can optionally be specified (as a percentage of hard limit). If soft  limit  per‐
              centage is not provided the default soft limit value for the volume is used to decide the soft limit.

        volume quota <VOLNAME> limit-objects <PATH> <SIZE> [<PERCENT>]
              Set  an  inode limit on the given path. Any previously set limit is overridden to the new value. The soft limit can optionally be specified (as a percentage of hard limit). If soft limit per‐
              centage is not provided the default soft limit value for the volume is used to decide the soft limit.

       NOTE: valid units of SIZE are : B, KB, MB, GB, TB, PB. If no unit is specified, the unit defaults to bytes.

        volume quota <VOLNAME> remove <PATH>
              Remove any usage limit configured on the specified directory. Note that if any limit is configured on the ancestors of this directory (previous directories along the path), they will still be
              honored and enforced.

        volume quota <VOLNAME> remove-objects <PATH>
              Remove any inode limit configured on the specified directory. Note that if any limit is configured on the ancestors of this directory (previous directories along the path), they will still be
              honored and enforced.

        volume quota <VOLNAME> list <PATH>
              Lists the  usage and limits configured on directory(s). If a path is given only the limit that has been configured on the directory(if any) is displayed along with the directory's  usage.  If
              no path is given, usage and limits are displayed for all directories that has limits configured.

        volume quota <VOLNAME> list-objects <PATH>
              Lists  the inode usage and inode limits configured on directory(s). If a path is given only the limit that has been configured on the directory(if any) is displayed along with the directory's
              inode usage. If no path is given, usage and limits are displayed for all directories that has limits configured.

        volume quota <VOLNAME> default-soft-limit <PERCENT>
              Set the percentage value for default soft limit for the volume.

        volume quota <VOLNAME> soft-timeout <TIME>
              Set the soft timeout for the volume. The interval in which limits are retested before the soft limit is breached.

        volume quota <VOLNAME> hard-timeout <TIME>
              Set the hard timeout for the volume. The interval in which limits are retested after the soft limit is breached.

        volume quota <VOLNAME> alert-time <TIME>
              Set the frequency in which warning messages need to be logged (in the brick logs) once soft limit is breached.

        volume inode-quota <VOLNAME> enable/disable
              Enable/disable inode-quota for <VOLNAME>

        volume quota help
              Display help for volume quota commands

       NOTE: valid units of time and their symbols are : hours(h/hr), minutes(m/min), seconds(s/sec), weeks(w/wk), Days(d/days).

   Geo-replication Commands
        Note: password-less ssh, from the master node (where these commands are executed) to the slave node <SLAVE_HOST>, is a prerequisite for the geo-replication commands.

        system:: execute gsec_create
              Generates pem keys which are required for push-pem

        volume geo-replication <MASTER_VOL> <SLAVE_HOST>::<SLAVE_VOL> create [push-pem] [force]
              Create a new geo-replication session from <MASTER_VOL> to <SLAVE_HOST> host machine having <SLAVE_VOL>.  Use push-pem to push the keys automatically.

        volume geo-replication <MASTER_VOL> <SLAVE_HOST>::<SLAVE_VOL> {start|stop} [force]
              Start/stop the geo-replication session from <MASTER_VOL> to <SLAVE_HOST> host machine having <SLAVE_VOL>.

        volume geo-replication [<MASTER_VOL> [<SLAVE_HOST>::<SLAVE_VOL>]] status [detail]
              Query status of the geo-replication session from <MASTER_VOL> to <SLAVE_HOST> host machine having <SLAVE_VOL>.

        volume geo-replication <MASTER_VOL> <SLAVE_HOST>::<SLAVE_VOL> {pause|resume} [force]
              Pause/resume the geo-replication session from <MASTER_VOL> to <SLAVE_HOST> host machine having <SLAVE_VOL>.

        volume geo-replication <MASTER_VOL> <SLAVE_HOST>::<SLAVE_VOL> delete [reset-sync-time]
              Delete the geo-replication session from <MASTER_VOL> to <SLAVE_HOST> host machine having <SLAVE_VOL>.  Optionally you can also reset the sync time in case you need to resync the entire volume
              on session recreate.

        volume geo-replication <MASTER_VOL> <SLAVE_HOST>::<SLAVE_VOL> config [[!]<options> [<value>]]
              View (when no option provided) or set configuration for this geo-replication session.  Use "!<OPTION>" to reset option <OPTION> to default value.

   Bitrot Commands
        volume bitrot <VOLNAME> {enable|disable}
              Enable/disable bitrot for volume <VOLNAME>

        volume bitrot <VOLNAME> scrub-throttle {lazy|normal|aggressive}
              Scrub-throttle value is a measure of how fast or slow the scrubber scrubs the filesystem for volume <VOLNAME>

        volume bitrot <VOLNAME> scrub-frequency {daily|weekly|biweekly|monthly}
              Scrub frequency for volume <VOLNAME>

        volume bitrot <VOLNAME> scrub {pause|resume|status|ondemand}
              Pause/Resume  scrub. Upon resume, scrubber continues where it left off. status option shows the statistics of scrubber. ondemand option starts the scrubbing immediately if the scrubber is not
              paused or already running.

        volume bitrot help
              Display help for volume bitrot commands


          Snapshot Commands

        snapshot create <snapname> <volname> [no-timestamp] [description <description>] [force]
              Creates a snapshot of a GlusterFS volume. User can provide a snap-name and a description to identify the snap. Snap will be created by appending timestamp in GMT. User can override  this  be‐
              haviour using "no-timestamp" option. The description cannot be more than 1024 characters. To be able to take a snapshot, volume should be present and it should be in started state.

        snapshot restore <snapname>
              Restores  an  already  taken snapshot of a GlusterFS volume. Snapshot restore is an offline activity therefore if the volume is online (in started state) then the restore operation will fail.
              Once the snapshot is restored it will not be available in the list of snapshots.

        snapshot clone <clonename> <snapname>
              Create a clone of a snapshot volume, the resulting volume will be GlusterFS volume. User can provide a clone-name. To be able to take a clone, snapshot should be present and it should  be  in
              activated state.

        snapshot delete ( all | <snapname> | volume <volname> )
              If snapname is specified then mentioned snapshot is deleted. If volname is specified then all snapshots belonging to that particular volume is deleted. If keyword *all* is used then all snap‐
              shots belonging to the system is deleted.

        snapshot list [volname]
              Lists all snapshots taken. If volname is provided, then only the snapshots belonging to that particular volume is listed.

        snapshot info [snapname | (volume <volname>)]
              This command gives information such as snapshot name, snapshot UUID, time at which snapshot was created, and it lists down the snap-volume-name, number of snapshots already taken  and  number
              of  snapshots still available for that particular volume, and the state of the snapshot. If snapname is specified then info of the  mentioned  snapshot is  displayed.  If volname is specified
              then info of all snapshots belonging to that volume is displayed.  If  both  snapname and  volname  is  not specified then info of all the snapshots present in the system are displayed.

        snapshot status [snapname | (volume <volname>)]
              This command gives status of the snapshot. The details included are snapshot brick path, volume group(LVM details), status of the snapshot bricks, PID of the bricks,  data  percentage  filled
              for that particular volume group to which the snapshots belong to, and total size of the logical volume.

              If  snapname  is specified then status of the mentioned snapshot is displayed. If volname is specified then status of all snapshots belonging to that volume is displayed. If both snapname and
              volname is not specified then status of all the snapshots present in the system are displayed.

        snapshot config [volname] ([snap-max-hard-limit <count>] [snap-max-soft-limit <percent>]) | ([auto-delete <enable|disable>]) | ([activate-on-create <enable|disable>])
              Displays and sets the snapshot config values.

              snapshot config without any keywords displays the snapshot config values of all volumes in the system. If volname is provided, then the snapshot config values of that volume is displayed.

              Snapshot config command along with keywords can be used to change the existing config values. If volname is provided then config value of that volume is changed, else it will  set/change  the
              system limit.

              snap-max-soft-limit and auto-delete are global options, that will be inherited by all volumes in the system and cannot be set to individual volumes.

              snap-max-hard-limit can be set globally, as well as per volume. The lowest limit between the global system limit and the volume specific limit, becomes the "Effective snap-max-hard-limit" for
              a volume.

              snap-max-soft-limit is a percentage value, which is applied on the "Effective snap-max-hard-limit" to get the "Effective snap-max-soft-limit".

              When auto-delete feature is enabled, then upon reaching the "Effective snap-max-soft-limit", with every successful snapshot creation, the oldest snapshot will be deleted.

              When auto-delete feature is disabled, then upon reaching the "Effective snap-max-soft-limit", the user gets a warning with every successful snapshot creation.

              When auto-delete feature is disabled, then upon reaching the "Effective snap-max-hard-limit", further  snapshot  creations  will not be allowed.

              activate-on-create is disabled by default. If you enable activate-on-create, then further snapshot will be activated during the time of snapshot creation.

        snapshot activate <snapname>
              Activates the mentioned snapshot.

              Note : By default the snapshot is activated during snapshot creation.

        snapshot deactivate <snapname>
              Deactivates the mentioned snapshot.

        snapshot help
              Display help for the snapshot commands.

   Self-heal Commands
        volume heal <VOLNAME>
              Triggers index self heal for the files that need healing.


        volume heal  <VOLNAME> [enable | disable]
              Enable/disable self-heal-daemon for volume <VOLNAME>.


        volume heal <VOLNAME> full
              Triggers self heal on all the files.


        volume heal <VOLNAME> info
              Lists the files that need healing.


        volume heal <VOLNAME> info split-brain
              Lists the files which are in split-brain state.


        volume heal <VOLNAME> statistics
              Lists the crawl statistics.


        volume heal <VOLNAME> statistics heal-count
              Displays the count of files to be healed.


        volume heal <VOLNAME> statistics heal-count replica <HOSTNAME:BRICKNAME>
              Displays the number of files to be healed from a particular replica subvolume to which the brick <HOSTNAME:BRICKNAME> belongs.


        volume heal <VOLNAME> split-brain bigger-file <FILE>
              Performs healing of <FILE> which is in split-brain by choosing the bigger file in the replica as source.


        volume heal <VOLNAME> split-brain source-brick <HOSTNAME:BRICKNAME>
              Selects <HOSTNAME:BRICKNAME> as the source for all the files that are in split-brain in that replica and heals them.


        volume heal <VOLNAME> split-brain source-brick <HOSTNAME:BRICKNAME> <FILE>
              Selects the split-brained <FILE> present in <HOSTNAME:BRICKNAME> as source and completes heal.

   Other Commands
        get-state [<daemon>] [[odir </path/to/output/dir/>] [file <filename>]] [detail|volumeoptions]
              Get local state representation of mentioned daemon and store data in provided path information

        help  Display the command options.

        quit  Exit the gluster command line interface.


FILES
       /var/lib/glusterd/*

SEE ALSO
       fusermount(1), mount.glusterfs(8), glusterfs(8), glusterd(8)

COPYRIGHT
       Copyright(c) 2006-2011  Gluster, Inc.  <http://www.gluster.com>



07 March 2011                                                                            Gluster command line utility                                                                              Gluster(8)
