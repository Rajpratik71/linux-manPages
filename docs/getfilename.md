getfilename(1)                                                                             General Commands Manual                                                                             getfilename(1)



NAME
       getfilename - Ask the user to name a file in a given format

SYNOPSIS
       getfilename  format-name file-name

DESCRIPTION
       The getfilename program will ask the user for the name of a file in the specified format, and will copy that file to the file-name given as the second argument.

       If  this doesn't sound very useful by itself, you're right.  However, this turns out to be all you need in order to add some useful functionality to mailcap-oriented programs such as mailto(1).  For
       example, the following line in a mailcap file allows mailto to help the user include PostScript in outgoing mail:

       application/postscript ; lpr -Pipa %s ; description="Include a Postscript File";compose="getfilename Postscript %s"


SEE ALSO
       mailto(1), metamail(1)

BUGS
       This is such a tiny program it might actually be bug-free, but I wouldn't bet on it.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission to use, copy, modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission  notice  appear  in  all
       copies,  and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                    getfilename(1)
