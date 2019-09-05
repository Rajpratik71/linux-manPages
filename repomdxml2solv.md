REPOMDXML2SOLV(1)                                                                                  LIBSOLV                                                                                  REPOMDXML2SOLV(1)



NAME
       repomdxml2solv - convert a repomd.xml file into a solv file

SYNOPSIS
       repomdxml2solv [OPTIONS]

DESCRIPTION
       The repomd.xml file is the index file of a rpm-md repository, containing references to all data file with checksums. The repomdxml2solv tool reads the repomd.xml file from stdin and writes the
       parsed data as solv file to standard output. The data is stored as meta attributes in the result.

       -q WHAT
           Data query mode: instead of writing a solv file, select the WHAT element in the input data and write it to standard output. Examples for WHAT are type to get a list of all types, and
           primary:location to get the location of the element with type primary.

SEE ALSO
       rpmmd2solv(1), mergesolv(1), createrepo(8)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                REPOMDXML2SOLV(1)
