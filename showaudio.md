showaudio(1)                                                                               General Commands Manual                                                                               showaudio(1)



NAME
       showaudio - Play an audio email message

SYNOPSIS
       showaudio  file-name(s)

DESCRIPTION
       The showaudio program will allow a user on a properly-equipped workstation to listen to an audio message.  It is intended to be called from mailcap files, typically by the metamail(1) program.

       At  most  sites,  it will work by playing audio on the speaker of the user's computer.  When used in conjunction with special hardware and software not part of the metamail distribution, however, it
       can also deliver the audio information by telephone number.  There are various options to showaudio that support this feature, but they are not documented here since the functionality is not  gener-
       ally available.

SEE ALSO
       audiocompose(1), audiosend(1), metamail(1)

BUGS
       Currently plays audio only on Sun & Sony workstations.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission  to  use,  copy,  modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all
       copies, and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of  Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                      showaudio(1)
