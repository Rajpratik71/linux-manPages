RNANO(1)                   General Commands Manual                   RNANO(1)

NAME
       rnano - a restricted nano

SYNOPSIS
       rnano [options] [[+line[,column]] file]...

DESCRIPTION
       rnano  runs  the  nano editor in restricted mode.  This allows editing
       only the specified file or files, and doesn't allow the user access to
       the filesystem nor to a command shell.

       In restricted mode, nano will:

       · not read any nanorc files;

       · not allow suspending;

       · not read nor write any file not specified on the command line;

       · not allow saving a file under a different name;

       · not allow appending or prepending to any file;

       · not make backup files nor do spell checking.

OPTIONS
       -h, --help
              Show a summary of command-line options and exit.

       See the nano(1) manpage for all available options.

BUGS
       Please report bugs via https://savannah.gnu.org/bugs/?group=nano.

HOMEPAGE
       https://nano-editor.org/

SEE ALSO
       nano(1)

AUTHOR
       Chris  Allegretta  and  others  (see  the files AUTHORS and THANKS for
       details).  This manual page was originally written by Thijs  Kinkhorst
       for the Debian system (but may be used by others).

January 2018                    version 2.9.3                        RNANO(1)
