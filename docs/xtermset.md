XTERMSET(1)                                                                                General Commands Manual                                                                                XTERMSET(1)



NAME
       xtermset - change settings of an xterm

SYNOPSIS
       xtermset [-option ...]

DESCRIPTION
       xtermset allows you to change the characteristics of an xterm window from the command line. Most options have the same names as those that you would give xterm at startup.

OPTIONS
       -store [<filename>]
               This option will save all the other command line options given to the filename. If filename is omitted then the options will be written to ~/.xtermsetrc.

       -default [<filename>]
               This  option will load options from the specified filename. If the filename is omitted then the options will be loaded from ~/.xtermsetrc. Options specified on the command line preceed those
               that are in the options file.

       -f, -force
               xtermset normally checks if you are using it on a correct terminal (xterm (derivative) or dtterm (derivative). With this option you can override this checking.

       -T string, -title string
               Sets the window title.

       -n string
               Sets the icon name.

       -fg color
               Sets the VT100 foreground color.

       -bg color
               Sets the VT100 background color.

       -mousefg color
               Sets the mouse pointer foreground color.

       -mousebg color
               Sets the mouse pointer background color.

       -tekfg color
               Sets the Tektronix emulation window foreground color.

       -tekbg color
               Sets the Tektronix emulation window background color.

       -cr color
               Sets the text cursor color.

       -hc color
               Sets the color for highlighted (selected) text.

       -fn font-spec, -font font-spec
               Sets the font.

       -geom geometry-spec, -geometry geometry-spec
               Sets the window size and position; see X(1) for details.

FILES
       ~/.xtermsetrc

SEE ALSO
       bash(1), xterm(1), X(1)

BUGS
       -geom does not support offsets from the left or bottom of the screen.  If the geometry-spec isn't in the correct format, the output will be strange.

AUTHORS
       Breyten Ernsting (bje@dds.nl)
       Decklin Foster (decklin@home.com)



User Commands                                                                                      Dec 2000                                                                                       XTERMSET(1)
