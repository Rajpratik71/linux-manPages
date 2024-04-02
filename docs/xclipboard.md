XCLIPBOARD(1)                                                                           General Commands Manual                                                                          XCLIPBOARD(1)

NAME
       xclipboard - X clipboard client

SYNOPSIS
       xclipboard [ -toolkitoption ... ] [ -w ] [ -nw ]

DESCRIPTION
       The  xclipboard  program  is used to collect and display text selections that are sent to the CLIPBOARD by other clients.  It is typically used to save CLIPBOARD selections for later use.  It
       stores each CLIPBOARD selection as a separate string, each of which can be selected.  Each time CLIPBOARD is asserted by another application, xclipboard transfers the contents of that  selec‐
       tion to a new buffer and displays it in the text window.  Buffers are never automatically deleted, so you'll want to use the delete button to get rid of useless items.

       Since  xclipboard  uses  a  Text  Widget  to  display  the contents of the clipboard, text sent to the CLIPBOARD may be re-selected for use in other applications.  xclipboard also responds to
       requests for the CLIPBOARD selection from other clients by sending the entire contents of the currently displayed buffer.

       An xclipboard window has the following buttons across the top:

       quit    When this button is pressed, xclipboard exits.

       delete  When this button is pressed, the current buffer is deleted and the next one displayed.

       new     Creates a new buffer with no contents.  Useful in constructing a new CLIPBOARD selection by hand.

       save    Displays a File Save dialog box.  Pressing the Accept button saves the currently displayed buffer to the file specified in the text field.

       next    Displays the next buffer in the list.

       previous
               Displays the previous buffer.

OPTIONS
       The xclipboard program accepts all of the standard X Toolkit command line options as well as the following:

       -w      This option indicates that lines of text that are too long to be displayed on one line in the clipboard should wrap around to the following lines.

       -nw     This option indicates that long lines of text should not wrap around.  This is the default behavior.

WIDGETS
       In order to specify resources, it is useful to know the hierarchy of the widgets which compose xclipboard.  In the notation below, indentation indicates hierarchical  structure.   The  widget
       class name is given first, followed by the widget instance name.

       XClipboard  xclipboard
               Form  form
                       Command  Quit
                       Command  delete
                       Command  new
                       Command  Save
                       Command  next
                       Command  prev
                       Label  index
                       Text  text
               TransientShell  fileDialogShell
                       Dialog  fileDialog
                               Label  label
                               Command  accept
                               Command  cancel
                               Text value
               TransientShell  failDialogShell
                       Dialog  failDialog
                               Label  label
                               Command  continue

SENDING/RETRIEVING CLIPBOARD CONTENTS
       Text  is  copied  to  the clipboard whenever a client asserts ownership of the CLIPBOARD selection.  Text is copied from the clipboard whenever a client requests the contents of the CLIPBOARD
       selection.  Examples of event bindings that a user may wish to include in a resource configuration file to use the clipboard are:

       *VT100.Translations: #override \
               <Btn3Up>:       select-end(CLIPBOARD) \n\
               <Btn2Up>:       insert-selection(PRIMARY,CLIPBOARD) \n\
               <Btn2Down>:     ignore ()

SEE ALSO
       X(7), xcutsel(1), xterm(1), individual client documentation for how to make a selection and send it to the CLIPBOARD.

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

FILES
       /etc/X11/app-defaults/XClipboard
              specifies required resources

AUTHOR
       Ralph R. Swick, DEC/MIT Project Athena
       Chris D. Peterson, MIT X Consortium
       Keith Packard, MIT X Consortium

X Version 11                                                                               xclipboard 1.1.3                                                                              XCLIPBOARD(1)
