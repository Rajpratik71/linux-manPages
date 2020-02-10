KBXUTIL(1)                                                                                    User Commands                                                                                    KBXUTIL(1)

NAME
       kbxutil - List, export, import Keybox data

DESCRIPTION
       kbxutil  (GnuPG)  2.1.11  Copyright  ©  2016  Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html> This is free software: you are free to
       change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

       Syntax: kbxutil [options] [files] List, export, import Keybox data

       Commands:

       --stats
              show key statistics

       --import-openpgp
              import OpenPGP keyblocks

       --find-dups
              find duplicates

       --cut  export records

OPTIONS
       --from N
              first record to export

       --to N last record to export

       -v, --verbose
              verbose

       -q, --quiet
              be somewhat more quiet

       -n, --dry-run
              do not make any changes

       --debug
              set debugging flags

       --debug-all
              enable full debugging

       Please report bugs to <http://bugs.gnupg.org>.

COPYRIGHT
       Copyright © 2016 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

kbxutil (GnuPG) 2.1.11                                                                          June 2018                                                                                      KBXUTIL(1)
