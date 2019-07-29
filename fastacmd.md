FASTACMD(1)                                                  NCBI Tools User's Manual                                                  FASTACMD(1)

NAME
       fastacmd - retrieve FASTA sequences from a BLAST database

SYNOPSIS
       fastacmd [-] [-D N] [-I] [-L start,stop] [-P N] [-S N] [-T] [-a] [-c] [-d str] [-i str] [-l N] [-o filename] [-p type] [-s str] [-t]

DESCRIPTION
       fastacmd retrieves FASTA formatted sequences from a blast(1) database formatted using the `-o' option.  An example fastacmd call would be

                                                                fastacmd -d nr -s p38398

OPTIONS
       A summary of options is included below.

       -      Print usage message

       -D N   Dump the entire database in some format:
              1      fasta
              2      GI list
              3      Accession.version list

       -I     Print database information only (overrides all other options)

       -L start,stop
              Range of sequence to extract (0 in start is beginning of sequence, 0 in stop is end of sequence, default is whole sequence)

       -P N   Retrieve sequences with Protein Identification Group (PIG) N.

       -S N   Strand on subsequence (nucleotide only):
              1      top (default)
              2      bottom

       -T     Print taxonomic information for requested sequence(s)

       -a     Retrieve duplicate accessions

       -c     Use ^A (\001) as non-redundant defline separator

       -d str Database (default is nr)

       -i str Input file with GIs/accessions/loci for batch retrieval

       -l N   Line length for sequence (default = 80)

       -o filename
              Output file (default = stdout)

       -p type
              Type of file:
              G      guess (default): look for protein, then nucleotide
              T      protein
              F      nucleotide

       -s str Comma-delimited search string(s).  GIs, accessions, loci, or fullSeq-id strings may be used, e.g., 555, AC147927, 'gnl|dbname|tag'

       -t     Definition line should contain target GI only

EXIT STATUS
              0      Completed successfully.
              1      An error (other than those below) occurred.
              2      The BLAST database was not found.
              3      A search (accession, GI, or taxonomy info) failed.
              4      No taxonomy database was found.

AUTHOR
       The National Center for Biotechnology Information.

SEE ALSO
       blast(1), /usr/share/doc/blast2/fastacmd.html.

NCBI                                                                2005-11-04                                                         FASTACMD(1)
