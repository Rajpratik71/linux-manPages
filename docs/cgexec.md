
CGEXEC(1)                                                                                      libcgroup Manual                                                                                     CGEXEC(1)



NAME
       cgexec - run the task in given control groups


SYNOPSIS
       cgexec [-h] [-g <controllers>:<path>] [--sticky] command [arguments]


DESCRIPTION
       The cgexec program executes the task command with arguments arguments in the given control groups.


       -g <controllers>:<path>
              defines the control groups in which the task will be run.  controllers is a list of controllers and path is the relative path to control groups in the given controllers list.

              This flag can be used multiple times to define multiple pairs of lists of controllers and relative paths.  Instead of the list of all mounted controllers, the wildcard b"*b" can be used.

              If this option is not used, cgexec will automatically place the task in the right cgroup based on /etc/cgrules.conf.

              If  /etc/cgrules.conf configuration file is used, there can be used template names. Then the control group name contains a template in destination tag (see cgrules.conf (5)) and if the cgroup
              does not exist in execution time, it is created, based on /etc/cgconfig.conf specification.  If the specifications are not present the group is created with the default kernel values.


       -h, --help
              Display this help and exit.


       --sticky
              If running the task command with this option, the daemon of service cgred (cgrulesengd process) does not change both the task of the command and the child tasks. Without this option, the dae‐
              mon does not change the task of the command but it changes the child tasks to the right cgroup based on /etc/cgrules.conf automatically.


EXAMPLES
       cgexec -g *:test1 ls
       runs command ls in control group test1 in all mounted controllers.

       cgexec -g cpu,memory:test1 ls -l
       runs command ls -l in control group test1 in controllers cpu and memory.

       cgexec -g cpu,memory:test1 -g swap:test2 ls -l
       runs command ls -l in control group test1 in controllers cpu and memory and control group test2 in controller swap.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


FILES
       /etc/cgrules.conf
              default libcgroup configuration file


SEE ALSO
       cgrules.conf (5)



Linux                                                                                             2009-03-15                                                                                        CGEXEC(1)
