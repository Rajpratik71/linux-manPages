showexternal(1)                                                                            General Commands Manual                                                                            showexternal(1)



NAME
       showexternal - Fetch and display the body of a mail message that is included by reference

SYNOPSIS
       showexternal  body-file access-type name [site [directory [mode [server]]]]

DESCRIPTION
       The showexternal program will attempt to obtain the real body of a mail message that is included only by reference, using the MIME type "message/external-body".  It is intended to be called by meta-
       mail via a mailcap entry like the following:

       message/external-body; showexternal %s %{access-type} %{name} %{site} %{directory} %{mode} %{server} ; needsterminal

       If it succeeds in fetching the message body, showexternal will then call metamail to actually display it.

SEE ALSO
       metamail(1)

ENVIRONMENT
       The FTP environment variable can override "ftp" as the name of the ftp program.

BUGS
       Not the greatest error handling in the world.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission to use, copy, modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission  notice  appear  in  all
       copies,  and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                   showexternal(1)
