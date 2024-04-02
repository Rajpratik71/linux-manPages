CVS-DEBUILD(1)                                                General Commands Manual                                               CVS-DEBUILD(1)

NAME
       cvs-debuild - build a Debian package using cvs-buildpackage and debuild

SYNOPSIS
       cvs-debuild [debuild options] [cvs-buildpackage options] [--lintian-opts lintian options]

DESCRIPTION
       cvs-debuild  is  a  wrapper  around cvs-buildpackage to run it with debuild as the package-building program.  (This cannot simply be accom‐
       plished using the -C option of cvs-buildpackage, as it does not know how to handle all of the special debuild options.)

       The program simply stashes the debuild and lintian options, and passes them to debuild when it is called by cvs-buildpackage.  All  of  the
       standard debuild options may be used (as listed below), but note that the root command specified by any --rootcmd or -r command-line option
       will be passed as an option to cvs-buildpackage.  The first non-debuild option detected will  signal  the  start  of  the  cvs-buildpackage
       options.

       The  selection  of  the  root  command is slightly subtle: if there are any command-line options, these will be used.  If not, then if cvs-
       buildpackage is set up to use a default root command, that will be used.  Finally, if neither of these are the case, then debuild will  use
       its procedures to determine an appropriate command, as described in its documentation.

       See the manpages for debuild(1) and cvs-buildpackage for more information about the behaviour of each.

OPTIONS
       The  following are the debuild options recognised by cvs-debuild.  All cvs-buildpackage and lintian options are simply passed to the appro‐
       priate program.  For explanations of the meanings of these variables, see debuild(1).

       --no-conf, --noconf

       --rootcmd=gain-root-command, -rgain-root-command

       --preserve-env

       --preserve-envvar=var, -evar

       --set-envvar=var=value, -evar=value

       --lintian, --no-lintian

       --ignore-dirname, --check-dirname
              These should not be needed, but it is provided nevertheless.

SEE ALSO
       cvs-buildpackage(1), debuild(1), dpkg-buildpackage(1), lintian(1)

AUTHOR
       This program was written by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                           Debian Utilities                                                   CVS-DEBUILD(1)
