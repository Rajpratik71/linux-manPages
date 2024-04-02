PAGESIZE(1)                                                                                General Commands Manual                                                                                PAGESIZE(1)



NAME
       pagesize - Print supported system page sizes

SYNOPSIS
       pagesize [options]

DESCRIPTION
       The pagesize utility prints the page sizes of a page of memory in bytes, as returned by getpagesizes(3). This is useful when creating portable shell scripts, configuring huge page pools with hugeadm
       or launching applications to use huge pages with hugectl.

       If no parameters are specified, pagesize prints the system base page size as returned by getpagesize(). The following parameters affect what other pagesizes are displayed.


       --huge-only, -H

              Display all huge pages supported by the system as returned by gethugepagesizes().


       --all, -a

              Display all page sizes supported by the system.


SEE ALSO
       oprofile(1), getpagesize(2), getpagesizes(3), gethugepagesizes(3), hugectl(7), hugeadm(7), libhugetlbfs(7)


AUTHORS
       libhugetlbfs was written by various people on the libhugetlbfs-devel mailing list.




                                                                                               October 10, 2008                                                                                   PAGESIZE(1)
