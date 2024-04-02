RTMPSRV(1)               General Commands Manual              RTMPSRV(1)

NAME
       rtmsrv - a stub server

SYNOPSIS
       rtmsrv [-z]

DESCRIPTION
       rtmsrv  is  useful  for  obtaining all the parameters that a real
       Flash client would send to an RTMP server, so that  they  can  be
       used  with  rtmpdump.   rtmpdump  is  invoked automatically after
       parsing a client request.

OPTIONS
       -z Debug level output. Extremely verbose.

SEE ALSO
       rtmpdump(1)

AUTHORS
       Andrej Stepanchuk, Howard Chu
       <http://rtmpdump.mplayerhq.hu>

RTMPDump v2.4                  2016-04-27                     RTMPSRV(1)
