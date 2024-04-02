
CGGET(1)                                                                                       libcgroup Manual                                                                                      CGGET(1)



NAME
       cgget - print parameter(s) of given group(s)


SYNOPSIS
       cgget [-n] [-v] [-r <name>] [-g <controller>] [-a] <path> ...
       cgget [-n] [-v] [-r <name>] -g <controller>:<path> ...


DESCRIPTION
       Prints the parameter(s) of input cgroup(s).  If neither controller nor variable are specified, the values of all possible variables are displayed.


       <path> is the name of the cgroup which should be read.  This parameter can be used multiple times.


       -a, --all
              print the variables for all controllers which consist in the  given cgroup


       -g <controller>
              defines controllers whose values should be displayed.  This option can be used multiple times.


       -g <controller>:<path>
              defines control groups whose values should be displayed.  This option can be used multiple times.


       -h, --help
              display help and exit


       -n     do not print headers, i.e. names of groups.


       -r, --variable <name>
              defines parameter to display.  This option can be used multiple times.



       -v, --values-only
              print only values, not parameter names.


EXAMPLES
       $ cgget -r cpuset.cpus -r cpuset.mems first second
       first:
       cpuset.cpus=0-1
       cpuset.mems=0

       second:
       cpuset.cpus=0
       cpuset.mems=0

       $ cgget -n -r cpuset.cpus -r cpuset.mems first second
       cpuset.cpus=0-1
       cpuset.mems=0
       cpuset.cpus=0
       cpuset.mems=0

       $ cgget -nv -r cpuset.cpus -r cpuset.mems first second
       0-1
       0
       0
       0

       $ cgget -n -g cpu /
       cpu.rt_period_us=1000000
       cpu.rt_runtime_us=950000
       cpu.shares=1024



ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


SEE ALSO
       cgrules.conf (1), cgcreate (1), cgget (1)




Linux                                                                                             2010-01-18                                                                                         CGGET(1)
