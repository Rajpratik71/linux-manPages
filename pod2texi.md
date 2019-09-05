POD2TEXI(1)                                             User Contributed Perl Documentation                                            POD2TEXI(1)

NAME
       pod2texi - convert Pod to Texinfo

SYNOPSIS
         pod2texi [OPTION]... POD...

DESCRIPTION
       Translate Pod file(s) to Texinfo.  There are two basic modes of operation.  First, by default, each pod is translated to a standalone
       Texinfo manual.

       Second, if "--base-level" is set higher than 0, each pod is translated to a file suitable for @include, and one more file with all the
       @includes is generated, intended to be @included in turn within a hand-written top-level file.

OPTIONS
       --appendix-sections
           Use appendix sectioning commands (@appendix, ...) instead of the default numbered sectioning Texinfo @-commands (@chapter, @section,
           ...).

       --base-level=NUM|NAME
           Sets the level of the "head1" commands.  It may be an integer or a Texinfo sectioning command (without the "@"): 1 corresponds to the
           @chapter/@unnumbered level, 2 to the @section level, and so on.  The default is 0, meaning that "head1" commands are still output as
           chapters, but the output is arranged as a standalone manual.

           If the level is not 0, the pod file is rendered as a fragment of a Texinfo manual suitable for @include.  In this case, each pod file
           has an additional sectioning command covering the entire file, one level above the "--base-level" value.  Therefore, to make each pod
           file a chapter in a large manual, you should use "section" as the base level.

           For an example of making Texinfo out of the Perl documentation itself, see "contrib/perldoc-all" in the Texinfo source distribution,
           with output available at <http://www.gnu.org/software/perl/manual>.

       --debug=NUM
           Set debugging level to NUM.

       --help
           Display help and exit.

       --output=NAME
           Name for the first manual, or the main manual if there is a main manual.  Default is to write to standard output.

       --no-section-nodes
           Use anchors for sections instead of nodes.

       --no-fill-section-gaps
           Do not fill sectioning gaps with empty @unnumbered files.  Ordinarily, it's good to keep the sectioning hierarchy intact.

       --preamble=STR
           Insert STR as top boilerplate before includes.  The default is a minimal beginning for a Texinfo document, and sets @documentencoding
           to "utf-8" (because the output is written that way).

       --subdir=NAME
           If there is a main manual with include files (each corresponding to an input pod file), then those include files are put in directory
           NAME.

       --unnumbered-sections
           Use unnumbered sectioning commands (@unnumbered, ...) instead of the default numbered sectioning Texinfo @-commands (@chapter,
           @section, ...).

       --top=TOP
           Name of the @top element for the main manual.  May contain Texinfo code.

       --version
           Display version information and exit.

SEE ALSO
       Pod::Simple::Texinfo.  perlpod.  The Texinfo manual.  Texinfo home page: <http://www.gnu.org/software/texinfo/>

COPYRIGHT
       Copyright 2015 Free Software Foundation, Inc.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

       There is NO WARRANTY, to the extent permitted by law.

AUTHOR
       Patrice Dumas <bug-texinfo@gnu.org>.

perl v5.18.1                                                        2015-02-25                                                         POD2TEXI(1)
