
opacheckload(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opacheckload(8)



NAME
       opacheckload



       Returns load information on hosts in the fabric.

Syntax
       opacheckload [-f hostfile] [-h 'hosts'] [-r] [-a|-n numprocs]
       [-d uploaddir]

Options
       --help    Produces full help text.


       -f hostfile
                 Specifies the file with hosts to check. Default is /etc/opa/hosts


       -h hosts  Specifies the list of hosts to check.


       -r        Reverses output to show the least busy hosts. Default is busiest hosts.

       -n numprocs
                 Shows the specified number of top numprocs hosts. Default is 10.

       -a        Shows all hosts. Default is 10.


       -d upload_dir
                 Specifies the target directory to upload loadavg. Default is uploads.


Examples
       opacheckload
       opacheckload -h 'arwen elrond'
       HOSTS='arwen elrond' opacheckload

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts, used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       UPLOADS_DIR
                 Directory to upload loadavg, used in absence of -d.


       FF_MAX_PARALLEL
                 Maximum concurrent operations.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opacheckload(8)
