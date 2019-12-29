xkbbell(1)                              General Commands Manual                             xkbbell(1)

NAME
       xkbbell - XKB extension user utility

SYNOPSIS
       xkbbell  [-display  <dpy>]  [-synch]  [-dev  <id>] [-force] [-nobeep] [-bf <id>] [-kf <id>] [-v
       <volume>] [-w <id>] [-help|-version]

DESCRIPTION
       user utility

OPTIONS
       -display <dpy>
               specifies which display to use

       -synch  turns on synchronization

       -dev <id>
               specifies which device to use

       -force  force audible bell

       -nobeep suppress server bell, event only

       -bf <id>
               specifies which bell feedback to use

       -kf <id>
               specifies which keyboard feedback to use

       -v <volume>
               specifies which volume to use

       -w <id> specifies which  window to use

       -help   print list of options and exit

       -version
               print program version and exit

       If neither device nor feedback are specified, xkbbell uses the default values for the core key‐
       board device.

X Version 11                                xkbutils 1.0.4                                  xkbbell(1)
