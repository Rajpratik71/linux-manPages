
CGCLASSIFY(1)                                                                                  libcgroup Manual                                                                                 CGCLASSIFY(1)



NAME
       cgclassify - move running task(s) to given cgroups


SYNOPSIS
       cgclassify [-g <controllers>:<path>] [--sticky | --cancel-sticky] <pidlist>


DESCRIPTION
       this command moves processes defined by the list of processes (pidlist) to the given control groups.

       The pids in the pidlist are separated by spaces


       -g <controllers>:<path>
              defines the control groups where the task will be moved.  controllers is a list of controllers and path is the relative path to control groups in the given controllers list.

              This flag can be used multiple times to define multiple pairs of lists of controllers and relative paths.  Instead of the list of all mounted controllers, the wildcard * can be used.

              If this option is not used then cgclassify will automatically move the task to a control group based on /etc/cgrules.conf.


       --sticky
              If this option is used, the daemon of service cgred (cgrulesengd process) does not change both the specified pidlist and their children tasks.  Without this option, the daemon does not change
              the specified pidlist but it automatically changes their child tasks to the right cgroup based on /etc/cgrules.conf.


       --cancel-sticky
              If this option is used, the daemon of service cgred (cgrulesengd process) can automatically  change  both  the  specified  pidlist  and  their  child  tasks  to  the  right  cgroup  based  on
              /etc/cgrules.conf.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


FILES
       /etc/cgrules.conf
              default libcgroup configuration file

       /etc/cgrules.d
              default libcgroup configuration files directory


EXAMPLES
       cgclassify -g cpu:student 1234
              moves process with pid number 1234 to control group student in cpu hierarchy.


       cgclassify 1234
              moves process with pid number 1234 to control groups based on /etc/cgrules.conf configuration file.


       cgclassify --sticky -g cpu:/student 1234
              moves process with pid number 1234 to control group student in cpu hierarchy.  The daemon of service cgred does not change cgroups of pid 1234 and its children (based on /etc/cgrules.conf).


SEE ALSO
       cgrules.conf (5), cgexec (1)




Linux                                                                                             2009-03-15                                                                                    CGCLASSIFY(1)
