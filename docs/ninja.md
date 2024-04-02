NINJA(1)                                                           User Commands                                                          NINJA(1)

NAME
       ninja - small build system closest in spirit to Make

DESCRIPTION
       usage: ninja [options] [targets...]

       if targets are unspecified, builds the 'default' target (see manual).

   options:
       --version
              print ninja version ("1.8.2")

       -C DIR change to DIR before doing anything else

       -f FILE
              specify input build file [default=build.ninja]

       -j N   run N jobs in parallel [default=derived from CPUs available]

       -k N   keep going until N jobs fail [default=1]

       -l N   do not start new jobs if the load average is greater than N

       -n     dry run (don't run commands but act like they succeeded)

       -v     show all command lines while building

       -d MODE
              enable debugging (use -d list to list modes)

       -t TOOL
              run a subtool (use -t list to list subtools)

              terminates toplevel options; further flags are passed to the tool

       -w FLAG
              adjust warnings (use -w list to list warnings)

AUTHOR
       This manual page was written by Gary Kramlich <grim@reaperworld.com> for the Debian GNU/Linux system (but may be used by others).

ninja 1.8.2                                                       September 2017                                                          NINJA(1)
