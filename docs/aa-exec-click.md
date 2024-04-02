aa-exec-click:(1)                                                   March 2014                                                   aa-exec-click:(1)

NAME
       aa-exec-click - program for executing click packages under confinement

DESCRIPTION
       This program is used to execute click package under AppArmor confinement. It is a thin wrapper around the aa-exec command which sets up the
       environment that is needed to run a click application under confinement.

USAGE
       aa-exec-click -p <PROFILE NAME> [ -x ] [aa-exec options] -- COMMAND

OPTIONS
       -h     show program's help

       -p PROFILE NAME
              AppArmor profile the application should run under

       -x     Force running application under X. Click packages are typically considered untrusted and are usually required to run under  confine‐
              ment. At this time, running untrusted click applications under X is not considered safe because of limitations in the X protocol. By
              default, aa-exec-click will refuse to launch applications if they are running under X.

SEE ALSO
       aa-exec(8), apparmor(7)

March 2014                                                                                                                       aa-exec-click:(1)
