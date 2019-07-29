XMESSAGE(1)                                                   General Commands Manual                                                  XMESSAGE(1)

NAME
       xmessage - display a message or query in a window (X-based /bin/echo)

SYNOPSIS
       xmessage [ -buttons label1[:value1],label2[:value2], ...  ] [ options ] -file filename
       xmessage [ -buttons label1[:value1],label2[:value2], ...  ] [ options ] message ...

DESCRIPTION
       The  xmessage program displays a window containing a message from the command line, a file, or standard input.  Along the lower edge of the
       message is row of buttons; clicking the left mouse button on any of these buttons will cause xmessage to exit.  Which button was pressed is
       returned in the exit status and, optionally, by writing the label of the button to standard output.

       The program is typically used by shell scripts to display information to the user or to ask the user to make a choice.

       Unless  a  size  is  specified,  xmessage sizes itself to fit the message, up to a maximum size.  If the message is too big for the window,
       xmessage will display scroll bars.

OPTIONS
       These are the command line options that xmessage understands, in addition to the standard ones listed in X(7).

       -buttons button,button,...
               This option will cause xmessage to create one button for each comma-separated button argument.  The corresponding resource is  but‐
               tons.  Each button consists of a label optionally followed by a colon and an exit value.  The label is the name of the Command but‐
               ton widget created and will be the default text displayed to the user.  Since this is the name of the widget  it  may  be  used  to
               change  any  of the resources associated with that button.  The exit value will be returned by xmessage if that button is selected.
               The default exit value is 100 plus the button number.  Buttons are numbered from the left starting with one.  The default string if
               no -buttons option is given is okay:0.

       -default label
               Defines  the  button with a matching label to be the default.  If not specified there is no default.  The corresponding resource is
               defaultButton.  Pressing Return anywhere in the xmessage window will activate the default button.  The default button has  a  wider
               border than the others.

       -file filename
               File  to  display.   The  corresponding resource is file.  A filename of `-' reads from standard input.  If this option is not sup‐
               plied, xmessage will display all non-option arguments in the style of echo.  Either -file or a message on the command  line  should
               be provided, but not both.

       -print  This  will  cause  the  program  to write the label of the button pressed to standard output.  Equivalent to setting the printValue
               resource to TRUE.  This is one way to get feedback as to which button was pressed.

       -center Pop up the window at the center of the screen.  Equivalent to setting the center resource to TRUE.

       -nearmouse
               Pop up the window near the mouse cursor.  Equivalent to setting the nearMouse resource to TRUE.

       -timeout secs
               Exit with status 0 after secs seconds if the user has not clicked on a button yet.  The corresponding resource is timeout.

WIDGET HIERARCHY
       Knowing the name and position in the hierarchy of each widget is useful when specifying resources for them.  In the  following  chart,  the
       class and name of each widget is given.

       Xmessage (xmessage)
            Form form
                 Text message
                 Command (label1)
                 Command (label2)
                 .
                 .
                 .

RESOURCES
       The program has a few top-level application resources that allow customizations that are specific to xmessage.

       file    A String specifying the file to display.

       buttons A String specifying the buttons to display.  See the -buttons command-line option.

       defaultButton
               A String specifying a default button by label.

       printValue
               A  Boolean value specifying whether the label of the button pressed to exit the program is written to standard output.  The default
               is FALSE.

       center  A Boolean value specifying whether to pop up the window at the center of the screen.  The default is FALSE.

       nearMouse
               A Boolean value specifying whether to pop up the window near the mouse cursor.  The default is FALSE.

       timeout The number of seconds after which to exit with status 0.  The default is 0, which means never time out.

       maxHeight (class Maximum)
               The maximum height of the text part of the window in pixels, used if no size was specified in the  geometry.   The  default  is  0,
               which means use 70% of the height of the screen.

       maxWidth (class Maximum)
               The maximum width of the text part of the window in pixels, used if no size was specified in the geometry.  The default is 0, which
               means use 70% of the width of the screen.

ACTIONS
       exit(value)
               exit immediately with an exit status of value (default 0).  This action can be used with translations to provide alternate ways  of
               exiting xmessage.

       default-exit()
               exit immediately with the exit status specified by the default button.  If there is no default button, this action has no effect.

EXIT STATUS
       If it detects an error, xmessage returns 1, so this value should not be used with a button.

SEE ALSO
       X(7), echo(1), cat(1)

AUTHORS
       Chris Peterson, MIT Project Athena
       Stephen Gildea, X Consortium

X Version 11                                                      xmessage 1.0.4                                                       XMESSAGE(1)
