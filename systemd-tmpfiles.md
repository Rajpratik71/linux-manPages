SYSTEMD-TMPFILES(8)                                                                          systemd-tmpfiles                                                                         SYSTEMD-TMPFILES(8)

NAME
       systemd-tmpfiles, systemd-tmpfiles-setup.service, systemd-tmpfiles-setup-dev.service, systemd-tmpfiles-clean.service, systemd-tmpfiles-clean.timer - Creates, deletes and cleans up volatile and
       temporary files and directories

SYNOPSIS
       systemd-tmpfiles [OPTIONS...] [CONFIGFILE...]

       systemd-tmpfiles-setup.service

       systemd-tmpfiles-setup-dev.service

       systemd-tmpfiles-clean.service

       systemd-tmpfiles-clean.timer

DESCRIPTION
       systemd-tmpfiles creates, deletes, and cleans up volatile and temporary files and directories, based on the configuration file format and location specified in tmpfiles.d(5).

       If invoked with no arguments, it applies all directives from all configuration files. If one or more absolute filenames are passed on the command line, only the directives in these files are
       applied. If only the basename of a configuration file is specified, all configuration directories as specified in tmpfiles.d(5) are searched for a matching file.

OPTIONS
       The following options are understood:

       --create
           If this option is passed, all files and directories marked with f, F, w, d, D, v, p, L, c, b, m in the configuration files are created or written to. Files and directories marked with z, Z,
           t, T, a, and A have their ownership, access mode and security labels set.

       --clean
           If this option is passed, all files and directories with an age parameter configured will be cleaned up.

       --remove
           If this option is passed, the contents of directories marked with D or R, and files or directories themselves marked with r or R are removed.

       --boot
           Also execute lines with an exclamation mark.

       --prefix=path
           Only apply rules with paths that start with the specified prefix. This option can be specified multiple times.

       --exclude-prefix=path
           Ignore rules with paths that start with the specified prefix. This option can be specified multiple times.

       --root=root
           Takes a directory path as an argument. All paths will be prefixed with the given alternate root path, including config search paths.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       It is possible to combine --create, --clean, and --remove in one invocation. For example, during boot the following command line is executed to ensure that all temporary and volatile directories
       are removed and created according to the configuration file:

           systemd-tmpfiles --remove --create

UNPRIVILEGED --CLEANUP OPERATION
       systemd-tmpfiles tries to avoid changing the access and modification times on the directories it accesses, which requires CAP_ADMIN privileges. When running as non-root, directories which are
       checked for files to clean up will have their access time bumped, which might prevent their cleanup.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd(1), tmpfiles.d(5)

systemd 229                                                                                                                                                                           SYSTEMD-TMPFILES(8)
