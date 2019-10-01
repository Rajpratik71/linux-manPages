GNOME-DICTIONARY(1)                                                                             User Commands                                                                             GNOME-DICTIONARY(1)



NAME
       gnome-dictionary - Look up words in online dictionaries

SYNOPSIS
       gnome-dictionary [[--look-up WORD] | [--match WORD]] [--source NAME] [--database NAME] [--strategy NAME] [--help]

DESCRIPTION
       gnome-dictionary looks up words in online dictionaries using the DICT protocol.

OPTIONS
       --look-up WORD
           Looks up the specified WORD using the default dictionary source, or the one specified with the --source command line option.

       --match WORD
           List all the entries in the dictionary source that match the specified WORD.

       --source=NAME, -s NAME
           Specifies the dictionary source to be used for looking up or matching words.

       --database=NAME, -D NAME
           Specifies the database in the dictionary source to be used for looking up or matching words.

       --strategy=NAME, -S NAME
           Specifies the matching strategy in the dictionary source to be used for looking up or matching words.

AUTHOR
       Emmanuele Bassi
       GNOME Project
           Author

COPYRIGHT
       Copyright © 2012 Emmanuele Bassi



GNOME                                                                                                                                                                                     GNOME-DICTIONARY(1)
