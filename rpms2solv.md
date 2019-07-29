RPMS2SOLV(1)                                                                                       LIBSOLV                                                                                       RPMS2SOLV(1)



NAME
       rpms2solv - convert one or more rpms into a solv file

SYNOPSIS
       rpms2solv [OPTIONS] RPM1.rpm ...

DESCRIPTION
       The rpms2solv tool converts the header data from one or more rpms into the solv file written to standard output.

       -m MANIFESTFILE
           Read the rpm file names from the specified MANIFESTFILE. You can use - to read the manifest from standard input.

       -0
           Use a null byte as line terminator for manifest files instead of a newline. This is useful if the file names can contain newlines. See also the -print0 option in find.

       -F
           Do not put all files from the headers into the file list, but instead use the filtering also found in createrepo.

       -k
           Read pubkeys instead of rpms.

       -K
           Read pubkey keyrings instead of rpms.

       -X
           Autoexpand SUSE pattern and product provides into packages.

SEE ALSO
       rpmdb2solv(1)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                     RPMS2SOLV(1)
