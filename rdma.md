RDMA(8)                                          Linux                                         RDMA(8)

NAME
       rdma - RDMA tool

SYNOPSIS
       rdma [ OPTIONS ] OBJECT { COMMAND | help }

       rdma [ -force ] -batch filename

       OBJECT := { dev | link }

       OPTIONS := { -V[ersion] | -d[etails] } -j[son] } -p[retty] }

OPTIONS
       -V, -Version
              Print the version of the rdma tool and exit.

       -b, -batch <FILENAME>
              Read commands from provided file or standard input and invoke them.  First failure will
              cause termination of rdma.

       -force Don't terminate rdma on errors in batch mode.  If there were any errors during execution
              of the commands, the application return code will be non zero.

       -d, --details
              Output detailed information.  Adding a second -d includes driver-specific details.

       -p, --pretty
              When combined with -j generate a pretty JSON output.

       -j, --json
              Generate JSON output.

   OBJECT
       dev    - RDMA device.

       link   - RDMA port related.

       The names of all objects may be written in full or abbreviated form, for example stats can be
       abbreviated as stat or just s.

   COMMAND
       Specifies the action to perform on the object.  The set of possible actions depends on the ob‐
       ject type.  As a rule, it is possible to show (or list ) objects, but some objects do not allow
       all of these operations or have some additional commands. The help command is available for all
       objects. It prints out a list of available commands and argument syntax conventions.

       If no command is given, some default command is assumed.  Usually it is list or, if the objects
       of this class cannot be listed, help.

EXIT STATUS
       Exit status is 0 if command was successful or a positive integer upon failure.

SEE ALSO
       rdma-dev(8), rdma-link(8), rdma-resource(8),

REPORTING BUGS
       Report any bugs to the Linux RDMA mailing list <linux-rdma@vger.kernel.org> where the develop‐
       ment and maintenance is primarily done.  You do not have to be subscribed to the list to send a
       message there.

AUTHOR
       Leon Romanovsky <leonro@mellanox.com>

iproute2                                      28 Mar 2017                                      RDMA(8)
