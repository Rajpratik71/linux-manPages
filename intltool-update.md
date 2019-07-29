INTLTOOL-UPDATE(8)                                            System Manager's Manual                                           INTLTOOL-UPDATE(8)

NAME
       intltool-update - updates PO template file and merge translations with it

SYNOPSIS
       intltool-update [option]...
       intltool-update LANGCODE

DESCRIPTION
       intltool-update generates new po file templates from source code, and merges existing translations with these new po templates.

       You must change working directory to the subdirectory containing translations (usually "po/") before running intltool-update.

OPTIONS
       When executing intltool-update , only one mode of operation is allowed each time.

   Mode of operation
       -p
       --pot
           Generate po template (.pot) only.

       -s
       --headers
           Executes intltool-extract(8) to extract strings inside XML/INI style files listed in POTFILES.in, and writes the extracted strings into
           header files, so that the strings can be recognised by xgettext(1).

       -m
       --maintain
           Search for left out files, which should have been listed in POTFILES.in or POTFILES.skip.  A list of all these files are  written  into
           another file called "missing".

       -r
       --report
           Display a status report for all translations in the software.

       -d LANGCODE
       --dist LANGCODE
           Merge LANGCODE.po with existing PO template.

   Other options
       -g NAME
       --gettext-package=NAME
           Manually  specify  PO  template file name, instead of determining the name automatically from source. Useful with -p/--pot option. This
           option has an additional effect: the name of current working directory is no more limited to "po" or "po-*".

       -o FILENAME
       --output-file=FILENAME
           Manually specify output FILENAME after merging old translation with PO template. Useful either with -d/--dist  option  or  without  any
           option.

       -x
       --verbose
           Display lots of feedback.

       --version
           Show version information.

       --help
           Show usage and basic help information.

EXAMPLES
       Creates a new PO template from source code, and name it foo.pot:

         intltool-update --pot --gettext-package=foo

       Updates translation file xy.po using existing po template called "bar.pot", and writes output into "xy1.po":

         intltool-update --dist --gettext-package=bar --output-file=xy1.po xy

       Creates new PO template and updates translation file xy.po (xy.po is overwritten with new content):

         intltool-update xy
         (same as intltool-update --pot && intltool-update --dist xy)

FILES
       po/POTFILES.in
              Contains list of source files which contain translatable strings, one file per line.

       po/POTFILES.skip
       po/POTFILES.ignore (obsolete)
              Contains list of source files which should be ignored when searching for translatable strings.

REPORTING BUGS
       Report bugs to http://bugs.launchpad.net/intltool

AUTHOR
       Darin Adler <darin@bentspoon.com>
       Kenneth Christiansen <kenneth@gnu.org>
       Maciej Stachowiak <mjs@eazel.com>

SEE ALSO
       intltoolize(8), intltool-prepare(8), intltool-extract(8), intltool-merge(8), xgettext(1)

intltool                                                            2003-08-02                                                  INTLTOOL-UPDATE(8)
