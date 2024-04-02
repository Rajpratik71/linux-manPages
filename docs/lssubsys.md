
LSSUBSYS(1)                                                                                    libcgroup Manual                                                                                   LSSUBSYS(1)



NAME
       lssubsys - list hierarchies containing given subsystem


SYNOPSIS
       lssubsys  [-m|--mount-points] [-M|--all-mount-points] [controller] [...]
       lssubsys  [-m|--mount-points] [-M|--all-mount-points] [-i|--hierarchies] [-a|--all]
       lssubsys  [-h|--help]


DESCRIPTION
       lssubsys list the hierarchies containing the given subsystem(s). If no subsystem is defined, it displays all mounted hierarchies.


       controller
              defines the subsystem whose hierarchy is shown.  If this parameter is not used, the command will list all mounted subsystems.


       -m, --mount-points
              Display mount points. Only the first mount points of shown hierarchies are displayed.


       -M, --all-mount-points
              Display mount points. All mount points of shown hierarchies are displayed, each on separate line.


       -a, --all
              Display all subsystems (including unmounted ones).


       -i, --hierarchies
              Display the attached hierarchy number if the subsystem is in a hierarchy.  If the option -m is also used, the hierarchy number is shown only for unmounted hierarchies.


       -h, --help
              Display help and exit.


EXAMPLE
       The command lssubsys -am lists all subsystems which are present in the system, mounted ones will be shown with their mount point:
              $ lssubsys -am
              ns
              cpuset
              cpu,devices
              cpuacct /cgroup/cpuacct
              memory /cgroup/memory
              freezer /cgroup/freezer
              net_cls /cgroup/net_cls

       The  command  lssubsys -ami lists all subsystems which are present in the system, mounted subsystems are listed with their mount points, unmounted ones which are in a hierarchy are listed with their
       hierarchy number:
              $ lssubsys -ami
              ns
              cpuset 5
              cpu,devices 6
              cpuacct /cgroup/cpuacct
              memory /cgroup/memory
              freezer /cgroup/freezer
              net_cls /cgroup/net_cls


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


SEE ALSO
       lscgroup (1), cgcreate (1), cgdelete (1), cgconfig.conf (5)



Linux                                                                                             2009-11-05                                                                                      LSSUBSYS(1)
