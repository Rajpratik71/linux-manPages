dpkg-genchanges(1)                                                  dpkg suite                                                  dpkg-genchanges(1)

NAME
       dpkg-genchanges - generate Debian .changes files

SYNOPSIS
       dpkg-genchanges [option...]

DESCRIPTION
       dpkg-genchanges  reads information from an unpacked and built Debian source tree and from the files it has generated and generates a Debian
       upload control file (.changes file).

OPTIONS
       --build=type
              Specifies the build type from a comma-separated list of components (since dpkg 1.18.5).

              The allowed values are:

              source Upload the source package.

              any    Upload the architecture specific binary packages.

              all    Upload the architecture independent binary packages.

              binary Upload the architecture specific and independent binary packages.  This is an alias for any,all.

              full   Upload everything.  This is alias for source,any,all, and the same as the default case when no build option is specified.

       -g     Equivalent to --build=source,all (since dpkg 1.17.11).

       -G     Equivalent to --build=source,any (since dpkg 1.17.11).

       -b     Equivalent to --build=binary or --build=any,all.

       -B     Equivalent to --build=any.

       -A     Equivalent to --build=all.

       -S     Equivalent to --build=source.

       The -sx options control whether the original source archive is included in the upload if any source is being  generated  (i.e.   -b  or  -B
       haven't been used).

       -si    By default, or if specified, the original source will be included only if the upstream version number (the version without epoch and
              without Debian revision) differs from the upstream version number of the previous changelog entry.

       -sa    Forces the inclusion of the original source.

       -sd    Forces the exclusion of the original source and includes only the diff.

       -vversion
              Causes changelog information from all versions strictly later than version to be used.

       -Cchanges-description
              Read the description of the changes from the file changes-description rather than using  the  information  from  the  source  tree's
              changelog file.

       -mmaintainer-address
              Use  maintainer-address as the name and email address of the maintainer for this package, rather than using the information from the
              source tree's control file.

       -emaintainer-address
              Use maintainer-address as the name and email address of the maintainer for this upload, rather than using the information  from  the
              source tree's changelog.

       -Vname=value
              Set an output substitution variable.  See deb-substvars(5) for a discussion of output substitution.

       -Tsubstvars-file
              Read  substitution  variables  in  substvars-file;  the default is debian/substvars.  No variable substitution is done on any of the
              fields that are output, however the special variable Format will override the field of the  same  name.  This  option  can  be  used
              multiple times to read substitution variables from multiple files (since dpkg 1.15.6).

       -Dfield=value
              Override or add an output control file field.

       -Ufield
              Remove an output control file field.

       -ccontrolfile
              Specifies the main source control file to read information from. The default is debian/control.

       -lchangelog-file
              Specifies the changelog file to read information from. The default is debian/changelog.

       -ffiles-list-file
              Read the list of files to be uploaded here, rather than using debian/files.

       -Fchangelog-format
              Specifies the format of the changelog. See dpkg-parsechangelog(1) for information about alternative formats.

       -uupload-files-dir
              Look  for  the  files  to  be uploaded in upload-files-dir rather than ..  (dpkg-genchanges needs to find these files so that it can
              include their sizes and checksums in the .changes file).

       -q     Usually dpkg-genchanges will produce informative messages on standard error, for example about how  many  of  the  package's  source
              files are being uploaded.  -q suppresses these messages.

       -O[filename]
              Print the changes file to standard output (the default) or to filename if specified (since dpkg 1.18.5).

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

FILES
       debian/files
              The  list  of  generated  files  which  are part of the upload being prepared.  dpkg-genchanges reads the data here when producing a
              .changes file.

SEE ALSO
       deb-substvars(5), deb-src-control(5), deb-src-files(5), deb-changelog(5), deb-changes(5).

1.18.24                                                             2017-07-04                                                  dpkg-genchanges(1)
