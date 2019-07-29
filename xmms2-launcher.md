XMMS2-LAUNCHER(1)                                             General Commands Manual                                            XMMS2-LAUNCHER(1)

NAME
       xmms2-launcher - XMMS2 daemon launcher

SYNOPSIS
       xmms2-launcher [-l file] [-P file] [-v] [--] [XMMS2D_OPTION] ...
       xmms2-launcher -h

DESCRIPTION
       XMMS2 is a redesign of the XMMS (http://legacy.xmms2.org) music player. It features a client-server model, allowing multiple (even simulta‐
       neous!) user interfaces, both textual and graphical. All common audio formats are supported using plugins. On top of this, there is a flex‐
       ible media library to organise your music.

       xmms2-launcher  starts  xmms2d(1)  in the background. The main feature is that it does not exit until the IPC system of XMMS2 is available,
       meaning that as soon as the xmms2-launcher process has exited successfully xmms2d(1) is ready to accept commands.

OPTIONS
       Unrecognized options and options occuring beyond pseudo-option -- are passed to xmms2d(1).

       -l file, --logfile=file
              Write log to file instead of the default log file location.

       -P file, --pidfile=file
              Write the pid of xmms2d(1) to file.

       -v, --verbose
              Make xmms2-launcher verbose.

       -?, -h, --help
              Show short help information and exit.

       --     Options beyond this marker are passed to xmms2d(1).

       XMMS2D_OPTION
              See xmms2d(1) for a list of options and their effect.

FILES
       Below CACHEDIR is $XDG_CACHE_HOME/xmms2 on UNIX if the XDG_CACHE_HOME-environment variable is set. Otherwise it is $HOME/.cache/xmms2 (UNIX
       except Darwin), or $HOME/Library/xmms2/logs (Darwin).

       CACHEDIR/xmms2d.log
              The default location for storing log output of xmms2d(1).

ENVIRONMENT
       XDG_CACHE_HOME
              The location where the XMMS2 logs are located by default.

SEE ALSO
       xmms2d(1), http://xmms2.org/.

HISTORY
       The XMMS2 Project was started by Tobias Rundström and Anders Waldenborg. It is developed by a small group of contributers from all over the
       world.

AUTHOR
       This manual page was written by Alexander Botero-Lowry <alex@foxybanana.com>. It was reformatted by Erik Massop <e.massop@hccnet.nl>.

                                                                                                                                 XMMS2-LAUNCHER(1)
