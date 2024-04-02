NUXWDOG(1)                                                                                        PKI Tools                                                                                        NUXWDOG(1)



NAME
       nuxwdog - Provides a simple watchdog process that can be used to start, stop, monitor, or reconfigure a server process.

SYNOPSIS
       nuxwdog -f configuration_file [-i]

DESCRIPTION
       nuxwdog is a watchdog daemon that builds on the uxwdog service that is part of the Netscape Enterprise Server (NES).  nuxwdog can start, stop, monitor, and reconfigure server programs, depending on
       the parameters passed to it in its configuration file.  nuxwdog opens a Unix domain socket to accept requests from any server process it is managing. Optionally, nuxwdog can be configured to
       communicate only with clients that are descendants of the nuxwdog process, limiting an avenue of potential access to any servers managed by the watchdog.

       Some servers require a high-level of security to protect their data or operations, which means (for example) that they cannot store plaintext passwords in a password file to allow the server to be
       started automatically.  nuxwdog can be configured to prompt for server passwords when a server first starts and then caches those passwords so that nuxwdog can restart the server without
       intervention if the server crashes.

       To make it easy for clients to communicate with nuxwdog, a C/C++ shared library is provided with the nuxwdog source code (libnuxwdog.so). Additionally, nuxwdog provides JNI interfaces and Perl
       bindings to the libnuxwdog.so library, so that calls can be made from Java and Perl programs. For more information on this library and the client interfaces, see
       https://fedorahosted.org/nuxwdog/wiki/HOWTO.

       nuxwdog is used by Dogtag PKI to monitor and manage the subsystem server processes for Java, Tomcat, and Apache servers.

OPTIONS
       -f configuration_file
           Passes the configuration file for the service which runs the subsystem.  With Dogtag PKI.  For the CA, OCSP, TKS, and DRM, this is for the Java process. For the TPS, this is for the Apache
           process.

       -i
           Runs the nuxwdog process in interactive mode and keeps nuxwdog open in the foreground instead of running it as a daemon in the background.

CONFIGURATION FILE PARAMETERS AND EXAMPLES
       ExeFile
           Gives the full path to the executable to be started.

       ExeArgs
           Passes any arguments to the executable. The first argument must be the full path to the executable (the same as the value in ExeFile).

       TmpDir
           Gives the full path to the executable to be started.

       ChildSecurity
           Sets whether the child server process should only allow requests from a parent (where nuxwdog is the parent).  nuxwdog checks the process ID for any client which sends a request to the Unix
           domain socket and drops any message where the client is not a descendant of the nuxwdog process. To allow any request, set this to 0; to allow only parent or ancestor requests, sets this to 1.

       ExeOut
           Gives the file to write stdout for the server to be started.

       ExeErr
           Gives the file to write stderr for the server to be started.

       ExeBackground
           Sets whether to run the server and the nuxwdog processes in the background in daemon mode after the watchdog is initialized. Setting this to 1 enables daemon mode, while 0 keeps this in the
           foreground.

       PidFile
           Gives the PID file to use to store the nuxwdog PID.

       ChildPidFile
           Gives the PID file to use to store the PID of the server process managed by nuxwdog.

       ExeContext
           Sets the SELinux context in which to start the server process.

       nuxwdog can be used to manage many types of server processes. For Dogtag PKI, it manages Java, Tomcat, and Apache servers. For the Dogtag PKI Certificate Authority, a Java-based subsystem with a
       Tomcat web service, the configuration file identifies the appropriate JRE and class paths, along with setting the output, error, and PID files. (The ExeArgs argument should be all on one line.)

           ExeFile /usr/lib/jvm/jre/bin/java
           ExeArgs /usr/lib/jvm/jre/bin/java
                   -Djava.endorsed.dirs=/usr/share/tomcat5/common/endorsed
                   -classpath :/usr/lib/jvm/jre/lib/rt.jar
                      :/usr/share/java/commons-collections.jar
                      :/usr/share/tomcat5/bin/bootstrap.jar
                      :/usr/share/tomcat5/bin/commons-logging-api.jar
                      :/usr/share/java/mx4j/mx4j-impl.jar
                      :/usr/share/java/mx4j/mx4j-jmx.jar
                      :/usr/share/tomcat5/common/lib/nuxwdog.jar
                   -Dcatalina.base=/var/lib/pki-ca2
                   -Dcatalina.home=/usr/share/tomcat5
                   -Djava.io.tmpdir=/usr/share/tomcat5/temp org.apache.catalina.startup.Bootstrap
                   start
           TmpDir /var/lib/pki-ca2/logs/pids
           ChildSecurity 1
           ExeOut /var/lib/pki-ca2/logs/catalina.out
           ExeErr /var/lib/pki-ca2/logs/catalina.out
           ExeBackground 1
           PidFile /var/lib/pki-ca2/logs/wd-pki-ca2.pid
           ChildPidFile /var/run/pki-ca2.pid

       For Dogtag PKI, the Token (smart card) Processing System uses an Apache-based server. This example also sets the SELinux context, pki_tps_t, used by the TPS subsystem processes.

           ExeFile /usr/sbin/httpd.worker
           ExeArgs /usr/sbin/httpd.worker -f /etc/pki-tps1/httpd.conf
           TmpDir /var/lib/pki-tps1/logs/pids
           PidFile /var/lib/pki-tps1/logs/wd-pki-tps1.pid
           ExeContext pki_tps_t

ADDITIONAL RESOURCES
       There is a more detailed how-to article, including information on available client calls for nuxwdog, at https://fedorahosted.org/nuxwdog/wiki/HOWTO.

       The nuxwdog server works in conjunction with the Dogtag PKI subsystems. The Dogtag PKI project wiki is at http://pki.fedoraproject.org/wiki/.

       For information specifically about nuxwdog, the nuxwdog project wiki is located at https://fedorahosted.org/nuxwdog/wiki/[1]. The nuxwdog relates directly to nuxwdog code changes and releases,
       rather than all PKI-related updates.

       Mailing lists: pki-devel@redhat.com and pki-users@redhat.com

       IRC: Freenode at #dogtag-pki

AUTHORS
       The PKI tools were written and maintained by developers with Netscape and now with Red Hat.

       Authors: Ade Lee <alee@redhat.com>, Deon Lackey <dlackey@redhat.com>.

COPYRIGHT
       (c) 2010, Red Hat, Inc. Licensed under the GNU Public License version 2.

NOTES
        1. https://fedorahosted.org/nuxwdog/wiki/
           https://fedorahosted.org/nuxwdog/wiki



nuxwdog 1                                                                                     November 29, 2010                                                                                    NUXWDOG(1)
