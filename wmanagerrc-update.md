WMANAGERRC-UPDATE(1)   BSD General Commands Manual  WMANAGERRC-UPDATE(1)

NAME
     wmanagerrc-update — update your wmanager settings automatically

SYNOPSIS
     wmanagerrc-update

DESCRIPTION
     The wmanagerrc-update program creates or updates the ~/.wmanagerrc
     file with a list of X11 window managers currently installed on the
     system.  On systems that do not have a convention for registering X
     window managers, wmanagerrc-update simply copies the contents of
     the ~/.wmanagerrc.user file to ~/.wmanagerrc.

     On systems that register the installed X window managers, the
     wmanagerrc-update program adds all of them to the wmanager(1) con‐
     figuration so that they are available soon after installation.
     Currently, only Debian GNU/Linux and similar systems that use the
     update-alternaties(8) mechanism are supported.  Locally installed
     window managers and things not registered as alternatives for
     x-window-manager(1) can be added to the file ~/.wmanagerrc.user in
     the .wmanagerrc format; see the wmanager(1) README file, usually
     /usr/share/doc/wmanager/README.gz, for more information.  The
     wmanagerrc-update program uses the entries first from
     ~/.wmanagerrc.user, then from the the registered window managers,
     in the order of update-alternatives(8) priorities.  You can over‐
     ride this by listing entries in wanted order in
     ~/.wmanagerrc.order, separated by whitespace.

BUGS
     Concurrent wmanagerrc-update processes may clobber the .wmanagerrc
     file.

SEE ALSO
     wmanager(1), wmanager-loop(1), update-alternatives(8)

HISTORY
     The wmanagerrc-update program was written by Tommi Virtanen in 2000
     and later modified by Peter Pentchev.  This manual page was origi‐
     nally written in perldoc format by Tommi Virtanen in 2000, and con‐
     verted to mdoc format and updated by Peter Pentchev in 2008.

AUTHORS
     Tommi Virtanen ⟨tv@debian.org⟩
     Peter Pentchev ⟨roam@ringlet.net⟩

BSD                           May 22, 2008                           BSD
