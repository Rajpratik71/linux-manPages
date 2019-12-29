RNANO(1)                                General Commands Manual                               RNANO(1)

NAME
       rnano - a restricted nano

SYNOPSIS
       rnano [options] [[+line[,column]] file]...

DESCRIPTION
       rnano  runs the nano editor in restricted mode.  This allows editing only the specified file or
       files, and doesn't allow the user access to the filesystem nor to a command shell.

       In restricted mode, nano will:

       • not allow suspending;

       • not allow saving the current buffer under a different name;

       • not allow inserting another file or opening a new buffer;

       • not allow appending or prepending to any file;

       • not make backup files nor do spell checking.

OPTIONS
       -h, --help
              Show the available command-line options and exit.

       For all existing options, see the nano(1) man page.

BUGS
       Please report bugs via https://savannah.gnu.org/bugs/?group=nano.

HOMEPAGE
       https://nano-editor.org/

SEE ALSO
       nano(1)

October 2019                                  version 4.5                                     RNANO(1)
