NFCT(8)                                                                                                                                                                                               NFCT(8)



NAME
       nfct - command line tool to configure with the connection tracking system

SYNOPSIS
       nfct command subsystem [parameters]

DESCRIPTION
       nfct is the command line tool that allows to configure the Connection Tracking System.

COMMANDS
       list   List the existing objects.

       add    Add new object.

       delete Delete an object.

       get    Get an existing object.

       flush  Flush the accounting object table.

       disable
              This command is for the helper subsystem. It allows you to disable enqueueing packets to userspace for helper inspection.

       default-set
              This command is for the timeout subsystem. It allows you to set default protocol timeouts.

       default-get
              This command is for the timeout subsystem. It allows you to get the default protocol timeouts.

SUBSYS
       By the time this manpage has been written, the supported subsystems are timeout and helper.

       timeout
              The timeout subsystem allows you to define fine-grain timeout policies.

       helper The helper subsystem allows you to configure userspace helpers.

       version
              Displays the version information.

       help   Displays the help message.

EXAMPLE
       nfct add timeout test-tcp inet tcp established 100 close 10 close_wait 10

       This creates a timeout policy for tcp using 100 seconds for the ESTABLISHED state, 10 seconds for CLOSE state and 10 seconds for the CLOSE_WAIT state.

       Then, you can attach the timeout policy with the iptables CT target:

       iptables -I PREROUTING -t raw -p tcp -j CT --timeout test-tcp

       iptables -I OUTPUT -t raw -p tcp -j CT --timeout test-tcp

       You can test that the timeout policy with:

       conntrack -E -p tcp

       It should display:

       [UPDATE] tcp 6 100 ESTABLISHED src=192.168.39.100 dst=57.126.1.20 sport=56463 dport=80 src=57.126.1.20 dst=192.168.39.100 sport=80 dport=56463 [ASSURED]

SEE ALSO
       iptables(8),conntrack(8)

BUGS
       Please, report them to netfilter-devel@vger.kernel.org or file a bug in Netfilter's bugzilla (https://bugzilla.netfilter.org).

AUTHORS
       Pablo Neira Ayuso wrote and maintains the nfct tool.

       Man page written by Pablo Neira Ayuso <pablo@netfilter.org>.



                                                                                                 Feb 29, 2012                                                                                         NFCT(8)
