tracker-preferences(1)                                             User Commands                                            tracker-preferences(1)

NAME
       tracker-preferences - Preferences editor for tracker-miner-fs

SYNOPSIS
       tracker-preferences

DESCRIPTION
       tracker-preferences  is  a graphical configuration front end for the tracker-miner-fs which crawls and mines data from the filesystem to be
       stored in the Tracker databases.

       Importantly, the TRACKER_USE_CONFIG_FILES environment variable which can be used by the tracker-miner-fs and other binaries  for  switching
       from  GSettings  to  config  files  is  not  supported  by  tracker-preferences.   This means that configuration changes (usually stored in
       $HOME/.config/tracker) must be manually updated when not using GSettings.

SEE ALSO
       tracker-miner-fs(1), tracker-control(1), tracker-store(1).

GNU                                                               September 2009                                            tracker-preferences(1)
