verifytree(1)                                                                                                                                                                                   verifytree(1)



NAME
       verifytree - verify that a local yum repository is consistent

SYNOPSIS
       verifytree [options] directory

DESCRIPTION
       verifytree is a program that verifies whether a local yum repository is consistent.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       -a, --checkall
              Check all packages in the repository.

       -t TESTOPIA, --testopia=TESTOPIA
              Report results to the given testopia run number.

       -r, --treeinfo
              Check the checksums of listed files in a .treeinfo file, if available.


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                                  verifytree(1)
