COPYMAT(1)                                                   NCBI Tools User's Manual                                                   COPYMAT(1)

NAME
       copymat - convert ASCII matrices into a database suitable for quick reading

SYNOPSIS
       copymat [-] [-H] [-P filename] [-W N] [-f X] [-r F]

DESCRIPTION
       copymat converts ASCII matrices produced by makemat(1) into a database that can be read into memory quickly.

OPTIONS
       A summary of options is included below.

       -      Print usage message

       -H     Print help; overrides all other arguments

       -P filename
              Database for matrix profiles (default = stdin)

       -W N   Word size for RPS database (default = 3)

       -f X   Threshold for extending hits for RPS database (default = 11.0)

       -r F   Do not create RPS mem map file(s)

AUTHOR
       The National Center for Biotechnology Information.

SEE ALSO
       impala(1), makemat(1), /usr/share/doc/blast2/impala.html

NCBI                                                                2004-06-25                                                          COPYMAT(1)
