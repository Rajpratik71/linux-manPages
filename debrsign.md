DEBRSIGN(1)                                                   General Commands Manual                                                  DEBRSIGN(1)

NAME
       debrsign - remotely sign a Debian .changes and .dsc file pair using SSH

SYNOPSIS
       debrsign [options] [user@]remotehost [changes-file|dsc-file]

DESCRIPTION
       debrsign  takes  either  an  unsigned  .dsc file or an unsigned .changes file and the associated unsigned .dsc file (found by replacing the
       architecture name and .changes by .dsc) if it appears in the .changes file and signs them by copying  them  to  the  remote  machine  using
       ssh(1)  and  remotely  running  debsign(1)  on  that machine.  All options not listed below are passed to the debsign program on the remote
       machine.

       If a .changes or .dsc file is specified, it is signed, otherwise, debian/changelog is parsed to determine the name of the .changes file  to
       look for in the parent directory.

       This  utility  is useful if a developer must build a package on one machine where it is unsafe to sign it; they need then only transfer the
       small .dsc and .changes files to a safe machine and then use the debsign program to sign them before transferring them back.  This  program
       automates this process.

       To  do  it  the  other way round, that is to connect to an unsafe machine to download the .dsc and .changes files, to sign them locally and
       then to transfer them back, see the debsign(1) program, which can do this task.

OPTIONS
       -S     Look for a source-only .changes file instead of a binary-build .changes file.

       -adebian-architecture, -tGNU-system-type
              See dpkg-architecture(1) for a description of these options.  They affect the search for the .changes file.  They  are  provided  to
              mimic the behaviour of dpkg-buildpackage when determining the name of the .changes file.

       --multi
              Multiarch  .changes  mode:  This  signifies  that  debrsign  should  use  the  most  recent  file with the name pattern package_ver‐
              sion_*+*.changes as the .changes file, allowing for the .changes files produced by dpkg-cross.

       --path remote-path
              Specify a path to the GPG binary on the remote host.

       --help, --version
              Show help message and version information respectively.

       Other options
              All other options are passed on to debsign on the remote machine.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command  line
       options  can  be  used to override configuration file settings.  Environment variable settings are ignored for this purpose.  The currently
       recognised variables are:

       DEBRSIGN_PGP_PATH
              Equivalent to passing --path on the command line (see above.)

SEE ALSO
       debsign(1), dpkg-architecture(1), ssh(1)

AUTHOR
       This program was written by Julian Gilbey <jdg@debian.org> and is copyright under the GPL, version 2 or later.

DEBIAN                                                           Debian Utilities                                                      DEBRSIGN(1)
