DELTAINFOXML2SOLV(1)                                                                               LIBSOLV                                                                               DELTAINFOXML2SOLV(1)



NAME
       deltainfoxml2solv - convert rpm-md's deltainfo format into a solv file

SYNOPSIS
       deltainfoxml2solv [OPTIONS]

DESCRIPTION
       The deltainfoxml2solv tool reads rpm-md’s deltainfo.xml data from stdin, and writes it as solv file to standard output. Some distributions name the input prestodelta.xml instead. Each delta rpm
       element is converted and added as repository:deltainfo element to the meta section of the solv file.

SEE ALSO
       mergesolv(1), createrepo(8)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                             DELTAINFOXML2SOLV(1)
