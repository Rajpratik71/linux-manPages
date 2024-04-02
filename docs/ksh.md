LKSH(1)                                                                                  BSD General Commands Manual                                                                                  LKSH(1)

NAME
     lksh — Legacy Korn shell built on mksh

SYNOPSIS
     lksh [-+abCefhiklmnprUuvXx] [-+o opt] [-c string | -s | file [args ...]]

DESCRIPTION
     lksh is a command interpreter intended exclusively for running legacy shell scripts.  It is built on mksh; refer to its manual page for details on the scripting language.  It is recommended to port
     scripts to mksh instead of relying on legacy or idiotic POSIX-mandated behaviour, since the MirBSD Korn Shell scripting language is much more consistent.

LEGACY MODE
     lksh currently has the following differences from mksh:

     ·   There is no explicit support for interactive use, nor any command line editing or history code.  Hence, lksh is not suitable as a user's login shell, either; use mksh instead.

     ·   The KSH_VERSION string identifies lksh as “LEGACY KSH” instead of “MIRBSD KSH”.  Note that the rest of the version string is identical between the two shell flavours, and the behaviour and differ-
         ences can change between versions; see the accompanying manual page mksh(1) for the versions this document applies to.

     ·   lksh only offers the traditional ten file descriptors to scripts.

     ·   lksh uses POSIX arithmetics, which has quite a few implications: The data type for arithmetics is the host ISO C long data type.  Signed integer wraparound is Undefined Behaviour.  The sign of the
         result of a modulo operation with at least one negative operand is unspecified.  Shift operations on negative numbers are unspecified.  Division of the largest negative number by -1 is Undefined
         Behaviour.  The compiler is permitted to delete all data and crash the system if Undefined Behaviour occurs.

     ·   The rotation arithmetic operators are not available.

     ·   The shift arithmetic operators take all bits of the second operand into account; if they exceed permitted precision, the result is unspecified.

     ·   The GNU bash extension &> to redirect stdout and stderr in one go is not parsed.

     ·   The mksh command line option -T is not available.

     ·   Unless set -o posix is active, lksh always uses traditional mode for constructs like:

               $ set -- $(getopt ab:c "$@")
               $ echo $?

         POSIX mandates this to show 0, but traditional mode passes through the errorlevel from the getopt(1) command.

     ·   Unlike AT&T UNIX ksh, mksh in -o posix or -o sh mode and lksh do not keep file descriptors > 2 private from sub-processes.

SEE ALSO
     mksh(1)

     https://www.mirbsd.org/mksh.htm

     https://www.mirbsd.org/ksh-chan.htm

CAVEATS
     To use lksh as /bin/sh, compilation to enable set -o posix by default is highly recommended for better standards compliance.

     lksh tries to make a cross between a legacy bourne/posix compatibl-ish shell and a legacy pdksh-alike but “legacy” is not exactly specified.

     The set built-in command does not have all options one would expect from a full-blown mksh or pdksh.

     Talk to the MirOS development team using the mailing list at <miros-mksh@mirbsd.org> or the #!/bin/mksh (or #ksh) IRC channel at irc.freenode.net (Port 6697 SSL, 6667 unencrypted) if you need any fur-
     ther quirks or assistance, and consider migrating your legacy scripts to work with mksh instead of requiring lksh.

MirBSD                                                                                          March 21, 2015                                                                                         MirBSD
