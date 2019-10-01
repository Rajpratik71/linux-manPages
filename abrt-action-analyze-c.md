ABRT-ACTION-ANALYZ(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-ANALYZ(1)



NAME
       abrt-action-analyze-c - Calculate and save UUID for a problem data directory DIR with coredump.

SYNOPSIS
       abrt-action-analyze-c [-v] [-d DIR]

DESCRIPTION
       The tool reads the file named coredump from a problem data directory, processes it and generates a universally unique identifier (UUID). Then it saves this data as new element uuid.

   Integration with ABRT events
       abrt-action-analyze-c can be used to generate the UUID of a newly saved coredump.

           EVENT=post-create analyzer=CCpp   abrt-action-analyze-c

OPTIONS
       -d DIR
           Path to a problem directory. Current working directory is used when this option is not provided.

       -v
           Be more verbose. Can be given multiple times.

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-ANALYZ(1)
