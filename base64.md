BASE64(1)                                                                                       User Commands                                                                                       BASE64(1)



NAME
       base64 - base64 encode/decode data and print to standard output

SYNOPSIS
       base64 [OPTION]... [FILE]

DESCRIPTION
       Base64 encode or decode FILE, or standard input, to standard output.

       Mandatory arguments to long options are mandatory for short options too.

       -d, --decode
              decode data

       -i, --ignore-garbage
              when decoding, ignore non-alphabet characters

       -w, --wrap=COLS
              wrap encoded lines after COLS character (default 76).  Use 0 to disable line wrapping

       --help display this help and exit

       --version
              output version information and exit

       With no FILE, or when FILE is -, read standard input.

       The data are encoded as described for the base64 alphabet in RFC 3548.  When decoding, the input may contain newlines in addition to the bytes of the formal base64 alphabet.  Use --ignore-garbage to
       attempt to recover from any other non-alphabet bytes in the encoded stream.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report base64 translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Simon Josefsson.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for base64 is maintained as a Texinfo manual.  If the info and base64 programs are properly installed at your site, the command

              info coreutils 'base64 invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                        BASE64(1)
