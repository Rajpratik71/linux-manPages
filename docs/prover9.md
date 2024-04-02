PROVER9(1)                                                    General Commands Manual                                                   PROVER9(1)

NAME
       prover9 - resolution/paramodulation theorem prover

SYNOPSIS
       prover9 [options] < input-file > output-file
       prover9 [options] -f input-file > output-file

DESCRIPTION
       This manual page documents briefly the prover9 command.

       prover9  is  an  automated theorem prover for first-order and equational logic. It is a successor of the otter(1) prover.  prover9 uses the
       inference techniques of ordered resolution and paramodulation with literal selection.

OPTIONS
       A summary of options is included below.

       -h     View a list of command-line options.

       -x     Enables an experimental enhanced auto-mode.  For more information consult the prover9 manual.

       -p     Fully parenthesize output.

       -t n   Constrain the search to last about n seconds.  For UNIX-like systems, the `user CPU' time is used.

       -f file
              Take input from file instead of from standard input.

SEE ALSO
       mace4(1), otter(1).
       On Debian systems, the manual is found in the prover9-doc package, at /usr/share/doc/prover9-doc/manual/index.html.

AUTHOR
       prover9 was written by William McCune <mccune@cs.unm.edu>

       This manual page was written by Peter Collingbourne <peter@pcc.me.uk>, for the Debian project (but may be used by others).

                                                                  August 12, 2007                                                       PROVER9(1)
