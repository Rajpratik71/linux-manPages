APTITUDE-RUN-STATE(1)                   Command-line reference                   APTITUDE-RUN-STATE(1)

NAME
       aptitude-run-state-bundle - unpack an aptitude state bundle and invoke aptitude on it

SYNOPSIS
       aptitude-run-state-bundle [<options>...] <input-file> [<program> [<arguments>...]]

DESCRIPTION
           Note
           This command is mostly for internal use and bug reporting in exceptional cases, it is not
           intended for end-users under normal circumstances.

       aptitude-run-state-bundle unpacks the given aptitude state bundle created by aptitude-create-
       state-bundle(1) to a temporary directory, invokes <program> on it with the supplied
       <arguments>, and removes the temporary directory afterwards. If <program> is not supplied, it
       defaults to aptitude(8).

OPTIONS
       The following options may occur on the command-line before the input file. Options following
       the input file are presumed to be arguments to aptitude.

       --append-args
           Place the options that give the location of the state bundle at the end of the command line
           when invoking <program>, rather than at the beginning (the default is to place options at
           the beginning).

       --help
           Display a brief usage summary.

       --prepend-args
           Place the options that give the location of the state bundle at the beginning of the
           command line when invoking <program>, overriding any previous --append-args (the default is
           to place options at the beginning).

       --no-clean
           Do not remove the unpacked state directory after running aptitude. You might want to use
           this if, for instance, you are debugging a problem that appears when aptitude's state file
           is modified. When aptitude finishes running, the name of the state directory will be
           printed so that you can access it in the future.

           This option is enabled automatically by --statedir.

       --really-clean
           Delete the state directory after running aptitude, even if --no-clean or --statedir was
           supplied.

       --statedir
           Instead of treating the input file as a state bundle, treat it as an unpacked state bundle.
           For instance, you can use this to access the state directory that was created by a prior
           run with --no-clean.

       --unpack
           Unpack the input file to a temporary directory, but don't actually run aptitude.

SEE ALSO
       aptitude-create-state-bundle(1), aptitude(8), apt(8)

AUTHORS
       Daniel Burrows <dburrows@debian.org>
           Main author of the document.

       Manuel A. Fernandez Montecelo <mafm@debian.org>
           Main maintainer after Daniel Burrows, documentation about new features, corrections and
           formatting.

COPYRIGHT
       Copyright 2007 Daniel Burrows.

       This manual page is free software; you can redistribute it and/or modify it under the terms of
       the GNU General Public License as published by the Free Software Foundation; either version 2
       of the License, or (at your option) any later version.

       This manual page is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
       without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
       the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if
       not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1301 USA.

aptitude-run-state-bundle 0.8.                01/19/2018                         APTITUDE-RUN-STATE(1)
