LINTIAN-LAB-TOOL(1)         Debian Package Checker        LINTIAN-LAB-TOOL(1)

NAME
       lintian-lab-tool - perform common operations on/involving laboratories

SYNOPSIS
       lintian-lab-tool <cmd> <lab> [...]

       lintian-lab-tool help

DESCRIPTION
       The lintian-lab-tool ...

OPERATIONS
       create-lab laboratory-dir
           Creates a new permanent Lintian laboratory in the directory
           denoted by laboratory-dir.

       help [cmd]
           Display the synopsis of this tool or one of its operations.

       remove-lab laboratory-dir
           Removes a permanent Lintian laboratory in the directory denoted by
           laboratory-dir.

       remove-pkgs laboratory-dir query [... query]
           Removes all packages matching the given queries from the permanent
           Lintian laboratory denoted by laboratory-dir.

       scrub-lab laboratory-dir
           Attempt to fix common metadata issues in an existing laboratory.

           This command can correct some corruptions caused by programs that
           failed to synchronize the laboratory metadata with the actual
           contents.  Almost all corrections involve discarding corrupted
           entries.

           These issues usually occur because:

           ·   Two processes update the laboratory concurrently.

           ·   A process updated the laboratory but was killed / crashed
               before it properly close the laboratory.

           Note that Lintian tools will fix these issues automatically as the
           tools happen to run into the issues.

CAVEAT
       Laboratories are not designed to have multiple processes working on
       them concurrently.

SEE ALSO
       lintian(1)

AUTHORS
       Niels Thykier <niels@thykier.net>

       Richard Braakman <dark@xs4all.nl>

       Christian Schwarz <schwarz@monet.m.isar.de>

Lintian v2.5.81ubuntu1            2018-04-08              LINTIAN-LAB-TOOL(1)
