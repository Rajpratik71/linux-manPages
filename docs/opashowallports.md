
opashowallports(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opashowallports(8)



NAME
       opashowallports



       (Switch and Host) Displays basic port state and statistics for all host nodes, chassis, or externally-managed switches.

       NOTE:  opareport  and opareports are more powerful Intel(R) Omni-Path Fabric Suite FastFabric commands. For general fabric analysis, use opareport or opareports with options such as -o errors and -o
       slowlinks to perform an efficient analysis of link speeds and errors.



Syntax
       opashowallports [-C] [-f hostfile] [-F chassisfile] [-h 'hosts']
       [-H 'chassis'] [-S]

Options
       --help    Produces full help text.

       -C        Performs operation against chassis. Default is host.

       -f hostfile
                 Specifies the file containing the list of hosts in cluster. Default is /etc/opa/hosts file.

       -F chassisfile
                 Specifies the file containing the list of chassis in cluster. Default is /etc/opa/chassis file.

       -h hosts  Specifies the list of hosts for which to show ports.

       -H chassis
                 Specifies the list of chassis for which to show ports.

       -S        Securely prompts for password for admin on chassis.

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts, used if -h option not supplied.


       CHASSIS   List of chassis, used if -C is used and -H and -F options not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       CHASSIS_FILE
                 File containing list of chassis, used in absence of -F and -H.


       FF_CHASSIS_LOGIN_METHOD
                 How to log into chassis. Can be Telnet or SSH.


       FF_CHASSIS_ADMIN_PASSWORD
                 Password for admin on all chassis. Used in absence of -S option.


Example
       opashowallports
       opashowallports -h 'elrond arwen'
       HOSTS='elrond arwen' opashowallports
       opashowallports -C
       opashowallports -H 'chassis1 chassis2'
       CHASSIS='chassis1 chassis2' opashowallports -C

Notes
       When performing opashowallports against hosts, internally SSH is used. The command opashowallports requires that password-less SSH be set up between the host running the  Intel(R)  Omni-Path  Fabric
       Suite FastFabric Toolset and the hosts opashowallports is operating against. The opasetupssh FastFabric tool can aid in setting up password-less SSH.

       When  performing  operations  against chassis, Intel recommends that you set up SSH keys (see opasetupssh ). If SSH keys are not set up, Intel recommends that you use the -S option, to avoid keeping
       the password in configuration files.

       When performing opashowallports against externally-managed switches, a node with Intel(R) Omni-Path Fabric Suite FastFabric Toolset installed is required. Typically, this  is  the  node  from  which
       opashowallports is being run.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opashowallports(8)
