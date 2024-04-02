DH_MAKE(1)                                                    General Commands Manual                                                   DH_MAKE(1)

NAME
       dh_make - prepare Debian packaging for an original source archive

SYNOPSIS
       dh_make [option]...

DESCRIPTION
       dh_make  is a tool to convert a regular source code package into one formatted according to the requirements of the Debian Policy.  dh_make
       must be invoked within a directory containing the source code, which must be named <packagename>-<version>.  The <packagename> must be  all
       lowercase, The <packagename> and <version> must be all lowercase, digits and dashes. The <version> can also contain digits, and the symbols
       plus, dot, tilde. The <version> must start with a digit.  If the directory name does not conform to this scheme, you must rename it  before
       using dh_make.  Alternatively, you may be able to use the --packagename option to force the package name.

   PACKAGE CLASSES
       Classes can be set with the single direct options (such as --s for single) or with the -C,--packageclass option (-C=s for single).

       Single binary (s)
              The package will generate a single binary .deb package. It is the standard case, so if you don't know what to do, choose this.

       Arch-Independent (i)
              The package will generate a single package that is arch-independent.

       Library (l)
              The  package  will  generate  at least two binaries. One library package containing just the lib in /usr/lib and another *-dev_*.deb
              package containing documentation and C headers.

          ACTIONS PERFORMED
              Unless --native was given, dh_make makes sure a original source archive (<packagename>_<version>.orig.tar.gz)  exists.  The  archive
              can  either end with .gz or one of the other supported compression extensions such as bz2 or lzma.  If no such file exists, the file
              specified with -f is copied in place.  If no -f is supplied either but --createorig is, the current directory is created into a news
              archive  ../<packagename>-<version>.orig.tar.gz  The  original archive is needed for other Debian tools to generate the diffs to the
              original sources required by the Debian packaging format.  Unless there are reasons against it, this file  should  be  the  pristine
              upstream archive.

       Then  dh_make  proceeds  to generate a "debian" subdirectory and the necessary control files in the program source directory. Those control
       files are customized with the packagename and version extracted from the directory name.

       dh_make makes several attempts to obtain the username. It first checks for the environment variables $DEBFULLNAME, $LOGNAME is used to find
       a name in the /etc/passwd file, and through NIS, YP and LDAP.

       The  e-mail address can either be specified with the -fB--email option or dh_make will attempt to find it. It will first check the environ‐
       ment variables $DEBEMAIL and then $EMAIL. If they are not set then dh_make will search an  available  LDAP  directory  using  ldapsearch(1)
       using $LOGNAME as the uid to search under.  Finally it will use $LOGNAME and /etc/mailname to generate an email address.

       dh_make  will  also  generate  example  files that are also customized for the package generated. You can remove all files with *.ex if you
       wish. You can also delete the README.Debian file if you don't have anything to put in it.  Renaming the example files to their name without
       the .ex at the end (and editing them if necessary) will activate that feature of debhelper.

       If  the --templates or -o (--overlay) option is used dh_make will apply a customizing template to the "debian" directory. See the templates
       described in the FILES section of this manpage for samples.

OPTIONS
       -c, --copyright license
              Use license type in copyright file.  license can be gpl, gpl2, gpl3, lgpl, lgpl2 lgpl3, artistic, apache, bsd, mit  or  custom.   If
              this  field  is not specified the copyright file has a space to fill in which sort of license is used. The field is case-insensitive
              so -c GPL works as well as -c gpl. gpl and lgpl will give you version 3 of the corresponding license, apache implies Apache v2.0. If
              you  need  a different version, change the license file afterwards or use the gpl2 and lgpl2 options.  If you select custom here you
              will need to use the --copyrightfile option as well.

       --copyrightfile filename
              When using the custom --copyright option this is the location of your custom copyright file. dh_make will  process  this  file  just
              like the standard copyright files. It is suggested you use one of the existing license files as a starting point.

       --docs Create a separate PACKAGE-doc binary package. All found documents in the source package will be installed here.

       -e, --email address
              Use address as the e-mail address in the Maintainer: field of debian/control file.

       -n, --native
              Create a native Debian packages, i.e. do not generate a .orig archive, since it will be generated when building with dpkg-buildpack‐
              age.  The version number will not have a Debian revision number (e.g. -1) appended to it.

       -f, --file file
              Use file as the original source archive, and skip the copying of the current program tree to program.orig.

       -l, --library
              Automatically set the package class to Library, skipping the question.

       -s, --single
              Automatically set the package class to Single binary, skipping the question.

       -i, --indep
              Automatically set the package class to arch-independent binary, skipping the question.

       -a, --addmissing
              Adds missing example and control files on an existing debian source directory.

       -t, --templates directory
              Applies the customizing templates in directory to the debian directory.

       -o, --overlay directory
              Applies a customization template to an existing debian directory.

       -p, --packagename name
              Force the package name to be name, good for packages with hyphens in their name or other strangeness. You can also make the  parame‐
              ter name_version which will set both the package name and version and bypass and directory checking.

       -d, --defaultless
              Skips  applying  the  default  templates  to  the target debian directory. Generally used in conjuction with either the --overlay or
              --templates options.

       -h, --help
              Display the name, version, available options and authors, and exit successfully.

       -v, --version
              Show the program name and version, and exit successfully.

       -y, --yes
              Automatic yes to prompts and run non-interactively.  The package class needs to be set for dh_make to run fully automatically.

ENVIRONMENT
       The following environment settings are used by dh_make:

       DEBEMAIL
              Email address to use in control and changelog entries.

       DEBFULLNAME
              You full name, eg "John Doe" which will appear in the control and changelog entries.

       EMAIL  Email address to use in control and changelog entries, only used if DEBEMAIL is no set.

       LOGNAME
              Default username used for looking up email and full name in other directories.

FILES
       /usr/share/debhelper/dh_make
              Directory that contains all the template files, separated in six directories:

       debian/
              with files for all package classes,

       debians/
              with files specific to the Single binary class,

       debianl/
              with files specific to the Library class, and finally,

       native/
              with files specific to the native Debian packages.

       licenses/
              template files for the more common licenses used in Debian packages

EXAMPLES
       To get dh_make to use the defaults and ask you various questions about the package

           dh_make

       Create your single class package using the with the GPL license:

           dh_make -s -c gpl

       A more involved example where you set your name in the environment, contact email and license in the options and specify the upstream file:

           DEBFULLNAME="John Doe"
           dh_make --email contact@example.com --copyright=bsd \
            --file ../foo.tar.gz

BUGS
       dh_make may not detect your username and email address correctly when using sudo.

SEE ALSO
       dpkg(1),dpkg-buildpackage(1),dh(1),make-kpkg(1),debhelper(7)

       You may also want to read the Debian Policy (in /usr/share/doc/debian-policy ) and the New  Maintainers'  Guide  (in  /usr/share/doc/maint-
       guide).

Debian Project                                                      2016-01-08                                                          DH_MAKE(1)
