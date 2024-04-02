APPDATA2SOLV(1)                                                                                    LIBSOLV                                                                                    APPDATA2SOLV(1)



NAME
       appdata2solv - convert application meta data into a solv file

SYNOPSIS
       appdata2solv [OPTIONS]

DESCRIPTION
       The appdata format contains metadata about application. It can be available both in repositories (for available applications) and in the installed system (for installed applications). The
       appdata2solv tool reads the metadata from stdin and writes the parsed data as solv file to standard output. The parser will create application: pseudo packages for each entry.

       -d APPDATADIR
           Do not read from standard input, instead scan the specified directory for appdata entries.  APPDATADIR is normally set to /usr/share/appdata.

       -r ROOTDIR
           Use ROOTDIR as root directory.

SEE ALSO
       mergesolv(1)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                  APPDATA2SOLV(1)
