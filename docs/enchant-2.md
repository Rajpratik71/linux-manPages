ENCHANT-2(1)                                                  General Commands Manual                                                 ENCHANT-2(1)

NAME
       Enchant - a spellchecker

SYNOPSIS
       enchant-2 -a|-l|-h|-v [-L] [-d DICTIONARY] [FILE]

DESCRIPTION
       Enchant is an ispell-compatible spellchecker.

       -d DICTIONARY
              use the given dictionary

       -a     list suggestions in ispell pipe mode format

       -l     list only the misspellings

       -L     display line numbers

       -h     display help and exit

       -v     display version information and exit

ENCHANT ORDERING FILE
       Enchant  uses  global and per-user ordering files named enchant.ordering to decide which spelling provider to use for particular languages.
       The per-user file takes precedence.

       The ordering file takes the form language_tag:<comma-separated list of spelling providers>. To see what providers are  available,  run  en‐
       chant-lsmod-2. '*' is used to mean "use this ordering for all languages, unless instructed otherwise." For example:

       *:aspell,hunspell,nuspell
       en:aspell,hunspell,nuspell
       en_GB:hunspell,nuspell,aspell
       fr:hunspell,nuspell,aspell

FILES AND DIRECTORIES
       Enchant looks in the following places for files, in decreasing order of precedence:

       ENCHANT_CONFIG_DIR
              (If the environment variable is set.)

       XDG_CONFIG_HOME/enchant (non-Windows systems)
              Default: ~/.config/enchant

       CSIDL_LOCAL_APPDATA\enchant (Windows systems)
              Default: C:\Documents and Settings\username\Local Settings\Application Data\enchant

       ${prefix}/share/enchant
              (Or the equivalent location relative to the enchant library for a relocatable build.)

       Dictionaries are looked for in a subdirectory with the same name as the provider; for example, ${prefix}/share/enchant/hunspell and ~/.con‐
       fig/enchant/hunspell.

       Some providers may also look in a standard system directory for their dictionaries; the hunspell provider can be configured  to  do  so  at
       build time.

SEE ALSO
       aspell(1), enchant-lsmod-2(1)

AUTHOR
       Written by Dom Lachowicz and Reuben Thomas.

                                                                                                                                      ENCHANT-2(1)
