PO4A(1p)                                                            Po4a Tools                                                            PO4A(1p)

NAME
       po4a - update both the PO files and translated documents in one shot

SYNOPSIS
       po4a [options] config_file

DESCRIPTION
       The po4a (PO for anything) project goal is to ease translations (and more interestingly, the maintenance of translations) using gettext
       tools on areas where they were not expected like documentation.

       The po4a program is useful if you want to avoid calling po4a-gettextize(1), po4a-updatepo(1), and po4a-translate(1) in complex Makefiles
       when you have multiple files to translate, different format, or need to specify different options for different documents.

Table of content
       This document is organized as follow:

   DESCRIPTION
   INTRODUCTION
   CONFIGURATION FILE SYNTAX
       Specifying the template languages

       Specifying the paths to translator inputs

       Autodetection of the paths and languages

       Specifying the documents to translate

       Specifying options for the modules

       Specifying aliases

       Split mode

   OPTIONS
   EXAMPLE
   SHORTCOMINGS
   SEE ALSO
   AUTHORS
   COPYRIGHT AND LICENSE

INTRODUCTION
       The po4a program is in charge of updating both the PO files (to sync them to the original documents) and the translated documents (to sync
       them to the PO files). The main point is to make the use of po4a easier without having to remember of the command line options.

       It also allows you to mix documents having different formats into the same POT file so that you can have only one such file per project.

       This behaviour can be mimicked by the other tools of the po4a suite (for example with Makefiles), but it is rather difficult to do, and
       exhausting to redo the same complicated Makefiles for each project using po4a.

       The dataflow can be summarized as follow. Any changes to the master document will be reflected in the PO files, and all changes to the PO
       files (either manual or caused by previous step) will be reflected in translation documents.

        master document --> PO files --> translations

       The dataflow cannot be inversed in this tool, and changes in translations are overwritten by the content of the PO files. As a matter of
       fact, this tool cannot be used to convert existing translations to the po4a system. For that task, please refer to po4a-gettextize(1).

CONFIGURATION FILE SYNTAX
       The (mandatory) argument is the path to the configuration file to use.  Its syntax aims at being simple and close to the configuration
       files used by the intl-tools projects.

       Comments in this files are noted by the char '#'. It comments everything until the end of the line. Lines can be continued by escaping the
       end of line.  All non blank lines must begin with a [] command, followed by its arguments.  (sound difficult said that way, but it is
       rather easy, I hope ;)

   Specifying the template languages
       Note: It is recommended to use [po_directory] rather than [po4a_langs] and [po4a_paths].  See section Autodetection of the paths and
       languages below.

       This is an optional command that can simplify the whole config file, and will make it more scalable. You have to specify a list of the
       languages in which you want to translate the documents. This is as simple as:

        [po4a_langs] fr de

       This will enable you to expand $lang to all the specified languages in the rest of the config file.

   Specifying the paths to translator inputs
       Note: It is recommended to use [po_directory] rather than [po4a_langs] and [po4a_paths].  See section Autodetection of the paths and
       languages below.

       First, you have to specify where the translator input files (i.e. the files used by translators to do their job) are located. It can be
       done by such a line:

        [po4a_paths] doc/l10n/project.doc.pot \
                     fr:doc/l10n/fr.po de:doc/l10n/de.po

       The command is thus [po4a_paths]. The first argument is the path to the POT file to use. All subsequent arguments are of the self-
       explanatory form:

           <lang>:<path to the PO file for this lang>

       If you've defined the template languages, you can rewrite the line above this way:

        [po4a_paths] doc/l10n/project.doc.pot $lang:doc/l10n/$lang.po

       You can also use $master to refer to the document filename. In this case, po4a will use a split mode: one POT and one PO (for each
       language) will be created for each document specified in the po4a configuration file.  See the Split mode section.

        [po4a_paths] doc/$master/$master.pot $lang:doc/$master/$lang.po

   Autodetection of the paths and languages
       Another command can be used to specify the name of a directory where the PO and POT files are located.  When it is used, po4a will detect
       the POT file as the only *.pot file from the specified directory.  po4a will also use the list of *.po files to define the list of
       languages (by stripping out the extension).  These languages will be used for the substitution of the $lang variable in the rest of the
       configuration file.

       This command should not be used together with the [po4a_langs] or [po4a_paths] commands.

       When using this command, you have to create an empty POT file on the first invocation of po4a to let it know the name of the POT file.

        [po_directory] po4a/po/

   Specifying the documents to translate
       You now naturally have to specify which documents are translated, their format, and where to put the translations. It can be made by such
       lines:

        [type: sgml] doc/my_stuff.sgml fr:doc/fr/mon_truc.sgml \
                     de:doc/de/mein_kram.sgml
        [type: pod] script fr:doc/fr/script.1 de:doc/de/script.1 \
                    add_fr:doc/l10n/script.fr.add

       This should be rather self-explanatory also. Note that in the second case, doc/l10n/script.fr.add is an addendum to add to the French
       version of this document.  Please refer to po4a(7) for more information about the addenda.

       More formally, the format is:

        [type: <format>] <master_doc> (<lang>:<localized_doc>)* \
                         (add_<lang>:<modifier>*<addendum_path>)*

       If there is no modifier, addendum_path is a path to an addendum.  Modifiers are

       ? Include addendum_path if this file does exist, otherwise do nothing.

       @ addendum_path is not a regular addendum but a file containg a list of addenda, one by line.  Each addendum may be preceded by modifiers.

       ! addendum_path is discarded, it is not loaded and will not be loaded by any further addendum specification.

       If you've defined the template languages, you can rewrite the line above this way:

        [type: pod] script $lang:doc/$lang/script.1 \
                    add_fr:doc/l10n/script.fr.add

       If all the languages had addenda with similar paths, you could also write something like:

        [type: pod] script $lang:doc/$lang/script.1 \
                    add_$lang:doc/l10n/script.$lang.add

   Specifying options for the modules
       po4a accepts options that will be passed to the module. These options are module specific and are specified with the -o switch.

       If you need a specific option for one of the document you want to translate, you can also specify it in the configuration file. Options are
       introduced by the opt keyword. The argument of the opt keyword must be quoted with double quotes if it contains a space (e.g. if you
       specify multiple options, or an option with an argument).  You can also specify options that will only apply to a specific language by
       using the opt_lang keyword.

       Here is an example:
        [type:man] data-05/test2_man.1 $lang:tmp/test2_man.$lang.1 \
                   opt:"-k 75" opt_it:"-L UTF-8" opt_fr:-v

       Arguments may contain spaces if you use single quotes or escaped double quotes:
        [po4a_alias:man] man opt:"-o \"mdoc=NAME,SEE ALSO\" -k 20"

       If you want to specify the same options for many documents, you may want to use an alias (see the Specifying aliases section below).

       You can also set options for all the documents specified in the configuration file:
        [options] opt:"..." opt_fr:"..."

   Specifying aliases
       If you must specify the same options for multiple files, you may be interested in defining a module alias. This can be done this way:

        [po4a_alias:test] man opt:"-k 21" opt_es:"-o debug=splitargs"

       This defines a module alias named test, based on the man module, with the -k 21 applied to all the languages and with -o debug=splitargs
       applied to the Spanish translation.

       This module alias can then be use like a regular module:

        [type:test] data-05/test2_man.1 $lang:tmp/test2_man.$lang.1 \
                   opt_it:"-L UTF-8" opt_fr:-v

       Note that you can specify additional options on a per file basis.

   Split mode
       The split mode is used when $master is used in the [po4a_paths] line.

       When the split mode is used, a temporary big POT and temporary big POs are used. This permits to share the translations between all the
       POs.

       If two POs have different translations for the same string, po4a will mark this string as fuzzy and will submit both translations in all
       the POs which contain this string. Then, when a translator updates the translation and removes the fuzzy tag in one PO, the translation of
       this string will be updated in every POs automatically.

       If there are name conflicts because several files have the same filename, the name of the master file can be specified by adding a
       "master:file="name option:

        [po4a_langs] de fr ja
        [po4a_paths] l10n/po/$master.pot $lang:l10n/po/$master.$lang.po
        [type: xml] foo/gui.xml $lang:foo/gui.$lang.xml master:file=foo-gui
        [type: xml] bar/gui.xml $lang:bar/gui.$lang.xml master:file=bar-gui

OPTIONS
       -k, --keep
           Minimal threshold for translation percentage to keep (i.e. write) the resulting file (default: 80). I.e. by default, files have to be
           translated at at least 80% to get written.

       -h, --help
           Show a short help message.

       -M, --master-charset
           Charset of the files containing the documents to translate. Note that all master documents must use the same charset for now. This is a
           known limitation, and we are working on solving this.

       -L, --localized-charset
           Charset of the files containing the localized documents. Note that all translated documents will use the same charset for now. This is
           a known limitation, and we are working on solving this.

       -A, --addendum-charset
           Charset of the addenda. Note that all the addenda should be in the same charset.

       -V, --version
           Display the version of the script and exit.

       -v, --verbose
           Increase the verbosity of the program.

       -q, --quiet
           Decrease the verbosity of the program.

       -d, --debug
           Output some debugging information.

       -o, --option
           Extra option(s) to pass to the format plugin. Specify each option in the 'name=value' format. See the documentation of each plugin for
           more information about the valid options and their meanings.

       -f, --force
           Always generate the POT and PO files, even if po4a considers it is not necessary.

           The default behavior (when --force is not specified) is the following:

               If the POT file already exists, it is regenerated if a master document or the configuration file is more recent.  The POT file is
               also written in a temporary document and po4a verifies that the changes are really needed.

               Also, a translation is regenerated only if its master document, the PO file, one of its addenda or the configuration file is more
               recent.  To avoid trying to regenerate translations which do not pass the threshold test (see --keep), a file with the .po4a-stamp
               extension can be created (see --stamp).

           If a master document includes files, you should use the --force flag because the modification time of these included files are not
           taken into account.

           The PO files are always re-generated based on the POT with msgmerge -U.

       --stamp
           Tells po4a to create stamp files when a translation is not generated because it does not reach the threshold. These stamp files are
           named according to the expected translated document, with the .po4a-stamp extension.

           Note: This only activates the creation of the .po4a-stamp files. The stamp files are always used if they exist, and they are removed
           with --rm-translations or when the file is finally translated.

       --no-translations
           Do not generate the translated documents, only update the POT and PO files.

       --rm-translations
           Remove the translated files (implies --no-translations).

       --no-backups
           This flag does nothing since 0.41, and may be removed in later releases.

       --rm-backups
           This flag does nothing since 0.41, and may be removed in later releases.

       --translate-only translated-file
           Translate only the specified file.  It may be useful to speed up processing if a configuration file contains a lot of files.  Note that
           this option does not update PO and POT files.  This option can be used multiple times.

       --variable var=value
           Define a variable that will be expanded in the po4a configuration file.  Every occurrence of $(var) will be replaced by value.  This
           option can be used multiple times.

       --srcdir SRCDIR
           Set the base directory for all input documents specified in the po4a configuration file.

       --destdir DESTDIR
           Set the base directory for all the output documents specified in the po4a configuration file.

   OPTIONS WHICH MODIFY POT HEADER
       --porefs type[,wrap|nowrap]
           Specify the reference format. Argument type can be one of none to not produce any reference, noline to not specify the line number
           (more accurately all line numbers are replaced by 1), counter to replace line number by an increasing counter, and full to include
           complete references.

           Argument can be followed by a comma and either wrap or nowrap keyword.  References are written by default on a single line.  The wrap
           option wraps references on several lines, to mimic gettext tools (xgettext and msgmerge).  This option will become the default in a
           future release, because it is more sensible.  The nowrap option is available so that users who want to keep the old behavior can do so.

       --msgid-bugs-address email@address
           Set the report address for msgid bugs. By default, the created POT files have no Report-Msgid-Bugs-To fields.

       --copyright-holder string
           Set the copyright holder in the POT header. The default value is "Free Software Foundation, Inc."

       --package-name string
           Set the package name for the POT header. The default is "PACKAGE".

       --package-version string
           Set the package version for the POT header. The default is "VERSION".

   OPTIONS TO MODIFY PO FILES
       --msgmerge-opt options
           Extra options for msgmerge(1).

           Note: $lang will be extended to the current language.

       --no-previous
           This option removes --previous from the options passed to msgmerge.  This permits to support versions of gettext earlier than 0.16.

       --previous
           This option adds --previous to the options passed to msgmerge.  It requires gettext 0.16 or later, and is activated by default.

   EXAMPLE
       Let's assume you maintain a program named foo which has a man page man/foo.1 which naturally is maintained in English only. Now you as the
       upstream or downstream maintainer want to create and maintain the translation.  First you need to create the POT file necessary to send to
       translators using po4a-gettextize(1).

       So for our case we would call

        cd man && po4a-gettextize -f man -m foo.1 -p foo.pot

       You would then send this file to the appropriate language lists or offer it for download somewhere on your website.

       Now let's assume you received three translations before your next release: de.po (including an addendum de.add), sv.po and pt.po.  Since
       you don't want to change your Makefile(s) whenever a new translation arrives you can use po4a with an appropriate configuration file in
       your Makefile.  Let's call it po4a.cfg. In our example it would look like the following:

        [po_directory] man/po4a/po/

        [type: man] man/foo.1 $lang:man/translated/$lang/foo.1 \
                   add_$lang:?man/po4a/add_$lang/$lang.add opt:"-k 80"

       In this example we assume that your generated man pages (and all PO and addenda files) should be stored in man/translated/$lang/
       (respectively in man/po4a/po/ and man/po4a/add_$lang/) below the current directory. In our example the man/po4a/po/ directory would include
       de.po, pt.po and sv.po, and the man/po4a/add_de/ directory would include de.add.

       Note the use of the modifier ? as only the German translation (de.po) is accompanied by an addendum.

       To actually build the translated man pages you would then (once!) add the following line in the build target of the appropriate Makefile:

               po4a po4a.cfg

       Once this is set up you don't need to touch the Makefile when a new translation arrives, i.e. if the French team sends you fr.po and fr.add
       then you simply drop them respectively in man/po4a/po/ and man/po4a/add_fr/ and the next time the programm is build the French translation
       is automatically build as well in man/translated/fr/.

       Note that you still need an appropriate target to install localized manual pages with English ones.

       Finally if you do not store generated files into your version control system, you will need a line in your clean target as well:
               -rm -rf man/translated

SHORTCOMINGS
       ·   Duplicates some code with the po4a-* programs.

       Patch welcome ;)

SEE ALSO
       po4a-build(1), po4a-gettextize(1), po4a-normalize(1), po4a-translate(1), po4a-updatepo(1), po4a-build.conf(5), po4a(7)

AUTHORS
        Denis Barbier <barbier@linuxfr.org>
        Nicolas François <nicolas.francois@centraliens.net>
        Martin Quinson (mquinson#debian.org)

COPYRIGHT AND LICENSE
       Copyright 2002-2012 by SPI, inc.

       This program is free software; you may redistribute it and/or modify it under the terms of GPL (see the COPYING file).

Po4a Tools                                                          2016-01-05                                                            PO4A(1p)
