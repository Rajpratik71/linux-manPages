showpicture(1)                                                                             General Commands Manual                                                                             showpicture(1)



NAME
       showpicture - View an image received in the mail

SYNOPSIS
       showpicture  [-viewer program-name] file-name(s)

DESCRIPTION
       The  showpicture  program  will  allow  a user on a properly-equipped workstation to view a picture using the xloadimage(1) program.  It is intended to be called from mailcap files, typically by the
       metamail(1) program.

       By default, the program used to display pictures under X11 is "xloadimage -view -quiet -geometry +1+1".  This can be overridden either by the environment variable X_VIEWER or by the -viewer  command
       line option.

SEE ALSO
       metamail(1)

BUGS
       Doesn't do much if you're not running X11.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission  to  use,  copy,  modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all
       copies, and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of  Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                    showpicture(1)
