showpartial(1)                                                                             General Commands Manual                                                                             showpartial(1)



NAME
       showpartial - Fetch and display the body of a mail message that is included by reference

SYNOPSIS
       showpartial  file id partnum totalnum

DESCRIPTION
       The  showpartial  program  will squirrel away the body of a MIME-format message that is of type "message/partial" for later use.  When it is called on the last piece, it will put the pieces together
       and call metamail to display the full message.  It is intended to be called by metamail via a mailcap entry like the following:

       message/partial; showpartial %s %{id} %{number} %{total}

       The parts are squirrelled away on /tmp, which means that /tmp can fill up if you never get the remaining parts.  When the message is finally displayed, via metamail, the parts are all discarded, and
       the user is asked whether or not to delete the file containing the entire message.

SEE ALSO
       metamail(1)

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission  to  use,  copy,  modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all
       copies, and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of  Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                    showpartial(1)
