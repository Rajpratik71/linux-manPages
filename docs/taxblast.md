TAXBLAST(1)                                                  NCBI Tools User's Manual                                                  TAXBLAST(1)

NAME
       taxblast - taxonomy-enabled BLAST

SYNOPSIS
       taxblast [-] [-d str] -i filename [-o filename] [-p]

DESCRIPTION
       taxblast is a variant of BLAST that makes use of taxonomic information.

OPTIONS
       A summary of options is included below.

       -      Print usage message

       -d str Database used to get SeqAnnot ASN.1 (nr by default)

       -i filename
              Input ASN.1 File (SeqAnnot)

       -o filename
              Output file name (stdout by default)

       -p     Sequence is DNA

SEE ALSO
       BLAST(1).

AUTHOR
       The National Center for Biotechnology Information.

NCBI                                                                2008-12-13                                                         TAXBLAST(1)
