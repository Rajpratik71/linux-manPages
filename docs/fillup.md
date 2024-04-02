FILLUP(8)                                                                                  System Manager's Manual                                                                                  FILLUP(8)



NAME
       fillup - the SuSE tool for merging config files

SYNOPSIS
       fillup [options] basefile addfile outputfile

       fillup [options] basefile addfile

       fillup -V|--version ...

       fillup -h|--help ...

DESCRIPTION
       fillup - merges input files into one resulting output file. Usually, each file is a configuration file.

       fillup  merges  files  which  are  holding  variables (ie configuration or environment variables).  A variable is defined by an entity composed of a preceding comment, a variable name, an assignment
       delimiter, and a related variable value.  A variable is determined by its variable name.

       A preceding comment is optional.  An assignment delimiter may be optional, but if there is an assignment delimiter, a variable name must precede it.  The last entity may be composed only of  a  com-
       ment.

       Only  if  variables  are  included in both input files (basefile and addfile) fillup has to select one of the variables.  Otherwise, if variables are included only in one of the input files they are
       added to the resulting output file (with the exception of the -i|--ignoreDefinites option).

       The functionality is now controlled by a parameter which determines whether a variable included both in the basefile and in the addfile is taken from the former or from the latter.   Furthermore,  a
       parameter controls whether the variable is removed from a copy of the basefile.

       To keep the fillup v1.04 functionality, the outputfile parameter can be omitted -- this means the resulting output file is named exactly like the first input file name (basefile = outputfile).

       If variables should be removed from the basefile, the basefile is not touched, but the result is written to basefile.new.

       If basefile includes a header as part of the first variable this header is preserved only for the outputfile if after the header an empty line follows.

       Starting  with version 1.20 handling of metadata for /etc/sysconfig files is included.  Metadata is part of preceding comment, each metadata line begins with double hash ("##"). A metadata line con-
       tains a pair <keyword>:<value>. The value itself can be described on several lines, each beginning with double hash and the optional keyword.

EXAMPLES
       fillup -m "/etc/rc.config" "my.config" "/etc/rc.config"

       All variables of "/etc/rc.config" are passed to the resulting output file "/etc/rc.config".  Variables defined only within "my.config" are appended.


       fillup -exchange "/etc/rc.config" "my.config"

       Only variables of "/etc/rc.config" that are not also defined within "my.config" are passed to the resulting output file "/etc/rc.config".  All variables of "my.config" are appended.


       fillup -m -r "/etc/rc.config" "my.config" "/etc/rc.config"

       All variables of "/etc/rc.config" are passed to the resulting output file "/etc/rc.config".  Variables defined only within "my.config" are appended.  The additional parameter '-r' removes  variables
       defined more than once from a copy of "/etc/rc.config".  "/etc/rc.config" isn't touched and the result of the removal is written to "/etc/rc.config.new".


       fillup -i "/etc/rc.config" "my.config"

       This  is a filter functionality. Variables of "/etc/rc.config" are only passed to the resulting output file "/etc/rc.config" if they are defined in both input files.  Because "my.config" is normally
       only a list of variable names from "/etc/rc.config", this is named filter functionality.  Additionally variables of "my.config" are appended if they are defined only in "my.config".

OPTIONS
       There are many options, which are displayed if fillup is called without or with the -h or --help option.

       Most of the parameters are based on v1.04. In the sequel only useful parameters are listed:

         -i, --ignoreDefinites    filter functionality
         -t, --trailing           save trailing comment
         -v, --verbose            maximum output to screen
         -V, --version            print fillup version and exit
         -c | --char <char>       use <char> as comment marker
         -d | --delim <char>      use <char> as delimiter

         -m, --maintain           maintaining the basefile
         -x, --exchange           exchanging the basefile
         -r, --remove             removing within a copy

EXIT CODE
       fillup returns EXIT_SUCCESS on successful completion.  Otherwise, an exception handler is called, which may return EXIT_FAILURE;

BUGS
       If a bug occurs which is not based on invalid options or missing input files, please add the option -v|--verbose to the call. The result and some classifications are displayed to locate the bug.

       With handlung of metadata and thus replacement of information within files a hardly documented debugging feature is introduced by adding two options on command  line:  information  about  a  special
       variable (given by --variable <variable name>) is logged into a special file (determined by --logfile <file name>).

COPYRIGHT
       fillup is copyright 1996,1997,1998,1999,2000,2001 by SuSE GmbH, Germany.  fillup is copyright 2002,2003 by SuSE Linux AG, Germany.

       There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AUTHOR
         Martin Scherbaum, maddin@suse.de (v1.04, 1996)
         Joerg Dippel,     jd@suse.de     (v1.05, 1998)
         Joerg Dippel,     jd@suse.de     (v1.06, 2000)
         Joerg Dippel,     jd@suse.de     (v1.10, 2002)
         Joerg Dippel,     jd@suse.de     (v1.21, 2003)




fillup                                                                                             Jan 2002                                                                                         FILLUP(8)
