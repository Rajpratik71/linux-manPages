xdmxconfig(1)                                                                              General Commands Manual                                                                              xdmxconfig(1)



NAME
       xdmxconfig - a graphical configuration tool for Xdmx configuration files

SYNOPSIS
       xdmxconfig [filename]

DESCRIPTION
       xdmxconfig reads, edits, and writes configuration files for the Xdmx server.  The grammar for the configuration file is specified in the Xdmx(1) manual page.

       To start from scratch, create a "New Global" and specify the name and overall dimensions for the configuration.  Then use "New Display" to enter more displays.

       If there is more than one configuration, the configuration name button will bring up a selection menu.

       In  the right-hand pannel, the left mouse button will move the highlighted display at "tool resolution"; the middle mouse button will move the highlighted display by a single pixel (at "wall resolu-
       tion"); and the right mouse button will bring up a menu allowing the highlighted display to be edited or deleted.  The arrow keys will also move the highlighted display by a single pixel.

BUGS
       Currently, entries with the wall keyword are not editable, but will be preserved in the new output file.  The tool will quit when requested by the user, even if a configuration  file  has  not  been
       written out (i.e., without warning).  The menu interaction should be improved (menu entries that don't currently work should be greyed-out, for example).  The Help button does not work.

SEE ALSO
       Xdmx(1), vdltodmx(1)



X Version 11                                                                                  xorg-server 1.18.3                                                                                xdmxconfig(1)
