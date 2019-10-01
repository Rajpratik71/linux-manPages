imsettings-switch(1)                                                                                                                                                                     imsettings-switch(1)



NAME
       imsettings-switch - Switch Input Method

SYNOPSIS
       imsettings-switch [ -hnqrx ] [ --no-update ] [ --quiet ] [ --restart ] [ --read-xinputrc ] [ --help ] [Input Method name | configuration filename]

DESCRIPTION
       imsettings-switch switches Input Method which is managed under imsettings. Either Input Method name or configuration filename are required unless --read-xinputrc option is specified to determine the
       target from $HOME/.config/imsettings/xinputrc or $xinputrcdir/xinputrc.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included below.

       -n --no-update
              Do not update $HOME/imsettings/xinputrc. without this option, imsettings-switch will updates it with the targeted Input Method.

       -q --quiet
              Do not show any messages except errors.

       -r --restart
              Restart the given Input Method or one which is determined from xinputrc by --read-xinputrc option.

       -x --read-xinputrc
              Determine the targeted Input Method from $HOME/imsettings/xinputrc or $xinputrcdir/xinputrc if not available.

       -h --help
              Show summary of options

       Input Method name
              Switch Input Method to Input Method name.

       configuration filename
              Switch Input Method to configuration filename.

SEE ALSO
       imsettings-list(1) imsettings-reload(1)

AUTHOR
       This manual page was written by Akira TAGOH <akira@tagoh.org>



                                                                                                 Apr 10, 2013                                                                            imsettings-switch(1)
