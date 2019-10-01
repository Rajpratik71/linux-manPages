SHA224SUM(1)                                                                                    User Commands                                                                                    SHA224SUM(1)



NAME
       sha224sum - compute and check SHA224 message digest

SYNOPSIS
       sha224sum [OPTION]... [FILE]...

DESCRIPTION
       Print or check SHA224 (224-bit) checksums.  With no FILE, or when FILE is -, read standard input.

       -b, --binary
              read in binary mode

       -c, --check
              read SHA224 sums from the FILEs and check them

       --tag  create a BSD-style checksum

       -t, --text
              read in text mode (default)

              Note: There is no difference between binary and text mode option on GNU system.

   The following four options are useful only when verifying checksums:
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

       The  sums are computed as described in RFC 3874.  When checking, the input should be a former output of this program.  The default mode is to print a line with checksum, a character indicating input
       mode ('*' for binary, space for text), and name for each FILE.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report sha224sum translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Ulrich Drepper, Scott Miller, and David Madore.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for sha224sum is maintained as a Texinfo manual.  If the info and sha224sum programs are properly installed at your site, the command

              info coreutils 'sha224sum invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                     SHA224SUM(1)
