MEINPROC4(8)                                                                                  KDE User's Manual                                                                                  MEINPROC4(8)



NAME
       meinproc4 - KDE translator for XML

SYNOPSIS
       meinproc4 [--help] [Generic-options] [Qt-options] [KDE-options] [--cache file] [--check] [--htdig] [--srcdir] [--param key=value] [[[-o] | [--output]] file] [--stdout] [--stylesheet xsl]
                 docbook_file

DESCRIPTION
       meinproc4 converts DocBook files to HTML.

GENERIC OPTIONS
       --author
           Show author information.

       --help
           Show help about options.

       --help-all
           Show all options.

       --help-kde
           Show KDE specific options.

       --help-qt
           Show Qt specific options.

       --license
           Show license information.

       -v--version
           Show version information

APPLICATION OPTIONS
       --cache file
           Create a cache file for the document

       --check
           Check the document for validity

               The output can be a bit daunting, since one small mistake can cause a cascade of errors.
               The trick is to look at the first error, fix that error, save the file, and run meinproc4 again.

       --htdig
           Create a ht://dig compatible index

       -o, --output file
           Output whole document to file.

       --stdout
           Output whole document to stdout.

       --stylesheet xsl
           Stylesheet to use

       --srcdir dir
           Set the root directory to look for kdelibs

       --param key=value
           Set parameters to pass to the stylesheet.

USAGE
       The most common way to run meinproc4 is simply as

           meinproc4 docbook-file

       where docbook-file is usually index.docbook. This command creates HTML pages from the DocBook file. Note that these pages are only viewable in KDE-based browsers (like Konqueror).

       If you need to view the HTML output in another browser (for example, if you're placing it on line), use

           meinproc4 --stylesheet stylesheet-name docbook-file

       where stylesheet-name is the full path to one of the XSL stylesheets in $KDEDIR/share/apps/ksgmltools/customization. To produce output suitable for the web, you can use kde-web.xsl or
       kde-chunk-online.xsl. See the README file in that directory for more details.

SEE ALSO
       kdeoptions(7), qtoptions(7)

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



0.01.01                                                                                           2008-10-03                                                                                     MEINPROC4(8)
