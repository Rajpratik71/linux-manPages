
CGCLEAR(1)                                                                                     libcgroup Manual                                                                                    CGCLEAR(1)



NAME
       cgclear - unload the cgroup filesystem


SYNOPSIS
       cgclear [-e] [-l <filename>] [-L <directory>] [...]


DESCRIPTION
       Without parameters, this command moves all the tasks inside the various cgroups to the root cgroup, deletes all the cgroups and finally unmounts the cgroup filesystem from the system.

       If  one  or  more config files are specified, only groups defined in the config files are removed. The files are processed in reverse order, i.e. the last file on command line is processed first, so
       cgclear can have the same command line arguments as appropriate cgconfigparser.


       -l, --load=<filename>
              specifies the config file to read. This option can be used multiple times and can be mixed with -L option.


       -L, --load-directory=<directory>
              specifies the directory, which is searched for configuration files. All files in this directory will be processed in alphabetical order as they were specified by -l option. This option can be
              used multiple times and can be mixed with -l option.


       -e     specifies that only empty groups should be removed. If a group defined in a config file has tasks inside or has a subgroup, it won't be removed. This option works only with -l or -L options.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


FILES
       /etc/cgconfig.conf
              default templates file

       /etc/cgconfig.d/
              default templates files directory



EXAMPLES
       cgclear
              unload the whole cgroup filesystem


       cgclear -l /etc/cgconfig.conf
              unload a subsystem of cgroup filesystem based on /etc/cgconfig.conf definition.


SEE ALSO
       cgconfigparser(1), cgconfig.conf(5)



Linux                                                                                             2009-10-23                                                                                       CGCLEAR(1)
