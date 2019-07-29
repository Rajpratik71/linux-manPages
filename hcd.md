HCD(1)                                                        General Commands Manual                                                       HCD(1)

NAME
       hcd - change working HFS directory

SYNOPSIS
       hcd [hfs-path]

DESCRIPTION
       hcd  is used to change the notion of the "current working directory" for the current HFS volume. All subsequent HFS commands will interpret
       filenames relative to this directory, unless absolute pathnames are used.

       If the argument pathname is omitted, hcd will change to the root of the current volume.

SEE ALSO
       hfsutils(1), hpwd(1), hls(1)

FILES
       $HOME/.hcwd

BUGS
       Although absolute pathnames can be given to hcd, the full pathname must match the current volume; it cannot specify a path for a  different
       volume. Use hvol or hmount to change the current volume. (Each volume has its own independent current working directory.)

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            13-Jan-1997                                                             HCD(1)
