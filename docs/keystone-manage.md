KEYSTONE-MANAGE(1)                                                                                 keystone                                                                                KEYSTONE-MANAGE(1)



NAME
       keystone-manage - Keystone Management Utility

KEYSTONE MANAGEMENT UTILITY
       Author openstack@lists.openstack.org

       Date   2017-02-23

       Copyright
              OpenStack Foundation

       Version
              11.0.0

       Manual section
              1

       Manual group
              cloud computing

   SYNOPSIS
          keystone-manage [options]

   DESCRIPTION
       keystone-manage  is  the command line tool which interacts with the Keystone service to initialize and update data within Keystone. Generally, keystone-manage is only used for operations that cannot
       be accomplished with the HTTP API, such data import/export and database migrations.

   USAGE
          keystone-manage [options] action [additional args]

   General keystone-manage options:
       · --help : display verbose help output.

       Invoking keystone-manage by itself will give you some usage information.

       Available commands:

       · bootstrap: Perform the basic bootstrap process.

       · create_jws_keypair: Create an ECDSA key pair for JWS token signing.

       · credential_migrate: Encrypt credentials using a new primary key.

       · credential_rotate: Rotate Fernet keys for credential encryption.

       · credential_setup: Setup a Fernet key repository for credential encryption.

       · db_sync: Sync the database.

       · db_version: Print the current migration version of the database.

       · doctor: Diagnose common problems with keystone deployments.

       · domain_config_upload: Upload domain configuration file.

       · fernet_rotate: Rotate keys in the Fernet key repository.

       · fernet_setup: Setup a Fernet key repository for token encryption.

       · mapping_populate: Prepare domain-specific LDAP backend.

       · mapping_purge: Purge the identity mapping table.

       · mapping_engine: Test your federation mapping rules.

       · receipt_rotate: Rotate auth receipts encryption keys.

       · receipt_setup: Setup a key repository for auth receipts.

       · saml_idp_metadata: Generate identity provider metadata.

       · token_rotate: Rotate token keys in the key repository.

       · token_setup: Setup a token key repository for token encryption.

       · trust_flush: Purge expired trusts.

   OPTIONS
          -h, --help
                 show this help message and exit

          --config-dir DIR
                 Path to a config directory to pull *.conf files from.  This file set is sorted, so as to provide a predictable parse order if individual options are over-ridden. The set  is  parsed  after
                 the file(s) specified via previous --config-file, arguments hence over-ridden options in the directory take precedence.

          --config-file PATH
                 Path to a config file to use. Multiple config files can be specified, with values in later files taking precedence. Defaults to None.

          --debug, -d
                 If set to true, the logging level will be set to DEBUG instead of the default INFO level.

          --log-config-append PATH, --log_config PATH
                 The  name  of a logging configuration file. This file is appended to any existing logging configuration files.  For details about logging configuration files, see the Python logging module
                 documentation. Note that when logging configuration files are used then all logging configuration is set in the configuration file and other logging configuration options are ignored  (for
                 example, logging_context_format_string).

          --log-date-format DATE_FORMAT
                 Defines the format string for %(asctime)s in log records. Default: None . This option is ignored if log_config_append is set.

          --log-dir LOG_DIR, --logdir LOG_DIR
                 (Optional) The base directory used for relative log_file paths. This option is ignored if log_config_append is set.

          --log-file PATH, --logfile PATH
                 (Optional) Name of log file to send logging output to.  If no default is set, logging will go to stderr as defined by use_stderr. This option is ignored if log_config_append is set.

          --nodebug
                 The inverse of --debug

          --nostandard-threads
                 The inverse of --standard-threads

          --nouse-syslog
                 The inverse of --use-syslog

          --noverbose
                 The inverse of --verbose

          --nowatch-log-file
                 The inverse of --watch-log-file

          --pydev-debug-host PYDEV_DEBUG_HOST
                 Host to connect to for remote debugger.

          --pydev-debug-port PYDEV_DEBUG_PORT
                 Port to connect to for remote debugger.

          --standard-threads
                 Do not monkey-patch threading system modules.

          --syslog-log-facility SYSLOG_LOG_FACILITY
                 Syslog facility to receive log lines. This option is ignored if log_config_append is set.

          --use-syslog
                 Use syslog for logging. Existing syslog format is DEPRECATED and will be changed later to honor RFC5424.  This option is ignored if log_config_append is set.

          --verbose, -v
                 If set to false, the logging level will be set to WARNING instead of the default INFO level.

          --version
                 show program's version number and exit

          --watch-log-file
                 Uses  logging  handler  designed  to watch file system.  When log file is moved or removed this handler will open a new log file with specified path instantaneously. It makes sense only if
                 log_file option is specified and Linux platform is used. This option is ignored if log_config_append is set.

   FILES
       None

   SEE ALSO
       · OpenStack Keystone

   SOURCE
       · Keystone is sourced in Gerrit git Keystone

       · Keystone bugs are managed at Launchpad Keystone

AUTHOR
       OpenStack

COPYRIGHT
       2012, OpenStack Foundation




                                                                                                 Apr 10, 2019                                                                              KEYSTONE-MANAGE(1)
