HALBERD(1)                                                         User Commands                                                        HALBERD(1)

NAME
       halberd - Discover web servers behind HTTP load balancers.

DESCRIPTION
       Usage: halberd [OPTION]... URL

       Discover web servers behind HTTP load balancers.

   Options:
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -v, --verbose
              explain what is being done

       -q, --quiet
              run quietly

       -d, --debug
              enable debugging information

       -t NUM, --time=NUM
              time (in seconds) to spend scanning the target

       -p NUM, --parallelism=NUM
              specify the number of parallel threads to use

       -u FILE, --urlfile=FILE
              read URLs from FILE

       -o FILE, --out=FILE
              write report to the specified file

       -a ADDR, --address=ADDR
              specify address to scan

       -r FILE, --read=FILE
              load clues from the specified file

       -w DIR, --write=DIR
              save clues to the specified directory

       --config=FILE
              use alternative configuration file

BUGS
       Report bugs to <jmbr@superadditive.com>

COPYRIGHT
       Copyright © 2004, 2005, 2006, 2010  Juan M. Bello Rivas <jmbr@superadditive.com>

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

halberd 0.2.4 (14-Aug-2010)                                         August 2010                                                         HALBERD(1)
