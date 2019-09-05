shownonascii(1)                                                                            General Commands Manual                                                                            shownonascii(1)



NAME
       shownonascii - View all or part of a mail message in a non-ASCII font

SYNOPSIS
       shownonascii  charset-font-name [-e command-to-execute] file-name(s)

DESCRIPTION
       The  shownonascii  program allows data in non-ASCII character sets to be viewed under X11.    By default, it will open up an xterm using the font named in the first argument, running the "more" com-
       mand to view all of the files named on the command line.

       If the -e switch is used, the rest of the command line will be taken as the command to tell xterm to run instead of more.

       If the MM_CHARSET environment variable is set and matches the character set named in the first argument, a new xterm window will not be opened.

       If the MM_AUXCHARSETS environment variable is set the character set named in the first argument is a subset of that string, a new xterm window will not be opened.

SEE ALSO
       mailto-hebrew(1), mailto(1), metamail(1)

BUGS
       Nope.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission to use, copy, modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission  notice  appear  in  all
       copies,  and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                   shownonascii(1)
