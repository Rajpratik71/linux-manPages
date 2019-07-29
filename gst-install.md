SESSIONINSTALLER(1)                                                 User manual                                                SESSIONINSTALLER(1)

NAME
       gst-install - installs missing GStreamer plugins

SYNOPSIS
       gst-install [OPTIONS] plugin ...

DESCRIPTION
       Gst-install  makes  use of the PackageKit session D-Bus interface to install missing GStreamer plugins, e.g. encoders, decoders or URI han‐
       dlers. It isn't supposed to be executed directly but instead by the gst_install_plugins_async  and  gst_install_plugins  functions  of  the
       GStreamer base library gstpbutilsinstallplugins.

       PackageKit  or  the  alternative session-installer implementation will handle the complete installation process with confirmation, progress
       and error dialogs.

       See the documentation of gstpbutilsinstallplugins for the argument construction and exit states.

OPTIONS
       --transient-for
              The X Window ID of the window which should be used as parents for the dialogs

DIAGNOSTICS
       None yet.

HOMEPAGE
       https://launchpad.net/sessioninstaller

BUGS
       You can report bugs at the Launchpad site of aptdaemon: https://bugs.launchpad.net/sessioninstaller/+filebug

AUTHOR
       Sebastian Heinlein <devel at glatzor dot de>

SEE ALSO
       aptd(1) session-installer(1)

Linux                                                               April 2010                                                 SESSIONINSTALLER(1)
