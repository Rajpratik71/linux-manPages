
opaverifyhosts(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaverifyhosts(8)



NAME
       opaverifyhosts



       Verifies basic node configuration and performance by running FF_HOSTVERIFY_DIR/hostverify.sh on all specified hosts.

       NOTE:  Prior to using opaverifyhosts, copy the sample file /usr/share/opa/samples/hostverify.sh to FF_HOSTVERIFY_DIR and edit it to set the appropriate configuration and performance expectations and
       select which tests to run by default. On the first run for a given node, use the -c option so that hostverify.sh gets copied to each node.


       FF_HOSTVERIFY_DIR defines both the location of hostverify.sh and the destination of the hostverify.res output file. FF_HOSTVERIFY_DIR is configured in the /etc/opa/opafastfabric.conf file.

       A summary of results is appended to the FF_RESULT_DIR/verifyhosts.res file. A punchlist of failures is also appended to the FF_RESULT_DIR/punchlist.csv file. Only failures are shown on stdout.


Syntax
       opaverifyhosts [-kc] [-f hostfile] [-u upload_file] [-d upload_dir]
       [-h hosts] [-T timelimit] [-F filename] [ test...]

Options
       --help    Produces full help text.


       -k        At start and end of verification, kills any existing hostverify or xhpl jobs on the hosts.


       -c        Copies hostverify.sh to hosts first, useful if you have edited it.


       -f hostfile
                 Specifies the file with hosts in cluster.
                 Default is /etc/opa/hosts.


       -h hosts  Specifies the list of hosts to ping.


       -u upload_file
                 Specifies the filename to upload hostverify.res to after verification to allow backup and review of the detailed results for each node. The default  upload  destination  file  is  hostver‐
                 ify.res. If -u '' is specified, no upload occurs.


       -d upload_dir
                 Specifies the directory to upload result from each host to. Default is uploads.


       -T timelimit
                 Specifies the time limit in seconds for host to complete tests. Default is 300 seconds (5 minutes).


       -F filename
                 Specifies the filename of hostverify script to use. Default is /root/hostverify.sh.


       test      Specifies one or more specific tests to run. See
                 /usr/share/opa/samples/hostverify.sh for a list of available tests.


Examples
       opaverifyhosts -c
       opaverifyhosts -h 'arwen elrond'
       HOSTS='arwen elrond' opaverifyhosts

Environment Variables
       HOSTS     List of hosts, used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       UPLOADS_DIR
                 Directory to upload to, used in absence of -d.


       FF_MAX_PARALLEL
                 Maximum concurrent operations.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaverifyhosts(8)
