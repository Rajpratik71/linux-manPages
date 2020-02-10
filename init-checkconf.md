init-checkconf(8)                                                                        System Manager's Manual                                                                        init-checkconf(8)

NAME
       init-checkconf - manual page for init-checkconf

SYNOPSIS
       init-checkconf [OPTIONS] file

       init-checkconf [OPTIONS] -f file

DESCRIPTION
       Determine if specified Upstart init(8) job configuration file is valid.

       By default, two checks are performed:

       ·   Ensure Upstart can parse overall file successfully

       ·   Ensure all script sections are parseable by shell

OPTIONS
       -d , --debug
              Show some debug output.

       -f file , --file=file
              Specify job configuration file to check.

       -i path , --initctl-path=path
              Specify path to initctl(8) binary.

       -s , --noscript
              Do not check script sections.

       -x path , --upstart-path=path
              Specify path to init(8) binary.

       -h , --help
              Display usage statement.

AUTHOR
       Written by James Hunt <james.hunt@ubuntu.com>

LIMITATIONS
       ·   exec stanzas containing shell meta-characters will not be checked as scripts.

REPORTING BUGS
       Report bugs at <https://launchpad.net/upstart/+bugs>

COPYRIGHT
       Copyright © 2011-2013 Canonical Ltd.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sh(1) init(5) init(8)

Upstart                                                                                         2013-11-19                                                                              init-checkconf(8)
