SETXKBMAP(1)                            General Commands Manual                           SETXKBMAP(1)

NAME
       setxkbmap - set the keyboard using the X Keyboard Extension

SYNOPSIS
       setxkbmap [ args ] [ layout [ variant [ option ...  ] ] ]

DESCRIPTION
       The  setxkbmap  command maps the keyboard to use the layout determined by the options specified
       on the command line.

       An XKB keymap is constructed from a number of components which are  compiled  only  as  needed.
       The source for all of the components can be found in /usr/share/X11/xkb.

OPTIONS
       -compat name
               Specifies the name of the compatibility map component used to construct a keyboard lay‐
               out.

       -config file
               Specifies the name of an XKB configuration file which  describes  the  keyboard  to  be
               used.

       -device device
               Specifies the numeric device id of the input device to be updated with the new keyboard
               layout. If not specified, the core keyboard device of the X server is updated.

       -display display
               Specifies the display to be updated with the new keyboard layout.

       -geometry name
               Specifies the name of the geometry component used to construct a keyboard layout.

       -help   Prints a message describing the valid input to setxkbmap.

       -I directory
               Adds a directory to the list of directories to be used to search for  specified  layout
               or rules files.

       -keycodes name
               Specifies the name of the keycodes component used to construct a keyboard layout.

       -keymap name
               Specifies the name of the keymap description used to construct a keyboard layout.

       -layout name
               Specifies  the  name  of  the layout used to determine the components which make up the
               keyboard description. The -layout option may only be used once. Multiple layouts can be
               specified as a comma-separated list.

       -model name
               Specifies the name of the keyboard model used to determine the components which make up
               the keyboard description.  Only one model may be specified on the command line.

       -option name
               Specifies the name of an option to determine the components which make up the  keyboard
               description;   multiple  options  may  be  specified,  one  per -option flag. Note that
               setxkbmap adds options specified in the command line to the options that were  set  be‐
               fore (as saved in root window properties). If you want to replace all previously speci‐
               fied options, use the -option flag with an empty argument first.

       -print  With this option setxkbmap just prints component names in a format acceptable  by  xkb‐
               comp  (an XKB keymap compiler) and exits. The option can be used for tests instead of a
               verbose option and in cases when one needs to run both the setxkbmap and the xkbcomp in
               chain (see below).

       -query  With  this  option setxkbmap just prints the current rules, model, layout, variant, and
               options, then exits.

       -rules file
               Specifies the name of the rules file used to resolve the requested layout and model  to
               a set of component names.

       -symbols name
               Specifies the name of the symbols component used to construct a keyboard layout.

       -synch  Force synchronization for X requests.

       -types name
               Specifies the name of the types component used to construct a keyboard layout.

       -variant name
               Specifies  which  variant of the keyboard layout should be used to determine the compo‐
               nents which make up the keyboard description. The -variant  option  may  only  be  used
               once.  Multiple variants can be specified as a comma-separated list and will be matched
               with the layouts specified with -layout.

       -verbose|-v [level]
               Specifies level of verbosity in output messages.  Valid levels range from 0 (least ver‐
               bose)  to  10 (most verbose).  The default verbosity level is 5.  If no level is speci‐
               fied, each -v or -verbose flag raises the level by 1.

       -version
               Prints the program's version number.

USING WITH xkbcomp
       If you have an Xserver and a client shell running on different computers and some XKB  configu‐
       ration files on those machines are different, you can get problems specifying a keyboard map by
       model, layout, and options names.  This is because setxkbmap converts its arguments to names of
       XKB  configuration  files  according  to files that are on the client-side computer, then sends
       these file names to the server where xkbcomp has to compose a complete keyboard map using files
       which  the  server has.  Thus if the sets of files differ in some way, the names that setxkbmap
       generates can be unacceptable on the server side.  You can solve this problem  by  running  the
       xkbcomp on the client side too.  With the -print option setxkbmap just prints the file names in
       an appropriate format to its stdout and this output can be piped directly to the xkbcomp input.
       For example, the command

       setxkbmap us -print | xkbcomp - $DISPLAY

       makes both steps run on the same (client) machine and loads a keyboard map into the server.

SEE ALSO
       xkbcomp(1), xkeyboard-config(7)

FILES
       /usr/share/X11/xkb

X Version 11                                setxkbmap 1.3.1                               SETXKBMAP(1)
