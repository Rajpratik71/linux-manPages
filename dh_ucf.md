DH_UCF(1)                                      Debhelper                                     DH_UCF(1)

NAME
       dh_ucf - register configuration files with ucf

SYNOPSIS
       dh_ucf [debhelper options] [-A] [-n] [file ...]

DESCRIPTION
       dh_ucf is a debhelper program that is responsible for generating the postinst and postrm
       commands that register files with ucf(1) and ucfr(1).

FILES
       debian/package.ucf
           List pairs of source and destination files to register with ucf. Each pair should be put on
           its own line, with the source and destination separated by whitespace. Both source and
           destination must be absolute paths. The source should be a file that is provided by your
           package, typically in /usr/share/, while the destination is typically a file in /etc/.

           A dependency on ucf will be generated in ${misc:Depends}.

OPTIONS
       -A, --all
           Install all files specified by command line parameters in ALL packages acted on.

       -n, --no-scripts
           Do not modify postinst/postrm scripts. Turns this command into a no-op.

       file ...
           Install these info files into the first package acted on. (Or in all packages if -A is
           specified).

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org> Jeroen Schot <schot@a-eskwadraat.nl>

12.6.1ubuntu2                                 2019-09-17                                     DH_UCF(1)
