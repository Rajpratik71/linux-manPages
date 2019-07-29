SHTOOLIZE.TMP(1)                                              GNU Portable Shell Tool                                             SHTOOLIZE.TMP(1)

NAME
       shtoolize - Build individual GNU shtool scripts

VERSION
       GNU shtool 2.0.8 (18-Jul-2008)

SYNOPSIS
       shtoolize [-h] [-v] [-q] [-o script] module [ module ... ]

DESCRIPTION
       The shtoolize program builds individual GNU shtool scripts (written to the default output file "shtool" or to the specified script) out of
       one or more shtool ingredient modules.  Available modules are:

        echo       Print string with optional construct expansion
        mdate      Pretty-print modification time of a file or dir
        table      Pretty print a field-separated list as a table
        prop       Display progress with a running propeller
        move       Move files with simultan substitution
        install    Install a program, script or datafile
        mkdir      Make one or more directories
        mkln       Make link with calculation of relative paths
        mkshadow   Make a shadow tree
        fixperm    Fix file permissions inside a source tree
        rotate     Rotate a logfile
        tarball    Roll distribution tarballs
        subst      Apply sed(1) substitution operations
        platform   Platform identification utility
        arx        Extended archive command
        slo        Separate linker options by library class
        scpp       Sharing C Pre-Processor
        version    Generate and maintain a version information file
        path       Deal with program paths

       Additionally there is a pseudo-module ``"all"'' which can be used as a short-hand for ``"echo mdate table prop move install mkdir mkln
       mkshadow fixperm platform arx slo scpp version path"'', i.e. to build a shtool script with all modules in the standard order. An installed
       shtool is usually built this way via ``"shtoolize -o shtool all"''.

       Use the shtoolize program to build individual shtool scripts in case you want a smaller sized script and you don't need all of the
       available shtool functionality.  For instance for the classical Autoconf based free software package a "shtool" script build via
       ``"shtoolize -o shtool install mkdir"'' might be sufficient.

OPTIONS
       The following command line options exist:

       -h  Displays a short help page describing the usage of shtoolize.

       -v  Displays the version number of shtoolize/shtool.

       -q  Displays no processing information.

       -o script
           Writes the output to file script instead to file ``"shtool"''.

EXAMPLE
       The typical free software package which is based on GNU libtool and GNU shtool one uses a "Makefile" entry like the following:

        #   Makefile entry for upgrading GNU tools
        upgrade-tools:
            libtoolize -f -c
            shtoolize -q all

       This upgrades the three files "ltmain.sh", "ltconfig" and "shtool" in the current source tree to the latest versions.

SEE ALSO
       shtool(1).

AUTHOR
        Ralf S. Engelschall
        rse@engelschall.com
        www.engelschall.com

18-Jul-2008                                                        shtool 2.0.8                                                   SHTOOLIZE.TMP(1)
