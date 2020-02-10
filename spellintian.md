SPELLINTIAN(1)                                                                     User Contributed Perl Documentation                                                                     SPELLINTIAN(1)

NAME
       spellintian - simple spellchecker based on Lintian's data files

SYNOPSIS
       spellintian [--picky] [text-file...]

DESCRIPTION
       The spellintian command parses one or more text files for spelling mistakes.  It uses the same spellcheck algorithm and data set as lintian.

       If no file is specified on the command line, this command expects its input on stdin.

OPTIONS
       --picky
           Also use the "picky" data set on top of the regular spelling data set.  The "picky" data set also includes a lot of capitalization related rules (like spelling "Debian" with an uppercase
           "D").

           Note however that these checks can have false positives.  As an example, consider the following those uses of Python "the python binary" (e.g. /usr/bin/python) and "the Python language".
           The --picky option will unconditionally flag the use of "python" in the first case as bad despite being correct.

       -h, --help
           Display usage information and exit.

       --version
           Print a version banner and exit.

SEE ALSO
       lintian(1)

AUTHORS
       Niels Thykier <niels@thykier.net> (wrote the manpage)

       Jakub Wilk <jwilk@jwilk.net> (wrote the program)

perl v5.22.1                                                                                    2017-06-05                                                                                 SPELLINTIAN(1)
