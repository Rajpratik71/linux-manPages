GVFS-MONITOR-DIR(1)                                                User Commands                                               GVFS-MONITOR-DIR(1)

NAME
       gvfs-monitor-dir - Monitor directories for changes

SYNOPSIS
       gvfs-monitor-dir [OPTION...] [LOCATION...]

DESCRIPTION
       As long as gvfs-monitor-dir is running, it will print information about file creation, deletion, file content and attribute changes and
       mount and unmount operations inside the specified directories.

       gvfs-monitor-dir uses the GIOs directory monitoring APIs to monitor the given directories. GIO uses different implementations depending on
       the platform. The most common implementation Linux uses inotify.

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

gvfs                                                                                                                           GVFS-MONITOR-DIR(1)
