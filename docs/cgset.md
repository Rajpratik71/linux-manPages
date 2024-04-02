
CGSET(1)                                                                                       libcgroup Manual                                                                                      CGSET(1)



NAME
       cgset - set the parameters of given cgroup(s)


SYNOPSIS
       cgset [-r <name=value>] <cgroup_path> ...
       cgset --copy-from <source_cgroup_path> <cgroup_path> ...


DESCRIPTION
       Set the parameters of input cgroups.


       <path> is the name of the cgroup which should be changed.  This parameter can be used multiple times.


       -r <name=value>
              defines the name of the file to set and the value which should be written to that file.  This parameter can be used multiple times.


       --copy-from <source_cgroup_path>
              defines the name of the cgroup whose parameters will be copied to the input cgroup.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


EXAMPLES
       cgset -r cpuset.cpus=0-1 student
              set variable cpus in control group student (controller cpuset) to 0-1


       cgset --copy-from group1/ group2/
              copy all parameters of group group1 to group group2 (for all path where both cgroups are defined)



SEE ALSO
       cgrules.conf (1), cgcreate (1), cgget (1)



Linux                                                                                             2009-03-15                                                                                         CGSET(1)
