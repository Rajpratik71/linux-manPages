SHTOOL.TMP(1)                                                 GNU Portable Shell Tool                                                SHTOOL.TMP(1)

NAME
       shtool - The GNU Portable Shell Tool

VERSION
       GNU shtool 2.0.8 (18-Jul-2008)

SYNOPSIS
       shtool [ global_options ] command [ command_options ] [ command_args ]

DESCRIPTION
       GNU shtool is a compilation of small but very stable and portable shell scripts into a single shell tool. All ingredients were in
       successful use over many years in various free software projects. The compiled shtool script is intended to be used inside the source tree
       of those free software packages.  There it can take over various (usually non-portable) tasks related to the building and installation of
       such packages.

GLOBAL OPTIONS
       The following global options are available for shtool. Any commands are ignored if one of them is present on the shtool command line.

       -h, --help
           Displays a short help page describing the usage of shtool and it's ingredient commands in a compact way.

       -v, --version
           Displays the version number of shtool.

       -d, --debug
           Displays shell trace messages for debugging purposes.

       -r, --recreate
           Recreate the shtool script with its own individual shtoolize(1) call.

COMMANDS
       The following commands are provided by shtool. They are all called via ""shtool" command". Any command options command_opts and arguments
       command_args are specific to the particular command and are described in the corresponding manual page shtool_command(1).  The commands are
       listed here sorted by topic, i.e., related commands are listed side-by-side.

       echo            echo(1) style print command providing special expansion constructs (terminal bold mode, environment details, date) and
                       newline control.

       mdate           Pretty-printing of the last modification time of a file or directory.

       table           Pretty-printing a field-separated list as a two-dimensional table.

       prop            Displaying of a processing indication though a running terminal character propeller.

       move            mv(1) style command for renaming/moving multiple files at once and allowing source files just to be deleted if contents did
                       not change.

       install         install(1) style command for installing a program, script or data file in a portable way.

       mkdir           mkdir(1) style command providing support for automatical parent directory creation, directory permission control and smart
                       skipping if directory already exists.

       mkln            ln(1) style command providing automatic calculation and usage of relative links if possible.

       mkshadow        Creation of a shadow filesystem tree by the help of symbolic links.

       fixperm         Fixing of file permissions in a source tree by cleaning up the permission bits.

       rotate          Rotate a logfile.

       tarball         Roll standardized distribution tarballs.

       subst           Apply sed(1) substitution operations.

       platform        Determines platform identification information.

       arx             Extended archive command which can even put existing archives into an archive.

       slo             Separate linker options by library class.

       scpp            An additional C source file pre-processor for sharing cpp(1) code, internal variables and internal functions.

       version         Maintain a version information file in either Text, C/C++, Perl or Python.  format.

       path            Deal with shell path variables.

SEE ALSO
       shtoolize(1), shtool-arx(1), shtool-echo(1), shtool-fixperm(1), shtool-install(1), shtool-mdate(1), shtool-mkdir(1), shtool-mkln(1),
       shtool-mkshadow(1), shtool-move(1), shtool-path(1), shtool-platform(1), shtool-prop(1), shtool-rotate(1), shtool-scpp(1), shtool-slo(1),
       shtool-subst(1), shtool-table(1), shtool-tarball(1), shtool-version(1).

HISTORY
       Some scripts contained in GNU shtool were already written in 1994 by Ralf S. Engelschall for use inside some private source trees. Then
       they evolved into more elaborated versions over the years and were used in various free software projects like ePerl, WML, iSelect, gFONT,
       etc.  They were complemented with other scripts from the author which he wrote in March 1998 for the ``Apache Autoconf-style Interface''
       (APACI) for Apache 1.3. In April 1999 the shtool package was created out of the accumulated master versions of the scripts and in June 1999
       it entered the status of an official GNU program and this way finally joined the group of GNU autoconf, GNU automake and GNU libtool.

AUTHOR
        Ralf S. Engelschall
        rse@engelschall.com
        www.engelschall.com

18-Jul-2008                                                        shtool 2.0.8                                                      SHTOOL.TMP(1)
