ZYPP-CHECKACCESSDEL(1)                                                                             LIBZYPP                                                                             ZYPP-CHECKACCESSDEL(1)



NAME
       zypp-CheckAccessDeleted - List processes which access deleted files

SYNOPSIS
       zypp-CheckAccessDeleted [OPTION]...

DESCRIPTION
       List running processes which access deleted files. This may help to identify services and processes which need to be restarted after an update, e.g. if they still refer to meanwhile deleted
       libraries. The output is similar to ‘zypper ps’ but does not sort out processes accessing normal files only.

OPTIONS
       --help
           display help and exit

AUTHORS
       Michael Andres <ma@suse.de>

SEE ALSO
       zypper(8)



SUSE Linux                                                                                        06/12/2015                                                                           ZYPP-CHECKACCESSDEL(1)
