SUCRACK(1)                                                    General Commands Manual                                                   SUCRACK(1)

NAME
       sucrack - is a multithreaded Linux/UNIX tool for brute-force cracking of local user accounts via su.

SYNOPSIS
       sucrack [options] wordlist

DESCRIPTION
       sucrack is a multithreaded Linux/UNIX tool brute-force cracking tool that drives su(1) with referencing a specific user and uses words from
       a wordlist as passwords. Running sucrack does not require high privileges on the target system.

OPTIONS
       sucrack allows reading passwords from stdin. In that case, use '-' instead of a filename as wordlist parameter.

       Common options:

       -h     print help message

       -a     use ansi escape codes for nice looking statistics (requires --enable-statistics configuration flag)

       -s <seconds>
              statistics display intervall (requires --enable-statistics configuration flag)

       -c     only print statistics if a key other than `q' is pressed

       -r     enable rewriting of dictionary words (see rules below)

       -w <num>
              number of threads to run with.

       -b <size>
              size of the word list buffer

       -u <user>
              user account to su to

       -l <rules>
              specify certain rules for the rewriting process

       Rewriting rules:

       A      Rewrite word with only upper case characters

       F      Rewrite word with first character as upper case

       L      Rewrite word with last character as upper case

       a      Rewrite word with only lower case characters

       f      Rewrite word with first character as lower case

       l      Rewrite word with last character as lower case

       D      Prepend each digit (0-9) to the word

       d      Append each digit (0-9) to the word

       e      enleet the word

       x      apply all rules to a word

ENVIRONMENT VARIABLES
       SUCRACK_SU_PATH
              The path to su (usually /bin/su or /usr/bin/su)

       SUCRACK_AUTH_FAILURE
              The message su returns on an authentication failure (like "su: Authentication failure" or "su: Sorry")

       SUCRACK_AUTH_SUCCESS
              The message that indicates an authentication success. This message must not be  a  password  listed  in  the  wordlist  (default  is
              "SUCRACK_SUCCESS")

AUTHOR
       Nico Leidecker <nfl@portcullis-security.com>
              http://www.leidecker.info

SEE ALSO
       su(1)

                                                                   Version 1.2.3                                                        SUCRACK(1)
