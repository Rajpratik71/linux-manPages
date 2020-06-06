XCUTSEL(1)                                                                               General Commands Manual                                                                               XCUTSEL(1)

NAME
       xcutsel - interchange between cut buffer and selection

SYNOPSIS
       xcutsel [ -toolkitoption ...] [-selection selection] [-cutbuffer number]

DESCRIPTION
       The  xcutsel  program  is used to copy the current selection into a cut buffer and to make a selection that contains the current contents of the cut buffer.  It acts as a bridge between applica‐
       tions that don't support selections and those that do.

       By default, xcutsel will use the selection named PRIMARY and the cut buffer CUT_BUFFER0.  Either or both of these can be overridden by command line arguments or by resources.

       An xcutsel window has the following buttons:

           quit
               When this button is pressed, xcutsel exits.  Any selections held by xcutsel are automatically released.

           copy PRIMARY to 0
               When this button is pressed, xcutsel copies the current selection into the cut buffer.

           copy 0 to PRIMARY
               When this button is pressed, xcutsel converts the current contents of the cut buffer into the selection.

       The button labels reflect the selection and cutbuffer selected by command line options or through the resource database.

       When the ``copy 0 to PRIMARY'' button is activated, the button will remain inverted as long as xcutsel remains the owner of the selection.  This serves to remind you which client owns  the  cur‐
       rent selection.  Note that the value of the selection remains constant; if the cutbuffer is changed, you must again activate the copy button to retrieve the new value when desired.

OPTIONS
       Xcutsel accepts all of the standard X Toolkit command line options as well as the following:

       -selection name
               This  option  specifies the name of the selection to use.  The default is PRIMARY.  The only supported abbreviations for this option are ``-select'', ``-sel'' and ``-s'', as the standard
               toolkit option ``-selectionTimeout'' has a similar name.

       -cutbuffer number
               This option specifies the cut buffer to use.  The default is cut buffer 0.

X DEFAULTS
       This program accepts all of the standard X Toolkit resource names and classes as well as:

       selection (class Selection)
               This resource specifies the name of the selection to use.  The default is PRIMARY.

       cutBuffer (class CutBuffer)
               This resource specifies the number of the cut buffer to use.  The default is 0.

WIDGET NAMES
       The following instance names may be used when user configuration of the labels in them is desired:

       sel-cut (class Command)
               This is the ``copy SELECTION to BUFFER'' button.

       cut-sel (class Command)
               This is the ``copy BUFFER to SELECTION'' button.

       quit (class Command)
               This is the ``quit'' button.

SEE ALSO
       X(7), xclipboard(1), xterm(1), text widget documentation, individual client documentation for how to make a selection.

BUGS
       There is no way to change the name of the selection or the number of the cut buffer while the program is running.

AUTHOR
       Ralph R. Swick, DEC/MIT Project Athena

X Version 11                                                                                 xclipboard 1.1.3                                                                                  XCUTSEL(1)
