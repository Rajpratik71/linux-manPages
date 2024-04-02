audiosend(1)                                                                               General Commands Manual                                                                               audiosend(1)



NAME
       audiosend - Send an audio email message

SYNOPSIS
       audiosend  [addr]

DESCRIPTION
       The  audiosend  program will allow a user on a properly-equipped workstation to send an audio fragment as electronic mail.  If an argument is provided, it will be used as the To address.  Otherwise,
       the user will be asked to provide the To address.  In any event, the user will be prompted for the Subject and CC fields.  Audiosend will then let the user record his message.  Afterwards, the  user
       will be given the options of delivering the mail, listening to the message, re-recording the message, or aborting.

ENVIRONMENT
       The RECORD_AUDIO environment variable can be set to the name of a program that records audio, sending the digital audio to standard output.

SEE ALSO
       audiocompose(1), mailto(1), metamail(1), metasend(1), mmencode(1), showaudio(1)

BUGS
       Currently only works on Sun & Sony workstations equipped with microphones.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission  to  use,  copy,  modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all
       copies, and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of  Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                      audiosend(1)
