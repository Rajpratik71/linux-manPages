WHAT-PATCH(1)                                                 General Commands Manual                                                WHAT-PATCH(1)

NAME
       what-patch - detect which patch system a Debian package uses

SYNOPSIS
       what-patch [options]

DESCRIPTION
       what-patch examines the debian/rules file to determine which patch system the Debian package is using.

       what-patch should be run from the root directory of the Debian source package.

OPTIONS
       Listed below are the command line options for what-patch:

       -h, --help
              Display a help message and exit.

       -v     Enable verbose mode.  This will include the listing of any files modified outside or the debian/ directory and report any additional
              details about the patch system if available.

AUTHORS
       what-patch was written by Kees Cook <kees@ubuntu.com>, Siegfried-A. Gevatter <rainct@ubuntu.com>, and  Daniel  Hahler  <ubuntu@thequod.de>,
       among others.  This manual page was written by Jonathan Patrick Davies <jpds@ubuntu.com>.

       Both are released under the GNU General Public License, version 3 or later.

SEE ALSO
       The Ubuntu MOTU team has some documentation about patch systems at the Ubuntu wiki: https://wiki.ubuntu.com/PackagingGuide/PatchSystems

       cdbs-edit-patch(1), dbs-edit-patch(1), dpatch-edit-patch(1)

DEBIAN                                                           Debian Utilities                                                    WHAT-PATCH(1)
