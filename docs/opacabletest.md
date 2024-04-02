
opacabletest(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opacabletest(8)



NAME
       opacabletest



       (Switch) Initiates or stops Cable Bit Error Rate stress tests for Intel(R) Omni-Path Host Fabric Interface (HFI)-to-switch links and/or ISLs.

Syntax
       opacabletest [-C|-A] [-c file] [-f hostfile] [-h 'hosts'] [-n numprocs]
       [-t portsfile] [-p ports] [start|start_fi|start_isl|stop|stop_fi|
       stop_isl] ...

Options
       --help    Produces full help text.


       -C        Clears error counters.


       -A        Forces the system to clear hardware error counters. Implies -C.


       -c file   Specifies the error thresholds configuration file. Default is /etc/opa/opamon.si.conf file. Only used if -C or -A specified.


       -f hostfile
                 Specifies the file with hosts to include in HFI -to-SW test. Default is /etc/opa/hosts file.


       -h hosts  Specifies the list of hosts to include in HFI -SW test.


       -n numprocs
                 Specifies the number of processes per host for HFI -SW test.


       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabrics when clearing counters. Default is /etc/opa/ports file.


       -p ports  Specifies the list of local HFI ports used to access fabrics for counter clear.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0
                           First active port on HFI x.





                 x:y       HFI x, port y.



       start     Starts the HFI -SW and ISL tests.


       start_fi  Starts the HFI -SW test.


       start_isl Starts the ISL test.


       stop      Stops the HFI -SW and ISL tests.


       stop_fi   Stops the HFI -SW test.


       stop_isl  Stops the ISL test.


       The HFI -SW cable test requires that the FF_MPI_APPS_DIR is set, and it contains a pre-built copy of the mpi_apps for an appropriate message passing interface (MPI).

       The  ISL  cable  test started by this tool assumes that the master Host Subnet Manager (HSM) is running on this host. If using the Embedded Subnet Manager (ESM), or if a different host is the master
       HSM, the ISL cable test must be controlled by the switch CLI, or by Intel(R) Omni-Path Fabric Suite FastFabric on the master HSM respectively.

Examples
       opacabletest -A start
       opacabletest -f good -A start
       opacabletest -h 'arwen elrond' start_fi
       HOSTS='arwen elrond' opacabletest stop
       opacabletest -A

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts, used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       PORTS     List of ports, used in absence of -t and -p.


       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.


       FF_MAX_PARALLEL
                 Maximum concurrent operations.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opacabletest(8)
