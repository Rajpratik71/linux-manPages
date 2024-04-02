ofl(1)                                                                                             hxtools                                                                                             ofl(1)



Name
       ofl — open file lister

Syntax
       ofl [-P] [-k signalspec] path[...]

Description
       Lists all processes that have directories or files open or in use within path. Additionally it can send a signal to these processes to free up a mountpoint for example.

Options
       -k signalspec
              Send the given signal to all processes that match.

       -P     Show only the PIDs of the processes that matched.

Differences to lsof/fuser
       ·   `lsof /home/user` and `fuser /home/user` would not list processes that have a descriptor open on /home/user/subdir.

       ·   `fuser -m /home/subdir` would automatically go down to the root of a vfsmount (e.g. /home) and list all processes, instead of limiting to /home/subdir.

See also
       hxtools(7)



hxtools                                                                                           2008-11-01                                                                                           ofl(1)
