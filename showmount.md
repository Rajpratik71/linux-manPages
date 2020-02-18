SHOWMOUNT(8)             System Manager's Manual            SHOWMOUNT(8)

NAME
       showmount - show mount information for an NFS server

SYNOPSIS
       showmount  [ -adehv ]  [ --all ]  [ --directories ] [ --exports ]
       [ --help ] [ --version ] [ host ]

DESCRIPTION
       showmount queries the mount daemon on a remote host for  informa‐
       tion  about the state of the NFS server on that machine.  With no
       options showmount lists the set of clients who are mounting  from
       that  host.   The  output from showmount is designed to appear as
       though it were processed through ``sort -u''.

OPTIONS
       -a or --all
              List both the client hostname or IP  address  and  mounted
              directory in host:dir format. This info should not be con‐
              sidered reliable. See the notes on rmtab in rpc.mountd(8).

       -d or --directories
              List only the directories mounted by some client.

       -e or --exports
              Show the NFS server's export list.

       -h or --help
              Provide a short help summary.

       -v or --version
              Report the current version number of the program.

       --no-headers
              Suppress the descriptive headings from the output.

SEE ALSO
       rpc.mountd(8), rpc.nfsd(8)

BUGS
       The completeness and accuracy of the information  that  showmount
       displays varies according to the NFS server's implementation.

       Because showmount sorts and uniqs the output, it is impossible to
       determine from the output whether a client is mounting  the  same
       directory more than once.

AUTHOR
       Rick Sladkey <jrs@world.std.com>

                             6 October 1993                 SHOWMOUNT(8)
