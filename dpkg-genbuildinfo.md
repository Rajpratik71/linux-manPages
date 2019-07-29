dpkg-genbuildinfo(1)                                                dpkg suite                                                dpkg-genbuildinfo(1)

NAME
       dpkg-genbuildinfo - generate Debian .buildinfo files

SYNOPSIS
       dpkg-genbuildinfo [option...]

DESCRIPTION
       dpkg-genbuildinfo  reads  information  from  an  unpacked  and built Debian source tree and from the files it has generated and generates a
       Debian control file describing the build environment and the build artifacts (.buildinfo file).

       This command was introduced in dpkg 1.18.11.

OPTIONS
       --build=type
              Specifies the build type from a comma-separated list of components.

              The allowed values are:

              any    Generate build  information  including  unqualified  build  dependencies  (Build-Depends)  and  architecture  specific  build
                     dependencies (Build-Depends-Arch).

              all    Generate  build  information  including  unqualified  build  dependencies  (Build-Depends) and architecture independent build
                     dependencies (Build-Depends-Indep).

              source Effectively ignored; generate build information with just the unqualified build dependencies (Build-Depends).

              binary Generate build information with all three types of build dependencies.  This is an alias for any,all.

              full   Generate build information with all three types of build dependencies.  This is an alias for any,all,source, and the same  as
                     the default case when no build option is specified.

       -ccontrolfile
              Specifies the main source control file to read information from. The default is debian/control.

       -lchangelog-file
              Specifies the changelog file to read information from. The default is debian/changelog.

       -ffiles-list-file
              Specifies where is the list of files that have been produced by the build, rather than using debian/files.

       -Fchangelog-format
              Specifies the format of the changelog. See dpkg-parsechangelog(1) for information about alternative formats.

       -O[filename]
              Print  the buildinfo file to standard output (or filename if specified) rather than to dir/source-name_source-version_arch.buildinfo
              (where dir is .. by default or upload-files-dir if -u was used).

       -uupload-files-dir
              Look for the files to be uploaded in upload-files-dir rather than ..  (dpkg-genbuildinfo needs to find these files so  that  it  can
              include their sizes and checksums in the .buildinfo file).

       --always-include-path
              By default, the Build-Path field will only be written if the current directory starts with a whitelisted pattern.

              On Debian and derivatives the pattern matches on /build/ at the start of the pathname.

              Specify this option to always write a Build-Path field when generating the .buildinfo.

       --admindir=dir
              Change the location of the dpkg database. The default location is /var/lib/dpkg.

       -q     dpkg-genbuildinfo might produce informative messages on standard error.  -q suppresses these messages.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

ENVIRONMENT
       DEB_BUILD_OPTIONS
              This variable can be used to enable or disable various features that affect the information included in the .buildinfo file, via the
              buildinfo option (since dpkg 1.18.19).  This option contains a comma-separated list of  features,  prefixed  with  the  ‘+’  or  ‘-’
              modifiers,  to  denote  whether  to  enable  or  disable them.  The special feature “all” can be used to enable or disable all other
              features.  The feature “path” controls whether to unconditionally include the Build-Path field.

FILES
       debian/files
              The list of generated files.  dpkg-genbuildinfo reads the data here when producing a .buildinfo file.

SEE ALSO
       deb-buildinfo(5).

1.18.24                                                             2017-07-04                                                dpkg-genbuildinfo(1)
