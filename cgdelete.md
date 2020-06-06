
CGDELETE(1)                                                                                    libcgroup Manual                                                                                   CGDELETE(1)



NAME
       cgdelete - remove control group(s)


SYNOPSIS
       cgdelete [-h] [-r] [[-g] <controllers>:<path>] ...


DESCRIPTION
       The cgdelete program removes all specified control groups.


       [-g] <controllers>:<path>
              Defines the control group to delete. Multiple control groups may be specified.  -g is optional.


       -h, --help
              Display this help and exit.


       -r, --recursive
              Recursively remove all subgroups.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


EXAMPLES
       cgdelete -g cpu,devices:/test
              remove control group test from hierarchies containing cpu and device controllers



SEE ALSO
       cgcreate (1), lscgroup (1), cgclear (1)



Linux                                                                                             2009-10-26                                                                                      CGDELETE(1)
