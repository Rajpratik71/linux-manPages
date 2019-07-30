SRCREDACT(1)                                                                            Text tools                                                                           SRCREDACT(1)

NAME
       srcredact - a program for redaction of text files

SYNOPSIS
       srcredact [OPTIONS] -e audience [full_file]

       srcredact [OPTIONS] -u audience full_file [redacted_file]

       srcredact -l [full_file]

       srcredact -h|-v

DESCRIPTION
       srcredact is the program to extract ``redacted versions'' of the master file (option -e) or to incorporate the changes in the redacted versions into the master file
       (``unredact'', option -u).

       The master file consists of chunks intended for different audiences.  Each audience has a name, e.g. "classified", "unclssified", "expert" etc.  Chunks are started and stopped by
       guard lines.  Each guard line has the format (for the default TeX syntax)

         %<*name1|name2|...>

       or

         %</name1|name2|...>

       In the first cases the text following the guard is included for the audiences "name1", "name2", ....  In the second case it is excluded for these audiences.

       THere is a special audience "ALL": a wild card for all audiences.  Thus the idiom

         %</ALL>
         %<*classified>

       means that the chunk is excluded for all audiences but "classified"

       Exactly one of the options  -e (extract) or -u (unextract) must be present.  In  the extract mode the  non-option argument is  the name of the full file.   If it is absent, or is
       "-",  standard input is used.  In the unextract mode the first non-option argument

OPTIONS
       -c list of comment patterns
           Use the given pattern for comment lines to search for guards instead of the default "TeX" pattern.  The recognized patterns are:

           c
                 /*<guard>*/

           cpp
                 //<guard>

           fortran
                 C<guard>

           shell
                 #<guard>

           TeX
                 %<guard>

           The pattern names should be separated by commas, and the list may be enclosed in quotes to prevent shell expansion, e.g

             -c "TeX, c, shell"

       -d  Debug mode on.

       -e audience
           Extract the contents for the current audience into the file file.  The cuurent audience is guessed from the file name, if the latter has the structure
           base-audience.extension, e.g. "report-unclassified.tex".  The key -a overrides this guess and should be used if the file name does not follow this pattern.  The file name "-"
           means the standard output.

       -h  Print help information and exit.

       -l  List all audiences set in the file (one per line) and exit.

       -u audience
           Take a edited file intended for the audience (the second non-option argument) and incorporate the changes in it into the full file (the first non-option argument).  If the
           second argument is missing, standard input is used instead.  As usual, "-" also means standard input.  Note that only one of the two file arguments in this case can be
           standard input.

       -v  Print version information and exit.

       -w on|off|1|0|true|false
           If "on", 1 or "true" (the deafult), implicitly wrap the full document into the guards

            %<*ALL>
            ...
            %</ALL>

RETURN VALUE
       The program returns 0 if successful, 1 if conflicts were found in the "unextract" mode and 2 in case of problems.

CONFLICTS IN UNEXTRACT MODE
       Like the standard diff3(1) tool, the program may find conflicts between the full version and the edited one in the -u mode.  Then the resulting file brackets the conflicts in the
       usual manner, e.g.

         <<<<<<< /tmp/BrjXo0hMOB/full
         %</nobonds>
         Forty-five tons best old dry government bonds, suitable for furnace, gold
         7 per cents., 1864, preferred.
         %<*nobonds>
         ||||||| /tmp/BrjXo0hMOB/extracted
         Forty-five tons best old dry government bonds, suitable for furnace, gold
         7 per cents., 1864, preferred.
         =======
         >>>>>>> /tmp/BrjXo0hMOB/new

       Here "full" is the full document, "extracted" is the extracted file for the given audience, "new" is the edited file.

AUTHOR
       Boris Veytsman, borisv@lk.net

       This work was commissioned by Consumer Financial Protection Bureau, United States Treasury.

LICENSE AND COPYRIGHT
       Copyright (C) 2015 Boris Veytsman.  Version 1.0

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either
       version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
       PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
       Boston, MA 02110-1301, USA

1.0                                                                                     2015-10-24                                                                           SRCREDACT(1)
