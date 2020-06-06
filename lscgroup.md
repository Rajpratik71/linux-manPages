
LSCGROUP(1)                                                                                    libcgroup Manual                                                                                   LSCGROUP(1)



NAME
       lscgroup - list all cgroups


SYNOPSIS
       lscgroup [[-g] <controllers>:<path>] [...]
       lscgroup [-h|--help]


DESCRIPTION
       List all/chosen cgroups.


       <controllers>:<path>
              defines the control groups whose subgroups will be shown.  If this parameter is not used, the command will list all existing cgroups.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


EXAMPLES
       lscgroup -g cpu:/
              list all cgroups which are in hierarchy containing cpu controller


       lscgroup -g cpu:/student
              list all cgroups which are in hierarchy containing cpu controller in subgroup student


       lscgroup
              list all cgroups which in all hierarchies



SEE ALSO
       lssubsys (1), cgcreate (1), cgdelete (1), cgconfig.conf (5)



Linux                                                                                             2009-11-05                                                                                      LSCGROUP(1)
