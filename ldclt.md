LDCLT(1)                                                                                   General Commands Manual                                                                                   LDCLT(1)



NAME
       ldclt - load test program for LDAP

SYNOPSYS
       ldclt  [-qQvV]  [-E <max errors>] [-b <base DN>] [-h <host>] [-p <port>] [-t <timeout>] [-D <bind DN>] [-w <passwd>] [-o <SASL option>] [-e <execParams>] [-a <max pending>] [-n <nb threads>] [-i <nb
       times>] [-N <nb samples>] [-I <err number>] [-T <total>] [-r <low> -R <high>] [-f <filter>] [-s <scope>] [-S <slave>] [-P<master port>] [-W <waitsec>] [-Z <certfile>]

DESCRIPTION
       This tool is a LDAP client targeted to validate the reliability of the product under a wide variety of stress conditions.

OPTIONS
       The valid options are:

       -a     Asynchronous mode, with max pending operations.

       -b     Give the base DN to use. Default "dc=example,dc=com".

       -D     Bind DN. See -w

       -E     Max errors allowed. Default 1000.

       -f     Filter for searches.

       -h     Host to connect. Default "localhost".

       -H     Ldap URL to connect to. Example, ldap://localhost:389. This takes precedence over -h and -p.

       -i     Number of times inactivity allowed. Default 3 (30 seconds)

       -I     Ignore errors (cf. -E). Default none.

       -n     Number of threads. Default 10.

       -N     Number of samples (10 seconds each). Default infinite.

       -o     SASL Option.

       -p     Server port. Default 389.

       -P     Master port (to check replication). Default 16000.

       -q     Quiet mode. See option -I.

       -Q     Super quiet mode.

       -r     Range's low value.

       -R     Range's high value.

       -s     Scope. May be base, subtree or one. Default subtree.

       -S     Slave to check.

       -t     LDAP operations timeout. Default 30 seconds.

       -T     Total number of operations per thread. Default infinite.

       -v     Verbose.

       -V     Very verbose.

       -w     Bind passwd. See -D.

       -W     Wait between two operations. Default 0 seconds.

       -Z     certfile. Turn on SSL and use certfile as the certificate DB

       -e     Execution parameters:

              add ldap_add() entries.
              append entries to the genldif file.
              ascii ascii 7-bits strings.
              attreplace=name:mask replace attribute of existing entry.
              attrlist=name:name:name specify list of attribs to retrieve
              attrsonly=0|1 ldap_search() parameter. Set 0 to read values.
              bindeach ldap_bind() for each operation.
              bindonly only bind/unbind, no other operation is performed.
              close will close() the fd, rather than ldap_unbind().
              cltcertname=name name of the SSL client certificate
              commoncounter all threads share the same counter.
              counteach count each operation not only successful ones.
              delete ldap_delete() entries.
              dontsleeponserverdown will loop very fast if server down.
              emailPerson objectclass=emailPerson (-e add only).
              esearch exact search.
              genldif=filename generates a ldif file
              imagesdir=path specify where are the images.
              incr incremental values.
              inetOrgPerson objectclass=inetOrgPerson (-e add only).
              keydbfile=file filename of the key database
              keydbpin=password password for accessing the key database
              noglobalstats don't print periodical global statistics
              noloop does not loop the incremental numbers.
              object=filename build object from input file
              person objectclass=person (-e add only).
              random random filters, etc...
              randomattrlist=name:name:name random select attrib in the list
              randombase random base DN.
              randombaselow=value low value for random generator.
              randombasehigh=value high value for random generator.
              randombinddn random bind DN.
              randombinddnfromfile=fine retrieve bind DN & passwd from file
              randombinddnlow=value low value for random generator.
              randombinddnhigh=value high value for random generator.
              rdn=attrname:value alternate for -f.
              referral=on|off|rebind change referral behaviour.
              scalab01 activates scalab01 scenario.
              scalab01_cnxduration maximum connection duration.
              scalab01_maxcnxnb modem pool size.
              scalab01_wait sleep() between 2 attempts to connect.
              smoothshutdown main thread waits till the worker threads exit.
              string create random strings rather than random numbers.
              v2 ldap v2.
              withnewparent rename with newparent specified as argument.
              randomauthid random SASL Authid.
              randomauthidlow=value low value for random SASL Authid.
              randomauthidhigh=value high value for random SASL Authid.

AUTHOR
       ldclt was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This is free software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license  is  essentially  the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                                       LDCLT(1)
