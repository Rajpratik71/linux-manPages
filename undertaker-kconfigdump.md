UNDERTAKER-KCONFIGDUMP(1)                                          User Commands                                         UNDERTAKER-KCONFIGDUMP(1)

NAME
       undertaker-kconfigdump - get a configuration dump from a Linux kernel tree

SYNOPSIS
       undertaker-kconfigdump

DESCRIPTION
       This  script should be run with the current directory set to the top level of a Linux kernel source tree.  It extracts information from the
       Kconfig files, and processes that information to produce a model.

ENVIRONMENT VARIABLES
       MODELS If set, the directory where models are placed.  Default: "model".

       DEBUG  If set (to any value), print some debug information.

AUTHOR
       Written by the VAMOS team <URL:http://vamos.informatik.uni-erlangen.de>

REPORTING BUGS
       Report bugs to <vamos-dev@i4.informatik.uni-erlangen.de>.

SEE ALSO
       undertaker(1) undertaker-kconfigdump(1), undertaker-linux-tree(1).

Undertaker                                                              1.1                                              UNDERTAKER-KCONFIGDUMP(1)
