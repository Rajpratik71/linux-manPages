unace(1)                                                           unace manual                                                           unace(1)

NAME
       unace - extract, test and view ACE archives

SYNOPSIS
       unace <command> [-<sw1> ...]  <archive> [<base_dir>\] [<files>/@<filelist>]

DESCRIPTION
       The unace utility is used for extracting, testing and viewing the contents of archives created with the ACE archiver.

COMMANDS
       e      Extract files

       l      List archive

       t      Test archive integrity

       v      List archive (verbose)

       x      Extract files with full path

SWITCHES
       c[-]   Show comments (default +)

       f[-]   Full path matching (default -)

       o[-]   Overwrite files (default -)

       p<pass>
              Set password

       y[-]   Assume yes on all queries (default -)

       x<files/@list>
              Exclude <files> or files in <list> from process

SEE ALSO
       gzip(1), bzip2(1), zip(1), arj(1), ppmd(1).

AUTHORS
       This  manual  page was written by Guillem Jover <guillem@debian.org> and revised by Fabian Greffrath <fabian@debian-unofficial.org> for the
       Debian project (but may be used by others).

2.50                                                                2005-12-05                                                            unace(1)
