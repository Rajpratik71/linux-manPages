
opafindgood(8)                                                                              IFSFFCLIRG (Man Page)                                                                              opafindgood(8)



NAME
       opafindgood



       Checks  for hosts that are able to be pinged, accessed via SSH, and active on the Intel(R) Omni-Path Fabric. Produces a list of good hosts meeting all criteria. Typically used to identify good hosts
       to undergo further testing and benchmarking during initial cluster staging and startup.

       The resulting good file lists each good host exactly once and can be used as input to create mpi_hosts files for running mpi_apps and the HFI-SW cable test. The files alive, running,  active,  good,
       and bad are created in the selected directory listing hosts passing each criteria.

       This  command  assumes  the Node Description for each host is based on the hostname-s output in conjunction with an optional hfi1_# suffix. When using a /etc/opa/hosts file that lists the hostnames,
       this assumption may not be correct.

       This command automatically generates the file FF_RESULT_DIR/punchlist.csv. This file provides a concise summary of the bad hosts found. This can be imported into Excel  directly  as  a  *.csv  file.
       Alternatively, it can be cut/pasted into Excel, and the Data/Text to Columns toolbar can be used to separate the information into multiple columns at the semicolons.

       A sample generated output is:

       # opafindgood
       3 hosts will be checked
       2 hosts are pingable (alive)
       2 hosts are ssh'able (running)
       2 total hosts have FIs active on one or more fabrics (active)
       No Quarantine Node Records Returned
       1 hosts are alive, running, active (good)
       2 hosts are bad (bad)
       Bad hosts have been added to /root/punchlist.csv
       # cat /root/punchlist.csv
       2015/10/04 11:33:22;phs1fnivd13u07n1 hfi1_0 p1 phs1swivd13u06 p16;Link errors
       2015/10/07 10:21:05;phs1swivd13u06;Switch not found in SA DB
       2015/10/09 14:36:48;phs1fnivd13u07n4;Doesn't ping
       2015/10/09 14:36:48;phs1fnivd13u07n3;No active port



       For a given run, a line is generated for each failing host. Hosts are reported exactly once for a given run. Therefore, a host that does not ping is NOT listed as can't ssh nor No active port. There
       may be cases where ports could be active for hosts that do not ping, especially if Ethernet host names are used for the ping test. However, the lack of ping often implies there are other fundamental
       issues, such as PXE boot or inability to access DNS or DHCP to get proper host name and IP address. Therefore, reporting hosts that do not ping is typically of limited value.

       Note that opafindgood queries the SA for NodeDescriptions to determine hosts with active ports. As such, ports may be active for hosts that cannot be accessed via SSH or pinged.

       By default, opafindgood checks for and reports nodes that are quarantined for security reasons. To skip this, use the -Q option.

Syntax
       opafindgood [-R|-A|-Q] [-d dir] [-f hostfile] [-h 'hosts']
       [-t portsfile] [-p ports] [-T timelimit]

Options
       --help    Produces full help text.

       -R        Skips the running test (SSH). Recommended if password-less SSH is not set up.

       -A        Skips the active test. Recommended if Intel(R) Omni-Path Fabric software or fabric is not up.

       -Q        Skips the quarantine test. Recommended if Intel(R) Omni-Path Fabric software or fabric is not up.

       -d dir    Specifies the directory in which to create alive, active, running, good, and bad files. Default is /etc/opa directory.

       -f hostfile
                 Specifies the file with hosts in cluster. Default is /etc/opa/hosts directory.

       -h hosts  Specifies the list of hosts to ping.

       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis. Default is /etc/opa/ports file.

       -p ports  Specifies the list of local HFI ports used to access fabric(s) for analysis.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



       -T timelimit
                 Specifies the time limit in seconds for host to respond to SSH. Default is 20 seconds.


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


Examples
       opafindgood
       opafindgood -f allhosts
       opafindgood -h 'arwen elrond'
       HOSTS='arwen elrond' opafindgood
       HOSTS_FILE=allhosts opafindgood
       opafindgood -p '1:1 1:2 2:1 2:2'



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opafindgood(8)
