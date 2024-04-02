extcompose(1)                                                                              General Commands Manual                                                                              extcompose(1)



NAME
       extcompose - Compose a reference to external data for inclusion in a mail message

SYNOPSIS
       extcompose  file-name

DESCRIPTION
       The  extcompose  program will allow a user on a properly-equipped workstation to enter the appropriate data to enable a mail message he is sending to make reference to "external" data, that is, data
       that is not included in the mail message itself  but is otherwise available on the network via a suitable mechanism.

       The user will be prompted for all necessary information.  External data may be referenced as local or AFS files, as files available for FTP (anonymous or authenticated), or as data available  via  a
       mailserver  mechanism.  The user will be asked to provide a MIME content-type value to describe the type of data being referenced, and to specify whether or not the data has been encoded with one of
       the algorithms for encoding data for email.  (Such encoding is not necessary, and is in fact inefficient and silly when used with externally referenced data.)

       This program is intended primarily to be called from mailcap files by programs like mailto(1).

SEE ALSO
       showexternal(1), mailto(1), metamail(1)

COPYRIGHT
       Copyright (c) 1992 Bell Communications Research, Inc. (Bellcore)

       Permission to use, copy, modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission  notice  appear  in  all
       copies,  and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                     extcompose(1)
