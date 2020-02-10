upstart-file-bridge(8)                                                                   System Manager's Manual                                                                   upstart-file-bridge(8)

NAME
       upstart-file-bridge - Bridge between Upstart and inotify

SYNOPSIS
       upstart-file-bridge [OPTIONS]...

DESCRIPTION
       upstart-file-bridge receives information about kernel file events that inotify(7) has received and creates init(8) events for them.

       Supported events exposed to Upstart allow jobs to detect creation, modification and deletion. See file-event(7) for further details.

       The bridge works by querying the init(8) daemon at bridge startup time to determine a list of all jobs whose start on or stop on conditions reference the file event. Further, the bridge arranges
       to be notified automatically when new jobs are created such that any subsequent jobs which reference the file event are also handled (as are job deletions).

       See inotify(7) and for further details.

OPTIONS
       --daemon
              Detach and run in the background.

       --debug
              Enable debugging output.

       --help Show brief usage summary.

       --user User-session mode: connect to Upstart via the user session rather than over the D-Bus system bus.

       --verbose
              Enable verbose output.

JOB ENVIRONMENT VARIABLES
       FILE   Path to file to watch. When run without --user, this must be an absolute path. If --user is specified, certain relative path types are supported:

              · If the path begins with '~/', the value will be expanded as would be performed by a shell for matching purposes (although when the event is emitted, the original value will be used).

              · If the path begins with './', '.' will be assumed to be the users home directory.

              · In all other scenarios, if the path does not begin with '/', it will be assumed to represent a file below the users home directory.

              If the path ends with a slash, it is considered to be a directory which changes the match behaviour (see below).

              If the path is not a directory, the file (but not the directory) portion of the path may contain wildcard matches. See fnmatch(3) and glob(7) for further details.

       EVENT  Event relating to FILE that job is interested in. If this variable is specified the value must be set to create, modify or delete depending on what type of file event the  job  is  inter‐
              ested in. If FILE is not specified, the bridge will watch for all types and set this variable to the appropriate value when emitting the event.

WATCH TYPE BEHAVIOUR
       The bridge emits events depending not only on the value of EVENT, but also on the entity specified by FILE:

   File
       An event will be emitted when the named file is created, modified or deleted depending on the value of EVENT. If EVENT is not specified, react to creation, modification and deletion.

       If the file already exists when the job is registered, and EVENT either specifies create or the variable is not specified, the event will be emitted.

   Directory
       An  event  will be emitted when the named directory is created, modified (files within it are created, modified or deleted) or deleted depending on the value of EVENT. If EVENT is not specified,
       react to creation, modification and deletion.

       If the directory already exists when the job is registered, and EVENT either specifies create or the variable is not specified, the event will be emitted.

   Glob
       One event will be emitted per match when the glob wildcard matches any files in the directory part is created, modified or deleted, depending on the value of EVENT. If EVENT  is  not  specified,
       react to creation, modification and deletion.

       If any matches already exist when the job is registered, and EVENT either specifies create or the variable is not specified, events will be emitted.

NOTES
       ·   A single instance of the bridge may be run at the system level, but multiple further instances may be run per user session instance by using the --user.

       ·   All job conditions specifying the file event are multi-shot: if the same file event occurs multiple times, the bridge will emit an Upstart event each time.

LIMITATIONS
       ·   Since  the  bridge currently uses inotify(7), it is subject to the same limitations; namely that recursive watches cannot be created reliably in all circumstances. As such, pathological sce‐
           narios such as deep directory trees being created and then quickly removed cannot be handled reliably. The following provides advice to minimise unexpected behaviour:

           ·   Attempt to only watch for files to be created, modified or deleted in directories that are guaranteed to already exist at the time the job is registered by the bridge.

           ·   If the system cannot guarantee that the directory will exist at job registration time, arrange for the directory to be created by an Upstart job before the bridge itself starts.

           ·   In user session mode, if a job specifies a file to watch for and that file is created but inaccessible to the user running the bridge, no event will be emitted.

       ·   Tilde expansion is only supported for the current user; that is '~otheruser' will not work.

AUTHOR
       Written by James Hunt <james.hunt@canonical.com>

BUGS
       Report bugs at <https://launchpad.net/ubuntu/+source/upstart/+bugs>

COPYRIGHT
       Copyright © 2013 Canonical Ltd.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       init(5) init(8) inotify(7) file-event(7)

upstart                                                                                         2013-03-11                                                                         upstart-file-bridge(8)
