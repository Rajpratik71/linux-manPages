CGM(1)                                                                                        User Commands                                                                                        CGM(1)

NAME
       cgm - a client script for cgmanager

DESCRIPTION
       cgm is a client script to simplify making requests of the cgroup manager.  It simply calls dbus-send to send requests to the running cgmanager or cgproxy.

       Usage:

       cgm ping

       cgm create <controller> <cgroup>

       cgm chown <controller> <cgroup> uid gid

       cgm chmod <controller> <cgroup> mode

       cgm chmodfile <controller> <cgroup> file mode

       cgm remove <controller> <cgroup> [0|1]

       cgm getpidcgroup <controller> pid

       cgm getpidcgroupabs <controller> pid

       cgm movepid <controller> <cgroup> pid

       cgm movepidabs <controller> <cgroup> pid

       cgm getvalue <controller> <cgroup> file

       cgm setvalue <controller> <cgroup> file value

       cgm gettasks <controller> <cgroup>

       cgm gettasksrecursive <controller> <cgroup>

       cgm listchildren <controller> <cgroup>

       cgm removeonempty <controller> <cgroup>

       cgm prune <controller> <cgroup>

       cgm listcontrollers

       cgm listkeys <controller> <cgroup>

       cgm apiversion

              Replace  '<controller>'  with the desired controller, i.e.  memory, and '<cgroup>' with the desired cgroup, i.e. x1.  For create, chown, chmod, remove, prune, remove_on_empty, gettasksre‐
              cursive and movepid, <controller> may be "all" or a comma-separated set of cgroups.  Remove by default is recursive, but adding '0' as the last argument will perforn  non-recursive  dele‐
              tion.  Adding '1' is supported for legacy reasons.

              To refer to the current cgroup, use ''.

NOTES
       In  order  to  protect the host from root in containers, cgmanager locks prevents tasks from administering cgroups which are not under their own.  The exceptions are that root in a container may
       escape up to the cgroup of its cgproxy, and root on the host may escape to the root cgroup.

       This means that a user in freezer cgroup /foo cannot list cgroups in /.  However, as root he can use movepidabs to escape to /, then list cgroups in /.

EXAMPLES
       To create a new cgroup called foo and move your shell into it, you could do:

       sudo cgm create all foo
       sudo cgm chown all foo $(id -u) $(id -g)
       cgm movepid all foo $$

       Then to freeze that cgroup,

       cgm setvalue freezer foo freezer.state FROZEN

SEE ALSO
       cgmanager(8)

cgm 0.29                                                                                       January 2016                                                                                        CGM(1)
