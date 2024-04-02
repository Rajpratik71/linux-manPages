PO4A-BUILD(1)                                                          PO4A                                                          PO4A-BUILD(1)

NAME
       po4a-build - build translated documentation

SYNOPSIS
       po4a-build [-f | --file FILE] [--pot-only]

       po4a-build [-? | -h | --help | --version]

DESCRIPTION
       po4a-build is intended to make it as easy to produce translated documentation as it can be to produce the current untranslated content.

       When po4a prepares the translated content as POD or DocBook XML, the final documentation can then be built using po4a-build. Both the
       untranslated and translated content is built as a single process, updating the POT files at the same time.

       Existing build instructions are replaced by a single call to po4a-build and a simple configuration file is used to tell po4a-build how to
       build each element and which binary packages will include the translated and untranslated content.

       Once built, the content will be in package-specific directories beneath the BASEDIR specified in the configuration file. For a binary
       package foo, with translations into German and French, this would result in:

           BASEDIR/foo/man/man1/foo.1
           BASEDIR/foo/man/de/man1/foo.1
           BASEDIR/foo/man/fr/man1/foo.1

       This makes it easy to include all the generated content into the binary package with a single install location:

           doc/foo/man/* ./usr/share/man/
           doc/foo/html/* ./usr/share/doc/foo/

       This rule will not need to be updated when new translations are added and adding a second binary package (bar) allows the content for that
       package to kept separate.

   Supported formats
       Currently, po4a-build supports the following combinations:

        1. DocBook XML for section 1.

        2. DocBook XML for section 3.

        3. DocBook XML for HTML.

        4. POD for section 1.

        5. POD for section 3.

        6. POD for section 5.

        7. POD for section 7.

       All supported formats, in all supported combinations, can be handled in a single po4a-build.conf configuration file and in a single call to
       po4a-build. See po4a-build.conf(5).

CONFIGURATION
       po4a-build uses a default configuration file, po4a-build.conf which should be in the top level directory of your package VCS. (Use the -f
       option to specify a different file.) See po4a-build.conf(5).

       Example 1. example configuration file

       An example configuration file is available at:

           /usr/share/doc/po4a/examples/po4a-build.conf.example

   configuration file layout
       The configuration file consists of several sections, general, XML/XSL support, POD support and HTML support.

       General includes the name and location of the po4a config file (probably best to leave this as po4a.config), the po directory containing
       the documentation PO files (often doc/po), the full name of the POT file used to create the translations, the BASEDIR for the generated
       output, whether the package contains manpages in section 3 rather than just section 1 and the names of the binary packages which are to
       contain the generated output.

       XML/XSL support includes specifying which of the binary packages use XSL support in the XMLPACKAGES variable, the top level DocBook file to
       pass to xsltproc and the location of the XML or DocBook files. The XSLFILE can be overridden, if necessary.

       POD support includes specifying which of the binary packages use POD support in the PODPACKAGES variable and the full name of the POD file.

       HTML support specifies the subdirectory to create below BASEDIR for the untranslated and translated HTML content and the DocBook file to
       generate the HTML. The HTMLXSL file can be overridden, if necessary.

COMMANDS
       --pot-only
           Only updates the POT file(s).  --pot-only is intended to support packages including all POT files in the package source. Packages using
           Autotools can easily add the POT file via EXTRA_DIST but packages just using a Makefile or certain VCS build helpers can find it
           awkward to add the POT file (which is a generated file) without putting the POT file into the VCS. To avoid this ugly and unnecessary
           work, po4a-build can update the POT file(s) at the start of the build, so that dpkg-source includes them into the source tarball.

           Example 2. svn-buildpackage example

           svn-buildpackage has explicit support for this kind of addition, using the useNativeDist SVN property and the native-dist Make target.

               # adds the POT file to the source tarball
               native-dist: Makefile
                    po4a-build --pot-only

               $ svn propset useNativeDist 1 debian

       -h|--help
           print the usage message and exit.

       --version
           print the usage message and exit.

OPTIONS
       -f|--file FILE
           Override the po4a-build default configuration file (po4a-build.conf) and supply your own.

AUTHOR
       po4a-build was written by Neil Williams <codehelp@debian.org>.

       This manual page was written by Neil Williams <codehelp@debian.org>

PO4A                                                                01/05/2016                                                       PO4A-BUILD(1)
