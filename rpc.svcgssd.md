rpc.svcgssd(8)           System Manager's Manual          rpc.svcgssd(8)

NAME
       rpc.svcgssd - server-side rpcsec_gss daemon

SYNOPSIS
       rpc.svcgssd [-n] [-v] [-r] [-i] [-f] [-p principal]

DESCRIPTION
       The  rpcsec_gss  protocol  gives  a  means  of  using the gss-api
       generic security api to provide security for protocols using  rpc
       (in  particular,  nfs).  Before exchanging any rpc requests using
       rpcsec_gss, the rpc client must first establish a  security  con‐
       text  with  the rpc server.  The linux kernel's implementation of
       rpcsec_gss depends on the userspace daemon rpc.svcgssd to  handle
       context  establishment  on the rpc server.  The daemon uses files
       in the proc filesystem to communicate with the kernel.

OPTIONS
       -f     Runs rpc.svcgssd in the foreground  and  sends  output  to
              stderr (as opposed to syslogd)

       -v     Increases  the  verbosity  of the output (can be specified
              multiple times).

       -r     If the rpcsec_gss library supports  setting  debug  level,
              increases  the  verbosity  of the output (can be specified
              multiple times).

       -i     If the nfsidmap  library  supports  setting  debug  level,
              increases  the  verbosity  of the output (can be specified
              multiple times).

       -p     Use principal instead of the default nfs/FQDN@REALM.

       -n     Use  the  system  default  credentials   (host/FQDN@REALM)
              rather than the default nfs/FQDN@REALM.

SEE ALSO
       rpc.gssd(8),

AUTHORS
       Dug Song <dugsong@umich.edu>
       Andy Adamson <andros@umich.edu>
       Marius Aamodt Eriksen <marius@umich.edu>
       J. Bruce Fields <bfields@umich.edu>

                               12 Jan 2007                rpc.svcgssd(8)
