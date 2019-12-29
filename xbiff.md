XBIFF(1)                                General Commands Manual                               XBIFF(1)

NAME
       xbiff - mailbox flag for X

SYNOPSIS
       xbiff [ -toolkitoption ... ] [ -option ... ]

DESCRIPTION
       The xbiff program displays a little image of a mailbox.  When there is no mail, the flag on the
       mailbox is down.  When mail arrives, the flag goes up  and  the  mailbox  beeps.   By  default,
       pressing  any  mouse  button in the image forces xbiff to remember the current size of the mail
       file as being the ``empty'' size and to lower the flag.

OPTIONS
       Xbiff accepts all of the standard X Toolkit command line options along with the additional  op‐
       tions listed below:

       -help   This  option indicates that a brief summary of the allowed options should be printed on
               the standard error.

       -update seconds
               This option specifies the frequency in seconds at which xbiff should  update  its  dis‐
               play.   If  the  mailbox  is obscured and then exposed, it will be updated immediately.
               The default is 30 seconds.

       -file filename
               This option specifies the name of the file which should be monitored.   By  default  it
               watches  your  inbox  in  the  default  location  for  your  system  (some examples are
               /var/mail/username, /usr/spool/mail/username, /var/spool/mail/username (where  username
               is your login name).  If the MAIL environment variable is set, the file specified by it
               will be monitored.

       -volume percentage
               This option specifies how loud the bell should be rung when new mail comes in.

       -shape  This option indicates that the mailbox window should be shaped if masks for  the  empty
               or full images are given.

       The following standard X Toolkit command line arguments are commonly used with xbiff:

       -display display
               This option specifies the X server to contact.

       -geometry geometry
               This option specifies the preferred size and position of the mailbox window.  The mail‐
               box is 48 pixels wide and 48 pixels high and will be centered in the window.

       -bg color
               This option specifies the color to use for the background of the window.

       -bd color
               This option specifies the color to use for the border of the window.

       -bw number
               This option specifies the width in pixels of the border surrounding the window.

       -fg color
               This option specifies the color to use for the foreground of the window.

       -rv     This option indicates that reverse video should be simulated by swapping the foreground
               and background colors.

       -xrm resourcestring
               This option specifies a resource string to be used.  This is especially useful for set‐
               ting resources that do not have separate command line options.

X DEFAULTS
       The application class name is XBiff.  This program uses the Mailbox widget.  It understands all
       of the core resource names and classes as well as:

       checkCommand (class CheckCommand)
               Specifies  a  shell  command to be executed to check for new mail rather than examining
               the size of file.  The specified string value is used as the argument  to  a  system(3)
               call and may therefore contain i/o redirection.  An exit status of 0 indicates that new
               mail is waiting, 1 indicates that there has been no change in  size,  and  2  indicates
               that the mail has been cleared.  By default, no shell command is provided.

       file (class File)
               Specifies  the  name of the file to monitor.  The default is as described above for the
               -file command line option.

       onceOnly (class Boolean)
               Specifies that the bell is only rung the first time new mail is found and is  not  rung
               again  until  at  least  one interval has passed with no mail waiting.  The window will
               continue to indicate the presence of new mail until it has been retrieved.  The default
               is false.

       width (class Width)
               Specifies the width of the mailbox.

       height (class Height)
               Specifies the height of the mailbox.

       update (class Interval)
               Specifies the frequency in seconds at which the mail should be checked.  The default is
               30.

       volume (class Volume)
               Specifies how loud the bell should be rung.  The default is 33 percent.

       foreground (class Foreground)
               Specifies the color for the foreground.

       reverseVideo (class ReverseVideo)
               Specifies that the foreground and background should be reversed.

       flip (class Flip)
               Specifies whether or not the image that is shown when mail has arrived  should  be  in‐
               verted.  The default is ``true.''

       fullPixmap (class Pixmap)
               Specifies a bitmap to be shown when new mail has arrived.  The default is flagup.

       emptyPixmap (class Pixmap)
               Specifies a bitmap to be shown when no new mail is present.  The default is flagdown.

       shapeWindow (class ShapeWindow)
               Specifies  whether  or not the mailbox window should be shaped to the given fullPixmap‐
               Mask and emptyPixmapMask.  The default is false.

       fullPixmapMask (class PixmapMask)
               Specifies a mask for the bitmap to be shown when new mail has arrived.  The default  is
               none.

       emptyPixmapMask (class PixmapMask)
               Specifies  a  mask for the bitmap to be shown when no new mail is present.  The default
               is none.

ACTIONS
       The Mailbox widget provides the following actions for use in event translations:

       check() This action causes the widget to check for new mail and display the flag appropriately.

       unset() This action causes the widget to lower the flag until new mail comes in.

       set()   This action causes the widget to raise the flag until the user resets it.

       The default translation is

               <ButtonPress>:  unset()

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources  stored  in  the
               RESOURCE_MANAGER property.

SEE ALSO
       X(7), xrdb(1), stat(2)

BUGS
       The mailbox bitmaps are ugly.

AUTHOR
       Jim Fulton, MIT X Consortium
       Additional hacks by Ralph Swick, DEC/MIT Project Athena

X Version 11                                  xbiff 1.0.3                                     XBIFF(1)
