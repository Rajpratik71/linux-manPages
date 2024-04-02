PW-INSPECTOR(1)                                               General Commands Manual                                              PW-INSPECTOR(1)

NAME
       pw-inspector - A tool to reduce the password list

SYNOPSIS
       pw-inspector [-i FILE] [-o FILE] [-m MINLEN] [-M MAXLEN] [-c MINSETS] -l -u -n -p -s

DESCRIPTION
       PW-Inspector reads passwords in and prints those which meet the requirements.  The return code is the number of valid passwords found, 0 if
       none was found.  Use for security: check passwords, if 0 is returned, reject password choice.  Use for hacking: trim your  dictionary  file
       to the pw requirements of the target.  Usage only allowed for legal purposes.

OPTIONS
       -i FILE
              file to read passwords from (default: stdin)

       -o FILE
              file to write valid passwords to (default: stdout)

       -m MINLEN
              minimum length of a valid password

       -M MAXLEN
              maximum length of a valid password

       -c MINSETS
              the minimum number of sets required (default: all given)

       -h, --help
              Show summary of options.

SETS
       -l     lowcase characters (a,b,c,d, etc.)

       -u     upcase characters (A,B,C,D, etc.)

       -n     numbers (1,2,3,4, etc.)

       -p     printable characters (which are not -l/-n/-p, e.g. $,!,/,(,*, etc.)

        -s    special characters - all others not withint the sets above

SEE ALSO
       hydra(1), xhydra(1).

AUTHOR
       hydra was written by van Hauser / THC <vh@thc.org> and co-maintained by David Maciejak <david.maciejak@gmail.com>.

       This manual page was written by Daniel Echeverry <epsilon77@gmail.com>, for the Debian project (and may be used by others).

                                                                    24/05/2012                                                     PW-INSPECTOR(1)
