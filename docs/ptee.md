ptee(1)                                                            User Commands                                                           ptee(1)

NAME
       ptee - piped tee: read from one file descriptor and copy to many

SYNOPSIS
       ptee [-h] [-r infd] outfd1 [outfd2 ...]

DESCRIPTION
       ptee  reads  from  one  file descriptor (0 / stdin by default) and copies everything to all given output file descriptors.  ptee is a piped
       version of tee(1).

       ptee can be used with pipexec(1) to fit the output of one command into many other commands.

OPTIONS
       -h     print help and version information

       -r infd
              use the given infd as input file descriptor.  If this is not specified, 0 (stdin) is used.

EXAMPLES
       Duplicate all data from stdin to stdout, stderr and fd 7:
           ptee 1 2 7

       The command
           tee output.txt
       is equivalent to the shell command
           ptee 5 5>output.txt

       Using pipexec(1): count all files in the file system and additionally count only those that have a uppercase 'A' in their name.   The  file
       system will be scanned only once.  No temporary files are generated.
           pipexec [ LS /bin/ls -R / ] [ PTEE /usr/bin/ptee 3 4 ] \
             [ WC1 /usr/bin/wc -l ] [ GREP /bin/grep A ] \
             [ WC2 /usr/bin/wc -l ] "{LS:1>PTEE:0}" "{PTEE:3>WC1:0}" \
             "{PTEE:4>GREP:0}" "{GREP:1>WC2:0}"

SEE ALSO
       pipexec(1), peet(1), tee(1)

AUTHOR
       Written by Andreas Florath (andreas@florath.net)

COPYRIGHT
       Copyright © 2015 by Andreas Florath (andreas@florath.net).  License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>.

User Commands                                                       2015-03-14                                                             ptee(1)
