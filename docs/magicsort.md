MAGICSORT(1)                                                       Magic Rescue                                                       MAGICSORT(1)

NAME
       magicsort - Categorize files by their file(1) magic

SYNOPSIS
       magicsort directory

DESCRIPTION
       Invokes the system's file utility on all files in directory non-recursively.  For each different string that file outputs it will create a
       sub-directory of that name and move the file in there.

SEE ALSO
       magicrescue(1), dupemap(1)

AUTHOR
       Jonas Jensen <jbj@knef.dk>

LATEST VERSION
       This tool is part of Magic Rescue.  You can find the latest version at <http://jbj.rapanden.dk/magicrescue/>

1.1.9                                                               2008-06-26                                                        MAGICSORT(1)
