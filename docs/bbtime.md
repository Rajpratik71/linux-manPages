BBTIME(1)                                                     General Commands Manual                                                    BBTIME(1)

NAME
       bbtime - Display the time in a small blackbox style window

SYNOPSIS
       bbtime [-display <displayname>] [-config <filename>]
              [-spooldir] [-version] [-help] [[-position] | [-pos]] <position>

DESCRIPTION
       This manual page documents briefly the bbtime command.

       bbtime displays the time in a small blackbox style window.

OPTIONS
       A summary of options are included below.

       -d[isplay] <displayname>
              X server to connect to

       -c[onfig] <filename>
              Alternate config file

       -bb[config] <filename>
              Alternate Blackbox config file

       -def[ault]
              Fall back on default configuration

       -m[ailbox] <filename>
              Filename of mailbox

       -v[ersion]
              Display version number

       -h[elp]
              Display this help

       -p[osition] <position>
              Set position of window, <position> = [+]|[-]x[+]|[-]y

       -w[withdrawn]
              Place bbtool in the Slit

       -s[hape]
              Don't display groundplate

CONFIGURATION
       Blackbox Users:

       By  default  bbtime  reads  the Blackbox style-file as defined in .blackboxrc and copies as much of the style as possible. The result is an
       application which looks a lot like the toolbar. Further configuration options can be found in bbtime.style.  Most likely you want to change
       these  options,  copy  this file to somewhere in your homedir (eg blackbox/bbtime.config) and edit it. Edit the file .blackboxrc and add or
       edit the line: bbtime.configFile: <your config file>.

       WARNING: You have to define the entire PATH.

       All style options set by reading the Blackbox-style file can be overridden by placing  them  in  bbtime.config  (and  changing  them).  See
       bbtime.style for all possible options.

       Make sure the file .bbtoolsrc does not exist, else the configuration style for other Window Managers will be used.

       Users of other Window managers:

       By default bbtime reads the bbtoolsrc and bbtime.nobb config files.  If you want to define your personal config-file copy bbtoolsrc to your
       homedir as ./.bbtoolsrc.  Copy bbtime.nobb somewhere in your homedir.  Edit .bbtoolsrc and add or edit the line:  bbtime.configFile:  <your
       config file>.

       WARNING: You have to define the entire PATH.

       Reconfiguration

       Press the right mouse-button on the envelope to cause bbtime to re-read its settings.

FILES
       bbtime automatically copies the style of the blackbox toolbar. It copies:

       toolbar                  -> bbtime.frame
       toolbar.label            -> bbtime.label
       toolbar.color            -> bbtime.frame.color
       toolbar.colorTo          -> bbtime.frame.colorTo
       toolbar.label.color      -> bbtime.label.color
       toolbar.label.colorTo    -> bbtime.label.colorTo
       toolbar.textColor        -> bbtime.textColor
       bevelWidth               -> bbtime.bevelWidth
       WARNING: if .bbtoolsrc is defined it won't copy the blackbox style.

       For the meaning of the different resources see the comments in the config-files.

SEE ALSO
       bbdate(1), bbppp(1)

AUTHOR
       This manual page was written by Chris Tillman <tillman@azstarnet.com> for the Debian GNU/Linux system (but may be used by others).

                                                                 December 29 2001                                                        BBTIME(1)
