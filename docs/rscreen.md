RSCREEN(1)                                                    General Commands Manual                                                   RSCREEN(1)

NAME
       rscreen - monitor and restart remote screen session

SYNOPSIS
       rscreen [autossh or ssh options] <[user@]host>

       ruscreen [autossh or ssh options] <[user@]host>

       rtmux [autossh or ssh options] <[user@]host>

DESCRIPTION
       rscreen/ruscreen/rtmux is a script to use autossh to open up a remote screen, screen -U or tmux session, or reconnect to an existing one.

       Based  on  autossh's  original rscreen example script as installed on Debian systems into /usr/share/doc/autossh/examples/rscreen, but with
       more generally usable defaults.

       ruscreen and rtmux are just symbolic links to the rscreen script and the script checks under which name it has been called.

SEE ALSO
       ssh(1), autossh(1), screen(1), tmux(1)

AUTHOR
       rscreen was written by Carson Harding (2002) and Axel Beckert (2011).

COPYRIGHT
       Redistribution and use in source and binary forms, with or without modification, are freely permitted.

                                                                                                                                        RSCREEN(1)
