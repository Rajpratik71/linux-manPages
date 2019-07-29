GETCAP(8)                  System Manager's Manual                  GETCAP(8)

NAME
       getcap - examine file capabilities

SYNOPSIS
       getcap [-v] [-r] [-h] filename [ ... ]

DESCRIPTION
       getcap displays the name and capabilities of each specified

OPTIONS
       -r  enables recursive search.

       -v  enables  to  display all searched entries, even if it has no file-
           capabilities.

       -h  prints quick usage.

       filename
           One file per line.

SEE ALSO
       cap_get_file(3), cap_to_text(3), setcap(8)

                                 12 Nov 2007                        GETCAP(8)
