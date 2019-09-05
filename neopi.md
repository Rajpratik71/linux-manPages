NEOPI(1)                                                      General Commands Manual                                                     NEOPI(1)

NAME
       neopi - web shell code detection

SYNOPSIS
       neopi [options] <dir> [regex]

DESCRIPTION
       This manual page documents briefly the neopi command.

       neopi is a Python script that uses a variety of statistical methods to detect obfuscated and encrypted content within text/script files.

       The intended purpose of NeoPI is to aid in the detection of hidden web shell code.

       The development focus of NeoPI was creating a tool that could be used in conjunction with other established detection methods such as Linux
       Malware Detect or traditional signature/keyword based searches.

       NeoPI recursively scans through the file system from a base directory and will rank files based on the results of a number of tests.

       It also presents a “general” score derived from file rankings within the individual tests.

OPTIONST
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is  included
       below.

       -v, --version
              Show version of program.

       -h, --help
              Show summary of options.

       -C FILECSV, --csv=FILECSV
              Generates a CSV output to FILECSV containing the results of the scan.

       -a, --all
              Run all tests including entropy, longest word, and index of coincidence.  This is the recommended way of running neopi.

       -e, --entropy
              Run only the entropy test.

       -l, --longestword
              Run only the longestword test.

       -c, --ic
              Run only the Index Coincidence test.

       -A, --auto
              This flag runs an auto generated regular expression that contains many common web application file extensions.

              This  list  is  by  no means comprehensive but does include a good ‘best effort’ scan if you are unsure of what web application lan‐
              guages your server is running.

              Current list of included extensions: php, asp, aspx, sh, bash, zsh, csh, tsch, pl, py, txt, cgi, cfm

EXAMPLES
       neopi -C scan1.csv -a -A /var/www/

       neopi -a /tmp/phpbb "php|txt"

       neopi -a -A /var/www/html/

ABOUT
       neopi authors are Ben Hagen <ben.hagen@neohapsis.com> and Scott Behrens <scott.behrens@neohapsis.com>.

       This man page was written by Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com> for the Debian GNU/Linux distribution (but it  may  be
       used by others).

                                                                   May  27, 2014                                                          NEOPI(1)
