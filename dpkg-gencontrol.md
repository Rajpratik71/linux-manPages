dpkg-gencontrol(1)                            dpkg suite                            dpkg-gencontrol(1)

NAME
       dpkg-gencontrol - generate Debian control files

SYNOPSIS
       dpkg-gencontrol [option...]

DESCRIPTION
       dpkg-gencontrol  reads  information  from an unpacked Debian source tree and generates a binary
       package control file (which defaults to debian/tmp/DEBIAN/control); during this process it will
       simplify the relation fields.

       Thus  Pre-Depends,  Depends,  Recommends  and Suggests are simplified in this order by removing
       dependencies which are known to be true according to the stronger dependencies already  parsed.
       It  will also remove any self-dependency (in fact it will remove any dependency which evaluates
       to true given the current version  of  the  package  as  installed).  Logically  it  keeps  the
       intersection  of  multiple  dependencies  on  the  same  package.  The order of dependencies is
       preserved as best as possible: if any dependency must be discarded due  to  another  dependency
       appearing further in the field, the superseding dependency will take the place of the discarded
       one.

       The other relation fields  (Enhances,  Conflicts,  Breaks,  Replaces  and  Provides)  are  also
       simplified  individually  by  computing the union of the various dependencies when a package is
       listed multiple times in the field.

       dpkg-gencontrol also adds an entry for the binary package to debian/files.

OPTIONS
       -vversion
              Sets the version number of the binary package which will be generated.

       -Vname=value
              Set an output substitution variable.  See  deb-substvars(5)  for  discussion  of  output
              substitution.

       -Tsubstvars-file
              Read  substitution  variables  in substvars-file; the default is debian/substvars.  This
              option can be used multiple times to read substitution  variables  from  multiple  files
              (since dpkg 1.15.6).

       -Dfield=value
              Override or add an output control file field.

       -Ufield
              Remove an output control file field.

       -ccontrol-file
              Specifies  the  main  source  control  file  to  read  information  from. The default is
              debian/control.

       -lchangelog-file
              Specifies the changelog file to read information from. The default is debian/changelog.

       -ffiles-list-file
              Read or write the list of files to be uploaded here, rather than using debian/files.

       -Fchangelog-format
              Specifies the format of the changelog. See dpkg-parsechangelog(1) for information  about
              alternative formats.

       -ppackage
              Generate  information  for the binary package package.  If the source control file lists
              only one binary package then this option may be omitted; otherwise it  is  essential  to
              select which binary package's information to generate.

       -nfilename
              Assume   the   filename   of  the  package  will  be  filename  instead  of  the  normal
              package_version_arch.deb filename.

       -is, -ip, -isp
              These options are ignored for compatibility  with  older  versions  of  the  dpkg  build
              scripts  but  are  now  deprecated. Previously they were used to tell dpkg-gencontrol to
              include the Section and Priority fields in the control file. This  is  now  the  default
              behaviour.  If you want to get the old behaviour you can use the -U option to delete the
              fields from the control file.

       -Ppackage-build-dir
              Tells dpkg-source that the package  is  being  built  in  package-build-dir  instead  of
              debian/tmp.   This  value  is  used  to  find  the  default  value of the Installed-Size
              substitution variable and control file field (using du), and for the default location of
              the output file.

       -O[filename]
              Print the control file to standard output (or filename if specified, since dpkg 1.17.2),
              rather than to debian/tmp/DEBIAN/control (or package-build-dir/DEBIAN/control if -P  was
              used).

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

ENVIRONMENT
       DPKG_COLORS
              Sets  the  color  mode  (since  dpkg  1.18.5).   The currently accepted values are: auto
              (default), always and never.

       DPKG_NLS
              If set, it will be used to decide whether to  activate  Native  Language  Support,  also
              known  as  internationalization  (or  i18n)  support  (since dpkg 1.19.0).  The accepted
              values are: 0 and 1 (default).

FILES
       debian/control
              The main source control information file, giving version-independent  information  about
              the source package and the binary packages it can produce.

       debian/files
              The   list   of   generated   files  which  are  part  of  the  upload  being  prepared.
              dpkg-gencontrol adds the presumed filenames of binary packages whose  control  files  it
              generates here.

SEE ALSO
       deb-substvars(5), deb-src-control(5), deb-changelog(5), deb-control(5).

1.19.7                                        2019-09-05                            dpkg-gencontrol(1)
