rblsmtpd(1)                                                   General Commands Manual                                                  rblsmtpd(1)

NAME
       rblsmtpd - blocks mail from RBL-listed sites. It works with any SMTP server that can run under tcpserver(1)

SYNOPSIS
       rblsmtpd opts prog

DESCRIPTION
       opts is a series of getopt-style options.  prog consists of one or more arguments.

       Normally rblsmtpd runs prog.  prog is expected to carry out an SMTP conversation to receive incoming mail messages.

       However,  rblsmtpd does not invoke prog if it is told to block mail from this client. Instead it carries out its own limited SMTP conversa‐
       tion, temporarily rejecting all attempts to send a message. Meanwhile it prints one line on descriptor 2 to log its activity.

       rblsmtpd drops the limited SMTP conversation after 60 seconds, even if the client has not quit by then.

OPTIONS
       -t n   Change the timeout to n seconds.

       Blocked clients

       If the $RBLSMTPD environment variable is set and is nonempty, rblsmtpd blocks mail. It uses $RBLSMTPD as an error message for  the  client.
       Normally rblsmtpd runs under tcpserver(1); you can use tcprules(1) to set $RBLSMTPD for selected clients.

       If $RBLSMTPD is set and is empty, rblsmtpd does not block mail.

       If  $RBLSMTPD  is not set, rblsmtpd looks up $TCPREMOTEIP in the RBL, and blocks mail if $TCPREMOTEIP is listed.  tcpserver sets up $TCPRE‐
       MOTEIP as the IP address of the remote host.

       -r base
              Use base as an RBL source. An IP address a.b.c.d is listed by that source if d.c.b.a.base has a TXT record.  rblsmtpd uses the  con‐
              tents of the TXT record as an error message for the client.

       -a base
              Use  base  as  an anti-RBL source. An IP address a.b.c.d is anti-listed by that source if d.c.b.a.base has an A record. In this case
              rblsmtpd does not block mail.

       You may supply any number of -r and -a options.  rblsmtpd tries each source in turn until it finds one that  lists  or  anti-lists  $TCPRE‐
       MOTEIP. It also tries an RBL source of rbl.maps.vix.com if you do not supply any -r options. See http://maps.vix.com/rbl/ for more informa‐
       tion about rbl.maps.vix.com.

       If you want to run your own RBL source or anti-RBL source for rblsmtpd, you can use rbldns from the DNScache (djbdns) package.

       Temporary errors

       Normally, if $RBLSMTPD is set, rblsmtpd uses a 451 error code in its limited SMTP conversation. This tells legitimate clients to try  again
       later. It gives innocent relay operators a chance to see the problem, prohibit relaying, get off the RBL, and get the mail delivered.

       However,  if $RBLSMTPD begins with a hyphen, rblsmtpd removes the hyphen and uses a 553 error code. This tells legitimate clients to bounce
       the message immediately.

       There are several error-handling options for RBL lookups:

       -B     (Default.) Use a 451 error code for IP addresses listed in the RBL.

       -b     Use a 553 error code for IP addresses listed in the RBL.

       -C     (Default.) Handle RBL lookups in a ``fail-open'' mode. If an RBL lookup fails temporarily, assume that the address is not listed; if
              an  anti-RBL  lookup fails temporarily, assume that the address is anti-listed. Unfortunately, a knowledgeable attacker can force an
              RBL lookup or an anti-RBL lookup to fail temporarily, so that his mail is not blocked.

       -c     Handle RBL lookups in a ``fail-closed'' mode. If an RBL lookup fails temporarily, assume that the address is listed (but use  a  451
              error  code  even with -b). If an anti-RBL lookup fails temporarily, assume that the address is not anti-listed (but use a 451 error
              code even if a subsequent RBL lookup succeeds with -b). Unfortunately, this sometimes delays legitimate mail.

SEE ALSO
       tcpserver(1), tcprules(1), tcprulescheck(1), fixcrio(1), recordio(1), rblsmtpd(1), tcpclient(1), who@(1), date@(1),  finger@(1),  http@(1),
       tcpcat(1), mconnect(1), tcp-environ(5)

       http://cr.yp.to/ucspi-tcp.html

                                                                                                                                       rblsmtpd(1)
