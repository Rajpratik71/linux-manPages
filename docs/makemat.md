MAKEMAT(1)                                                   NCBI Tools User's Manual                                                   MAKEMAT(1)

NAME
       makemat - convert binary profiles into portable ASCII form

SYNOPSIS
       makemat [-] [-E N] [-G N] [-H] [-P filename] [-S X] [-U str] [-d str] [-z N]

DESCRIPTION
       makemat converts a collection of binary profiles, created by the -C option of PSI-BLAST, into portable ASCII form.

OPTIONS
       A summary of options is included below.

       -      Print usage message

       -E N   Cost to extend a gap (default = 1)

       -G N   Cost to open a gap (default = 11)

       -H     Print help; overrides all other arguments

       -P filename
              Database name for profile database (default = stdin)

       -S X   Scaling factor for matrix outputs to avoid round-off problems (default = 100)

       -U str Underlying Matrix (default = BLOSUM62)

       -d str Underlying sequence database used to make profiles (default = nr)

       -z N   Effective length of the profile database (0 for length of -d option)

AUTHOR
       The National Center for Biotechnology Information.

SEE ALSO
       blast(1), copymat(1), /usr/share/doc/blast2/impala.html

NCBI                                                                2004-06-25                                                          MAKEMAT(1)
