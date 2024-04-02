
CGCONFIGPARSER(8)                                                                              libcgroup Manual                                                                             CGCONFIGPARSER(8)



NAME
       cgconfigparser - setup control group file system


SYNOPSIS
       cgconfigparser [-h] [-l <filename>] [-L <directory>] [...]


OPTIONS
       -h, --help
              Displays help.

       -l, --load=FILE
              Parses  the control groups configuration file Sets up the control group file system defined by the configuration file and mounts mount points defined by the configuration file.  The format of
              the file is described in cgconfig.conf. This option can be used multiple times and can be mixed with -L option.


       -L, --load-directory=DIR
              Finds all files in given directory and parses them in alphabetical order like they were specified by -l option. This option can be used multiple times and can be mixed with -l option.


       -a <agid>:<auid>
              defines the default owner of the rest of the defined control group’s files. These users are allowed to set subsystem parameters and create subgroups.  The default value is the same as has the
              parent cgroup.


       -d, --dperm=mode
              sets the default permissions of a control groups directory.  The permissions needs to be specified as octal numbers e.g.  -d 775.


       -f, --fperm=mode
              sets the default permissions of the control group files.  The permissions needs to be specified as octal numbers e.g.  -f 775.  The value is not used as given because the current owner's per‐
              missions are used as an umask (so 777 will set group and others permissions to the owners permissions).


       -s, --tperm=mode
              sets the default permissions of the control group tasks files.  The permissions needs to be specified as octal numbers e.g.  -f 775.  The value is  not  used  as  given  because  the  current
              owner's permissions are used as an umask (so 777 will set group and others permissions to the owners permissions).


       -t <tuid>:<tgid>
              defines the default owner of tasks file of the defined control group. I.e. this user and members of this group have write access to the file.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


FILES
       /etc/cgconfig.conf
              default libcgroup configuration file

       /etc/cgconfig.d/
              default libcgroup configuration files directory


EXAMPLES
       cgconfigparser -l /etc/cgconfig.conf
              setup control group file system based on /etc/cgconfig.conf configuration file



SEE ALSO
       cgconfig.conf (5)



Linux                                                                                             2009-03-16                                                                                CGCONFIGPARSER(8)
