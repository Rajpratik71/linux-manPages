FORMATDB(1)                                                  NCBI Tools User's Manual                                                  FORMATDB(1)

NAME
       formatdb - format protein or nucleotide databases for BLAST

SYNOPSIS
       formatdb  [-]  [-B filename] [-F filename] [-L filename] [-T filename] [-V] [-a] [-b] [-e] [-i filename] [-l filename] [-n str] [-o] [-p F]
       [-s] [-t str] [-v N]

DESCRIPTION
       formatdb must be used in order to format protein or nucleotide source databases  before  these  databases  can  be  searched  by  blastall,
       blastpgp  or  MegaBLAST. The source database may be in either FASTA or ASN.1 format.  Although the FASTA format is most often used as input
       to formatdb, the use of ASN.1 is advantageous for those who are using ASN.1 as the common source for other  formats  such  as  the  GenBank
       report.  Once  a  source database file has been formatted by formatdb it is not needed by BLAST. Please note that if you are going to apply
       periodic updates to your BLAST databases using fmerge(1), you will need to keep the source database file.

OPTIONS
       A summary of options is included below.

       -      Print usage message

       -B filename
              Binary Gifile produced from the Gifile specified by -F.  This option specifies the name of a  binary  GI  list  file.   This  option
              should  be  used with the -F option.  A text GI list may be specified with the -F option and the -B option will produce that GI list
              in binary format.  The binary file is smaller and BLAST does not need to convert it, so it can be read faster.

       -F filename
              Gifile (file containing list of gi's) for use with -B or -L

       -L filename
              Create an alias file named filename, limiting the sequences searched to those specified by -F.

       -T filename
              Set the taxonomy IDs in ASN.1 deflines according to the table in filename.

       -V     Verbose: check for non-unique string ids in the database

       -a     Input file is database in ASN.1 format (otherwise FASTA is expected)

       -b     ASN.1 database is binary (as opposed to ASCII text)

       -e     Input is a Seq-entry.  A source ASN.1 database (either text ascii or binary) may contain a Bioseq-set or just  one  Bioseq.  In  the
              latter case -e should be provided.

       -i filename
              Input file(s) for formatting

       -l filename
              Log file name (default = formatdb.log)

       -n str Base name for BLAST files (defaults to the name of the original FASTA file)

       -o     Parse  SeqID  and  create indexes.  If the source database is in FASTA format, the database identifiers in the FASTA definition line
              must follow the conventions of the FASTA Defline Format.

       -p F   Input is a nucleotide, not a protein.

       -s     Index only by accession, not by locus.  This is especially useful for sequence sets like the EST's where  the  accession  and  locus
              names  are identical.  Formatdb runs faster and produces smaller temporary files if this option is used.  It is strongly recommended
              for EST's, STS's, GSS's, and HTGS's.

       -t str Title for database file [String]

       -v N   Break up large FASTA files into `volumes' of size N million letters (4000 by default).  As part of the creation of  a  volume,  for‐
              matdb writes a new type of BLAST database file, called an alias file, with the extension `nal' or `pal'.

AUTHOR
       The National Center for Biotechnology Information.

SEE ALSO
       blast(1), copymat(1), formatrpsdb(1), makemat(1), /usr/share/doc/blast2/formatdb.html.

NCBI                                                                2007-10-19                                                         FORMATDB(1)
