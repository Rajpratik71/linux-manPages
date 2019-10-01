MIGSPEED(8)                                                                              Linux Administrator's Manual                                                                             MIGSPEED(8)



NAME
       migspeed - Test the speed of page migration

SYNOPSIS
       migspeed -p pages from-nodes to-nodes

DESCRIPTION
       migspeed attempts to move a sample of pages from the indicated node to the target node and measures the time it takes to perform the move.

       -p pages

       The default sample is 1000 pages. Override that with another number.


NOTES
       Requires an NUMA policy aware kernel with support for page migration (Linux 2.6.16 and later).


COPYRIGHT
       Copyright 2007 Christoph Lameter, Silicon Graphics, Inc.  migratepages is under the GNU General Public License, v.2


SEE ALSO
       numactl(8)




SGI                                                                                               April 2005                                                                                      MIGSPEED(8)
