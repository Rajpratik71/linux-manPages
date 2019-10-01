DEVLINK(8)                                                                                          Linux                                                                                          DEVLINK(8)



NAME
       devlink - Devlink tool

SYNOPSIS
       devlink [ OPTIONS ] OBJECT { COMMAND | help }


       OBJECT := { dev | port | monitor }


       OPTIONS := { -V[ersion] | -n[no-nice-names] } -j[json] } -p[pretty] }


OPTIONS
       -V, --Version
              Print the version of the devlink utility and exit.


       -n, --no-nice-names
              Turn off printing out nice names, for example netdevice ifnames instead of devlink port identification.


       -j, --json
              Generate JSON output.


       -p, --pretty
              When combined with -j generate a pretty JSON output.


   OBJECT
       dev    - devlink device.


       port   - devlink port.


       monitor
              - watch for netlink messages.


   COMMAND
       Specifies the action to perform on the object.  The set of possible actions depends on the object type.  As a rule, it is possible to show (or list ) objects, but some objects do not allow all of
       these operations or have some additional commands. The help command is available for all objects. It prints out a list of available commands and argument syntax conventions.

       If no command is given, some default command is assumed.  Usually it is list or, if the objects of this class cannot be listed, help.


EXIT STATUS
       Exit status is 0 if command was successful or a positive integer upon failure.


SEE ALSO
       devlink-dev(8), devlink-port(8), devlink-monitor(8), devlink-sb(8), devlink-resource(8),


REPORTING BUGS
       Report any bugs to the Network Developers mailing list <netdev@vger.kernel.org> where the development and maintenance is primarily done.  You do not have to be subscribed to the list to send a mes‐
       sage there.


AUTHOR
       Jiri Pirko <jiri@mellanox.com>



iproute2                                                                                         14 Mar 2016                                                                                       DEVLINK(8)
