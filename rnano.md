RNANO(1)                                                                                 General Commands Manual                                                                                 RNANO(1)

NAME
       rnano - Restricted mode for Nano's ANOther editor, an enhanced free Pico clone

SYNOPSIS
       rnano [options] [[+line,column] file]...

DESCRIPTION
       nano is a small, free and friendly editor which aims to replace Pico, the default editor included in the non-free Pine package.  On top of copying Pico's look and feel, nano also implements some
       missing (or disabled by default) features in Pico, such as "search and replace" and "go to line and column number".

       rnano is a restricted version of nano, which only edits specific files and doesn't allow the user access to the filesystem or a command shell.

       In restricted mode, nano will not:

       · read or write to any file not specified on the command line;

       · read any nanorc files;

       · allow suspending;

       · allow a file to be appended to, prepended to, or saved under a different name;

       · use backup files or spell checking.

OPTIONS
       -h, --help
              Show a summary of command-line options and exit.

       -V, --version
              Show the current version number and exit.

       See the nano(1) manpage for all of the possible options.

BUGS
       Please send any comments or bug reports to nano@nano-editor.org.

       The nano mailing list is available from nano-devel@gnu.org.

       To subscribe, email to nano-devel-request@gnu.org with a subject of "subscribe".

HOMEPAGE
       http://www.nano-editor.org/

AUTHOR
       Chris Allegretta <chrisa@asty.org>, et al (see the file AUTHORS for details).  This manual page was originally written by Thijs Kinkhorst <thijs@kinkhorst.com>, for the Debian system (but may be
       used by others).

February 2016                                                                                 version 2.5.3                                                                                      RNANO(1)
