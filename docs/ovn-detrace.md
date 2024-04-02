ovn-detrace(1)                                                                               Open vSwitch Manual                                                                               ovn-detrace(1)



NAME
       ovn-detrace - convert ``ovs-appctl ofproto/trace'' output to combine OVN logical flow information.

SYNOPSIS
       ovn-detrace < file

       Common options:
              [-h | --help] [-V | --version]


DESCRIPTION
       The  ovn-detrace  program  reads ovs-appctl ofproto/trace output on stdin, looking for flow cookies, and expand each cookie with corresponding OVN logical flows. It expands logical flow further with
       the north-bound information e.g. the ACL that generated the logical flow, when relevant.

OPTIONS
       -h
       --help Prints a brief help message to the console.

       -V
       --version
              Prints version information to the console.

       --ovnsb=server
              The OVN Southbound DB remote to contact.  If the OVN_SB_DB environment variable is set, its value is used as the default.  Otherwise, the default  is  unix:/var/run/openvswitch/ovnsb_db.sock,
              but this default is unlikely to be useful outside of single-machine OVN test environments.

       --ovnnb=server
              The  OVN  Northbound DB remote to contact.  If the OVN_NB_DB environment variable is set, its value is used as the default.  Otherwise, the default is unix:/var/run/openvswitch/ovnnb_db.sock,
              but this default is unlikely to be useful outside of single-machine OVN test environments.

SEE ALSO
       ovs-appctl(8),ovn-sbctl(8),ovn--nbctl(8),ovn-trace(8)



Open vSwitch                                                                                        2.11.0                                                                                     ovn-detrace(1)
