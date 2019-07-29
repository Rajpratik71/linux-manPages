DCH-REPEAT(1)                                                 General Commands Manual                                                DCH-REPEAT(1)

NAME
       dch-repeat - repeats a changelog entry into an older release

SYNOPSIS
       dch-repeat --build-tree <PATH>
       dch-repeat --source-release <RELEASE>
       dch-repeat --target-release <RELEASE>
       dch-repeat --devel-release <RELEASE>
       dch-repeat --pocket <POCKET>
       dch-repeat -h

DESCRIPTION
       dch-repeat  is  used  to  repeat a changelog into an older release.  It expects that --build-tree is laid out with each Ubuntu release as a
       separate directory ("feisty", "edgy", etc).

       For example, if gimp had a security update prepared for Feisty in $TREE/feisty/gimp-2.2.13, running  dch-repeat  in  $TREE/edgy/gimp-2.2.13
       would pull in the latest changelog from the Feisty build.

OPTIONS
       Listed below are the command line options for dch-repeat:

       -h or --help
              Display a help message and exit.

       --build-tree PATH
              Base of build trees. Default is /scratch/ubuntu/build.

       -s or --source-release RELEASE
              Which release to take changelog from.

       --target-release RELEASE
              Which release to build into.

       --devel-release RELEASE
              Which release is the development release.

       --pocket POCKET
              Which pocket to use.

AUTHOR
       dch-repeat was written by Kees Cook <kees@ubuntu.com>.  This manual page was written by Jonathan Patrick Davies <jpds@ubuntu.com>.

       Both are released under the GNU General Public License, version 2.

SEE ALSO
       dch(1).

ubuntu-dev-tools                                                  10 August 2008                                                     DCH-REPEAT(1)
