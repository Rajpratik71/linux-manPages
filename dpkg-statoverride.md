dpkg-statoverride(1)                                                                          dpkg utilities                                                                         dpkg-statoverride(1)

NAME
       dpkg-statoverride - override ownership and mode of files

SYNOPSIS
       dpkg-statoverride [option...] command

DESCRIPTION
       “stat  overrides”  are  a way to tell dpkg(1) to use a different owner or mode for a path when a package is installed (this applies to any filesystem object that dpkg handles, including directo‐
       ries, devices, etc.). This can be used to force programs that are normally setuid to be install without a setuid flag, or only executable by a certain group.

       dpkg-statoverride is a utility to manage the list of stat overrides. It has three basic functions: adding, removing and listing overrides.

COMMANDS
       --add user group mode path
              Add an override for path. path does not need to exist when this command is used; the override will be stored and used later.  Users and groups can be specified by their name (for  example
              root or nobody), or by their number by prepending the number with a ‘#’ (for example #0 or #65534).  The mode needs to be specified in octal.

              If --update is specified and path exists, it is immediately set to the new owner and mode.

       --remove path
              Remove an override for path, the status of path is left unchanged by this command.

       --list [glob-pattern]
              List all overrides. If a glob pattern is specified restrict the output to overrides which match the glob. If there are no overrides or none match the glob dpkg-statoverride will exit with
              an exitcode of 1.

       --help Show the usage message and exit.

       --version
              Show the version and exit.

OPTIONS
       --admindir directory
              Change the directory of the dpkg database where the statoverride file is also stored. Defaults to /var/lib/dpkg.

       --force
              Force an action, even if a sanity check would otherwise prohibit it.  This is necessary to override an existing override.

       --update
              Immediately try to change the path to the new owner and mode if it exists.

       --quiet
              Be less verbose about what we do.

ENVIRONMENT
       DPKG_ADMINDIR
              If set and the --admindir option has not been specified, it will be used as the dpkg data directory.

FILES
       /var/lib/dpkg/statoverride
              File which contains the current list of stat overrides of the system. It is located in the dpkg administration directory, along with other files important  to  dpkg,  such  as  status  or
              available.
              Note: dpkg-statoverride preserves the old copy of this file, with extension “-old”, before replacing it with the new one.

SEE ALSO
       dpkg(1).

Debian project                                                                                  2013-04-01                                                                           dpkg-statoverride(1)
