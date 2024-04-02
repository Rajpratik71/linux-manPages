FSLSFONTS(1)                                                  General Commands Manual                                                 FSLSFONTS(1)

NAME
       fslsfonts - list fonts served by X font server

SYNOPSIS
       fslsfonts [-options ...] [-fn pattern]

DESCRIPTION
       fslsfonts  lists  the  fonts  that  match  the  given  pattern.  The wildcard character "*" may be used to match any sequence of characters
       (including none), and "?" to match any single character.  If no pattern is given, "*" is assumed.

       The "*" and "?" characters must be quoted to prevent them from being expanded by the shell.

OPTIONS
       -server servername
               This option specifies the X font server to contact.  servername must be specified in one of the formats defined in the Font  Server
               Names section of X(7).   If not specified, the server name in the FONTSERVER environment variable is used.

       -l      Lists some attributes of the font on one line in addition to its name.

       -ll     Lists font properties in addition to -l output.

       -lll    Supported for compatibility with xlsfonts, but output is the same as for -ll.

       -m      This option indicates that long listings should also print the minimum and maximum bounds of each font.

       -C      This option indicates that listings should use multiple columns.  This is the same as -n 0.

       -1      This option indicates that listings should use a single column.  This is the same as -n 1.

       -w width
               This option specifies the width in characters that should be used in figuring out how many columns to print.  The default is 79.

       -n columns
               This  option  specifies the number of columns to use in displaying the output.  The default is 0, which will attempt to fit as many
               columns of font names into the number of character specified by -w width.

       -u      This option indicates that the output should be left unsorted.

       -version
               This option prints the program version and exits.

ENVIRONMENT
       FONTSERVER
               To get the default fontserver.  The server name must be specified in one of the formats defined in the Font Server Names section of
               X(7).

SEE ALSO
       xfs(1), showfont(1), xlsfonts(1), X(7).

BUGS
       Doing ``fslsfonts -l'' can tie up your server for a very long time.  This is really a bug with single-threaded non-preemptable servers, not
       with this program.

AUTHOR
       Dave Lemke, Network Computing Devices, Inc

X Version 11                                                      fslsfonts 1.0.5                                                     FSLSFONTS(1)
