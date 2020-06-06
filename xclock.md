XCLOCK(1)                                                                                General Commands Manual                                                                                XCLOCK(1)

NAME
       xclock - analog / digital clock for X

SYNOPSIS
       xclock  [  -help  ]  [  -analog  |  -digital ] [ -brief ] [ -chime ] [ -hd color ] [ -hl color ] [ -update seconds ] [ -strftime format ] [ -twelve | -twentyfour | -utime ] [ -padding number ] [
       -norender ] [ -render ] [ -sharp ] [ -face pattern ]

DESCRIPTION
       The xclock program displays the time in analog or digital form.  The time is continuously updated at a frequency which may be specified by the user.

OPTIONS
       Xclock accepts all of the standard X Toolkit command line options along with the additional options listed below:

       -help   This option indicates that a brief summary of the allowed options should be printed on the standard error.

       -analog This option indicates that a conventional 12 hour clock face with tick marks and hands should be used.  This is the default.

       -digital or -d
               This option indicates that a 24 hour digital clock should be used.

       -brief  This option indicates that the digital clock should only display the hours and minutes fields.  The default is to show the full time and date information.

       -utime  This option indicates that a digital clock should display seconds since the Epoch (in format '970012340 seconds since Epoch' instead of a standard 24-hour time.

       -strftime format
               This option allows an strftime(3) format string to be specified for the digital clock's display.

       -twelve This option indicates that a digital clock should display the time in twelve hour format.

       -twentyfour
               This option indicates that a digital clock should display the time in twenty-four hour format.  This is the default when a digital clock is used.

       -chime  This option indicates that the clock should chime once on the half hour and twice on the hour.

       -hands color (or -hd color)
               This option specifies the color of the hands on an analog clock.  The default is black.  This option is effectively ignored when Xrender is in use.

       -highlight color (or -hl color)
               This option specifies the color of the edges of the hands on an analog clock, and is only useful on color displays.  The default is black.  This option is effectively ignored when  Xren‐
               der is in use.

       -update seconds
               This  option specifies the frequency in seconds at which xclock should update its display.  If the clock is obscured and then exposed, it will be updated immediately.  A value of 30 sec‐
               onds or less will enable a second hand on an analog clock.  The default is 60 seconds.

       -padding number
               This option specifies the width in pixels of the padding between the window border and clock text or picture.  The default is 10 on a digital clock and 8 on an analog clock.

       -render This option tells xclock to use the Xrender extension to draw an anti-aliased face. This is the default if xclock has been compiled with Xrender support.  Note that the  color  selection
               options and resources used when Xrender is in effect differ from the standard options.

       -norender
               This option turns off the use of Xrender to draw the clock.

       -sharp  This option tells xclock to use sharper edges when drawn using the Xrender extension.

       -face pattern
               This  option specifies the font to use in digital mode when the Xrender extension is used.  Patterns are specified using the fontconfig face format described in the Font Names section of
               fonts.conf(5).

X DEFAULTS
       This program uses the Clock widget.  It understands all of the core resource names and classes as well as:

       width (class Width)
               Specifies the width of the clock.  The default for analog clocks is 164 pixels; the default for digital clocks is whatever is needed to hold the clock when displayed in the chosen font.

       height (class Height)
               Specifies the height of the clock.  The default for analog clocks is 164 pixels; the default for digital clocks is whatever is needed to hold the clock when displayed in the chosen font.

       update (class Interval)
               Specifies the frequency in seconds at which the time should be redisplayed.

       foreground (class Foreground)
               Specifies the color for the tick marks. The default depends on whether reverseVideo is specified.  If reverseVideo is specified the default is lwhite, otherwise the default is black.

       hands (class Foreground)
               Specifies the color of the insides of the clock's hands. The default depends on whether reverseVideo is specified.  If reverseVideo is specified the  default  is  lwhite,  otherwise  the
               default is black.  Note that this resource is not used when Xrender is in effect.

       highlight (class Foreground)
               Specifies the color used to highlight the clock's hands. The default is
                depends  on  whether reverseVideo is specified.  If reverseVideo is specified the default is lwhite, otherwise the default is black.  Note that this resource is not used when Xrender is
               in effect.

       analog (class Boolean)
               Specifies whether or not an analog clock should be used instead of a digital one.  The default is True.

       twentyfour (class Boolean)
               Specifies whether or not a digital clock should display the time in twenty-four hour format.  The default is True.

       chime (class Boolean)
               Specifies whether or not a bell should be rung on the hour and half hour.

       padding (class Margin)
               Specifies the amount of internal padding in pixels to be used.  The default is 8.

       font (class Font)
               Specifies the font to be used for the digital clock.  Note that variable width fonts currently will not always display correctly.  This font is only used when Xrender is not in effect.

       render (class Boolean)
               Specifies whether or not the Xrender extension should be used for the display. The default is True if xclock has been compiled with Xrender support.

       When Xrender is in effect, the following additional resources are understood:

       face (class FaceName)
               Specify the pattern for the font to be used for the digital clock when Xrender is used.   Patterns are specified using the fontconfig face format described in the Font Names  section  of
               fonts.conf(5).

       sharp (class Boolean)
               Specifies if sharp edges should be used when rendering the clock.  The default is False.

       buffer (class Boolean)
               Specifies that the updates of the image are drawn to a pixmap before copied into the window instead drawing them into the window directly.

       The defaults of the following color resources depend on whether reverseVideo is specified.  If reverseVideo is specified the default is lwhite, otherwise the default is black.

       hourColor (class Foreground)
               The color of the hour hand.

       minuteColor (class Foreground)
               The color of the minute hand.

       secondColor (class Foreground)
               The color of the second hand.

       majorColor (class Foreground)
               The color of the major scale ticks (i. e. each five minutes).

       minorColor (class Foreground)
               The color of the minor scale ticks (between major ticks).

WIDGETS
       In  order  to  specify  resources, it is useful to know the hierarchy of the widgets which compose xclock.  In the notation below, indentation indicates hierarchical structure.  The widget class
       name is given first, followed by the widget instance name.

       XClock  xclock
               Clock  clock

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

FILES
       /etc/X11/app-defaults/XClock
              specifies required resources

SEE ALSO
       X(7), xrdb(1), time(3), fonts.conf (5).

BUGS
       Xclock believes the system clock.

       When in digital mode, the string should be centered automatically.

AUTHORS
       Tony Della Fera (MIT-Athena, DEC)
       Dave Mankins (MIT-Athena, BBN)
       Ed Moy (UC Berkeley)

X Version 11                                                                                   xclock 1.0.7                                                                                     XCLOCK(1)
