READNSSTATE(1)                                                                             General Commands Manual                                                                             READNSSTATE(1)



NAME
       readnsstate - interpret the contents of cn=replica's nsState value readnsstate /etc/dirsrv/slapd-INSTANCE/dse.ldif

DESCRIPTION
       Decode and display the content of the nsState attribute from a directory servers cn=replicate object.

EXAMPLES
              sudo /usr/bin/readnsstate /etc/dirsrv/slapd-localhost/dse.ldif

              For replica cn=replica,cn=dc3Dexample2Cdc3Dcom,cn=mapping tree,cn=config
                fmtstr=[H6x3QH6x]
                size=40
                len of nsstate is 40
                CSN generator state:
                  Replica ID    : 5
                  Sampled Time  : 1463100468
                  Gen as csn    : 57352434000000050000
                  Time as str   : Fri May 13 10:47:48 2016
                  Local Offset  : 0
                  Remote Offset : 276
                  Seq. num      : 0
                  System time   : Fri May 13 14:01:25 2016
                  Diff in sec.  : 11617
                  Day:sec diff  : 0:11617

AUTHOR
       readnsstate was written by the 389 Project by richm.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by William Brown <wibrown@redhat.com>, for the 389 Directory Server Project.
       This is free software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.



                                                                                                March 31, 2017                                                                                 READNSSTATE(1)
