
opapingall(8)                                                                               IFSFFCLIRG (Man Page)                                                                               opapingall(8)



NAME
       opapingall



       (All) Pings a group of hosts or chassis to verify that they are powered on and accessible through TCP/IP ping.

Syntax
       opapingall [-C] [-p] [-f hostfile] [-F chassisfile] [-h 'hosts']
       [-H 'chassis']

Options
       --help    Produces full help text.


       -C        Performs a ping against a chassis. Default is hosts.


       -p        Pings all hosts/chassis in parallel.


       -f hostfile
                 Specifies the file with hosts in cluster.
                 Default is /etc/opa/hosts.


       -F chassisfile
                 Specifies the file with chassis in cluster.
                 Default is /etc/opa/chassis.


       -h hosts  Specifies the list of hosts to ping.


       -H chassis
                 Specifies the list of chassis to ping.


Example
       opapingall
       opapingall -h 'arwen elrond'
       HOSTS='arwen elrond' opapingall
       opapingall -C

       NOTE:  This command pings all hosts/chassis found in the specified host/chassis file. The use of -C option merely selects the default file and/or environment variable to use. For this command, it is
       valid to use a file that lists both hosts and chassis.

       opapingall -C -H 'chassis1 chassis2'
       CHASSIS='chassis1 chassis2' opapingall -C

Environment Variables
       HOSTS     List of hosts, used if -h option not supplied.


       CHASSIS   List of chassis, used if -H option not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       CHASSIS_FILE
                 File containing list of chassis, used in absence of -F and -H.


       FF_MAX_PARALLEL
                 When -p option is used, maximum concurrent operations are performed.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                 opapingall(8)
