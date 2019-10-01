LOOK(1)                                                                                         User Commands                                                                                         LOOK(1)



NAME
       look - display lines beginning with a given string

SYNOPSIS
       look [options] string [file]

DESCRIPTION
       The  look  utility  displays any lines in file which contain string.  As look performs a binary search, the lines in file must be sorted (where sort(1) got the same options -d and/or -f that look is
       invoked with).

       If file is not specified, the file /usr/share/dict/words is used, only alphanumeric characters are compared and the case of alphabetic characters is ignored.

OPTIONS
       -a, --alternative
              Use the alternative dictionary file.

       -d, --alphanum
              Use normal dictionary character set and order, i.e. only alphanumeric characters are compared.  (This is on by default if no file is specified.)

       -f, --ignore-case
              Ignore the case of alphabetic characters.  (This is on by default if no file is specified.)

       -t, --terminate character
              Specify a string termination character, i.e. only the characters in string up to and including the first occurrence of character are compared.

       -h, --help
              Display help text and exit.

       -V, --version
              Output version information and exit.

       The look utility exits 0 if one or more lines were found and displayed, 1 if no lines were found, and >1 if an error occurred.

EXAMPLE
              sort -d /etc/passwd -o /tmp/look.dict
              look -t: root:foobar /tmp/look.dict

FILES
       /usr/share/dict/words
           the dictionary

       /usr/share/dict/web2
           the alternative dictionary

SEE ALSO
       grep(1), sort(1)

COMPATIBILITY
       The original manual page stated that tabs and blank characters participated in comparisons when the alphanum option was specified.  This was incorrect, and the current man page matches the  historic
       implementation.

HISTORY
       The look utility appeared in Version 7 AT&T Unix.

AVAILABILITY
       The look command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        June 2011                                                                                           LOOK(1)
