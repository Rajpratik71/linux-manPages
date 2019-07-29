dpkg-scansources(1)                                                 dpkg suite                                                 dpkg-scansources(1)

NAME
       dpkg-scansources - create Sources index files

SYNOPSIS
       dpkg-scansources [option...] binary-dir [override-file [path-prefix]] > Sources

DESCRIPTION
       dpkg-scansources scans the given binary-dir for .dsc files.  These are used to create a Debian source index, which is output to stdout.

       The  override-file,  if  given,  is used to set priorities in the resulting index records and to override the maintainer field given in the
       .dsc files.  The file can be compressed (since dpkg 1.15.5).  See deb-override(5) for the format of this file.  Note:  Since  the  override
       file  is  indexed  by binary, not source packages, there's a bit of a problem here. The current implementation uses the highest priority of
       all the binary packages produced by a .dsc file for the priority of the source package, and the override entry for the first binary package
       listed in the .dsc file to modify maintainer information. This might change.

       The  path-prefix, if given, is prepended to the directory field in the generated source index. You generally use this to make the directory
       fields contain the path from the top of the Debian archive hierarchy.

       Note: If you want to access the generated Sources file with apt(8) you will probably need to compress the file with gzip(1)  (generating  a
       Sources.gz file). apt ignores uncompressed Sources files except on local access (i.e.  file:// sources).

OPTIONS
       -n, --no-sort
           Don't sort the index records. Normally they are sorted by source package name.

       -e, --extra-override file
           Scan file to find supplementary overrides (since dpkg 1.15.4; the file can be compressed since dpkg 1.15.5).  See deb-extra-override(5)
           for more information on its format.

       -s, --source-override file
           Use file as the source override file (the file can be compressed since dpkg 1.15.5).  The default is the name of the override file  you
           specified with .src appended.

           The  source override file is in a different format from the binary override file. It contains only two whitespace separated fields, the
           first is the source package name and the second is the section. Blank lines and comment lines are ignored in the normal  manner.  If  a
           package appears in both files the source override takes precedence for setting the section.

       --debug
           Turn debugging on.

       --help
           Show the usage message and exit.

       --version
           Show the version and exit.

SEE ALSO
       deb-override(5), deb-extra-override(5), dpkg-scanpackages(1).

1.18.24                                                             2017-07-04                                                 dpkg-scansources(1)
