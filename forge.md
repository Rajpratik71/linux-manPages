FORGE(1)                                     User Commands                                    FORGE(1)

NAME
       forge - training program for SNAP

SYNOPSIS
       forge [options] <ann> <dna> [options]

OPTIONS
       -help

       -verbose

       -pseudocount <float>
              [1]   (absolute number for all models)

       -pseudoCoding <float> [0.0] (eg. 0.05)

       -pseudoIntron <float> [0.0]

       -pseudoInter <float>
              [0.0]

       -min-counts
              [0]

       -lcmask [-fragmentN]

       -utr5-length <int>
              [50]

       -utr5-offset <int>
              [10]

       -utr3-length <int>
              [50]

       -utr3-offset <int>
              [10]

       -explicit <int>
              [250]

       -min-intron <int>
              [30]

       -boost <file>
              (file of ID <int>)

forge 2010-07-28                             October 2013                                     FORGE(1)
