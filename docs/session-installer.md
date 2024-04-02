SESSIONINSTALLER(1)                                                 User manual                                                SESSIONINSTALLER(1)

NAME
       session-installer - allows applications to easily install and remove software

SYNOPSIS
       session-installer

DESCRIPTION
       Session-installer  allows applications to easily install additional software (e.g. extensions or GSreamer codecs), uninstall files and per‐
       form simple package status queries by calling a distribution neutral D-Bus interface.

       The whole process of confirmation, error reporting and progress notification is handled by sessioninstaller. Currently it comes only with a
       GTK based user interface.

       The  D-Bus  interface  is  developed under the PackageKit umbrella and is available on the session bus. The reference implementation can be
       found in gnome-packagekit. It was also adopted by KPackageKit.

       In contrast to gnome-packagekit and KPackageKit it doesn't use the PackageKit daemon for querying and installation, but instead  makes  use
       of APT and aptdaemon directly (alternatively synaptic can be used).

       Normally it is not required to start this programme manually since it makes use of D-Bus activation and will be started on request automat‐
       ically.

ENVIRONMENT
       SESSIONINSTALLER_BACKEND
              Set the package manager which should be used for installation.  Possible values are aptdaemon, synaptic and dummy.

HOMEPAGE
       https://launchpad.net/sessioninstaller

BUGS
       You can report bugs at the Launchpad site of aptdaemon: https://bugs.launchpad.net/sessioninstaller/+filebug

AUTHOR
       Sebastian Heinlein <devel at glatzor dot de>

SEE ALSO
       aptd(1) http://www.packagekit.org/pk-faq.html#session-methods

Linux                                                              December 2009                                               SESSIONINSTALLER(1)
