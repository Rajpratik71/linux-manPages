ENCHANT-LSMOD-2(1)                                            General Commands Manual                                           ENCHANT-LSMOD-2(1)

NAME
       Enchant - list provider and dictionary information

SYNOPSIS
       enchant-lsmod-2 [[-lang|-word-chars] [language_tag]|-list-dicts|-help|-version]

DESCRIPTION
       enchant-lsmod-2  gives  information about Enchant's spell-checker providers and the dictionaries each offers.  See enchant-2(1) for details
       about how the providers and dictionaries are located.  If no command-line options are given, the available providers are listed.

   OPTIONS
       -lang  Show which provider and dictionary will be used for the given language, or all languages if none is supplied.

       -word-chars
              Show the extra word characters for the given language, if available. This is of little interest to most users.

       -list-dicts
              List the provider and dictionary for all available languages.

       -help  Show brief help.

       -version
              Prints the program's version.

SEE ALSO
       enchant-2(1)

AUTHOR
       Written by Dom Lachowicz and Reuben Thomas.

                                                                    August 2017                                                 ENCHANT-LSMOD-2(1)
