WMANAGER(1)            BSD General Commands Manual           WMANAGER(1)

NAME
     wmanager — choose a window manager and launch it

SYNOPSIS
     wmanager [OPTIONS ...]

DESCRIPTION
     The wmanager program displays a choice of the window managers
     listed in the ~/.wmanagerrc file.  When one is picked, the related
     command is written to standard output, intended to be used by shell
     scripts.  If the program is exited without choosing a window man‐
     ager, “-1” is written to standard output.

     -fg COLOR
             Set the foreground color.

     -bg COLOR
             Set the background color.

     -bg2 COLOR
             Set the widget background color

     -di[splay] host:n.n
             Set the X display.

     -dn[d], -nod[nd]
             Enable/disable drag & drop, probably does nothing.

     -g[eometry] WxH+X+Y
             Set the window size and location.

     -i[conic]
             Start as iconified.

     -k[bd], -nok[bd]
             Enable/disable keyboard support.

     -na[me] CLASSNAME
             Set the X window class.

     -s[cheme] SCHEME
             Unknown, probably does nothing useful.

     -ti[tle] WINDOWTITLE
             Set the window title.

     -to[oltips], -not[ooltips]
             Enable/disable tooltips, probably does nothing.

EXAMPLE
     To start using wmanager, create a ~/.wmanagerrc file - generally
     with wmanagerrc-update(1) - and add something like the following at
     the end of your ~/.xsession file:

           WM="$(wmanager -geometry +570+585)"
           ...
           exec $WM

     See also wmanager-loop(1) for a nicer way to start wmanager.

SEE ALSO
     wmanager(1), wmanager-loop(1), wmanagerrc-update(1), X(7x)

HISTORY
     The wmanager program was written by Meik Tessmer in 1999.  This
     manual page was originally written in perldoc format by Tommi
     Virtanen in 2000, and converted to mdoc format by Peter Pentchev in
     2008.

AUTHORS
     The wmanager program - Meik Tessmer ⟨fuller@daemogorgon.net⟩.

     The manual page - Tommi Virtanen ⟨tv@debian.org⟩ and Peter Pentchev
     ⟨roam@ringlet.net⟩.

BSD                           May 22, 2008                           BSD
