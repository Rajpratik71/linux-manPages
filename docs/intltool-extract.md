INTLTOOL-EXTRACT(8)                                           System Manager's Manual                                          INTLTOOL-EXTRACT(8)

NAME
       intltool-extract - generate header files which can be read by gettext

SYNOPSIS
       intltool-extract [options]... SOURCE_FILE

DESCRIPTION
       intltool-extract  extracts  strings  in  the  specified XML/INI type SOURCE_FILE and writes them into a C header file. Then xgettext(1) can
       merge these strings inside header file into po template.

       intltool-extract is usually not executed manually, but called from intltool-update(8) instead.

OPTIONS
       -l
       --local
           Creates a subdirectory under current working directory (named "tmp/") and writes files there. This option can't be used  with  --update
           option.

       --update
           Writes  header file into the same directory the source file is in. New file name is the source file name appending ".h" extension. This
           option can't be used with -l/--local option. Besides, this option is the default option if neither --local nor --update is specified.

       --type=TYPE
           Specify the type of source file. Currently supported types are:
           "gettext/glade" (.glade, .glade2)
           "gettext/gsettings" (.gschema.xml)
           "gettext/ini" (Generic INI file)
           "gettext/keys" (.keys)
           "gettext/rfc822deb" (RFC 822 format file)
           "gettext/quoted" (all strings within "")
           "gettext/schemas" (.schemas)
           "gettext/scheme" (.scm)
           "gettext/xml" (Generic XML file)
           "gettext/qtdesigner" (Qt Designer .ui files)

       -v
       --version
           Show version information.

       -h
       --help
           Show usage and basic help information.

       -q
       --quiet
           Be quiet while running.

REPORTING BUGS
       Report bugs to http://bugs.launchpad.net/intltool

AUTHOR
       Darin Adler <darin@bentspoon.com>
       Kenneth Christiansen <kenneth@gnu.org>
       Maciej Stachowiak <mjs@eazel.com>

SEE ALSO
       intltoolize(8), intltool-prepare(8), intltool-merge(8), intltool-update(8), xgettext(1)

intltool                                                            2003-08-02                                                 INTLTOOL-EXTRACT(8)
