UNCLUTTER(1X)                                                                                                                                                                                   UNCLUTTER(1X)



NAME
       unclutter - remove idle cursor image from screen

SYNOPSIS
       unclutter [-display|-d display] [-idle seconds] [-keystroke] [-jitter pixels] [-grab] [-noevents] [-reset] [-root] [-onescreen] [-not] name ...

DESCRIPTION
       unclutter removes the cursor image from the screen so that it does not obstruct the area you are looking at after it has not moved for a given time.  It does not do this if the cursor is in the root
       window or a button is down.  It tries to ignore jitter (small movements due to noise) if you have a mouse that twitches.

OPTIONS
       -display
              is followed by the display to open.

       -idle  is followed by the number of seconds between polls for idleness.  The default is 5.

       -keystroke
              tells unclutter not to use a timeout to determine when to remove the cursor, but to instead wait until a key has been pressed (released, really).

       -jitter
              is followed by the amount of movement of the pointer that is to be ignored and considered as random noise.  The default is 0.

       -grab  means use the original method of grabbing the pointer in order to remove the cursor.  This often doesn't interoperate too well with some window managers.

       -noevents
              stops unclutter sending a pseudo EnterNotify event to the X client whose cursor has been stolen.  Sending the event helps programs like emacs think that they have not lost the pointer  focus.
              This option is provided for backwards compatibility in case some clients get upset.

       -reset resets  the  timeout  for idleness after the cursor is restored for some reason (such as a window being pushed or popped) even though the x y coordinates of the cursor have not changed.  Nor-
              mally, the cursor would immediately be removed again.

       -root  means remove the cursor even if it is on the root background, where in principle it should not be obscuring anything useful.

       -onescreen
              restricts unclutter to the single screen specified as display, or the default screen for the display.  Normally, unclutter will unclutter all the screens on a display.

       -not   is followed by a list of window names where the cursor should not be removed.  The first few characters of the WM_NAME property on the window need to match one the listed names.   This  argu-
              ment must be the last on the command line.

LIMITATIONS
       The  -keystroke  option may not work (that is, the cursor will not disappear) with clients that request KeyRelease events.  Games and Xt applications using KeyUp in their translation tables are most
       likely to suffer from this problem.  The most feasible solution is to extend unclutter to use the XTest extension to get all keyboard and mouse events, though this of course requires XTest to be  in
       the server too.

       The  -keystroke  option  does  not  distinguish modifier keys from keys which actually generate characters.  If desired this could be implemented in a simple way by using XLookupString to see if any
       characters are returned.

DIAGNOSTICS
       The message

        someone created a sub-window to my sub-window!

       means that unclutter thinks a second unclutter is running, and tried to steal the cursor by creating a sub-window to the sub-window already used to steal the cursor.  This situation quickly deterio-
       rates into a fight no one can win, so it is detected when possible and the program gives up.

AUTHOR
       Mark M Martin. cetia 7feb1994. mmm@cetia.fr



                                                                                                                                                                                                UNCLUTTER(1X)
