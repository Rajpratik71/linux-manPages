ABRT-ACTION-ANALYZ(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-ANALYZ(1)



NAME
       abrt-action-analyze-oops - Calculate and save UUID and duplicate hash for a problem data directory DIR with kernel oops.

SYNOPSIS
       abrt-action-analyze-oops [-v] [-d DIR]

DESCRIPTION
       The tool reads the file named backtrace from a problem data directory, parses it as a kernel oops record and generates a duplication hash and a universally unique identifier (UUID). Then it saves
       this data as new elements duphash and uuid.

   Integration with ABRT events
       abrt-action-analyze-oops can be used to generate the duplication hash of a newly discovered kernel oops.

           EVENT=post-create analyzer=Kerneloops   abrt-action-analyze-oops

OPTIONS
       -d DIR
           Path to a problem directory. Current working directory is used when this option is not provided.

       -v
           Be more verbose. Can be given multiple times.

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-ANALYZ(1)
