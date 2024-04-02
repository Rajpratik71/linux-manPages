HADDOCK(1)                         Haddock documentation generator                         HADDOCK(1)

NAME
       haddock - documentation tool for annotated Haskell source code

SYNOPSIS
       haddock [options] file...

DESCRIPTION
       This  manual page documents briefly the haddock command.  Extensive documentation is available
       in various other formats including DVI, PostScript and HTML; see below.

       file is a filename containing a Haskell source module.  All the modules specified on the  com‐
       mand  line  will be processed together.  When one module refers to an entity in another module
       being processed, the documentation will link directly to that entity.

       Entities that cannot be found, for example because they are in a module that is not being pro‐
       cessed  as part of the current batch, simply will not be hyperlinked in the generated documen‐
       tation.  haddock will emit warnings listing all the identifiers it could not resolve.

       The modules should not be mutually recursive, as haddock does not like swimming in circles.

OPTIONS
       The programs follow the usual GNU command line syntax, with long  options  starting  with  two
       dashes  (`--').   A summary of options is included below.  For a complete description, see the
       other documentation.

       -o DIR, --odir=DIR
              directory in which to put the output files

       -i FILE, --read-interface=FILE
              read an interface from FILE.

       -D FILE, --dump-interface=FILE
              dump an interface for these modules in FILE.

       -l DIR, --lib=DIR
              location of Haddock's auxiliary files

       -h, --html
              Generate documentation in HTML format.  Several files will be generated into  the  cur‐
              rent  directory  (or  the specified directory if the -o option is given), including the
              following:

              index.html
                     The top level page of the documentation:  lists  the  modules  available,  using
                     indentation to represent the hierarchy if the modules are hierarchical.

              haddock.css
                     The  stylesheet  used by the generated HTML.  Feel free to modify this to change
                     the colors or layout, or even  specify  your  own  stylesheet  using  the  --css
                     option.

              module.html
                     An HTML page for each module.

              doc-index.html, doc-index-XX.html
                     The  index,  split  into  two  (functions/constructors and types/classes, as per
                     Haskell namespaces) and further split alphabetically.

       --hoogle
              output for Hoogle

       --html-help=format
              produce index and table of contents in mshelp, mshelp2 or devhelp format (with -h)

       --source-base=URL
              Include links to the source files in the generated documentation, where URL is the base
              URL where the source files can be found.

       -s URL, --source-module=URL
              Include links to the source files in the generated documentation, where URL is a source
              code link for each module (using the %{FILE} or %{MODULE} vars).

       --source-entity=URL
              Include links to the source files in the generated documentation, where URL is a source
              code link for each entity (using the %{FILE}, %{MODULE} or %{NAME} vars).

       --comments-base=URL
              URL for a comments link on the contents and index pages.

       --comments-module=URL
              URL for a comments link for each module (using the %{MODULE} var).

       --comments-entity=URL
              URL for a comments link for each entity (using the %{FILE}, %{MODULE} or %{NAME} vars).

       --css=FILE
              Use  the  CSS  FILE  instead of the default stylesheet that comes with haddock for HTML
              output. It should specify certain classes: see the default stylesheet for details.

       -p FILE, --prologue=FILE
              Specify a file containing prologue text.

       -t TITLE, --title=TITLE
              Use TITLE as the page heading for each page in the documentation.  This  will  normally
              be the name of the library being documented.

              The title should be a plain string (no markup please!).

       -k NAME, --package=NAME
              Specify the package name (optional).

       -n, --no-implicit-prelude
              do not assume Prelude is imported

       -d, --debug
              Enable extra debugging output.

       -?, --help
              Display help.

       -V, --version
              Display version.

       -v, --verbose
              Verbose status reporting.

       --use-contents=URL
              Use a separately-generated HTML contents page.

       --gen-contents
              Generate an HTML contents from specified  interfaces.

       --use-index=URL
              Use a separately-generated HTML index.

       --gen-index
              Generate an HTML index from specified interfaces.

       --ignore-all-exports
              Behave as if all modules have the ignore-exports atribute

       --hide=MODULE
              Behave as if MODULE has the hide attribute.

       --use-package=PACKAGE
              The modules being processed depend on PACKAGE.

FILES
       /usr/bin/haddock
       /usr/share/haddock-2.6.1/html/plus.gif
       /usr/share/haddock-2.6.1/html/minus.gif
       /usr/share/haddock-2.6.1/html/haskell_icon.gif
       /usr/share/haddock-2.6.1/html/haddock.js
       /usr/share/haddock-2.6.1/html/haddock.css
       /usr/share/haddock-2.6.1/html/haddock-DEBUG.css

SEE ALSO
       /usr/share/doc/haddock/,
       the Haddock homepage (http://haskell.org/haddock/) ⟨http://haskell.org/haddock/⟩

COPYRIGHT
       Haddock version 2.6.1

       Copyright     2006-2010      Simon     Marlow     <simonmar@microsoft.com>,     Dawid    Waern
       <david.waern@gmail.com>.  All rights reserved.

AUTHOR
       This manual page was written by Michael Weber <michaelw@debian.org> for the  Debian  GNU/Linux
       system (but may be used by others).

Haddock, version 2.6.1                        July 2010                                    HADDOCK(1)
