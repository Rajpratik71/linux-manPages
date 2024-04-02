EDIT-PATCH(1)                                                 General Commands Manual                                                EDIT-PATCH(1)

NAME
       edit-patch, add-patch - tool for preparing patches for Debian source packages

SYNOPSIS
       edit-patch path/to/patch

       add-patch path/to/patch

DESCRIPTION
       edit-patch is a wrapper script around the Quilt, CDBS, and dpatch patch systems. It simplifies the process of preparing and editing patches
       to Debian source packages and allows the user to not have to be concerned with which patch system is in use.   Run  from  inside  the  root
       directory of the source package, edit-patch can be used to edit existing patches located in debian/patches.

       It can also be used to incorporate new patches.  If pointed at a patch not already present, it will copy the patch to debian/patches in the
       correct format for the patch system in use.  Next, the patch is applied and a subshell is opened in order to edit the patch.   Typing  exit
       or pressing Ctrl-d will close the subshell and launch an editor to record the debian/changelog entry.

       edit-patch  is  integrated  with  the  Bazaar  and Git version control systems.  The patch will be automatically added to the tree, and the
       debian/changelog entry will be used as the commit message.

       If no patch system is present, the patch is applied inline, and a copy is stored in debian/patches-applied.

       add-patch is the non-interactive version of edit-patch.  The patch will be incorporated but no editor or subshell will be spawned.

AUTHORS
       edit-patch was written by Daniel Holbach <daniel.holbach@canonical.com>,  Michael  Vogt  <michael.vogt@canonical.com>,  and  David  Futcher
       <bobbo@ubuntu.com>.

       This manual page was written by Andrew Starr-Bochicchio <a.starr.b@gmail.com>.

       Both are released under the terms of the GNU General Public License, version 3.

DEBIAN                                                           Debian Utilities                                                    EDIT-PATCH(1)
