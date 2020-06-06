DELVE(1)                                    User Commands                                    DELVE(1)

NAME
       delve - Inspect the contents of a Xapian database

SYNOPSIS
       delve [OPTIONS] DATABASE...

DESCRIPTION
       delve - Inspect the contents of a Xapian database

OPTIONS
       -a     show all terms in the database

       -A <prefix>
              show all terms in the database with given prefix

       -r <recno>
              for term list(s)

       -t <term>
              for posting list(s)

       -t <term> -r <recno>
              for position list(s)

       -s, --stemmer=LANG
              set the stemming language, the default is 'none'

       -1     output one list entry per line

       -V     output values for each document referred to

       -V<valueno>
              output value valueno for each document referred to (or each document in the database if
              no -r options)

       -d     output document data for each document referred to

       -z     for db, count documents with length 0

       -v     extra info (wdf and len for postlist; wdf and termfreq for termlist;  number  of  terms
              for db; termfreq when showing all terms)

       -vv    even more info (also show collection freq and wdf upper bound for terms)

       --help display this help and exit

       --version
              output version information and exit

xapian-core 1.4.5                            October 2017                                    DELVE(1)
