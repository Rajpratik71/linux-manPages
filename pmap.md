PMAP(1)                                                                                      Linux User's Manual                                                                                      PMAP(1)



NAME
       pmap - display information about process memory mappings


SYNOPSIS
       pmap [ -d | -q | -h | -V | -A low,high ] pid [...]


DESCRIPTION
       pmap(1) displays information about a process's memory mappings, such as its stack, data segment, mapped files, and so on.

       The  pmap(1)  utility will show, for each mapping of a given process, the starting byte address in the process's address space, the size, the RSS (size of the mapping in physical memory), the amount
       of dirty pages, the permission, the device node, the offset, and the file backing the mapping, if any.

       As the last line of output, the pmap(1) utility will tally up the total size of all mappings as well as show the total size of writable/private mappings and of shared mappings.


OPTIONS
       -x, --extended
              Ignored as this version of pmap always does extended process memory mappings.

       -d, --device
              Display major and minor device numbers.

       -A, --limit=low,high
              Limit results to the given range to low and high address range. Notice that the low and high arguments are single string separated with comma.

       -q, --quiet
              Hide header and memory statistics.

       -h, --help
              Show pmap usage.

       -V, --version
              Display version information.


EXIT STATUS
              0      Success.
              1      Failure.
              42     Did not find all processes asked for.


FILES
       /proc/pid/maps and /proc/pid/smaps -- memory mapping information


SEE ALSO
       ps(1), top(1), free(1), vmstat(1)


AUTHORS
       Written by Chris Rivera, Robert Love, and Werner Fink.


REPORTING BUGS
       This version of pmap even if part of procps-ng is specific for SUSE, therefore report bugs to ⟨http://www.suse.de/feedback⟩.



Linux                                                                                            12 Oct 2005                                                                                          PMAP(1)
