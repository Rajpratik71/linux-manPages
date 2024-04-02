audiocompose(1)                                                                            General Commands Manual                                                                            audiocompose(1)



NAME
       audiocompose - Compose an audio fragment for inclusion in a mail message

SYNOPSIS
       audiocompose  file-name

DESCRIPTION
       The  audiocompose program will allow a user on a properly-equipped workstation to enter an audio fragment which will be written to the named file.  The user will be given the chance to listen to his
       clip after recording it, and to re-record it if he so desires.

       This program is intended primarily to be called from mailcap files by programs like mailto(1).

ENVIRONMENT
       The RECORD_AUDIO environment variable can be set to the name of a program that records audio, sending the digital audio to standard output.

SEE ALSO
       audiosend(1), mailto(1), metamail(1), showaudio(1)

BUGS
       Currently only works on Sun & Sony workstations equipped with microphones.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission to use, copy, modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission  notice  appear  in  all
       copies,  and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                   audiocompose(1)
