DEBCONF-GETTEXTIZE(1)                                               po-debconf                                               DEBCONF-GETTEXTIZE(1)

NAME
       debconf-gettextize - extract translations of debconf templates into PO files

SYNOPSIS
       debconf-gettextize [-v] [-h] [--podir=DIR] [--choices] [--merge] master [master ...]

DESCRIPTION
       The /var/lib/dpkg/info/*.templates files read by debconf contain English text and translations in the same file.  But in source packages,
       translations are managed in separate files to help translators.  In the initial implementation, a master templates file contained only
       English text, and templates.xx files contained both original and translated strings for the language xx.  The debconf-mergetemplate program
       was merging master and translated templates files.

       The new implementation with "po-debconf" is based on "gettext".  Maintainers mark translatable fields by prepending them with an
       underscore, English strings are automatically extracted into a POT file, translators work on normal PO files, and po2debconf generates a
       merged templates file with the same structure.

       The debconf-gettextize program was initially designed to help migrating to the new implementation.

       · It reads a list of master files and their associated translations, and generates po/*.po files for each language containing translated
         strings.

       · Each input file receives an ".old" suffix, and a new master file overwrites the old one; it is identical to the previous master file
         except that an underscore is prepended to translatable fields.  Developers can then choose which fields translators have to work on and
         which ones are skipped because their values are not locale-dependent.

       · A po/POTFILES.in file is also created, it contains the list of templates files debconf-updatepo has to process.

       Typically the debconf-gettextize program must be run only once when transforming from the first implementation to the "po-debconf" format,
       but it can also be used afterwards to transform a "_Choices" field into "__Choices" (or vice-versa) without losing translations, when using
       the "--merge" flag (alongside with "--choices" or not).  The desired template containing the "_Choices" or "__Choices" fields to modify has
       to be copied into a temporary template file, which is passed to debconf-gettextize as an argument.  Then the following steps are performed:

       1. po2debconf is run on this template file to generate a translated templates file.

       2. This translated templates file is processed as described above and PO files are generated.

       3. Newly created PO files are merged with existing ones.

       When PO files are merged, "_Choices" fields have to be replaced by "__Choices" (or vice-versa) in the original templates file before
       running debconf-updatepo, otherwise new translations will be fuzzy.

OPTIONS
       -h, --help
           Display a usage summary for the program and exit.

       -v, --verbose
           Process in verbose mode.

       --podir=DIR
           Set directory for PO files.  Default is to search for PO files in the po subdirectory below the location of the first master file.

       --choices
           By default, debconf-gettextize replaces "Choices" fields by "_Choices".  With this flag, "__Choices" fields are written instead.

       --merge
           When this flag is set, the strings are merged with existing PO files.  The templates files and po/POTFILES.in are not modified.

CAVEATS
       The "Default" field is special when template type is "Select" or "Multiselect", because a value has to be chosen amongst the English list
       of choices, even for localized values.  Normally this field must not be changed, but in rare circumstances localized values are meaningful
       (e.g. to choose the default language of an application).  In order to let translators know that this localized "Default" field is special,
       you must by convention call it "_DefaultChoice" instead of "_Default".

SEE ALSO
       debconf-updatepo(1), po2debconf(1), debconf-devel(7), po-debconf(7).

AUTHORS
         Denis Barbier <barbier@linuxfr.org>
         Martin Quinson <martin.quinson@ens-lyon.fr>

                                                                    2016-01-07                                               DEBCONF-GETTEXTIZE(1)
