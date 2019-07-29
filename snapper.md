SNAPPER(8)                                                                              Filesystem Snapshot Management                                                                             SNAPPER(8)



NAME
       snapper - Command-line program for filesystem snapshot management

SYNOPSIS
       snapper [--global-opts] command [--command-opts] [command-arguments]

       snapper {--help}

DESCRIPTION
       Snapper is a command-line program for filesystem snapshot management. It can create, delete and compare snapshots and undo changes done between snapshots.

       Snapper never modifies the content of snapshots. Thus snapper creates read-only snapshots if supported by the kernel. Supported filesystems are btrfs and ext4 as well as snapshots of LVM logical
       volumes with thin-provisioning. Some filesystems might not be supported depending on your installation.

CONCEPTS
   Configurations
       For each filesystem or subvolume that should be snapshotted by snapper, a configuration file is required, see snapper-configs(5). The setup can be done with the create-config command.

   Snapshots
       Snapper distinguishes three types of snapshots.

       pre
           Pre snapshots should always have a corresponding post snapshot. The intention of pre/post snapshot pairs is to snapshot the filesystem before and after a modification.

       post
           See pre type.

       single
           These snapshots have no special relationship to other snapshots.

       Note that filesystem-wise all three types are the same.

   Snapshot Description and Userdata
       With each snapshot a description and some userdata can be associated. The description is a string. The userdata is a list of key-value pairs where the keys and values are strings.

   Automatic Snapshot Creation
       Next to manual snapshot creation, snapshots are also created automatically.

       ·   A cron-job creates hourly snapshots.

       ·   Certain programs like YaST and zypper create pre/post snapshot pairs when modifying the system.

   Cleanup Algorithms
       Snapper provides several algorithms to clean up old snapshots. The algorithms are executed in a daily cron-job. This can be configured in the corresponding configurations files along with parameters
       for every algorithm.

       number
           Deletes old snapshots when a certain number of snapshots is reached.

       timeline
           Deletes old snapshots but keeps a number of hourly, daily, weekly, monthly and yearly snapshots.

       empty-pre-post
           Deletes pre/post snapshot pairs with empty diffs.

       The number and timeline cleanup algorithm can also try to keep the space used by snapshots below a limit. For that quota must be setup, see command setup-quota, and the LIMIT variables in the config
       file must have ranges (min- and max-value). The algorithms will then make two passes:

        1. Delete snapshots above the max-value independent of the used space.

        2. Delete snapshots above the min-value until the limit for the used space is reached.

       The limit for the used space can be configured via the SPACE_LIMIT variable. Note: Only snapshots that have a cleanup algorithm set are taken into account when calculating the used space.

   Filters
       Some files keep state information of the system, e.g.  /etc/mtab. Such files should never be reverted. To help users, snapper allows one to ignore these files.

       Each line in all files /etc/snapper/filters/*.txt specifies a pattern. When snapper computes the difference between two snapshots it ignores all files and directories matching any of those patterns
       by using fnmatch(3) with the flag FNM_LEADING_DIR.

       Note that filters do not exclude files or directories from being snapshotted. For that, use subvolumes or mount points.

GLOBAL OPTIONS
       -q, --quiet
           Suppress normal output. Error messages will still be printed, though.

       -v, --verbose
           Increase verbosity.

       --utc
           Display dates and times in UTC.

       --iso
           Display dates and times in ISO format.

       -t, --table-style
           Specifies table style. Table style is identified by an integer number.

       -c, --config name
           Use specified configuration instead of the default configuration. The default configuration is named "root".

       --no-dbus
           Operate without a DBus connection.

           Use with caution since a running snapperd will not know about modifications made to the system.

       -r, --root path
           Operate on target root. Only works together with no-dbus and only for some commands.

       --version
           Print version and exit.

COMMANDS
       Snapper provides a number of commands. Each command accepts the options listed in the GLOBAL OPTIONS section. These options must be specified before the command name. In addition, many commands have
       specific options, which are listed in this section. These command-specific options must be specified after the name of the command and before any of the command arguments.

       help
           Show short help text.

       list-configs
           List available configurations.

       create-config [options] subvolume
           Create a new configuration for a filesystem or subvolume. For this command you will likely need the global option --config, see GLOBAL OPTIONS and CONCEPTS.

           -f, --fstype fstype
               Manually set filesystem type. Supported values are btrfs, ext4 and lvm. For lvm, snapper uses LVM thin-provisioned snapshots. The filesystem type on top of LVM must be provided in
               parentheses, e.g. lvm(xfs).

               Without this option snapper tries to detect the filesystem.

           -t, --template name
               Name of template for the new configuration file.

       delete-config
           Delete a configuration for a filesystem or subvolume. For this command you will likely need to global option --config, see GLOBAL OPTIONS and CONCEPTS.

       get-config
           Displays the settings of the configuration.

       set-config configdata
           Changes the settings of the configuration. The settings configdata are a list of key-value-pairs separated by spaces and the key and value must be separated by an equal sign, e.g.
           "NUMBER_CLEANUP=yes NUMBER_LIMIT=10". The value of SUBVOLUME and FSTYPE cannot be changed.

       list (ls) [options]
           List snapshots.

           -t, --type type
               Selects type of snapshots to list. Possible values are all, single and pre-post.

           -a, --all-configs
               List snapshots from all configs accessible by the user.

       create [options]
           Create a new snapshot.

           -t, --type type
               Specifies the type of the new snapshot. Possible values are single, pre and post.

           --pre-number number
               For post snapshots the number of the pre snapshot must be provided.

           -p, --print-number
               Print number of the created snapshot.

           -d, --description description
               Description for the snapshot.

           -c, --cleanup-algorithm cleanup-algorithm
               Set the cleanup algorithm for the snapshot.

           -u, --userdata userdata
               Set userdata for the snapshot. The key-value pairs must be separated by comma and the key and value must be separated by an equal sign, e.g. requestid=42,user=arthur.

           --command command
               Create a pre and post snapshot and run command in between.

       modify [options] number
           Modify a snapshot.

           -d, --description description
               New description for snapshot.

           -c, --cleanup-algorithm cleanup-algorithm
               Set the cleanup algorithm for the snapshot.

           -u, --userdata userdata
               Set userdata for the snapshot. The key-value pairs must be separated by comma and the key and value must be separated by an equal sign, e.g. requestid=42,user=arthur.

       delete (remove|rm) number | number1-number2
           Delete a snapshot or a range of snapshots.

           -s, --sync
               Sync the filesystem after deleting the snapshots. The details depend on the filesystem type.

               Btrfs normally asynchronously frees space after deleting snapshots. With this option snapper will wait until the space once used by the deleted snapshots is actually available again.

       mount number
           Mount a snapshot. Not required for all filesystem types.

       umount number
           Unmount a snapshot. Not required for all filesystem types.

       status [options] number1..number2
           Compare the snapshots number1 and number2. This will show a list of files and directories that have been created, modified or deleted in the time between the two snapshots have been made.

           -o, --output file
               Write output to file file.

           The output consists of a string encoding the status followed by the filename. The characters of the status string are:

            1. A "+" means the file was created, a "-" means the file was deleted. A "c" means the content of the file has changed and a "t" means the type of the file has changed (e.g. from regular file
               to directory).

            2. A "p" means the permissions are have changed.

            3. An "u" means the user ownership has changed.

            4. A "g" means the group ownership has changed.

            5. A "x" means the extended attribute information has changed.

            6. An "a" means the ACL information has changed.

           If there is no change a "." is outputted.

       diff [options] number1..number2 [files]
           Compare the snapshots number1 and number2. This will show a diff of the content of files and directories that have been created, modified or deleted in the time between the two snapshots have
           been made.

           -i, --input file
               Read files to diff from file file.

           --diff-cmd command
               Command used for comparing files. The default is /usr/bin/diff --new-file --unified. The two files to compare are passed as parameters to the command.

           -x, --extensions options
               Extra options passed to the diff command.

       undochange [options] number1..number2 [files]
           Undo changes done between snapshot number1 and number2.

           -i, --input file
               Read files for which to undo changes from file file.

       rollback [options] [number]
           Creates two new snapshots and sets the default subvolume. Per default the system boots from the default subvolume of the root filesystem. The exact actions depend on whether a number is provided
           or not:

           ·   Without a number, a first read-only snapshot of the default subvolume is created. A second read-write snapshot of the current system is created. The system is set to boot from the second
               snapshot.

           ·   With a number, a first read-only snapshot of the current system is created. A second read-write snapshot is created of number. The system is set to boot from the second snapshot.

           Rollback is only supported with btrfs and requires a properly configured system.

           -p, --print-number
               Print number of the second created snapshot.

           -d, --description description
               Description for the snapshot.

           -c, --cleanup-algorithm cleanup-algorithm
               Set the cleanup algorithm for the snapshot.

           -u, --userdata userdata
               Set userdata for the snapshot. The key-value pairs must be separated by comma and the key and value must be separated by an equal sign, e.g. requestid=42,user=arthur.

           The rollback command also sets the description, the cleanup algorithm and some userdata unless the values are specified on the command line. This will automate cleanup of snapshots created by
           rollbacks.

       setup-quota
           Sets up quota. Currently only supported with btrfs.

       cleanup cleanup-algorithm
           Run the cleanup algorithm cleanup-algorithm. Currently implemented cleanup algorithms are number, timeline and empty-pre-post.

       xadiff number1..number2 [files]
           Compare the extended attributes between snapshot number1 and number2. See examples below:

           ·   +:user.foo for created attributes

           ·   -:user.bar for removed attributes

           ·   -+:security.selinux for modified attributes

PERMISSIONS
       Non-root users can be allowed to use a configuration by setting ALLOW_USERS or ALLOW_GROUPS in the config file. For all operations to work, the user must also be able to read and access the
       .snapshots directory inside the subvolume. The .snapshots directory must be owned by root and must not be writable by anybody else.

       Here are some methods how to achieve that:

       ·   Make the directory accessible for everyone:

           chmod a+rx .snapshots

       ·   Make the directory accessible for a group the user belongs to, e.g.:

           chown :users .snapshots

       ·   Make the directory accessible for the user using ACLs, e.g.:

           setfacl -m u:tux:rx .snapshots

       The last method can be performed by snapper, see the SYNC_ACL setting in snapper-configs(5).

FILES
       /etc/sysconfig/snapper
           Global configuration file.

       /etc/snapper/configs
           Directory containing configuration files.

       /etc/snapper/config-templates
           Directory containing configuration templates.

       /etc/snapper/filters/*.txt
           Filter files.

       /var/log/snapper.log
           Logfile. Please include this file in bug reports.

NOTES
       There is no mechanism to ensure consistency of the files while a snapshot it made. E.g. the files of a database can be inconsistent while the database is running.

       Consistency after undochange is not guaranteed. E.g. when the creation of a user is undone, there might still exist files from that user.

       Support for individual filesystems, rollback and extended attributes are compile-time options and may not be available.

HOMEPAGE
       http://snapper.io/

AUTHORS
       Arvin Schnell <aschnell@suse.com>

SEE ALSO
       snapper-configs(5), snapper-zypp-plugin(8), pam_snapper(8), btrfs(8), lvm(8), attr(5), acl(5)



0.5.0                                                                                             2014-04-07                                                                                       SNAPPER(8)
