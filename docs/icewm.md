IceWM(1)                                                                                        Window Manager                                                                                       IceWM(1)



NAME
       icewm - lightweight X11 window manager


DESCRIPTION
       IceWM  is  lightweight  X11 window manager.  The goal of IceWM is to provide a small, fast and familiar window manager for the X11 window system. Compatibility with the window manager is desired and
       will be implemented where appropriate.

       It was originally designed to emulate the look of Motif, OS/2 Warp 4, OS/2 Warp 3 and Windows 95. Since it has a theming engine (hint: http://www.icewm.org/) others styles  are  possible.   It  also
       tries to combine the feel of the above systems whenever it is compatible.

       Generally,  it  tries  to  make all functions available both by keyboard and by mouse (this is not currently possible when using mouse focus).  Extreme configurability similar to fvwm and many other
       window managers is NOT the goal. However IceWM configurability is very good through its various preferences files.

       IceWM consists of several parts:

       icewm - the actual window manager binary. This is the one you need to get window decorations.

       icewmbg - the background setting applications. It can assign plain background color or images in different formats to the X background, shared or separated for  different  workspaces.  This  program
       should be started before IceWM startup.

       icewmtray - catches the Docklet objects installed by various applications like PSI.

       icewm-session - runs all of the above when needed. Implements basic session management.

       icesh - could be used to manage IceWM internals from command line.

       icewmhint - used internally.

       icesound - plays audio files on GUI events raised by IceWM.


OPTIONS
       For most of the parts use option

       -h, --help
              to see all of the options.

ENVIRONMENT VARIABLES
       ICEWM_PRIVCFG=PATH
              Directory to use for user private configuration files, "$HOME/.icewm/" by default.

       DISPLAY=NAME
              Name of the X server to use, depends on Xlib by default. See X(1).

       MAIL=URL
              Location of your mailbox. If the schema is omitted the local "file" schema is assumed.


FILES
       IceWM looks for its configuration files in the following directories, in the following order:

       $(HOME)/.icewm/
              User-specific configurations

       /etc/X11/icewm/
              System-wide customized defaults

       /usr/local/share/icewm/
              Default installation settings

       Configuration files

       keys
              global keybindings to launch applications (not window manager related)

       menu
              menu of startable applications; usually customized by the user

       preferences
              general settings - paths, colors, fonts...

       prefoverride
              settings that should override the themes

       programs
              automatically generated menu of startable applications (this should be used for wmconfig, menu or similar packages, perhaps as a part of the login or X startup sequence)

       theme
              currently selected theme

       toolbar
              quick launch application icons on the taskbar

       winoptions
              application window options

       startup
              commands to execute on IceWM startup

       shutdown
              commands to execute on IceWM shutdown

       Configuration directories

       icons
              icons used for applications (usually XPM files *_16x16.xpm and *_32x32.xpm)

       ledclock
              pictures of digits for clocks displayed in taskbar

       mailbox
              icons used for different states of mailbox

       taskbar
              pictures to customize look of the taskbar

       themes
              directory to store themes


EXAMPLES
       Examples of above configuration files you can find in default installation path or in system-wide customizable defaults.

SEE ALSO
       xinit(1), X(1),

       http://www.icewm.org/manual/

       http://www.icewm.org/FAQ/

       http://www.icewm.org/themes/

AUTHORS
       The original version of IceWM was designed and implemented in 1997 by Marko Macek, in year 2001 it was maintained by Mathias Hasselmann then again Marko Macek took over.

       IceWM man page written by Adam Pribyl, covex@ahoj.fsik.cvut.cz, 2005

BUG REPORTS
       If you find a bug in IceWM please use bug reporting system on http://sourceforge.net/projects/icewm/ to report it.

COPYING
       IceWM is released under GNU Library General Public License.

       This  library  is  free software; you can redistribute it and/or modify it under the terms of the GNU Library General Public License as published by the Free Software Foundation; either version 2 of
       the License, or (at your option) any later version.

       This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR  A  PARTICULAR  PURPOSE.   See  the  GNU
       Library General Public License for more details.

       You  should  have  received  a  copy  of  the GNU Library General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
       02111-1307  USA.



Adam Pribyl                                                                                      July 20 2005                                                                                        IceWM(1)
