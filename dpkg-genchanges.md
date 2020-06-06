dpkg-genchanges(1)                                                                            dpkg utilities                                                                           dpkg-genchanges(1)

NAME
       dpkg-genchanges - generate Debian .changes files

SYNOPSIS
       dpkg-genchanges [option...]

DESCRIPTION
       dpkg-genchanges reads information from an unpacked and built Debian source tree and from the files it has generated and generates a Debian upload control file (.changes file).

OPTIONS
       -g     Specifies that only source and architecture independent packages should be uploaded, thus no architecture specific packages will be included (since dpkg 1.17.11).

       -G     Specifies that only source and architecture specific packages should be uploaded, thus no architecture independent packages will be included (since dpkg 1.17.11).

       -b, -B, -A
              Specifies  that  a binary-only build is taking place, thus no source files are to be included.  There's no distinction between -b, -B and -A, the produced .changes file will include what‐
              ever files were created by the binary-* target(s) of the package being built.

       -S     Specifies that only the source should be uploaded, thus no binary packages will be included.

       The -sx options control whether the original source archive is included in the upload if any source is being generated (i.e.  -b or -B haven't been used).

       -si    By default, or if specified, the original source will be included only if the upstream version number (the version without epoch and without Debian revision)  differs  from  the  upstream
              version number of the previous changelog entry.

       -sa    Forces the inclusion of the original source.

       -sd    Forces the exclusion of the original source and includes only the diff.

       -vversion
              Causes changelog information from all versions strictly later than version to be used.

       -Cchanges-description
              Read the description of the changes from the file changes-description rather than using the information from the source tree's changelog file.

       -mmaintainer-address
              Use maintainer-address as the name and email address of the maintainer for this package, rather than using the information from the source tree's control file.

       -emaintainer-address
              Use maintainer-address as the name and email address of the maintainer for this upload, rather than using the information from the source tree's changelog.

       -Vname=value
              Set an output substitution variable.  See deb-substvars(5) for a discussion of output substitution.

       -Tsubstvars-file
              Read substitution variables in substvars-file; the default is debian/substvars.  No variable substitution is done on any of the fields that are output, however the special variable Format
              will override the field of the same name. This option can be used multiple times to read substitution variables from multiple files (since dpkg 1.15.6).

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
              Look for the files to be uploaded in upload-files-dir rather than ..  (dpkg-genchanges needs to find these files so that it can include their sizes and checksums in the .changes file).

       -q     Usually dpkg-genchanges will produce informative messages on standard error, for example about how many of the package's source files are being uploaded.  -q suppresses these messages.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

FILES
       debian/files
              The list of generated files which are part of the upload being prepared.  dpkg-genchanges reads the data here when producing a .changes file.

Debian Project                                                                                  2014-09-24                                                                             dpkg-genchanges(1)
