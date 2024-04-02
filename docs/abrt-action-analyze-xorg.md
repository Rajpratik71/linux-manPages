ABRT-ACTION-ANALYZ(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-ANALYZ(1)



NAME
       abrt-action-analyze-xorg - Calculate and save UUID and duplicate hash for a problem data directory DIR with Xorg backtrace.

SYNOPSIS
       abrt-action-analyze-xorg [-v] [-d DIR]

DESCRIPTION
       The tool reads the file named Xorg.0.log and checks if any black listed module was loaded. If so, not-reportable file is created with an appropriate explanation text. If no black listed module was
       loaded, the tool reads the file named backtrace from a problem data directory record and generates a duplication hash and a universally unique identifier (UUID). Then it saves this data as new
       elements duphash and uuid.

   Integration with ABRT events
       abrt-action-analyze-xorg can be used to generate the duplication hash of a newly discovered Xorg backtraces.

           EVENT=post-create analyzer=Xorg   abrt-action-analyze-xorg

OPTIONS
       -d DIR
           Path to a problem directory. Current working directory is used when this option is not provided.

       -v
           Be more verbose. Can be given multiple times.

FILES
       /etc/abrt/xorg.conf List of modules which, when loaded, should make Xorg crashes non-reportable.

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-ANALYZ(1)
