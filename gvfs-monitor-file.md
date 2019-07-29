GVFS-MONITOR-FILE(1)                                               User Commands                                              GVFS-MONITOR-FILE(1)

NAME
       gvfs-monitor-file - Monitor files for changes

SYNOPSIS
       gvfs-monitor-file [OPTION...] [LOCATION...]

DESCRIPTION
       As long as gvfs-monitor-file is running, it will print information about creation, deletion, content and attribute changes and mount and
       unmount operations affecting the monitored files.

       gvfs-monitor-file uses the GIOs file monitoring APIs to monitor the given files. GIO uses different implementations depending on the
       platform. The most common implementation Linux uses inotify.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -N, --no-pair
           Don't send single MOVED events.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

gvfs                                                                                                                          GVFS-MONITOR-FILE(1)
