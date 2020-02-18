SNAP(1)                       User Commands                      SNAP(1)

NAME
       snap - Semi-HMM-based Nucleic Acid Parser

SYNOPSIS
       snap [options] <HMM file> <FASTA file> [options]

OPTIONS
       -help  report useful information

       -lcmask
              treat lowercase as N

       -plus  predict on plus strand only

       -minus predict on minus strand only

       -gff   output annotation as GFF

       -ace   output annotation as ACED

       -quiet do not send progress to STDERR

       -aa <file>
              create FASTA file of proteins

       -tx <file>
              create FASTA file of transcripts

       -xdef <file>
              external definitions

       -name <string>
              name for the gene [default snap]

snap 2010-07-28               October 2013                       SNAP(1)
