dpkg-scanpackages(1)                          dpkg suite                          dpkg-scanpackages(1)

NAME
       dpkg-scanpackages - create Packages index files

SYNOPSIS
       dpkg-scanpackages [option...] binary-path [override-file [path-prefix]] > Packages

DESCRIPTION
       dpkg-scanpackages  sorts  through a tree of Debian binary packages and creates a Packages file,
       used by apt(8), dselect(1), etc, to tell the user what packages are available for installation.
       These Packages files are the same as those found on Debian archive sites and CD-ROMs. You might
       use dpkg-scanpackages yourself if making a directory of local packages to install on a  cluster
       of machines.

       Note:  If  you  want  to  access the generated Packages file with apt you will probably need to
       compress  the  file  with  xz(1)  (generating  a  Packages.xz  file),  bzip2(1)  (generating  a
       Packages.bz2  file)  or  gzip(1)  (generating  a  Packages.gz  file).  apt ignores uncompressed
       Packages files except on local access (i.e.  file:// sources).

       binary-path is the  name  of  the  tree  of  the  binary  packages  to  process  (for  example,
       contrib/binary-i386).   It  is  best  to  make this relative to the root of the Debian archive,
       because every Filename field in the new Packages file will start with this string.

       override-file is the name of a file to read which contains information about  how  the  package
       fits into the distribution (the file can be compressed since dpkg 1.15.5); see deb-override(5).

       path-prefix is an optional string to be prepended to the Filename fields.

       If  more  than one version of a package is found only the newest one is included in the output.
       If they have the same version and only differ in architecture only the first one found is used.

OPTIONS
       -t, --type type
              Scan for *.type packages, instead of *.deb.

       -e, --extra-override file
              Scan file to find supplementary  overrides  (the  file  can  be  compressed  since  dpkg
              1.15.5).  See deb-extra-override(5) for more information on its format.

       -a, --arch arch
              Use a pattern consisting of *_all.deb and *_arch.deb instead of scanning for all debs.

       -h, --hash hash-list
              Only  generate  file hashes for the comma-specified list specified (since dpkg 1.17.14).
              The default is to generate all currently supported hashes.  Supported values: md5, sha1,
              sha256.

       -m, --multiversion
              Include all found packages in the output.

       -M, --medium id-string
              Add an X-Medium field containing the value id-string (since dpkg 1.15.5).  This field is
              required if you want to generate Packages.cd files for use by the multicd access  method
              of dselect.

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

DIAGNOSTICS
       dpkg-scanpackages outputs the usual self-explanatory errors. It also warns about packages  that
       are in the wrong subdirectory, are duplicated, have a Filename field in their control file, are
       missing from the override file, or have maintainer substitutions which do not take effect.

SEE ALSO
       dpkg(1), dselect(1), deb-override(5), deb-extra-override(5), dpkg-scansources(1).

1.19.7                                        2019-09-05                          dpkg-scanpackages(1)
