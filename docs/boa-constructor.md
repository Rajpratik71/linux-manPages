BOA-CONSTRUCTOR(1)                                            General Commands Manual                                           BOA-CONSTRUCTOR(1)

NAME
       boa-constructor - RAD tool for Python and WxWindows

SYNOPSIS
       boa-constructor [-CDTSBERhv] [-O directory] [--Constricted] [--Debug] [--Trace] [--StartupFile] [--BlockHomePrefs] [--EmptyEditor [--Remot‐
       eDebugServer] [--help] [--version] [files...]

DESCRIPTION
       This manual page documents briefly the boa-constructor command.  This manual page was written for the Debian distribution because the orig‐
       inal program does not have a manual page.

       boa-constructor is an IDE and a RAD tool for creating cross-platform applications built on top of the Python language and the WxWindows GUI
       toolkit.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with  two  dashes  (`-').   A  summary  of  options  is
       included below.

       -O, --OverridePrefsDirName directory
              Specify  a  different directory to load preferences from. Default is $HOME/.boa-constructor and is used if it exists. Directory will
              be created (and populated) if it does not exist.

       -C, --Constricted
              Run in constricted mode, overrides the preferences.

       -D, --Debug
              Run the first filename passed on the command-line in the Debugger on startup.

       -T, --Trace
              Run in trace mode. Used for tracking down core dumps. Every function call is logged to a file which can later be parsed for a trace‐
              back.

       -S, --StartupFile
              Execute  the  script  pointed  to  by  $BOASTARTUP  or  $PYTHONSTARTUP  in  the  Shell  namespace. The Editor object is available as
              sys.boa_ide. Overrides the preferences.

       -B, --BlockHomePrefs
              Prevent the $HOME directory being used.

       -E, --EmptyEditor
              Don't open the files that were open last time Boa was closed.

       -R, --RemoteDebugServer
              Run the first filename passed on the command-line in a Remote Debugger Server that can be connected to over a socket.

       -h, --help
              Show summary of options.

       -v, --version
              Show version of program.

SEE ALSO
       python(1).
       The program contains an integrated help and a little tutorial.

AUTHOR
       This manual page was written by Cedric Delfosse <cedric@debian.org>, for the Debian project (but may be used by others).

                                                                    13 May 2003                                                 BOA-CONSTRUCTOR(1)
