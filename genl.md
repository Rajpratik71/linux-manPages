GENL(8)                                          Linux                                         GENL(8)

NAME
       genl - generic netlink utility frontend

SYNOPSIS
       genl [ -s[tatistics] ] [ -d[etails] ] [ -r[aw] ] OBJECT

       genl { -V[ersion] | -h[elp] }

       OBJECT := { ctrl CTRL_OPTS }

       CTRL_OPTS := { help | list | monitor | get PARMS }

       PARMS := { name NAME | id ID }

DESCRIPTION
       The  genl  utility provides a simple frontend to the generic netlink library. Although it's de‐
       signed to support multiple OBJECTs, for now only the ctrl object is available, which is used to
       query the generic netlink controller.

   ctrl
       The generic netlink controller can be queried in various ways:

       help   This command just prints a help text for the ctrl object.

       list   Show the registered netlink users.

       monitor
              Listen for generic netlink notifications.

       get    Query the controller for a given user, identified either by name or id.

OPTIONS
       genl supports the following options.

       -h, -help
              Show summary of options.

       -V, -Version
              Show version of program.

       -s, -stats, -statistics
              Show object statistics.

       -d, -details
              Show object details.

       -r, -raw
              Dump raw output only.

SEE ALSO
       ip(8)

AUTHOR
       genl was written by Jamal Hadi Salim <hadi@cyberus.ca>.

       This manual page was written by Petr Sabata <contyk@redhat.com>.

iproute2                                      29 Oct 2015                                      GENL(8)
