DDRESCUELOG(1)                                                     User Commands                                                    DDRESCUELOG(1)

NAME
       ddrescuelog - tool for ddrescue mapfiles

SYNOPSIS
       ddrescuelog [options] mapfile

DESCRIPTION
       GNU  ddrescuelog  -  Tool for ddrescue mapfiles.  Manipulates ddrescue mapfiles, shows their contents, converts them to/from other formats,
       compares them, and tests rescue status.

       NOTE: In versions of ddrescue prior to 1.20 the mapfile was called 'logfile'. The format is the same; only the name has changed.

OPTIONS
       -h, --help
              display this help and exit

       -V, --version
              output version information and exit

       -a, --change-types=<ot>,<nt>
              change the block types of mapfile

       -A, --annotate-mapfile
              add comments with human-readable pos/sizes

       -b, --block-size=<bytes>
              block size in bytes [default 512]

       -B, --binary-prefixes
              show binary multipliers in numbers [SI]

       -c, --create-mapfile[=<tt>]
              create mapfile from list of blocks [+-]

       -C, --complete-mapfile[=<t>]
              complete mapfile adding blocks of type t [?]

       -d, --delete-if-done
              delete the mapfile if rescue is finished

       -D, --done-status
              return 0 if rescue is finished

       -f, --force
              overwrite existing output files

       -i, --input-position=<bytes>
              starting position of rescue domain [0]

       -l, --list-blocks=<types>
              print block numbers of given types (?*/-+)

       -L, --loose-domain
              accept an incomplete domain mapfile

       -m, --domain-mapfile=<file>
              restrict domain to finished blocks in file

       -n, --invert-mapfile
              invert block types (finished <--> others)

       -o, --output-position=<bytes>
              starting position in output file [ipos]

       -p, --compare-mapfile=<file>
              compare block types in domain of both files

       -P, --compare-as-domain=<file>
              like -p but compare finished blocks only

       -q, --quiet
              suppress all messages

       -s, --size=<bytes>
              maximum size of rescue domain to be processed

       -t, --show-status
              show a summary of mapfile contents

       -v, --verbose
              be verbose (a 2nd -v gives more)

       -x, --xor-mapfile=<file>
              XOR the finished blocks in file with mapfile

       -y, --and-mapfile=<file>
              AND the finished blocks in file with mapfile

       -z, --or-mapfile=<file>
              OR the finished blocks in file with mapfile

       Use '-' to read a mapfile from standard input or to write the mapfile created by '--create-mapfile' to standard output.  Numbers may be  in
       decimal, hexadecimal or octal, and may be followed by a multiplier: s = sectors, k = 1000, Ki = 1024, M = 10^6, Mi = 2^20, etc...

       Exit status: 0 for a normal exit, 1 for environmental problems (file not found, invalid flags, I/O errors, etc), 2 to indicate a corrupt or
       invalid input file, 3 for an internal consistency error (eg, bug) which caused ddrescuelog to panic.

REPORTING BUGS
       Report bugs to bug-ddrescue@gnu.org
       Ddrescue home page: http://www.gnu.org/software/ddrescue/ddrescue.html
       General help using GNU software: http://www.gnu.org/gethelp

COPYRIGHT
       Copyright © 2017 Antonio Diaz Diaz.  License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

ddrescuelog 1.22                                                   February 2017                                                    DDRESCUELOG(1)
