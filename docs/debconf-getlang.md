DEBCONF-GETLANG(1)                                                    Debconf                                                   DEBCONF-GETLANG(1)

NAME
       debconf-getlang - extract a language from a templates file

SYNOPSIS
        debconf-getlang lang master [translation]
        debconf-getlang --stats master translation [...]

DESCRIPTION
       Note: This utility is deprecated; you should switch to using the po-debconf package.

       This program helps make and manage translations of debconf templates.  There are basically three situations in which this program might be
       called:

       A translation is just being started.
           You want to provide the translator with a file they can work on that has the English fields from your templates file, plus blank Field-
           ll fields for the target language that they can fill in.

           To do this, run the program with first parameter being the code for the language that is being translated to, and the second parameter
           being the filename of the English templates file.

       A translation is well under way.
           You have changed some English text, or added more items to your templates file, and you want to send the translators a file with the
           English text plus their current translations (or you are the translator, and you want to generate such a file for your own use).

           To accomplish this, run the program with the first parameter being the the code for the language that is being translated to, the
           second parameter being the filename of the master English templates file, and the third parameter being the filename of the current
           translated file.

           When run this way, the program is smart enough to notice fuzzy translations. For example a fuzzy Description will be output as
           Description-<lang>-fuzzy, and a new, blank Description-<lang> will be added.  Translators should remove the -fuzzy fields as they
           correct the fuzzy translations.

       Checking the status of a translation
           To check the status of a translation, use the --status flag, and pass the english template file as the first parameter, and all the
           other translated templates after that. It will output statistics for each of them. For example:

             debconf-getlang --stats debian/templates debian/templates.*

NOTE
       Note that the text in the generated templates may be word-wrapped by debconf.

SEE ALSO
       debconf-mergetemplate(1)

AUTHOR
       Joey Hess <joeyh@debian.org>

                                                                    2019-05-06                                                  DEBCONF-GETLANG(1)
