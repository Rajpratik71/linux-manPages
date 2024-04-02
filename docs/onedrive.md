ONEDRIVE(1)                                                        User Commands                                                       ONEDRIVE(1)

NAME
       onedrive - folder synchronization with OneDrive

SYNOPSIS
       onedrive [OPTION] --synchronize
       onedrive [OPTION] --monitor
       onedrive [OPTION] --display-config
       onedrive [OPTION] --display-sync-status

DESCRIPTION
       A complete tool to interact with OneDrive on Linux.

OPTIONS
       Without any option given, no sync is done and the program exits.

       --auth-files ARG
              Perform authorization via two files passed in as ARG in the format authUrl:responseUrl.  The authorization URL is written to the au‐
              thUrl, then onedrive waits for the file responseUrl to be present, and reads the response from that file.

       --auth-response ARG
              Perform authentication not via interactive dialog but via providing the response url directly.

       --check-for-nomount
              Check for the presence of .nosync in the syncdir root. If found, do not perform sync.
              Configuration file key: check_nomount (default: false)

       --check-for-nosync
              Check for the presence of .nosync in each directory. If found, skip directory from sync.
              Configuration file key: check_nosync (default: false)

       --classify-as-big-delete
              Number of children in a path that is locally removed which will be classified as a 'big data delete'
              Configuration file key: classify_as_big_delete (default: 1000)

       --cleanup-local-files
              Cleanup additional local files when using --download-only. This will remove local data.
              Configuration file key: cleanup_local_files (default: false)

       --confdir ARG
              Set the directory used to store the configuration files

       --create-directory ARG
              Create a directory on OneDrive - no sync will be performed.

       --create-share-link ARG
              Create a shareable link for an existing file on OneDrive

       --debug-https
              Debug OneDrive HTTPS communication.
              Configuration file key: debug_https (default: false)

       --destination-directory ARG
              Destination directory for renamed or move on OneDrive - no sync will be performed.

       --disable-download-validation
              Disable download validation when downloading from OneDrive
              Configuration file key: disable_download_validation (default: false)

       --disable-notifications
              Do not use desktop notifications in monitor mode
              Configuration file key: disable_notifications (default: false)

       --disable-upload-validation
              Disable upload validation when uploading to OneDrive
              Configuration file key: disable_upload_validation (default: false)

       --display-config
              Display what options the client will use as currently configured - no sync will be performed.

       --display-running-config
              Display what options the client has been configured to use on application startup.

       --display-sync-status
              Display the sync status of the client - no sync will be performed.

       --download-only
              Replicate the OneDrive online state locally, by only downloading changes from OneDrive. Do not upload local changes to OneDrive.
              Configuration file key: download_only (default: false)

       --dry-run
              Perform a trial sync with no changes made. Can ONLY be used with --synchronize. Will be ignored for --monitor
              Configuration file key: dry_run (default: false)

       --enable-logging
              Enable client activity to a separate log file
              Configuration file key: enable_logging (default: false)

       --force
              Force the deletion of data when a 'big delete' is detected

       --force-http-11
              Force the use of HTTP 1.1 for all operations
              Configuration file key: force_http_11 (default: false)

       --force-sync
              Force a synchronization of a specific folder, only when using --synchronize --single-directory and ignore
              all non-default skip_dir and skip_file rules

       --get-O365-drive-id ARG
              Query and return the Office 365 Drive ID for a given Office 365 SharePoint Shared Library

       --get-file-link ARG
              Display the file link of a synced file

       --list-shared-folders
              List OneDrive Business Shared Folders

       --local-first
              Synchronize from the local directory source first, before downloading changes from OneDrive.
              Configuration file key: local_first (default: false)

       --logout
              Logout the current user

       --log-dir ARG
              defines the directory where logging output is saved to, needs to end with a slash
              Configuration file key: log_dir (default: /var/log/onedrive/)

       --min-notify-changes
              the minimum number of pending incoming changes necessary to trigger a desktop notification
              Configuration file key: min_notify_changes (default: 5)

       -m --modified-by ARG
              Display the last modified by details of a given path

       -m --monitor
              Keep monitoring for local and remote changes

       --monitor-interval ARG
              The number of seconds by which each sync operation is undertaken when idle under monitor mode
              Configuration file key: monitor_interval (default: 300)

       --monitor-fullscan-frequency ARG
              Number of sync runs before performing a full local scan of the synced directory
              Configuration file key: monitor_fullscan_frequency (default: 10)

       --monitor-log-frequency ARG
              Frequency of logging in monitor mode
              Configuration file key: monitor_log_frequency (default: 5)

       --no-remote-delete
              Do not delete local file 'deletes' from OneDrive when using --upload-only
              Configuration file key: no_remote_delete (default: false)

       --operation-timeout ARG
              Set the maximum amount of time (seconds) a file operation is allowed to take. This includes DNS resolution, connecting, data  trans‐
              fer, etc.
              Configuration file key: operation_timeout (default: 3600)

       --print-token
              Print the access token, useful for debugging

       --reauth
              Reauthenticate the client with OneDrive

       --remove-directory ARG
              Remove a directory on OneDrive - no sync will be performed.

       --remove-source-files
              Remove source file after successful transfer to OneDrive when using --upload-only
              Configuration file key: remove_source_files (default: false)

       --resync
              Forget the last saved state, perform a full sync

       --resync-auth
              Approve the use of performing a --resync action without needing CLI authorization

       --single-directory ARG
              Specify a single local directory within the OneDrive root to sync.

       --skip-dir ARG
              Skip any directories that match this pattern from syncing

       --skip-dir-strict-match
              When matching skip_dir directories, only match explicit matches
              Configuration file key: skip_dir_strict_match (default: false)

       --skip-dot-files
              Skip dot files and folders from syncing
              Configuration file key: skip_dotfiles (default: false)

       --skip-file
              Skip any files that match this pattern from syncing
              Configuration file key: skip_file (default: ~*|.~*|*.tmp)

       --skip-size ARG
              Skip new files larger than this size (in MB)

       --skip-symlinks
              Skip syncing of symlinks
              Configuration file key: skip_symlinks (default: false)

       --source-directory ARG
              Source directory to rename or move on OneDrive - no sync will be performed.

       --space-reservation ARG
              The amount of disk space to reserve (in MB) to avoid 100% disk space utilisation

       --sync-root-files
              Sync all files in sync_dir root when using sync_list.

       --sync-shared-folders
              Sync OneDrive Business Shared Folders
              Configuration file key: sync_business_shared_folders (default: false)

       --syncdir ARG
              Set the directory used to sync the files that are synced
              Configuration file key: sync_dir (default: ~/OneDrive)

       --synchronize
              Perform a synchronization

       --upload-only
              Replicate  the  locally  configured sync_dir state to OneDrive, by only uploading local changes to OneDrive. Do not download changes
              from OneDrive.
              Configuration file key: upload_only (default: false)

       --user-agent ARG
              Set the used User Agent identifier
              Configuration file key: user_agent (default: don't change)

       -v --verbose
              Print more details, useful for debugging. Given two times (or more) enables even more verbose debug statements.

       --version
              Print the version and exit

       --with-editing-perms
              Create a read-write shareable link for an existing file on OneDrive when used with --create-share-link <file>

       -h --help
              This help information.

FEATURES
       State caching

       Real-Time file monitoring with Inotify

       File upload / download validation to ensure data integrity

       Resumable uploads

       Support OneDrive for Business (part of Office 365)

       Shared Folder support for OneDrive Personal and OneDrive Business accounts

       SharePoint / Office365 Shared Libraries

       Desktop notifications via libnotify

       Dry-run capability to test configuration changes

       Prevent major OneDrive accidental data deletion after configuration change

       Support for National cloud deployments (Microsoft Cloud for US Government, Microsoft Cloud  Germany,  Azure  and  Office  365  operated  by
       21Vianet in China)

CONFIGURATION
       You should copy the default config file into your home directory before making changes:
       mkdir -p ~/.config/onedrive
       cp @DOCDIR@/config ~/.config/onedrive/config

       For the supported options see the above list of command line options for the availability of a configuration key.

       Pattern are case insensitive.  * and ? wildcards characters are supported.  Use | to separate multiple patterns.

       After changing the filters (skip_file or skip_dir in your configs) you must execute onedrive --synchronize --resync.

FIRST RUN
       After installing the application you must run it at least once from the terminal to authorize it.

       You  will be asked to open a specific link using your web browser where you will have to login into your Microsoft Account and give the ap‐
       plication the permission to access your files. After giving the permission, you will be redirected to a blank page. Copy  the  URI  of  the
       blank page into the application.

SYSTEMD INTEGRATION
       Service files are installed into user and system directories.

       OneDrive service running as root user
              To enable this mode, run as root user
              systemctl enable onedrive
              systemctl start onedrive

       OneDrive service running as root user for a non-root user
              This mode allows starting the OneDrive service automatically with system start for multiple users. For each <username> run:
              systemctl enable onedrive@<username>
              systemctl start onedrive@<username>

       OneDrive service running as non-root user
              In this mode the service will be started when the user logs in.  Run as user
              systemctl --user enable onedrive
              systemctl --user start onedrive

LOGGING OUTPUT
       When  running  onedrive  all actions can be logged to a separate log file.  This can be enabled by using the --enable-logging flag.  By de‐
       fault, log files will be written to /var/log/onedrive.

       All logfiles will be in the format of %username%.onedrive.log, where %username% represents the user who ran the client.

NOTIFICATIONS
       If OneDrive has been compiled with support for notifications, a running onedrive in monitor mode will send notifications about  initializa‐
       tion and errors via libnotify to the dbus.

       Note that this does not work if onedrive is started as root for a user via the onedrive@<username> service.

SEE ALSO
       Further examples and documentation is available in README.md docs/USAGE.md docs/advanced-usage.md docs/BusinessSharedFolders.md docs/Share‐
       Point-Shared-Libraries.md docs/national-cloud-deployments.md

v2.4.25                                                              June 2023                                                         ONEDRIVE(1)
