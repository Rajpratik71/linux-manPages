THUNAR(1)                                                         [FIXME: manual]                                                        THUNAR(1)

NAME
       Thunar - File Manager for the Xfce Desktop Environment

SYNOPSIS
       Thunar [options] [[URI]...]

       Thunar [options] --bulk-rename [[URI]...]

       Thunar [options] --quit

DESCRIPTION
       Thunar is a fast and easy to use file manager for the Xfce Desktop Environment. It has been designed from the ground up to be lighweight
       with special focus on usability. Its user interface is clean and intuitive, and does not include any confusing or useless options.

INVOCATION
       Thunar takes a list of URIs for folders that should be opened in new file manager windows or files that should be run using the default
       application for their types. The URIs may be specified as either file: or trash: URIs, absolute paths or paths relative to the current
       directory from which Thunar is being invoked. If no URIs are specified, the current folder will be opened in a new file manager window.

       When the --bulk-rename option is specified no file managers windows will be opened, but instead the URIs will be passed to the bulk
       renamer. The bulk renamer allows to rename several files or folders at once using different renamer modules.

   Options
       -?, --help
           Print brief help and exit.

       -v, --version
           Print version information and exit.

       -B, --bulk-rename
           Open the URIs in a standalone window of the bulk renamer.

       --daemon
           Do not terminate the Thunar instance when the last window is closed, but keep it running to speed up opening new windows later on. This
           is the default when spawning Thunar as part of the default Xfce session or when using D-Bus activation.

       --display=DISPLAY
           Use the specified X DISPLAY for the user interface.

       -q, --quit
           Terminate any Thunar instance running in the background (spawned using the --daemon option). This command should be used whenever
           Thunar is upgraded to a new version to ensure that no old instance is reused.

AUTHOR
       Thunar was written by Benedikt Meurer <benny@xfce.org>.

       This manual page was written by Benedikt Meurer <benny@xfce.org>.

[FIXME: source]                                                     01/29/2017                                                           THUNAR(1)
