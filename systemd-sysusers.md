SYSTEMD-SYSUSERS(8)                                                                        systemd-sysusers                                                                        SYSTEMD-SYSUSERS(8)

NAME
       systemd-sysusers, systemd-sysusers.service - Allocate system users and groups

SYNOPSIS
       systemd-sysusers [OPTIONS...] [CONFIGFILE...]

       systemd-sysusers.service

DESCRIPTION
       systemd-sysusers creates system users and groups, based on the file format and location specified in sysusers.d(5).

       If invoked with no arguments, it applies all directives from all files found. If one or more filenames are passed on the command line, only the directives in these files are applied. If only
       the basename of a file is specified, all directories as specified in sysusers.d(5) are searched for a matching file. If the string "-" is specified instead of a filename, entries from the
       standard input of the process are read.

OPTIONS
       The following options are understood:

       --root=root
           Takes a directory path as an argument. All paths will be prefixed with the given alternate root path, including config search paths.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd(1), sysusers.d(5)

systemd 237                                                                                                                                                                        SYSTEMD-SYSUSERS(8)
