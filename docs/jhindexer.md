JHINDEXER(1)                                                        Java Tools                                                        JHINDEXER(1)

NAME
       jhindexer - JavaHelp command line utility

SYNOPSIS
       jhindexer [ options ] [ file | folder ]

PARAMETERS
       options
          Command-line options.

       file
          JavaHelp system content file. If the argument is a folder, the folder is searched recursively for JavaHelp system content files.

DESCRIPTION
       jhindexer  creates  a  full-text search database used by the JavaHelp system full-text search engine to locate matches. You can use the jh‐
       search command to verify the validity of the database.

OPTIONS
       -c file
          A configuration file name.

       -db dir
          The name of the database output folder. By default the output folder is named JavaHelpSearch and is created in the current folder.

       -locale lang_country_variant
          The name of the locale as described in java.util.Locale.For example: en_US  (English,  United  States)  or  en_US_WIN  (English,  United
          States, Windows variant).

       -logfile file
          Captures  jhindexer  messages in a specified file. You can use this option to preserve jhindexer output on Win32 machines where the con‐
          sole window is dismissed after execution terminates.

       -nostop words
          Causes stop words to be indexed in the full-text search database.

       -verbose
          Displays verbose messages while processing.

SEE ALSO
       jhsearch (1)

                                                                  June  28, 2007                                                      JHINDEXER(1)
