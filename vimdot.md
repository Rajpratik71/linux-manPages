VIMDOT(1)                                                                                General Commands Manual                                                                                VIMDOT(1)

NAME
       vimdot - Combined text editor and dot viewer

SYNOPSIS
       vimdot [file]

DESCRIPTION
       vimdot  is  a  simple script which launches the gvim or vim editor along with a GUI window showing the dot output of the edited file.  The dot output window automatically refreshes everytime the
       file is saved in the editor.

       If no filename is given, vimdot will use 'noname.gv' and initialise it with an example graph to get you started.

       The GUI window (provided by "dot -Txlib") supports zooming using the mouse scroll-wheel, and panning by holding the scroll-wheel down and dragging.

SEE ALSO
       vim(1), dot(1)

AUTHOR
       vimdot was written by John Ellson <ellson@research.att.com>

       This manual page was written by David Claughton <dave@eclecticdave.com>, for the Debian project (but may be used by others).

                                                                                               Jan 31, 2010                                                                                     VIMDOT(1)
