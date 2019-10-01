ppdmerge(1)                                                                                       Apple Inc.                                                                                      ppdmerge(1)



NAME
       ppdmerge - merge ppd files

SYNOPSIS
       ppdmerge [ -o output-ppd-file ] ppd-file ppd-file2 [ ... ppd-fileN ]

DESCRIPTION
       ppdmerge merges two or more PPD files into a single, multi-language PPD file.

       The -o option specifies the PPD file to create. If not specified, the merged PPD file is written to the standard output. If the output file already exists, the new

NOTES
       ppdmerge does not check whether the merged PPD files are for the same device. Merging of different device PPDs will yield unpredictable results.

SEE ALSO
       cupsprofile(1), ppdc(1), ppdhtml(1), ppdi(1), ppdpo(1), ppdcfile(5)
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



20 May 2008                                                                                          CUPS                                                                                         ppdmerge(1)
