DCMD(1)                                                                                  General Commands Manual                                                                                  DCMD(1)

NAME
       dcmd - expand file lists of .dsc/.changes files in the command line

SYNOPSIS
       dcmd [options] [command] [changes-file|dsc-file] ...

DESCRIPTION
       dcmd  replaces  any  reference  to  a .dsc or .changes file in the command line with the list of files in its 'Files' section, plus the file itself.  It allows easy manipulation of all the files
       involved in an upload (for .changes files) or a source package (for .dsc files).

       If command is omitted (that is the first argument is an existing .dsc or .changes file), the expanded list of files is printed to stdout, one file by line. Useful for usage in backticks.

OPTIONS
       There are a number of options which may be used in order to select only a subset of the files listed in the .dsc or .changes file. If a requested file is not found,  an  error  message  will  be
       printed.

       --dsc         Select the .dsc file.

       --schanges    Select .changes files for the 'source' architecture.

       --bchanges    Select .changes files for binary architectures.

       --changes     Select .changes files. Implies --schanges and --bchanges.

       --archdeb     Select architecture-dependent binary packages (.deb files).

       --indepdeb    Select architecture-independent binary packages (.deb files).

       --deb         Select binary packages (.deb files). Implies --archdeb and --indepdeb.

       --archudeb    Select architecture-dependent .udeb binary packages.

       --indepudeb   Select architecture-independent .udeb binary packages.

       --udeb        Select .udeb binary packages. Implies --archudeb and --indepudeb.

       --tar, --orig Select the upstream .tar file.

       --diff, --debtar
                     Select the Debian .debian.tar or .diff file.

       Each option may be prefixed by --no to indicate that all files not matching the specification should be selected.

       It is not possible to combine positive filtering options (e.g. --dsc) and negative filtering options (e.g. --no-changes) in the same dcmd invocation.

       --no-fail-on-missing, -r
              If any of the requested files were not found, do not output an error.

       --package, -p
              Output package name part only.

       --sort, -s
              Sort output alphabetically.

       --tac, -t
              Reverse output order.

EXAMPLES
       Copy the result of a build to another machine:

       $ dcmd scp rcs_5.7-23_amd64.changes elegiac:/tmp
       rcs_5.7-23.dsc                  100%  490     0.5KB/s   00:00
       rcs_5.7-23.diff.gz              100%   12KB  11.7KB/s   00:00
       rcs_5.7-23_amd64.deb            100%  363KB 362.7KB/s   00:00
       rcs_5.7-23_amd64.changes        100% 1095     1.1KB/s   00:00
       $

       $ dcmd --diff --deb scp rcs_5.7-23_amd64.changes elegiac:/tmp
       rcs_5.7-23.diff.gz              100%   12KB  11.7KB/s   00:00
       rcs_5.7-23_amd64.deb            100%  363KB 362.7KB/s   00:00
       $

       Check the contents of a source package:

       $ dcmd md5sum rcs_5.7-23.dsc
       8fd09ea9654cda128f8d5c337d3b8de7  rcs_5.7.orig.tar.gz
       f0ceeae96603e823eacba6721a30b5c7  rcs_5.7-23.diff.gz
       5241db1e231b1f43ae5514b63d2523f8  rcs_5.7-23.dsc
       $

       $ dcmd --no-diff md5sum rcs_5.7-23.dsc
       8fd09ea9654cda128f8d5c337d3b8de7  rcs_5.7.orig.tar.gz
       5241db1e231b1f43ae5514b63d2523f8  rcs_5.7-23.dsc
       $

SEE ALSO
       dpkg-genchanges(1), dpkg-source(1)

AUTHOR
       This program was written by Romain Francoise <rfrancoise@debian.org> and is released under the GPL, version 2 or later.

DEBIAN                                                                                       Debian Utilities                                                                                     DCMD(1)
