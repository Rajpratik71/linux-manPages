session-migration(1)                                            Linux User's Manual                                           session-migration(1)

NAME
       session-migration - Migrate in user session settings.

SYNOPSIS
       session-migration [options]

DESCRIPTION
       The  session-migration program can be used to migrate in-session user data when a program is evolving its configuration, or needing to have
       files moved and so on. This program is generally autostarted at the very beginning of the session and integrates caching capabilities.

       The general usage is to ship an executable file in XDG_DATA_DIR/session-migration/scripts. This one will be executed the next time the user
       log into the session. It will executes all executable files there in ascii order, one after another.

       Even if the program tries to cache some timestamp and scripts to not be launched twiced (they are skipped on subsequent runs), the executa‐
       bles file should be idempotent.

OPTIONS
       --dry-run
              This parameter enables to run the session-migration tool without really launching the scripts and marking them  are  migrated.  It's
              generally used with --verbose for debugging purposes.

       --file filename
              This parameter, followed by a path or filename, tells sesions-migration to only consider that script file and ignoring XDG_DATA_DIR.
              It won't log as well this special file as being migrated.

       --help Display a quick command help.

       --verbose
              Show a lot of verbose information. It can be used by the user to debug configuration issues;

                                                                   12 July 2012                                               session-migration(1)
