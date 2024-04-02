UNXRANDR(1)                                                                                                                            UNXRANDR(1)

NAME
       unxrandr - inverse tool of xrandr

SYNOPSIS
       unxrandr

DESCRIPTION
       unxrandr  is a tool that queries the XRandR state using ARandR's libraries and outputs an xrandr command line that reproduces the state (as
       far as it is supported by the library).

       The command
          sh -c "unxrandr"

       should never modify the configured state.

       It takes no options apart from --help and --version.

SEE ALSO
       man 1 arandr

AUTHOR
       chrysn <chrysn@fsfe.org>

                                                                    2011-10-01                                                         UNXRANDR(1)
