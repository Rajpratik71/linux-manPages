HMM-ASSEMBLER.PL(1)           User Commands          HMM-ASSEMBLER.PL(1)

NAME
       hmm-assembler.pl - SNAP module hmm-assembler.pl

SYNOPSIS
       hmm-assembler.pl  [-OPTIONS  [-MORE_OPTIONS]]  [--] [PROGRAM_ARG1
       ...]

OPTIONS
   The following single-character options are accepted:
       With arguments: -i -e -A -D -M -S -C -I -N -a -3 -5 -Z -c

       Boolean (without arguments): -r -o -x -p -t -1

       Options may be merged together.  -- stops processing of  options.
       Space is not required between options and their arguments.

       Options:

       -i     <length>       [500]

       -e     <length>       [1000]

       -A     <order:length> [0:30]

       -D     <order:length> [0:9]

       -M     <order:length> [0:15]

       -S     <order:length> [0:9]

       -C     <order>        [4]

       -I     <order>        [4]

       -N     <order>        [4]

       -3     <order:length> []  include 3'UTR model, requires -a

       -a     <order:length> []  include PolyA model, requires -3

       -5     <order:length> []  include 5'UTR moel, requires -p

       -p     include generic promoter model, requires -5

       -r     include generic repeat model

       -o     include reverse ORF model

       -x     use explicit duration intron model

       -t     include C.elegans trans-splicing, requires -p, -5

       -Z     <clade>             sets clade-specific values (worm, fly,
              plant)

       -1     single gene model

       -c <score>
              include GC-AG splice donor model

hmm-assembler.pl 2010-07-28   November 2013          HMM-ASSEMBLER.PL(1)
