RNANO(1)                                                                                   General Commands Manual                                                                                   RNANO(1)



NAME
       rnano - Restricted mode for Nano's ANOther editor, an enhanced free Pico clone


SYNOPSIS
       rnano [OPTIONS] [[+LINE,COLUMN] FILE]...


DESCRIPTION
       This manual page briefly documents the rnano command.

       nano  is  a  small, free and friendly editor which aims to replace Pico, the default editor included in the non-free Pine package. Rather than just copying Pico's look and feel, nano also implements
       some missing (or disabled by default) features in Pico, such as "search and replace" and "go to line and column number".

       rnano is a restricted version of nano, which only edits specific files and doesn't allow the user access to the filesystem or a command shell.

       In restricted mode, nano will not:

       · read or write to any file not specified on the command line;

       · read any nanorc files;

       · allow suspending;

       · allow a file to be appended to, prepended to, or saved under a different name;

       · use backup files or spell checking.


OPTIONS
       +LINE,COLUMN
              Places cursor at line number LINE and column number COLUMN (at least one of which must be specified) on startup, instead of the default of line 1, column 1.

       -?     Same as -h (--help).

       -h (--help)
              Show a summary of command line options and exit.

       -V (--version)
              Show the current version number and exit.

       See the nano(1) manpage for the complete documentation of nano.


BUGS
       Please send any comments or bug reports to nano@nano-editor.org.

       The nano mailing list is available from nano-devel@gnu.org.

       To subscribe, email to nano-devel-request@gnu.org with a subject of "subscribe".


HOMEPAGE
       http://www.nano-editor.org/


AUTHOR
       Chris Allegretta <chrisa@asty.org>, et al (see AUTHORS for details).  This manual page was originally written by Thijs Kinkhorst <thijs@kinkhorst.com>, for the Debian system (but may be used by oth‐
       ers).



August 23, 2007                                                                                 version 2.0.0                                                                                        RNANO(1)
