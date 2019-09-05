ISOFILTER(1)                                                  General Commands Manual                                                 ISOFILTER(1)

NAME
       isofilter - removes isomorphic structures from mace4(1) models

SYNOPSIS
       isofilter [options] < input-file > output-file
       isofilter0 [options] < input-file > output-file
       isofilter2 [options] < input-file > output-file

DESCRIPTION
       This manual page documents briefly the isofilter, isofilter0 and isofilter2 commands.

       If mace4(1) produces more than one structure, some of them are very likely to be isomorphic to others. The program isofilter can be used to
       remove isomorphic structures.

ALGORITHM
       There are multiple isofilter variants providing alternative algorithms.

       isofilter
              Uses Occurrence Profiles algorithm.

       isofilter2
              Uses Canonical Forms algorithm.

OPTIONS
       A summary of options is included below.

       ignore_constants
              Ignore all constants during the isomorphism tests.

       check <operations>
              Consider only the listed operations in the isomorphism tests.

       output <operations>
              Output only the listed operations.

       wrap   Enclose the resulting structures in list(interpretations). ... end_of_list.

SEE ALSO
       mace4(1).
       Full documentation  for  isofilter  is  found  in  the  prover9  manual,  available  on  Debian  systems  in  the  prover9-doc  package  at
       /usr/share/doc/prover9-doc/manual/index.html.

AUTHOR
       isofilter was written by William McCune <mccune@cs.unm.edu>

       This manual page was written by Peter Collingbourne <peter@pcc.me.uk>, for the Debian project (but may be used by others).

                                                                 January 20, 2007                                                     ISOFILTER(1)
