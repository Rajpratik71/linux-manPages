apol(1)                                               SETools: SELinux Policy Analysis Tools                                               apol(1)

NAME
       apol - Graphical SELinux policy analysis tool

SYNOPSIS
       apol [OPTIONS] [POLICY]

DESCRIPTION
       apol is a graphical tool that allows the user to inspect and analyze aspects of an SELinux policy.

POLICY
       apol supports loading SELinux policies in one of two formats.

              source:
                     A single text file containing a monolithic policy source. This file is usually named policy.conf.

              binary:
                     A  single  file  containing  a binary policy. This file is usually named by version on Linux systems, for example, policy.30.
                     This file is usually named sepolicy on Android systems.

       If not provided, apol will start with none loaded.

OPTIONS
       -h, --help
              Print help information and exit.

       --version
              Print version information and exit.

       -v, --verbose
              Print additional informational messages.

       --debug
              Enable debugging output.

AUTHOR
       Chris PeBenito <cpebenito@tresys.com>

BUGS
       Please report bugs via the SETools bug tracker, https://github.com/TresysTechnology/setools/issues

SEE ALSO
       sediff(1), sedta(1), seinfo(1), seinfoflow(1), sesearch(1)

Tresys Technology, LLC                                              2016-02-20                                                             apol(1)
