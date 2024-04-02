tcprules(1)                                                   General Commands Manual                                                  tcprules(1)

NAME
       tcprules - compiles rules for tcpserver(1).

SYNOPSIS
       tcprules cdb tmp

DESCRIPTION
       tcpserver(1) optionally follows rules to decide whether a TCP connection is acceptable. For example, the rule

              18.23.0.32:deny

       prohibits connections from IP address 18.23.0.32.

       tcprules reads rules from its standard input and writes them into cdb in a binary format suited for quick access by tcpserver(1).

       tcprules  can  be used while tcpserver(1) is running. It ensures that cdb is updated atomically. It does this by first writing the rules to
       tmp and then moving tmp on top of cdb.  If tmp already exists, it is destroyed. The directories containing cdb and tmp must be writable  to
       tcprules; they must also be on the same filesystem.

       If there is a problem with the input or with tmp, tcprules complains and leaves cdb alone.

       The binary cdb format is portable across machines.

RULE FORMAT
       A rule is one line. A file containing rules may also contain comments: lines beginning with # are ignored.

       Each rule contains an address, a colon, and a list of instructions, with no extra spaces. When tcpserver(1) receives a connection from that
       address, it follows the instructions.

ADDRESSES
       tcpserver(1) looks for rules with various addresses:

       1.     $TCPREMOTEINFO@$TCPREMOTEIP, if $TCPREMOTEINFO is set;

       2.     $TCPREMOTEINFO@=$TCPREMOTEHOST, if $TCPREMOTEINFO is set and $TCPREMOTEHOST is set;

       3.     $TCPREMOTEIP;

       4.     =$TCPREMOTEHOST, if $TCPREMOTEHOST is set;

       5.     shorter and shorter prefixes of $TCPREMOTEIP ending with a dot;

       6.     shorter and shorter suffixes of $TCPREMOTEHOST starting with a dot, preceded by =, if $TCPREMOTEHOST is set;

       7.     =, if $TCPREMOTEHOST is set; and finally

       8.     the empty string.

       tcpserver(1) uses the first rule it finds. You should use the -p option to tcpserver(1) if you rely on $TCPREMOTEHOST here.

       For example, here are some rules:

            joe@127.0.0.1:first
            18.23.0.32:second
            :third
            127.:fourth

       If $TCPREMOTEIP is 10.119.75.38, tcpserver(1) will follow the third instructions.

       If $TCPREMOTEIP is 18.23.0.32, tcpserver(1) will follow the second instructions.

       If $TCPREMOTEIP is 127.0.0.1 and $TCPREMOTEINFO is bill, tcpserver(1) will follow the fourth instructions.

       If $TCPREMOTEIP is 127.0.0.1 and $TCPREMOTEINFO is joe, tcpserver(1) will follow the first instructions.

       You can use tcprulescheck(1) to see how tcpserver will interpret rules in cdb.

ADDRESS RANGES
       tcprules treats 1.2.3.37-53:ins as an abbreviation for the rules 1.2.3.37:ins, 1.2.3.38:ins, and so on up through 1.2.3.53:ins.  Similarly,
       10.2-3.:ins is an abbreviation for 10.2.:ins and 10.3.:ins.

INSTRUCTIONS
       The  instructions  in a rule must begin with either allow or deny. deny tells tcpserver(1) to drop the connection without running anything.
       For example, the rule

              :deny

       tells tcpserver(1) to drop all connections that aren't handled by more specific rules.

       The instructions may continue with some environment variables, in the form var="x".  tcpserver(1) adds an environment  variable  $var  with
       value x. For example,

              10.0.:allow,RELAYCLIENT="@fix.me"

       adds an environment variable $RELAYCLIENT with value @fix.me. The quotes may be replaced by any repeated character:

              10.0.:allow,RELAYCLIENT=/@fix.me/

       Any number of variables may be listed:

              127.0.0.1:allow,RELAYCLIENT="",TCPLOCALHOST="movie.edu"

SEE ALSO
       tcpserver(1), tcprulescheck(1), argv0(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1), finger@(1), http@(1), tcp‐
       cat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                       tcprules(1)
