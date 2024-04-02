HUGEEDIT(7)                                                                            Miscellaneous Information Manual                                                                           HUGEEDIT(7)



NAME
       hugeedit - Set default policy for backing text and data with hugepages

SYNOPSIS
       hugeedit binary
       hugeedit [options] binary

DESCRIPTION
       hugectl runs processes with a specific policy for backing memory regions with hugepages. Ordinarily when processes are relinked with libhugetlbfs using the recommended linking method, either hugectl
       is required on each execution or environment variables must be set for each execution. hugeedit can be used to set bits in the ELF header that determine if the text or data segments  are  backed  by
       default without further intervention.

       If no arguments are specified, hugeedit will display what the current defaults for each segment in a binary are. The available options are


       --text Back the text segments of the binary by default.


       --data Back the data segments of the binary by default


       --disable
              Back all segments using small pages by default


SEE ALSO
       oprofile(1), libhugetlbfs(7), hugectl(8)

AUTHORS
       libhugetlbfs was written by various people on the libhugetlbfs-devel mailing list.




                                                                                               October 8, 2008                                                                                    HUGEEDIT(7)
