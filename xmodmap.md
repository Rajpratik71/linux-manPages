XMODMAP(1)                              General Commands Manual                             XMODMAP(1)

NAME
       xmodmap - utility for modifying keymaps and pointer button mappings in X

SYNOPSIS
       xmodmap [-options ...] [filename]

DESCRIPTION
       The xmodmap program is used to edit and display the keyboard modifier map and keymap table that
       are used by client applications to convert event keycodes into keysyms.  It is usually run from
       the user's session startup script to configure the keyboard according to personal tastes.

OPTIONS
       The following options may be used with xmodmap:

       -display display
               This option specifies the host and display to use.

       -help   This  option indicates that a brief description of the command line arguments should be
               printed on the standard error channel.  This will be done whenever an  unhandled  argu‐
               ment is given to xmodmap.

       -grammar
               This  option  indicates  that  a help message describing the expression grammar used in
               files and with -e expressions should be printed on the standard error.

       -version
               This option indicates that xmodmap should print its version information and exit.

       -verbose
               This option indicates that xmodmap should print logging information as  it  parses  its
               input.

       -quiet  This option turns off the verbose logging.  This is the default.

       -n      This  option  indicates that xmodmap should not change the mappings, but should display
               what it would do, like make(1) does when given this option.

       -e expression
               This option specifies an expression to be executed.  Any number of expressions  may  be
               specified from the command line.

       -pm     This  option  indicates that the current modifier map should be printed on the standard
               output.   This is the default mode of operation if no other mode options are specified.

       -pk     This option indicates that the current keymap table should be printed on  the  standard
               output.

       -pke    This  option  indicates that the current keymap table should be printed on the standard
               output in the form of expressions that can be fed back to xmodmap.

       -pp     This option indicates that the current pointer map should be printed  on  the  standard
               output.

       -       A lone dash means that the standard input should be used as the input file.

       The filename specifies a file containing xmodmap expressions to be executed.  This file is usu‐
       ally kept in the user's home directory with a name like .xmodmaprc.

EXPRESSION GRAMMAR
       The xmodmap program reads a list of expressions and parses them all before attempting  to  exe‐
       cute  any  of  them.   This makes it possible to refer to keysyms that are being redefined in a
       natural way without having to worry as much about name conflicts.

       The list of keysym names may be found in the header file  <X11/keysymdef.h>  (without  the  XK_
       prefix),  supplemented by the keysym database  /usr/share/X11/XKeysymDB.  Keysyms matching Uni‐
       code characters may be specified as "U0020" to "U007E" and "U00A0" to "U10FFFF" for all  possi‐
       ble Unicode characters.

       keycode NUMBER = KEYSYMNAME ...
               The  list  of  keysyms  is assigned to the indicated keycode (which may be specified in
               decimal, hex or octal and can be determined by running the xev program).  Up  to  eight
               keysyms  may  be  attached  to a key, however the last four are not used in any major X
               server implementation.  The first keysym is used when no modifier  key  is  pressed  in
               conjunction with this key, the second with Shift, the third when the Mode_switch key is
               used with this key and the fourth when both the Mode_switch and Shift keys are used.

       keycode any = KEYSYMNAME ...
               If no existing key has the specified list of keysyms assigned to it, a spare key on the
               keyboard  is  selected  and the keysyms are assigned to it.  The list of keysyms may be
               specified in decimal, hex or octal.

       keysym KEYSYMNAME = KEYSYMNAME ...
               The KEYSYMNAME on the left hand side is translated into matching keycodes used to  per‐
               form  the  corresponding  set  of keycode expressions.  Note that if the same keysym is
               bound to multiple keys, the expression is executed for each matching keycode.

       clear MODIFIERNAME
               This removes all entries in the modifier map for the given modifier, where  valid  name
               are:  Shift,  Lock,  Control, Mod1, Mod2, Mod3, Mod4, and Mod5 (case does not matter in
               modifier names, although it does matter for all other  names).   For  example,  ``clear
               Lock'' will remove all any keys that were bound to the shift lock modifier.

       add MODIFIERNAME = KEYSYMNAME ...
               This  adds  all  keys  containing the given keysyms to the indicated modifier map.  The
               keysym names are evaluated after all input expressions are read  to  make  it  easy  to
               write expressions to swap keys (see the EXAMPLES section).

       remove MODIFIERNAME = KEYSYMNAME ...
               This  removes  all  keys  containing the given keysyms from the indicated modifier map.
               Unlike add, the keysym names are evaluated as the line is read in.  This allows you  to
               remove keys from a modifier without having to worry about whether or not they have been
               reassigned.

       pointer = default
               This sets the pointer map back to its default settings (button 1 generates a code of 1,
               button 2 generates a 2, etc.).

       pointer = NUMBER ...
               This  sets  the  pointer  map  to  contain the indicated button codes.  The list always
               starts with the first physical button.  Setting a button code to 0 disables events from
               that button.

       Lines that begin with an exclamation point (!) are taken as comments.

       If you want to change the binding of a modifier key, you must also remove it from the appropri‐
       ate modifier map.

EXAMPLES
       Many pointers are designed such that the first button is pressed using the index finger of  the
       right  hand.  People who are left-handed frequently find that it is more comfortable to reverse
       the button codes that get generated so that the primary button is pressed using the index  fin‐
       ger of the left hand.  This could be done on a 3 button pointer as follows:
       %  xmodmap -e "pointer = 3 2 1"

       Many  applications support the notion of Meta keys (similar to Control keys except that Meta is
       held down instead of Control).  However, some servers do not have a Meta keysym in the  default
       keymap  table, so one needs to be added by hand.  The following command will attach Meta to the
       Multi-language key (sometimes labeled Compose Character).  It also takes advantage of the  fact
       that  applications  that  need  a Meta key simply need to get the keycode and don't require the
       keysym to be in the first column of the keymap table.  This means that  applications  that  are
       looking for a Multi_key (including the default modifier map) won't notice any change.
       %  xmodmap -e "keysym Multi_key = Multi_key Meta_L"

       Similarly,  some  keyboards have an Alt key but no Meta key.  In that case the following may be
       useful:
       %  xmodmap -e "keysym Alt_L = Meta_L Alt_L"

       One of the more simple, yet convenient, uses of xmodmap is to set the keyboard's  "rubout"  key
       to  generate an alternate keysym.  This frequently involves exchanging Backspace with Delete to
       be more comfortable to the user.  If the ttyModes resource in xterm is set as well, all  termi‐
       nal emulator windows will use the same key for erasing characters:
       %  xmodmap -e "keysym BackSpace = Delete"
       %  echo "XTerm*ttyModes:  erase ^?" | xrdb -merge

       Some  keyboards  do  not  automatically generate less than and greater than characters when the
       comma and period keys are shifted.  This can be remedied with xmodmap by resetting the bindings
       for the comma and period with the following scripts:
       !
       ! make shift-, be < and shift-. be >
       !
       keysym comma = comma less
       keysym period = period greater

       One  of  the  more  irritating differences between keyboards is the location of the Control and
       CapsLock keys.  A common use of xmodmap is to swap these two keys as follows:
       !
       ! Swap Caps_Lock and Control_L
       !
       remove Lock = Caps_Lock
       remove Control = Control_L
       keysym Control_L = Caps_Lock
       keysym Caps_Lock = Control_L
       add Lock = Caps_Lock
       add Control = Control_L

       This example can be run again to swap the keys back to their previous assignments.

       The keycode command is useful for assigning the same keysym to multiple keycodes.  Although un‐
       portable,  it  also  makes  it possible to write scripts that can reset the keyboard to a known
       state.  The following script sets the backspace  key  to  generate  Delete  (as  shown  above),
       flushes  all existing caps lock bindings, makes the CapsLock key be a control key, make F5 gen‐
       erate Escape, and makes Break/Reset be a shift lock.
       !
       ! On the HP, the following keycodes have key caps as listed:
       !
       !     101  Backspace
       !      55  Caps
       !      14  Ctrl
       !      15  Break/Reset
       !      86  Stop
       !      89  F5
       !
       keycode 101 = Delete
       keycode 55 = Control_R
       clear Lock
       add Control = Control_R
       keycode 89 = Escape
       keycode 15 = Caps_Lock
       add Lock = Caps_Lock

ENVIRONMENT
       DISPLAY to get default host and display number.

SEE ALSO
       X(7), xev(1), setxkbmap(1), XStringToKeysym(3), Xlib documentation on key and pointer events

BUGS
       Every time a keycode expression is evaluated, the server generates a MappingNotify event on ev‐
       ery  client.  This can cause some thrashing.  All of the changes should be batched together and
       done at once.  Clients that receive keyboard input and ignore MappingNotify events will not no‐
       tice any changes made to keyboard mappings.

       Xmodmap should generate "add" and "remove" expressions automatically whenever a keycode that is
       already bound to a modifier is changed.

       There should be a way to have the remove expression accept keycodes  as  well  as  keysyms  for
       those times when you really mess up your mappings.

AUTHOR
       Jim  Fulton,  MIT X Consortium, rewritten from an earlier version by David Rosenthal of Sun Mi‐
       crosystems.

X Version 11                                 xmodmap 1.0.9                                  XMODMAP(1)
