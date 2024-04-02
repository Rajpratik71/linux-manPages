RPMMD2SOLV(1)                                                                                      LIBSOLV                                                                                      RPMMD2SOLV(1)



NAME
       rpmmd2solv - convert files in rpm-md format into a solv file

SYNOPSIS
       rpmmd2solv [OPTIONS]

DESCRIPTION
       The rpmmd2solv tool reads rpm-md xml data from stdin, and writes it as solv file to standard output. It understands the primary, filelist, other, and susedata format.

       -X
           Autoexpand SUSE pattern and product provides into packages.

SEE ALSO
       repomdxml2solv(1), mergesolv(1), createrepo(8)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                    RPMMD2SOLV(1)
