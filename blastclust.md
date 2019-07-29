BLASTCLUST(1)                                                NCBI Tools User's Manual                                                BLASTCLUST(1)

NAME
       blastclust - BLAST score-based single-linkage clustering

SYNOPSIS
       blastclust  [-] [-C] [-L X] [-S X] [-W N] [-a N] [-b F] [-c filename] [-d filename] [-e F] [-i filename] [-l filename] [-o filename] [-p F]
       [-r filename] [-s filename] [-v [filename]]

DESCRIPTION
       blastclust automatically and systematically clusters protein or DNA sequences based on pairwise matches found using the BLAST algorithm  in
       case of proteins or Mega BLAST algorithm for DNA. In the latter case a single Mega BLAST search is performed for all the sequences combined
       against a database created from the same sequences. blastclust finds pairs of sequences that have  statistically  significant  matches  and
       clusters them using single-linkage clustering.

OPTIONS
       A summary of options is included below.

       -      Print usage message

       -C     Complete unfinished clustering

       -L X   Length coverage threshold (default = 0.9)

       -S X   Score coverage threshold (bit score / length if < 3.0, percentage of identities otherwise; default = 1.75)

       -W N   Use words of size N (length of best perfect match; zero invokes default behavior: 3 for proteins, 32 for nucleotides)

       -a N   Number of CPU's to use (default = 1)

       -b F   Do not require coverage on both neighbours

       -c filename
              Read advanced options from configuration file filename

       -d filename
              Input as a database

       -e F   Disable id parsing in database formatting

       -i filename
              FASTA input file (program will format the database and remove files in the end; default = stdin)

       -l filename
              Restrict reclustering to id list in filename

       -o filename
              Output file for list of clusters (default = stdout)

       -p F   Input is nucleotides, not proteins.

       -r filename
              Restore neighbors for reclustering from filename

       -s filename
              Save all neighbours to filename

       -v [filename]
              Print verbose progress messages (to filename)

AUTHOR
       The National Center for Biotechnology Information.

SEE ALSO
       blast(1), formatdb(1), /usr/share/doc/blast2/blastclust.html, <http://www.ncbi.nlm.nih.gov/BLAST/>

NCBI                                                                2004-06-25                                                       BLASTCLUST(1)
