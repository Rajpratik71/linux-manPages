COMPS2SOLV(1)                                                                                      LIBSOLV                                                                                      COMPS2SOLV(1)



NAME
       comps2solv - convert rpm-md comps.xml file into a solv file

SYNOPSIS
       comps2solv [OPTIONS]

DESCRIPTION
       The comps.xml file is Fedora’s way to implement package groups. The comps2solv tool reads the comps xml file from stdin and writes the parsed data as solv file to standard output. The parser will
       create group: and category: pseudo packages for each comps entry.

SEE ALSO
       mergesolv(1), createrepo(8)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                    COMPS2SOLV(1)
