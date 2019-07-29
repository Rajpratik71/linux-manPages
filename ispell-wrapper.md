ISPELL-WRAPPER(1)                                                                                                                ISPELL-WRAPPER(1)

NAME
       ispell-wrapper - smart wrapper for ispell

SYNOPSIS
        ispell-wrapper [--emacs=name] [--language=regexp] [--dry-run] [ispell options] file

          Options (all long only options):
           --emacs=name           Set the language to use by emacs dict name
           --language=regexp      Set the language to use by name
           --dry-run              Only show what would have done

DESCRIPTION
       ispell-wrapper is a wrapper script for ispell intended to be used in a Debian system in conjunction with the infrastructure introduced by
       the dictionaries-common package. Option --dry-run will show the string to be run without doing anything else.

       It automatically sets the -d, -w, and -T options to ispell as a function of the chosen language.  Of course, this only works for dictionary
       packages that comply with the above mentioned Policy.

       Here is how the language is defined (in order of priority):

       1)  By matching the emacs dict name given in --emacs option to the name of one of the emacs dicts names provided by installed languages in
           the system. This match must be exact (although is case insensitive).  Note that this will override any value given in the --language
           option.

       2)  By matching the regexp given in option --language to the list of installed languages in the system.

       3)  By matching the regexp stored in the environment variable ISPELLDEFAULT to the list of installed languages in the system.

       4)  By using the value stored in the user-specific file ~/.ispell-default (use select-default-iwrap(1) to set it).

       5)  By using the value stored in the site-wide file /etc/dictionaries-common/ispell-default (use select-default-ispell(8) as superuser to
           set it).

       Note: regexp matches are case-insensitive and the ISO-8859-1 special characters are transformed into their ASCII equivalents.  German ess-
       zet is equivalent to the character "s" and the ae ligature to the character "e".

EXAMPLE
       Let us say that the following dictionaries are installed in the system (as appearing in the Debconf question at installation time):

           castellano (Spanish TeX mode)
           castellano8 (Spanish 8 bit)
           português (European Portuguese)
           português brasileiro (Brazilian Portuguese)

       Choosing the regexp (either in the --language option or in the environment variable ISPELLDEFAULT) to be "span" will yield an error, since
       two languages will match ("castellano" and "castellano8").  However, if the regexp is "span.*8", the language "castellano8 (Spanish 8 bit)"
       will be chosen.

ENVIRONMENT
       ISPELLDEFAULT
           Regexp that matches the name of the default language to use, if no --language option is given.

FILES
       $HOME/.ispell-default
           Contains the name of the language to use, if no --language option is given or if the ISPELLDEFAULT environment variable is not set.
           This is a user-specific choice.

       /etc/dictionaries-common/ispell-default
           Name of the language to use when everything above is not set. This is a system-wide setting.

SEE ALSO
       select-default-ispell(8), select-default-iwrap(1)

AUTHORS
       Rafael Laboissiere

1.27.2~ubuntu16.04.1~c42.ppa1                                       2017-12-18                                                   ISPELL-WRAPPER(1)
