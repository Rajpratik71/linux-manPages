CHECKBASHISMS(1)                                                                         General Commands Manual                                                                         CHECKBASHISMS(1)

NAME
       checkbashisms - check for bashisms in /bin/sh scripts

SYNOPSIS
       checkbashisms script ...
       checkbashisms --help|--version

DESCRIPTION
       checkbashisms,  based on one of the checks from the lintian system, performs basic checks on /bin/sh shell scripts for the possible presence of bashisms.  It takes the names of the shell scripts
       on the command line, and outputs warnings if possible bashisms are detected.

       Note that the definition of a bashism in this context roughly equates to "a shell feature that is not required to be supported by POSIX"; this means that some issues  flagged  may  be  permitted
       under optional sections of POSIX, such as XSI or User Portability.

       In cases where POSIX and Debian Policy disagree, checkbashisms by default allows extensions permitted by Policy but may also provide options for stricter checking.

OPTIONS
       --help, -h
              Show a summary of options.

       --newline, -n
              Check for "echo -n" usage (non POSIX but required by Debian Policy 10.4.)

       --posix, -p
              Check for issues which are non POSIX but required to be supported by Debian Policy 10.4 (implies -n).

       --force, -f
              Force each script to be checked, even if it would normally not be (for instance, it has a bash or non POSIX shell shebang or appears to be a shell wrapper).

       --extra, -x
              Highlight  lines  which,  whilst  they  do not contain bashisms, may be useful in determining whether a particular issue is a false positive which may be ignored.  For example, the use of
              "$BASH_ENV" may be preceded by checking whether "$BASH" is set.

       --version, -v
              Show version and copyright information.

EXIT VALUES
       The exit value will be 0 if no possible bashisms or other problems were detected.  Otherwise it will be the sum of the following error values:

       1      A possible bashism was detected.

       2      A file was skipped for some reason, for example, because it was unreadable or not found.  The warning message will give details.

       4      No bashisms were detected in a bash script.

SEE ALSO
       lintian(1)

AUTHOR
       checkbashisms was originally written as a shell script by Yann Dirson <dirson@debian.org> and rewritten in Perl with many more features by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                                                       Debian Utilities                                                                            CHECKBASHISMS(1)
