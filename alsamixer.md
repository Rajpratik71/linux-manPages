ALSAMIXER(1)                                                                            General Commands Manual                                                                           ALSAMIXER(1)

NAME
       alsamixer - soundcard mixer for ALSA soundcard driver, with ncurses interface

SYNOPSIS
       alsamixer [options]

DESCRIPTION
       alsamixer is an ncurses mixer program for use with the ALSA soundcard drivers. It supports multiple soundcards with multiple devices.

OPTIONS
       -h, --help
              Help: show available flags.

       -c, --card <card number or identification>
              Select the soundcard to use, if you have more than one. Cards are numbered from 0 (the default).

       -D, --device <device identification>
              Select the mixer device to control.

       -V, --view <mode>
              Select the starting view mode, either playback, capture or all.

       -g, --no-color
              Toggle the using of colors.

MIXER VIEWS
       The  top-left  corner  of alsamixer is the are to show some basic information: the card name, the mixer chip name, the current view mode and the currently selected mixer item.  When the mixer
       item is switched off, [Off] is displayed in its name.

       Volume bars are located below the basic information area.  You can scroll left/right when all controls can't be put in a single screen.  The name of each control is shown in the bottom  below
       the volume bars.  The currently selected item is drawn in red and/of emphasized.

       Each mixer control with volume capability shows a box and the current volume filled in that box.  The volume percentages are displayed below the volume bar for left and right channels.  For a
       mono control, only one value is shown there.

       When a mixer control is turned off, M (mute) appears below the volume bar.  When it's turned on, O in green appears instead.  You can toggle the switch via m key.

       When a mixer control has capture capability, the capture flag appears below the volume bar, too.  When the capture is turned off, ------- is shown.  CAPTURE in red appears  when  the  capture
       switch is turned on.  In addition, L and R letters appear in left and right side to indicate that left and the right channels are turned on.

       Some controls have the enumeration list, and don't show boxes but only texts which indicate the currently active item.  You can change the item via up/down keys.

VIEW MODES
       alsamixer  has three view modes: playback, capture and all.  In the playback view, only the controls related with playback are shown.  Similarly, only the controls for capture (recording) are
       shown in the capture view.  The all view mode shows all controls.  The current view mode is displayed in the top-left position together with the mixer name, etc.

       The default view mode is the playback view.  You can change it via -V option.

       Each view mode can be switched via keyboard commands, too.  See the next section.

KEYBOARD COMMANDS
       alsamixer recognizes the following keyboard commands to control the soundcard.  Commands shown here in upper case can also be given in lower case.  To be reminded of these keystrokes, hit the
       h key.

   General Controls
       The Left and right arrow keys are used to select the channel (or device, depending on your preferred terminology). You can also use n ("next") and p ("previous").

       The  Up  and Down Arrows control the volume for the currently selected device. You can also use + or - for the same purpose. Both the left and right signals are affected. For independent left
       and right control, see below.

       The B or = key adjusts the balance of volumes on left and right channels.

       M toggles muting for the current channel (both left and right).  If the hardware supports it, you can mute left and right independently by using , (or <) and . (or >) respectively.

       SPACE enables recording for the current channel. If any other channels have recording enabled, they will have their recording function disabled first. This only works for  valid  input  chan‐
       nels, of course.

       L re-draws the screen.

   View Mode Controls
       Function  keys  are  used  to  change  view  modes.   You  can switch to the help mode and the proc info mode via F1 and F2 keys, respectively.  On terminals that can't use function keys like
       gnome-terminal, ? and / keys can be used alternatively for help and proc modes.

       F3, F4 and F5 keys are used to switch to playback, capture and all view mode, respectively.  TAB key toggles the current view mode circularly.

   Quick Volume Changes
       PageUp increases volume by 5.

       PageDown decreases volume by 5.

       End sets volume to 0.

       You can also control left & right levels for the current channel independently, as follows:

       [Q | W | E ]  -- turn UP [ left | both | right ]

       [Z | X | C ] -- turn DOWN [ left | both | right ]

       If the currently selected mixer channel is not a stereo channel, then all UP keys will work like W, and all DOWN keys will work like X.

       The number keys from 0 to 9 are to change the absolute volume quickly.  They correspond to 0 to 90% volume.

   Selecting the Sound Card
       You can select another sound card by pressing the F6 or S keys.  This will show a list of available sound cards to choose from, and an entry to enter the mixer device name by hand.

   Exiting
       Quit the program with ALT Q, or by hitting ESC.  Please note that you might need to hit ESC twice on some terminals since it's regarded as a prefix key.

VOLUME MAPPING
       In alsamixer, the volume is mapped to a value that is more natural for a human ear.  The mapping is designed so that the position in the interval is proportional to the volume as a human  ear
       would  perceive it, i.e. the position is the cubic root of the linear sample multiplication factor.  For controls with a small range (24 dB or less), the mapping is linear in the dB values so
       that each step has the same size visually.

       Only for controls without dB information, a linear mapping of the hardware volume register values is used (this is the same algorithm as used in the old alsamixer).

SEE ALSO
        amixer(1), aplay(1), arecord(1)

BUGS
       Some terminal emulators (e.g. nxterm) may not work quite right with ncurses, but that's their own damn fault. Plain old xterm seems to be fine.

AUTHOR
       alsamixer has been written by Tim Janik and been further improved by Jaroslav Kysela <perex@perex.cz> and Clemens Ladisch <clemens@ladisch.de>.

       This manual page was provided by Paul Winkler <zarmzarm@erols.com>.

                                                                                              22 May 2009                                                                                 ALSAMIXER(1)
