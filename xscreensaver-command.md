xscreensaver-command(1)                                         XScreenSaver manual                                        xscreensaver-command(1)

NAME
       xscreensaver-command - control a running xscreensaver process

SYNOPSIS
       xscreensaver-command  [-display host:display.screen] [-help | -demo | -prefs | -activate | -deactivate | -cycle | -next | -prev | -select n
       | -exit | -restart | -lock | -version | -time | -watch]

DESCRIPTION
       The xscreensaver-command program controls a running xscreensaver process by sending it client-messages.

       xscreensaver(1) has a client-server model: the xscreensaver process is a daemon that runs in the background;  it  is  controlled  by  other
       foreground programs such as xscreensaver-command and xscreensaver-demo(1).

       This program, xscreensaver-command, is a command-line-oriented tool; the xscreensaver-demo(1).  program is a graphical tool.

OPTIONS
       xscreensaver-command accepts the following command-line options:

       -help   Prints a brief summary of command-line options.

       -demo   This  just  launches  the  xscreensaver-demo(1) program, in which one can experiment with the various graphics hacks available, and
               edit parameters.

       -demo number
               When the -demo option is followed by an integer, it instructs the xscreensaver daemon to run that hack, and wait for  the  user  to
               click  the mouse before deactivating (i.e., mouse motion does not deactivate.)  This is the mechanism by which xscreensaver-demo(1)
               communicates with the xscreensaver(1) daemon.  (The first hack in the list is numbered 1, not 0.)

       -prefs  Like the no-argument form of -demo, but brings up that program's Preferences panel by default.

       -activate
               Tell xscreensaver to turn on immediately (that is, blank the screen, as if the user had been idle for long  enough.)   The  screen‐
               saver will deactivate as soon as there is any user activity, as usual.

               It is useful to run this from a menu; you may wish to run it as
               sleep 5 ; xscreensaver-command -activate
               to  be  sure that you have time to take your hand off the mouse before the screensaver comes on.  (Because if you jiggle the mouse,
               xscreensaver will notice, and deactivate.)

       -deactivate
               This tells xscreensaver to pretend that there has just been user activity.  This means that  if  the  screensaver  is  active  (the
               screen  is  blanked),  then this command will cause the screen to un-blank as if there had been keyboard or mouse activity.  If the
               screen is locked, then the password dialog will pop up first, as usual.  If the screen is not blanked,  then  this  simulated  user
               activity will re-start the countdown (so, issuing the -deactivate command periodically is one way to prevent the screen from blank‐
               ing.)

       -cycle  If the screensaver is active (the screen is blanked), then stop the current graphics demo and run a new one (chosen randomly.)

       -next   This is like either -activate or -cycle, depending on which is more appropriate, except that the graphics hack that will be run  is
               the next one in the list, instead of a randomly-chosen one.  In other words, repeatedly executing -next will cause the xscreensaver
               process to invoke each graphics demo sequentially.  (Though using the -demo option is probably an easier way to accomplish that.)

       -prev   This is like -next, but cycles in the other direction.

       -select number
               Like -activate, but runs the Nth element in the list of hacks.  By knowing what is in the programs list, and in what order, you can
               use this to activate the screensaver with a particular graphics demo.  (The first element in the list is numbered 1, not 0.)

       -exit   Causes the xscreensaver process to exit gracefully.  This does nothing if the display is currently locked.

               Warning: never use kill -9 with xscreensaver while the screensaver is active.  If you are using a virtual root window manager, that
               can leave things in an inconsistent state, and you may need to restart your window manager to repair the damage.

       -lock   Tells the running xscreensaver process to lock the screen immediately.  This is like -activate, but forces locking as well, even if
               locking  is  not  the default (that is, even if xscreensaver's lock resource is false, and even if the lockTimeout resource is non-
               zero.)

               Note that locking doesn't work unless the xscreensaver process is running as you.  See xscreensaver(1) for details.

       -version
               Prints the version of xscreensaver that is currently running on the display: that is, the actual  version  number  of  the  running
               xscreensaver  background  process,  rather than the version number of xscreensaver-command.  (To see the version number of xscreen‐
               saver-command itself, use the -help option.)

       -time   Prints the time at which the screensaver last activated or deactivated (roughly, how long the user has been idle or  non-idle:  but
               not quite, since it only tells you when the screen became blanked or un-blanked.)

       -restart
               Causes  the  screensaver  process to exit and then restart with the same command line arguments as last time.  You shouldn't really
               need to do this, since xscreensaver notices when the .xscreensaver file has changed and re-reads it as needed.

       -watch  Prints a line each time the screensaver changes state: when the screen blanks,  locks,  unblanks,  or  when  the  running  hack  is
               changed.  This option never returns; it is intended for use by shell scripts that want to react to the screensaver in some way.  An
               example of its output would be:
               BLANK Fri Nov  5 01:57:22 1999
               RUN 34
               RUN 79
               RUN 16
               LOCK Fri Nov  5 01:57:22 1999
               RUN 76
               RUN 12
               UNBLANK Fri Nov  5 02:05:59 1999
               The above shows the screensaver activating, running three different hacks, then locking (perhaps because the lock-timeout went off)
               then  unblanking  (because  the user became active, and typed the correct password.)  The hack numbers are their index in the `pro‐
               grams' list (starting with 1, not 0, as for the -select command.)

               For example, suppose you want to run a program that turns down the volume on your machine when the screen blanks, and turns it back
               up  when  the  screen  un-blanks.  You could do that by running a Perl program like the following in the background.  The following
               program tracks the output of the -watch command and reacts accordingly:
               #!/usr/bin/perl

               my $blanked = 0;
               open (IN, "xscreensaver-command -watch |");
               while (<IN>) {
                   if (m/^(BLANK|LOCK)/) {
                       if (!$blanked) {
                           system "sound-off";
                           $blanked = 1;
                       }
                   } elsif (m/^UNBLANK/) {
                       system "sound-on";
                       $blanked = 0;
                   }
               }
               Note that LOCK might come either with or without a preceding BLANK (depending on whether the  lock-timeout  is  non-zero),  so  the
               above program keeps track of both of them.

STOPPING GRAPHICS
       If  xscreensaver is running, but you want it to stop running screen hacks (e.g., if you are logged in remotely, and you want the console to
       remain locked but just be black, with no graphics processes running) you can accomplish that by simply powering down the monitor  remotely.
       In  a  minute  or  so, xscreensaver will notice that the monitor is off, and will stop running screen hacks.  You can power off the monitor
       like so:
       xset dpms force off
       See the xset(1) manual for more info.

       You can also use xscreensaver-demo(1) to make the monitor power down after a few hours, meaning that xscreensaver will run  graphics  until
       it has been idle for the length of time you specified; and after that, the monitor will power off, and screen hacks will stop being run.

DIAGNOSTICS
       If  an  error  occurs  while  communicating  with  the xscreensaver daemon, or if the daemon reports an error, a diagnostic message will be
       printed to stderr, and xscreensaver-command will exit with a non-zero value.  If the command is accepted, an indication  of  this  will  be
       printed to stdout, and the exit value will be zero.

ENVIRONMENT
       DISPLAY to get the host and display number of the screen whose saver is to be manipulated.

       PATH    to  find  the  executable  to  restart  (for the -restart command).  Note that this variable is consulted in the environment of the
               xscreensaver process, not the xscreensaver-command process.

UPGRADES
       The latest version of xscreensaver(1) and related tools can always be found at https://www.jwz.org/xscreensaver/

SEE ALSO
       X(1), xscreensaver(1), xscreensaver-demo(1), xset(1)

COPYRIGHT
       Copyright © 1992-2013 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any
       purpose  is  hereby  granted without fee, provided that the above copyright notice appear in all copies and that both that copyright notice
       and this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for  any
       purpose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>, 13-aug-1992.

       Please let me know if you find any bugs or make any improvements.

X Version 11                                                    5.40 (12-Aug-2018)                                         xscreensaver-command(1)
