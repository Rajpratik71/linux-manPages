SHA224SUM(1)                                                                                 User Commands                                                                                SHA224SUM(1)

NAME
       sha224sum - compute and check SHA224 message digest

SYNOPSIS
       sha224sum [OPTION]... [FILE]...

DESCRIPTION
       Print or check SHA224 (224-bit) checksums.

       With no FILE, or when FILE is -, read standard input.

       -b, --binary
              read in binary mode

       -c, --check
              read SHA224 sums from the FILEs and check them

       --tag  create a BSD-style checksum

       -t, --text
              read in text mode (default)

   The following five options are useful only when verifying checksums:
       --ignore-missing
              don't fail or report status for missing files

       --quiet
              don't print OK for each successfully verified file

       --status
              don't output anything, status code shows success

       --strict
              exit non-zero for improperly formatted checksum lines

       -w, --warn
              warn about improperly formatted checksum lines

       --help display this help and exit

       --version
              output version information and exit

       The  sums  are computed as described in RFC 3874.  When checking, the input should be a former output of this program.  The default mode is to print a line with checksum, a space, a character
       indicating input mode ('*' for binary, ' ' for text or where binary is insignificant), and name for each FILE.

AUTHOR
       Written by Ulrich Drepper, Scott Miller, and David Madore.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report sha224sum translation bugs to <http://translationproject.org/team/>

COPYRIGHT
       Copyright © 2017 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation at: <http://www.gnu.org/software/coreutils/sha224sum>
       or available locally via: info '(coreutils) sha2 utilities'

GNU coreutils 8.28                                                                           January 2018                                                                                 SHA224SUM(1)
