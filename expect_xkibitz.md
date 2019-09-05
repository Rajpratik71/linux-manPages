XKIBITZ(1)                                                    General Commands Manual                                                   XKIBITZ(1)

NAME
       xkibitz - allow multiple people to interact in an xterm

SYNOPSIS
       xkibitz [ xkibitz-args ] [ program program-args...  ]

INTRODUCTION
       xkibitz allows users in separate xterms to share one shell (or any program that runs in an xterm).  Uses include:

              ·   A  novice  user  can ask an expert user for help.  Using xkibitz, the expert can see what the user is doing, and offer advice or
                  show how to do it right.

              ·   By running xkibitz and then starting a full-screen editor, people may carry out a conversation, retaining the ability to  scroll
                  backwards, save the entire conversation, or even edit it while in progress.

              ·   People  can  team  up on games, document editing, or other cooperative tasks where each person has strengths and weaknesses that
                  complement one another.

              ·   If you want to have a large number of people do an on-line code walk-through, you can sit two in front of each workstation,  and
                  then connect them all together while you everyone looks at code together in the editor.

USAGE
       To start xkibitz, one user (the master) runs xkibitz with no arguments.

       xkibitz  starts  a  new  shell  (or another program, if given on the command line).  The user can interact normally with the shell, or upon
       entering an escape (described when xkibitz starts) can add users to the interaction.

       To add users, enter "+ display" where display is the X display name.  If there is no ":X.Y" in the display name, ":0.0"  is  assumed.   The
       master  user  must have permission to access each display.  Each display is assigned a tag - a small integer which can be used to reference
       the display.

       To show the current tags and displays, enter "=".

       To drop a display, enter "- tag" where tag is the display's tag according to the "=" command.

       To return to the shared shell, enter "return".  Then the keystrokes of all users become the input  of  the  shell.   Similarly,  all  users
       receive the output from the shell.

       To  terminate xkibitz it suffices to terminate the shell itself.  For example, if any user types ^D (and the shell accepts this to be EOF),
       the shell terminates followed by xkibitz.

       Normally, all characters are passed uninterpreted.  However, in the escape dialogue the user talks directly  to  the  xkibitz  interpreter.
       Any  Expect(1)  or  Tcl(3) commands may also be given.  Also, job control may be used while in the interpreter, to, for example, suspend or
       restart xkibitz.

       Various processes can produce various effects.  For example, you can emulate a multi-way write(1) session with the command:

            xkibitz sleep 1000000

ARGUMENTS
       xkibitz understands a few special arguments which should appear before the program name (if given).  Each argument should be  separated  by
       whitespace.  If the arguments themselves takes arguments, these should also be separated by whitespace.

       -escape sets the escape character.  The default escape character is ^].

       -display  adds  a  display  much  like the "+" command.  Multiple -display flags can be given.  For example, to start up xkibitz with three
       additional displays:

            xkibitz -display mercury -display fox -display dragon:1.0

CAVEATS
       Due to limitations in both X and UNIX, resize propagation is weak.

       When the master user resizes the xterm, all the other xterms are logically resized.  Unfortunately, xkibitz cannot force the physical xterm
       size to correspond with the logical xterm sizes.

       The  other  users  are  free to resize their xterm but their sizes are not propagated.  The master can check the logical sizes with the "="
       command.

       Deducing the window size is a non-portable operation.  The code is known to work for recent versions of SunOS, AIX, Unicos, and HPUX.  Send
       back mods if you add support for anything else.

ENVIRONMENT
       The environment variable SHELL is used to determine and start a shell, if no other program is given on the command line.

       If  the  environment variable DISPLAY is defined, its value is used for the display name of the xkibitz master (the display with tag number
       0). Otherwise this name remains empty.

       Additional arguments may be passed to new xterms through the environment variable XKIBITZ_XTERM_ARGS.  For example, to create xterms with a
       scrollbar and a green pointer cursor:

            XKIBITZ_XTERM_ARGS="-sb -ms green"
            export XKIBITZ_XTERM_ARGS

       (this  is for the Bourne shell - use whatever syntax is appropriate for your favorite shell). Any option can be given that is valid for the
       xterm command, with the exception of -display, -geometry and -S as those are set by xkibitz.

SEE ALSO
       Tcl(3), libexpect(3) kibitz(1)
       "Exploring Expect: A Tcl-Based Toolkit for Automating Interactive Programs" by Don Libes, O'Reilly and Associates, January 1995.
       "kibitz - Connecting Multiple Interactive Programs Together", by Don Libes, Software - Practice & Experience, John Wiley & Sons, West  Sus‐
       sex, England, Vol. 23, No. 5, May, 1993.

AUTHOR
       Don Libes, National Institute of Standards and Technology

                                                                  06 October 1994                                                       XKIBITZ(1)
