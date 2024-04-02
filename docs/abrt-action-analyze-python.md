ABRT-ACTION-ANALYZ(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-ANALYZ(1)



NAME
       abrt-action-analyze-python - Calculate and save UUID and duplicate hash for a problem data directory DIR with Python crash data.

SYNOPSIS
       abrt-action-analyze-python [-v] [-d DIR]

DESCRIPTION
       The tool reads the file named backtrace from a problem data directory, parses it as a Python exception and generates a duplication hash and a universally unique identifier (UUID). Then it saves this
       data as new elements duphash and uuid.

   Integration with ABRT events
       abrt-action-analyze-python can be used to generate the duplication hash of a newly discovered Python crash.

           EVENT=post-create analyzer=Python   abrt-action-analyze-python

OPTIONS
       -d DIR
           Path to a problem directory. Current working directory is used when this option is not provided.

       -v
           Be more verbose. Can be given multiple times.

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-ANALYZ(1)
