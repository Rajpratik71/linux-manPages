EXONPAIRS(1)                  User Commands                 EXONPAIRS(1)

NAME
       exonpairs - SNAP module exonpairs

SYNOPSIS
       exonpairs [options] <HMM file> <FASTA file> [options]

OPTIONS
       -min-intron <int>
              minimum Intron length [30]

       -max-intron <int>
              maximum Intron length [10000]

       -einit-length <int>
              minimum Einit length in bp [10]

       -eterm-length <int>
              minimum Eterm length in bp [10]

       -exon-length <int>
              minimum Exon length in bp [30]

       -intron-score <float> minimum Intron score in bits [-5]

       -einit-score <float>
              minimum Einit score in bits [-5]

       -eterm-score <float>
              minimum Eterm score in bits [-5]

       -exon-score <float>
              minimum Exon score in bits [-5]

       -pair-score <float>
              minimum pair score (exon-intron-exon) [10]

       -flank-length <int>
              length of flanking sequence per exon [20]

       -lcmask
              treat lowercase as N

exonpairs 2010-07-28          October 2013                  EXONPAIRS(1)
