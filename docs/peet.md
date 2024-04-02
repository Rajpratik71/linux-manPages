peet(1)                                                            User Commands                                                           peet(1)

NAME
       peet - piped reverse tee: read from many file descriptors and copy to one

SYNOPSIS
       peet [-h] [-w outfd] infd1 [infd2 ...]

DESCRIPTION
       peet  reads from many file descriptors and copies everything to one file descriptor.  If no file descriptor is given ('-w' option), 1 (std‐
       out) is used.

       peet is text line based - i.e. only complete lines are written.  The order of lines written to the output file descriptor  is  pure  random
       when there is more then one file descriptor where a complete line can be read from.

       peet can be used with pipexec(1) to de-multiplex text based output.

OPTIONS
       -h     print help and version information

       -w outfd
              use the given outfd as output file descriptor.  If this option is not specified, 1 (stdout) is used.

EXAMPLES
       Read from stdin (fd 0), and file descriptors 9 and 11 and write to stdout.
           peet 0 9 11

       Using pipexec(1): start two commands, both write their log to stdout and use one instance of rotatelogs(1) to write the logs to disk into a
       common log file: (The file descriptors 8 and 11 are chosen by random.)
           pipexec [ CMD1 /usr/bin/cmd1 ] [ CMD2 /usr/bin/cmd2 ] \
             [ PEET /usr/bin/peet 8 11 ] \
             [ RLOGS /usr/bin/rotatelogs /var/log/%Y%m%d_cmd.log ] \
             "{CMD1:1>PEET:8}" "{CMD2:1>PEET:11}" \
             "{PEET:1>RLOGS:0}"

SEE ALSO
       pipexec(1), peet(1), rotatelogs(1), tee(1)

AUTHOR
       Written by Andreas Florath (andreas@florath.net)

COPYRIGHT
       Copyright © 2015 by Andreas Florath (andreas@florath.net).  License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>.

User Commands                                                       2015-03-14                                                             peet(1)
