INTERPFORMAT(1)                                               General Commands Manual                                              INTERPFORMAT(1)

NAME
       interpformat - tool for transforming mace4(1) models

SYNOPSIS
       interpformat [options] <transformation> -f input-file > output-file
       interpformat [options] <transformation> < input-file > output-file

DESCRIPTION
       The models (structures) in mace4(1) output files can be transformed in various ways with the program interpformat.

TRANSFORMATIONS
       The transformations are listed here.

       standard
              one line per operation

       standard2
              standard, with binary operations in a square (default)

       portable
              list of lists, suitable for parsing by Python, GAP, etc.

       tabular
              as nice tables

       raw    similar to standard, but without punctuation

       cooked as terms, e.g., f(0,1)=2

       tex    formatted for LaTeX

       xml    XML

OPTIONS
       A summary of options is included below.

       output <operations>
              Output only the listed operations.

       wrap   Enclose output in list(interpretations).

SEE ALSO
       mace4(1).
       Full  documentation  for  interpformat  is  found  in  the  prover9  manual,  available  on  Debian  systems  in the prover9-doc package at
       /usr/share/doc/prover9-doc/manual/index.html.

AUTHOR
       interpformat was written by William McCune <mccune@cs.unm.edu>

       This manual page was written by Peter Collingbourne <peter@pcc.me.uk>, for the Debian project (but may be used by others).

                                                                 January 20, 2007                                                  INTERPFORMAT(1)
