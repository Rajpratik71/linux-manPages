targetctl(8)                                                                               System Manager's Manual                                                                               targetctl(8)



NAME
       targetctl - Save and restore configuration of kernel target

DESCRIPTION
       targetctl  is  a low-level script to save and restore the configuration of the LIO kernel target, to and from a file in json format. It is not normally meant to be used by end-users directly, but by
       system init frameworks, or advanced end-users who are generating the configuration file themselves and need a way to load the configuration without relying on the targetcli configuration shell.

USAGE
       targetctl must be invoked as root. Exit status will be 0 if successful, or nonzero if an error was encountered.

       targetctl save [config-file]

       Saves the current configuration of the kernel target to a file in json format. Since the file may contain cleartext passwords, the file's permissions will be set to only allow root access.  If  con‐
       fig-file is not supplied, targetctl will use the default file location, /etc/target/saveconfig.json.

       targetctl restore [config-file]

       Removes  any  existing configuration and replaces it with the configuration described in the file. See saveconfig.json(5) for more details. If parts of the configuration could not be restored, those
       parts will be noted in the error output, and the rest of the configuration will still be applied.

       targetctl clear

       Removes any existing configuration from the running kernel target.

       targetctl --help

       Displays usage information.

SEE ALSO
       targetcli(8), targetd(8), saveconfig.json(5)

FILES
       /etc/target/saveconfig.json

       /sys/kernel/config/target

AUTHOR
       Written by Andy Grover <agrover@redhat.com>.
       Man page written by Andy Grover <agrover@redhat.com>.

REPORTING BUGS
       Report bugs via <targetcli-fb-devel@lists.fedorahosted.org>
       or <https://github.com/open-iscsi/rtslib-fb/issues>



                                                                                                                                                                                                 targetctl(8)
