HUMOUNT(1)                                                    General Commands Manual                                                   HUMOUNT(1)

NAME
       humount - remove an HFS volume from the list of known volumes

SYNOPSIS
       humount [volume-name-or-path]

DESCRIPTION
       humount  is used to forget about an HFS volume previously mounted with hmount.  Either the volume's name or the UNIX path to the volume may
       be used to specify the volume. If no name or path is given, the current volume is assumed.

NOTES
       It is not strictly necessary to use this command. It does not affect any physical volumes; it only updates the  file  named  .hcwd  in  the
       user's home directory used to keep track of the currently known HFS volumes.

SEE ALSO
       hfsutils(1), hmount(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            05-Apr-1996                                                         HUMOUNT(1)
