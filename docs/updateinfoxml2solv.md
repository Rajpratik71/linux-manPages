UPDATEINFOXML2SOLV(1)                                                                              LIBSOLV                                                                              UPDATEINFOXML2SOLV(1)



NAME
       updateinfoxml2solv - convert rpm-md's updateinfo.xml format into a solv file

SYNOPSIS
       updateinfoxml2solv [OPTIONS]

DESCRIPTION
       The updateinfoxml2solv tool reads rpm-md’s updateinfo xml data from stdin, and writes it as solv file to standard output. Update elements are converted into special patch: pseudo packages.

SEE ALSO
       mergesolv(1), createrepo(8)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                            UPDATEINFOXML2SOLV(1)
