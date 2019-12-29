SYSTEMD-TMPFILES(8)                        systemd-tmpfiles                        SYSTEMD-TMPFILES(8)

NAME
       systemd-tmpfiles, systemd-tmpfiles-setup.service, systemd-tmpfiles-setup-dev.service, systemd-
       tmpfiles-clean.service, systemd-tmpfiles-clean.timer - Creates, deletes and cleans up volatile
       and temporary files and directories

SYNOPSIS
       systemd-tmpfiles [OPTIONS...] [CONFIGFILE...]

       System units:

       systemd-tmpfiles-setup.service
       systemd-tmpfiles-setup-dev.service
       systemd-tmpfiles-clean.service
       systemd-tmpfiles-clean.timer

       User units:

       systemd-tmpfiles-setup.service
       systemd-tmpfiles-clean.service
       systemd-tmpfiles-clean.timer

DESCRIPTION
       systemd-tmpfiles creates, deletes, and cleans up volatile and temporary files and directories,
       based on the configuration file format and location specified in tmpfiles.d(5).

       If invoked with no arguments, it applies all directives from all configuration files. When
       invoked with --replace=PATH, arguments specified on the command line are used instead of the
       configuration file PATH. Otherwise, if one or more absolute filenames are passed on the command
       line, only the directives in these files are applied. If "-" is specified instead of a
       filename, directives are read from standard input. If only the basename of a configuration file
       is specified, all configuration directories as specified in tmpfiles.d(5) are searched for a
       matching file and the file found that has the highest priority is executed.

OPTIONS
       The following options are understood:

       --create
           If this option is passed, all files and directories marked with f, F, w, d, D, v, p, L, c,
           b, m in the configuration files are created or written to. Files and directories marked
           with z, Z, t, T, a, and A have their ownership, access mode and security labels set.

       --clean
           If this option is passed, all files and directories with an age parameter configured will
           be cleaned up.

       --remove
           If this option is passed, the contents of directories marked with D or R, and files or
           directories themselves marked with r or R are removed.

       --user
           Execute "user" configuration, i.e.  tmpfiles.d files in user configuration directories.

       --boot
           Also execute lines with an exclamation mark.

       --prefix=path
           Only apply rules with paths that start with the specified prefix. This option can be
           specified multiple times.

       --exclude-prefix=path
           Ignore rules with paths that start with the specified prefix. This option can be specified
           multiple times.

       --root=root
           Takes a directory path as an argument. All paths will be prefixed with the given alternate
           root path, including config search paths.

           Note that this option does not alter how the users and groups specified in the
           configuration files are resolved. With or without this option, users and groups are always
           resolved according to the host's user and group databases, any such databases stored under
           the specified root directories are not consulted.

       --replace=PATH
           When this option is given, one ore more positional arguments must be specified. All
           configuration files found in the directories listed in tmpfiles.d(5) will be read, and the
           configuration given on the command line will be handled instead of and with the same
           priority as the configuration file PATH.

           This option is intended to be used when package installation scripts are running and files
           belonging to that package are not yet available on disk, so their contents must be given on
           the command line, but the admin configuration might already exist and should be given
           higher priority.

       --cat-config
           Copy the contents of config files to standard output. Before each file, the filename is
           printed as a comment.

       --no-pager
           Do not pipe output into a pager.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       It is possible to combine --create, --clean, and --remove in one invocation (in which case
       removal and clean-up are executed before creation of new files). For example, during boot the
       following command line is executed to ensure that all temporary and volatile directories are
       removed and created according to the configuration file:

           systemd-tmpfiles --remove --create

UNPRIVILEGED --CLEANUP OPERATION
       systemd-tmpfiles tries to avoid changing the access and modification times on the directories
       it accesses, which requires CAP_FOWNER privileges. When running as non-root, directories which
       are checked for files to clean up will have their access time bumped, which might prevent their
       cleanup.

EXIT STATUS
       On success, 0 is returned. If the configuration was syntactically invalid (syntax errors,
       missing arguments, ...), so some lines had to be ignored, but no other errors occurred, 65 is
       returned (EX_DATAERR from /usr/include/sysexits.h). If the configuration was syntactically
       valid, but could not be executed (lack of permissions, creation of files in missing
       directories, invalid contents when writing to /sys/ values, ...), 73 is returned (EX_CANTCREAT
       from /usr/include/sysexits.h). Otherwise, 1 is returned (EXIT_FAILURE from
       /usr/include/stdlib.h).

SEE ALSO
       systemd(1), tmpfiles.d(5)

systemd 242                                                                        SYSTEMD-TMPFILES(8)
