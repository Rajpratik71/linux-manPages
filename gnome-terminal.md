gnome-terminal(1)          General Commands Manual          gnome-terminal(1)

NAME
       gnome-terminal — is a terminal emulation application.

SYNOPSIS
       gnome-terminal  [-e,  --command=STRING]   [-x, --execute ]  [--window-
       with-profile=PROFILENAME]   [--tab-with-profile=PROFILENAME]   [--win‐
       dow-with-profile-internal-id=PROFILEID]  [--tab-with-profile-internal-
       id=PROFILEID]    [--role=ROLE]    [--show-menubar]    [--hide-menubar]
       [--geometry=GEOMETRY]  [--working-directory=DIRNAME]  [-?, --help]

DESCRIPTION
       GNOME Terminal is a terminal emulation application that you can use to
       perform the following actions:

       Access a UNIX shell in the GNOME environment.

       A shell is a program that interprets and executes  the  commands  that
       you  type at a command line prompt. When you start GNOME Terminal, the
       application starts the default shell that is specified in your  system
       account. You can switch to a different shell at any time.

       Run any application that is designed to run on VT102, VT220, and xterm
       terminals.

       GNOME Terminal emulates the xterm program developed by the  X  Consor‐
       tium.  In  turn, the xterm program emulates the DEC VT102 terminal and
       also supports the DEC VT220 escape sequences. An escape sequence is  a
       series of characters that starts with the Esc character.

       GNOME  Terminal accepts all of the escape sequences that the VT102 and
       VT220 terminals use for functions such as positioning the  cursor  and
       clearing the screen.

OPTIONS
       -e, --command=STRING
                 Execute the argument to this option inside the terminal.

       -x, --execute
                 Execute  the remainder of the command line inside the termi‐
                 nal.

       --window-with-profile=PROFILENAME
                 Open a new window containing a tab with the  given  profile.
                 More than one of these options can be provided.

       --tab-with-profile=PROFILENAME
                 Open  a  tab in the window with the given profile. More than
                 one of these options can be provided, to open several tabs .

       --window-with-profile-internal-id=PROFILEID
                 Open a new window containing a tab with  the  given  profile
                 ID. Used internally to save sessions.

       --tab-with-profile-internal-id=PROFILEID
                 Open  a  tab  in the window with the given profile ID.  Used
                 internally to save sessions.

       --role=ROLE
                 Set the role for the last-specified window; applies to  only
                 one window; can be specified once for each window you create
                 from the command line.

       --show-menubar
                 Turn on the menu bar for the last-specified window;  applies
                 to  only  one  window; can be specified once for each window
                 you create from the command line.

       --hide-menubar
                 Turn off the menu bar for the last-specified window; applies
                 to  only  one  window; can be specified once for each window
                 you create from the command line.

       --geometry=GEOMETRY
                 X geometry specification (see "X" man page), can  be  speci‐
                 fied once per window to be opened.

       --working-directory=DIRNAME
                 Set the terminal's working directory to DIRNAME.

       -?, --help
                 Show help message.

AUTHOR
       This manual page was written by Christian Marillat marillat@debian.org
       for the Debian GNU/Linux system (but may be used by others).

                                                            gnome-terminal(1)
