HVOL(1)                                                       General Commands Manual                                                      HVOL(1)

NAME
       hvol - display or change the current HFS volume

SYNOPSIS
       hvol [volume-or-path]

DESCRIPTION
       With  no  arguments,  hvol  displays the name and path to the "current" HFS volume as well as the names and paths of all previously mounted
       ("known") volumes.

       With an argument, hvol changes the current volume to be the one specified. Either the name of the volume or the path to its UNIX source can
       be specified. The volume must have been previously mounted using hmount.

       A separate "current working directory" is maintained for each mounted volume.  This information is kept in a file named .hcwd in the user's
       home directory.

SEE ALSO
       hfsutils(1), hmount(1), humount(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            21-Apr-1996                                                            HVOL(1)
