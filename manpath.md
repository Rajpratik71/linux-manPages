MANPATH(1)                    Manual pager utils                   MANPATH(1)

NAME
       manpath - determine search path for manual pages

SYNOPSIS
       manpath [-qgdc?V] [-m system[,...]] [-C file]

DESCRIPTION
       If $MANPATH is set, manpath will simply display its contents and issue
       a warning.  If not, manpath will  determine  a  suitable  manual  page
       hierarchy search path and display the results.

       The  colon-delimited  path is determined using information gained from
       the man-db configuration file - (/etc/manpath.config) and  the  user's
       environment.

OPTIONS
       -q, --quiet
              Do not issue warnings.

       -d, --debug
              Print debugging information.

       -c, --catpath
              Produce a catpath as opposed to a manpath.  Once the manpath is
              determined, each path element is converted to its relative cat‐
              path.

       -g, --global
              Produce  a  manpath  consisting  of all paths named as `global'
              within the man-db configuration file.

       -m system[,...], --systems=system[,...]
              If this system has access to other  operating  system's  manual
              hierarchies,  this  option  can  be used to include them in the
              output of manpath.  To include NewOS's manual page  hierarchies
              use the option -m NewOS.

              The  system  specified  can be a combination of comma delimited
              operating system names.  To include the native  operating  sys‐
              tem's  manual  page  hierarchies,  the  system name man must be
              included in the argument string.  This option will override the
              $SYSTEM environment variable.

       -C file, --config-file=file
              Use  this  user  configuration  file rather than the default of
              ~/.manpath.

       -?, --help
              Print a help message and exit.

       --usage
              Print a short usage message and exit.

       -V, --version
              Display version information.

ENVIRONMENT
       MANPATH
              If $MANPATH is set, manpath  displays  its  value  rather  than
              determining it on the fly.  If $MANPATH is prefixed by a colon,
              then the value of the variable is appended to the  list  deter‐
              mined  from  the  content  of  the configuration files.  If the
              colon comes at the end of the value in the variable,  then  the
              determined list is appended to the content of the variable.  If
              the value of the variable contains a double  colon  (::),  then
              the  determined  list  is  inserted in the middle of the value,
              between the two colons.

       SYSTEM If $SYSTEM is set, it will have the same effect as  if  it  had
              been specified as the argument to the -m option.

FILES
       /etc/manpath.config  man-db configuration file.

SEE ALSO
       apropos(1), man(1), whatis(1)

AUTHOR
       Wilf. (G.Wilford@ee.surrey.ac.uk).
       Fabrizio Polacco (fpolacco@debian.org).
       Colin Watson (cjwatson@debian.org).

2.8.3                             2018-04-05                       MANPATH(1)
