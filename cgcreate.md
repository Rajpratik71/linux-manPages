
CGCREATE(1)                                                                                    libcgroup Manual                                                                                   CGCREATE(1)



NAME
       cgcreate - create new cgroup(s)


SYNOPSIS
       cgcreate [-h] [-t <tuid>:<tgid>] [-a <agid>:<auid>] [-f mode] [-d mode] [-s mode] -g <controllers>:<path> [-g ...]


DESCRIPTION
       The command creates new cgroup(s) defined by the options -g.


       -a <agid>:<auid>
              defines  the  name  of  the  user and the group which own the rest of the defined control group’s files. These users are allowed to set subsystem parameters and create subgroups.  The default
              value is the same as has the parent cgroup.


       -d, --dperm=mode
              sets the permissions of a control groups directory.  The permissions needs to be specified as octal numbers e.g.  -d 775.


       -f, --fperm=mode
              sets the permissions of the control groups parameters.  The permissions needs to be specified as octal numbers e.g.  -f 775.  The value is not used as given because the current  owner's  per‐
              missions are used as an umask (so 777 will set group and others permissions to the owners permissions).


       -g <controllers>:<path>
              defines  control groups to be added.  controllers is a list of controllers. Character "*" can be used as a shortcut for "all mounted controllers".  path is the relative path to control groups
              in the given controllers list. This option can be specified multiple times.


       -h, --help
              display this help and exit


       -s, --tperm=mode
              sets the permissions of the control group tasks file.  The permissions needs to be specified as octal numbers e.g.  -s 775.  The value is not used as given because the current owner's permis‐
              sions are used as an umask (so 777 will set group and others permissions to the owners permissions).


       -t <tuid>:<tgid>
              defines  the  name of the user and the group, which owns tasks file of the defined control group. I.e. this user and members of this group have write access to the file.  The default value is
              the same as has the parent cgroup.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


EXAMPLES
       cgcreate -g *:student -g devices:teacher
              create control group student in all mounted hierarchies and create control group teacher in hierarchy containing controller devices.





SEE ALSO
       cgrules.conf (5) cgexec (1) cgclassify (1)



Linux                                                                                             2009-03-15                                                                                      CGCREATE(1)
