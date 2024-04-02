MYSQLAUDITADMIN                                                   MySQL Utilities                                                  MYSQLAUDITADMIN

NAME
       mysqlauditadmin - Maintain the audit log

SYNOPSIS
       mysqlauditadmin [OPTIONS]...  mysqlauditadmin [OPTIONS]... [COMMAND] mysqlauditadmin l=user:pass@host:port [OPTIONS]...
       [COMMAND[--value=VALUE]] mysqlauditadmin --file-stats --audit-log-name=FULL_PATH mysqlauditadmin copy --audit-log-name=FULL_PATH
       --copy-to=DESTINATION [--remote-login=user:host]

DESCRIPTION
       This utility allow you to maintain the audit log[1], allowing you to monitor the audit log file growth and control its rotation. Rotation
       refers to the action of replacing the current audit log file by a new one for continuous use, renaming (with a timestamp extension) and
       copying the previously used audit log file to a defined location.

       This utility allows you to view and modify a subset of audit log control variables, display the audit log file status, perform on-demand
       rotation of the log file, and copy files to other locations. These features enable you to easily monitor the audit log file growth and
       control its rotation (automatically based on the defined file size threshold, or manually by a on-demand command).

       The available actions include the following:

        1. copy

           This command copies the audit log specified by --audit-log-name to the destination path specified by --copy-to. The --remote-login
           option can be used to copy log files from a remote location. Note: the destination path must be locally accessible by the current user.

        2. policy

           The policy command is used to change the audit logging policy. The accepted values are the following, which are set using the --value
           option.

               Note
               The --server option is also required to execute this command.

           ·   ALL: log all events

           ·   NONE: log nothing

           ·   LOGINS: only log login events

           ·   QUERIES: only log query events

           ·   DEFAULT: sets the default log policy

        3. rotate_on_size

           This command sets the file size threshold for automatic rotation of the audit log (the audit_log_rotate_on_size variable). The value is
           set using the --value option, and must be in the range (0, 4294967295). This command also requires the --server option to be specified.
           Note: if the variable is set with a value that is not a multiple of 4096, then it is truncated to the nearest multiple.

        4. rotate

           This command is used to perform an on-demand audit log rotation, and only requires the --server option to be passed. Note: this command
           has no effect if the audit log file size is smaller than 4096, which is the minimum value allowed that is greater than 0 for the
           audit_log_rotate_on_size variable variable).
             OPTIONS

       mysqlauditadmin accepts the following command-line options:

       ·   --audit-log-name=<AUDIT_LOG_FILE>

           Full path and file name for the audit log file. Used by the --file-stats option, and the copy command.

       ·   --copy-to=<COPY_DESTINATION>

           The location to copy the specified audit log file. The path must be locally accessible for the current user.

       ·   --file-stats

           Display the audit log file statistics.

       ·   --help

           Display a help message and exit.

       ·   --remote-login=<REMOTE_LOGIN>

           User name and host to be used for the remote login, for copying log files. It is defined using the following format: <user>:<host or
           IP>. Usage will prompt for the password.

       ·   --server=<SERVER>

           Connection information for the server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or <login-path>[:<port>][:<socket>].

       ·   --show-options

           Display the audit log system variables.

       ·   --value=<VALUE>

           Value used to set variables based on the specified commands, such as policy and rotate_on_size.

       ·   --server1=<source>

           Connection information for the first server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>].

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       This utility is available as of μ 1.2.0.

       This utility can only be applied to servers with the audit log plugin enabled[2]. And the audit log plugin is available as of MySQL Server
       versions 5.5.28 and 5.6.10.

       This utility requires Python version 2.6 or higher, but does not support Python 3.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools, which is required to read the login-path values from the login
       configuration file (.mylogin.cnf). This feature exists as of MySQL Server 5.6.6, see mysql_config_editor — MySQL Configuration Utility[3].
             LIMITATIONS

       The --remote-login option is not supported on Microsoft Windows platforms. For Microsoft Windows, use UNC paths and perform a local copy
       operation, omitting the
        --remote-login option.
             EXAMPLES

       To display the audit log system variables, run the following command:

           $ mysqlauditadmin --show-options --server=root@localhost:3310
             #
             # Audit Log Variables and Options
             #
             +---------------------------+---------------+
             | Variable_name             | Value         |
             +---------------------------+---------------+
             | audit_log_buffer_size     | 1048576       |
             | audit_log_file            | audit.log     |
             | audit_log_flush           | OFF           |
             | audit_log_policy          | ALL           |
             | audit_log_rotate_on_size  | 0             |
             | audit_log_strategy        | ASYNCHRONOUS  |
             +---------------------------+---------------+

       To perform a (manual) rotation of the audit log file, use the following command:

           shell> mysqlauditadmin --server=root@localhost:3310 rotate
           #
           # Executing ROTATE command.
           #

       To display the audit log file statistics, run the following command:

           shell> mysqlauditadmin --file-stats --audit-log-name=../SERVER/data/audit.log
             +------------------------------+--------+---------------------------+---------------------------+
             | File                         | Size   | Created                   | Last Modified             |
             +------------------------------+--------+---------------------------+---------------------------+
             | audit.log                    | 3258   | Wed Sep 26 11:07:43 2012  | Wed Sep 26 11:07:43 2012  |
             | audit.log.13486539046497235  | 47317  | Wed Sep 26 11:05:04 2012  | Wed Sep 26 11:05:04 2012  |
             +------------------------------+--------+---------------------------+---------------------------+

       To change the audit log policy to log only query events, and show the system variables before and after the execution of the policy
       command, use the following command:

           shell> mysqlauditadmin --show-options --server=root@localhost:3310 policy \
               --value=QUERIES
             #
             # Showing options before command.
             #
             # Audit Log Variables and Options
             #
             +---------------------------+---------------+
             | Variable_name             | Value         |
             +---------------------------+---------------+
             | audit_log_buffer_size     | 1048576       |
             | audit_log_file            | audit.log     |
             | audit_log_flush           | OFF           |
             | audit_log_policy          | ALL           |
             | audit_log_rotate_on_size  | 0             |
             | audit_log_strategy        | ASYNCHRONOUS  |
             +---------------------------+---------------+
             #
             # Executing POLICY command.
             #
             #
             # Showing options after command.
             #
             # Audit Log Variables and Options
             #
             +---------------------------+---------------+
             | Variable_name             | Value         |
             +---------------------------+---------------+
             | audit_log_buffer_size     | 1048576       |
             | audit_log_file            | audit.log     |
             | audit_log_flush           | OFF           |
             | audit_log_policy          | QUERIES       |
             | audit_log_rotate_on_size  | 0             |
             | audit_log_strategy        | ASYNCHRONOUS  |
             +---------------------------+---------------+

       To change the audit log automatic file rotation size to 32535, and show the system variables before and after the execution of the
       rotate_on_size command, use the following command. (Notice that the value set is actually 28672 because the specified rotate_on_size value
       is truncated to a multiple of 4096):

           shell> mysqlauditadmin --show-options --server=root@localhost:3310 rotate_on_size \
                --value=32535
             #
             # Showing options before command.
             #
             # Audit Log Variables and Options
             #
             +---------------------------+---------------+
             | Variable_name             | Value         |
             +---------------------------+---------------+
             | audit_log_buffer_size     | 1048576       |
             | audit_log_file            | audit.log     |
             | audit_log_flush           | OFF           |
             | audit_log_policy          | ALL           |
             | audit_log_rotate_on_size  | 0             |
             | audit_log_strategy        | ASYNCHRONOUS  |
             +---------------------------+---------------+
             #
             # Executing ROTATE_ON_SIZE command.
             #
             #
             # Showing options after command.
             #
             # Audit Log Variables and Options
             #
             +---------------------------+---------------+
             | Variable_name             | Value         |
             +---------------------------+---------------+
             | audit_log_buffer_size     | 1048576       |
             | audit_log_file            | audit.log     |
             | audit_log_flush           | OFF           |
             | audit_log_policy          | ALL           |
             | audit_log_rotate_on_size  | 28672         |
             | audit_log_strategy        | ASYNCHRONOUS  |
             +---------------------------+---------------+

       To perform a copy of a audit log file to another location, use the following command:

           shell> mysqlauditadmin --audit-log-name=../SERVER/data/audit.log.13486539046497235 \
                copy --copy-to=/BACKUP/Audit_Logs

       To copy a audit log file from a remote server/location to the current location (user password will be prompted), use the following command:

           shell> mysqlauditadmin --audit-log-name=audit.log.13486539046497235 \
                copy --remote-login=user:host --copy-to=.

COPYRIGHT
NOTES
        1. audit log
           http://dev.mysql.com/doc/refman/5.6/en/audit-log-plugin.html

        2. audit log plugin enabled
           http://dev.mysql.com/doc/refman/5.6/en/audit-log-plugin-installation.html

        3. mysql_config_editor — MySQL Configuration Utility
           http://dev.mysql.com/doc/refman/5.6/en/mysql-config-editor.html

SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                     MYSQLAUDITADMIN
