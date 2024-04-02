dccleancrw(1)                                                 General Commands Manual                                                dccleancrw(1)

NAME
       dccleancrw - Canon (CRW) RAW photo file recovery utility

SYNOPSIS
       dccleancrw crw_0001.crw crw_0002.crw ...

DESCRIPTION
       Because  they  are  parsed from the end, Canon CRW files become unreadable if garbage data is appended to them, as often happens when files
       are recovered from damaged media.  This program truncates CRW files to the correct size.

SEE ALSO
       dcraw(1)

AUTHOR
       Written by Dave Coffin.
       man page by Steve King for debian.

                                                                   Jun 27, 2006                                                      dccleancrw(1)
