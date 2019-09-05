MERGESOLV(1)                                                                                       LIBSOLV                                                                                       MERGESOLV(1)



NAME
       mergesolv - merge multiple files in solv format into a single one

SYNOPSIS
       mergesolv [OPTIONS] FILE1.solv FILE2.solv ...

DESCRIPTION
       The mergesolv tool reads all solv files specified on the command line, and writes a merged version to standard output.

       -X
           Autoexpand SUSE pattern and product provides into packages.

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                     MERGESOLV(1)
