SUBMITTODEBIAN(1)                                             General Commands Manual                                            SUBMITTODEBIAN(1)

NAME
       submittodebian - submit changes in Debian source tree to Debian

SYNOPSIS
       submittodebian

DESCRIPTION
       This manual page documents briefly the submittodebian command.

       submittodebian  was  created to help bridge a gap between Debian and Ubuntu, namely by making it trivially easy to submit your changes to a
       Debian package to the Debian bug tracking system.

       It expects to find the .dsc and diff.gz of the current version (which you likely just created) and the previous one in  the  parent  direc‐
       tory.  By examining debian/changelog it will extract the information it needs to:

       1. Extract the debdiff containing your changes.

       2. Open the debdiff in your $EDITOR so that you can remove any Ubuntu specific changes.

       3. Extract your changelog entry so that you can create a bug report from it.

       4. Start reportbug with the debdiff attached and with the text of the changelog entry.

SEE ALSO
       reportbug(1).

AUTHOR
       submittodebian and this man page were written by Soren Hansen <soren@ubuntu.com>.

       Both are released under the GNU General Public License, version 2 or later.

ubuntu-dev-tools                                                     Dec 2007                                                    SUBMITTODEBIAN(1)
