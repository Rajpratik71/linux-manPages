SIMHASH(1)                                                    General Commands Manual                                                   SIMHASH(1)

NAME
       simhash - file similarity hash tool

SYNOPSIS
       simhash [ -s nshingles ] [ -f nfeatures ] [ file ]
       simhash [ -s nshingles ] [ -f nfeatures ] -w file ...
       simhash [ -s nshingles ] [ -f nfeatures ] -m file ...
       simhash -c hashfile hashfile

DESCRIPTION
       This  program  is  used to compute and compare similarity hashes of files.  A similarity hash is a chunk of data that has the property that
       some distance metric between files is proportional to some distance metric between the hashes.  Typically the similarity hash will be  much
       smaller than the file itself.

       The algorithm used by simhash is Manassas' "shingleprinting" algorithm (see BIBLIOGRAPHY below): take a hash of every m-byte subsequence of
       the file, and retain the n of these hashes that are numerically smallest.  The size of the intersection of the hash sets of two files gives
       a statistically good estimate of the similarity of the files as a whole.

       In  its  default mode, simhash will compute the similarity hash of its file argument (or stdin) and write this hash to its standard output.
       When invoked with the -w argument (see below), simhash will compute similarity hashes of all of its file arguments in "batch  mode".   When
       invoked  with the -m argument (see below), simhash will compare all the given files using similarity hashes in "match mode".  Finally, when
       invoked with the -c argument (see below), simhash will report the degree of similarity between two hashes.

OPTIONS
       -f feature-count
              When computing a similarity hash, retain at most feature-count significant hashes from the target file.  The  default  is  128  fea‐
              tures.   Larger  feature  counts  will give higher resolution in differences between files, will increase the size of the similarity
              hash proportionally to the feature count, and will increase similarity hash computation time slightly.

       -s shingle-size
              When computing a similarity hash, use hashes of samples consisting of shingle-size consecutive bytes drawn  from  the  target  file.
              The  default  is  8  bytes, the minimum is 4 bytes.  Larger shingle sizes will emphasize the differences between files more and will
              slow the similarity hash computation proportionally to the shingle size.

       -c hashfile1 hashfile2
              Display the distance (normalized to the range 0..1) between the similarity hash stored in hashfile1 and the similarity  hash  stored
              in hashfile2.

       -w file ...
              Write the similarity hash of each of the file arguments to file.sim.

       -m file ...
              Compute the similarity hash of each of the file arguments, and output a similarity matrix for those files.

AUTHOR
       Bart Massey <bart@cs.pdx.edu>

BUGS
       This currently uses CRC32 for the hashing.  A Rabin Fingerprint should be offered as a slightly slower but more reliable alternative.

       The  shingleprinting algorithm works for text files and fairly well for other sequential filetypes, but does not work well for image files.
       The latter both are 2D and often undergo odd transformations.

BIBLIOGRAPHY
       Mark  Manasse,  Microsoft  Research  Silicon  Valley.   Finding  similar  things  quickly  in  large  collections.   http://research.micro‐
       soft.com/research/sv/PageTurner/similarity.htm

       Andrei  Z.  Broder.   On  the  resemblance  and containment of documents.  In Compression and Complexity of Sequences (SEQUENCES'97), pages
       21-29. IEEE Computer Society, 1998.  ftp://ftp.digital.com/pub/DEC/SRC/publications/broder/positano-final-wpnums.pdf

       Andrei Z. Broder.  Some applications of Rabin's fingerprinting method.  Published in R. Capocelli, A. De Santis, U. Vaccaro eds., Sequences
       II: Methods in Communications, Security, and Computer Science, Springer-Verlag, 1993.  http://athos.rutgers.edu/~muthu/broder.ps

                                                                  3 January 2007                                                        SIMHASH(1)
