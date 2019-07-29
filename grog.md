GROG(1)                                                                                    General Commands Manual                                                                                    GROG(1)



NAME
       grog - guess options for groff command

SYNOPSIS
       grog [-C] [groff-option ...] [--] [filespec ...]
       grog -h | --help
       grog -v | --version

DESCRIPTION
       grog reads the input (file names or standard input) and guesses which of the groff(1) options are needed to perform the input with the groff program.  The corresponding groff command is output.

OPTIONS
       The  only  grog options recognized are -C (which is also passed on) to enable compatibility mode; -v and --version print information on the version number; and -h and --help print usage information.
       -v, --version, -h, and --help stop the program directly without printing a groff command to standard output.

       All other specified short options (words starting with one minus character -) are interpreted as groff options or option clusters with or without argument.  No space is allowed between  options  and
       their argument.  Except from the -marg options, all options will be passed on, i.e. they are included unchanged in the command for the output without effecting the work of grog.

       A filespec argument can either be the name of an existing file or a single minus - to mean standard input.  If no filespec is specified standard input is read automatically.

DETAILS
       grog  reads  all  filespec parameters as a whole.  It tries to guess which of the following groff options are required for running the input under groff: -e, -man, -me, -mm, -mom, -ms, -mdoc, -mdoc-
       old, -p, -R, -g, -G, -s, and -t.  The guessed groff command including those options and the found filespec parameters is put on the standard output.

       It is possible to specify arbitrary groff options on the command line.  These are passed on the output without change, except for the -marg options.

       The groff program has trouble when the wrong -marg option or several of these options are specified.  In these cases, grog will print an error message and exit with an error code.  It is  better  to
       specify no -marg option.  Because such an option is only accepted and passed when grog does not find any of these options or the same option is found.

       If several different -marg options are found by grog an error message is produced and the program is terminated with an error code.  But the output is written with the wrong options nevertheless.

       Remember  that  it  is  not  necessary  to  determine a macro package.  A roff file can also be written in the groff language without any macro package.  grog will produce an output without an -marg
       option.

       As groff also works with pure text files without any roff requests, grog cannot be used to identify a file to be a roff file.

       The groffer(1) program heavily depends on a working grog.

       The grog source contains two files written in different programming languages: grog.pl is the Perl version, while grog.sh is a shell script using awk(1).  During the run of make(1), it is determined
       whether the system contains a suitable version of perl(1).  If so, grog.pl is transformed into grog; otherwise grog.sh is used instead.

EXAMPLES
       ·      Calling

                     grog meintro.me

              results in

                     groff -me meintro.me

              So grog recognized that the file meintro.me is written with the -me macro package.

       ·      On the other hand,

                     grog pic.ms

              outputs

                     groff -pte -ms pic.ms

              Besides determining the macro package -ms, grog recognized that the file pic.ms additionally needs -pte, the combination of -p for pic, -t for tbl, and -e for eqn.

       ·      If both files are combined by the command

                     grog meintro.me pic.ms

              an error message is sent to standard error because groff cannot work with two different macro packages:

                     grog: error: there are several macro packages: -me -ms

              Additionally the corresponding output with the wrong options is printed to standard output:

                     groff -pte -me -ms meintro.me pic.ms

              But the program is terminated with an error code.

       ·      The call of

                     grog -ksS -Tdvi grnexmpl.g

              contains  several groff options that are just passed on the output without any interface to grog.  These are the option cluster -ksS consisting of -k, -s, and -S; and the option -T with argu-
              ment dvi.  The output is

                     groff -ksS -Tdvi grnexmpl.g

              so no additional option was added by grog.  As no option -marg was found by grog this file does not use a macro package.

SEE ALSO
       groff(1), troff(1), tbl(1), pic(1), chem(1), eqn(1), refer(1), grn(1), grap(1), soelim(1), groff_me(7), groff_ms(7), groff_mm(7), groff_mom(7), groff_man(7), groffer(1)

COPYING
       Copyright (C) 1989-2003, 2006, 2007, 2009-2012 Free Software Foundation, Inc.  Written by James Clark.  Maintained by Werner Lemberg ⟨wl@gnu.org⟩.  Rewritten  and  put  under  GPL  by  Bernd  Warken
       <groff-bernd.warken-72@web.de>.

       This file is part of grog, which is part of groff, a free software project.  You can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free
       Software Foundation, either version 2, or (at your option) any later version.

       You should have received a copy of the GNU General Public License along with groff, see the files COPYING and LICENSE in the top directory of the groff source package.  Or read the man page  gpl(1).
       You can also write to the Free Software Foundation, 51 Franklin St - Fifth Floor, Boston, MA 02110-1301, USA.



Groff Version 1.22.2                                                                           07 February 2013                                                                                       GROG(1)
