
opahostadmin(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opahostadmin(8)



NAME
       opahostadmin



       (Host)  Performs  a number of multi-step host initialization and verification operations, including upgrading software or firmware, rebooting hosts, and other operations. In general, operations per‐
       formed by opahostadmin involve a login to one or more host systems.

Syntax
       opahostadmin [-c] [-i ipoib_suffix] [-f hostfile] [-h 'hosts']
       [-r release] [-I install_options] [-U upgrade_options] [-d dir]
       [-T product] [-P packages] [-m netmask] [-S] operation...

Options
       --help    Produces full help text.


       -c        Overwrites the result files from any previous run before starting this run.


       -i ipoib_suffix
                 Specifies the suffix to apply to host names to create IPoIB host names. Default is -opa.


       -f hostfile
                 Specifies the file with the names of hosts in a cluster. Default is /etc/opa/hosts file.


       -h hosts  Specifies the list of hosts to execute the operation against.


       -r release
                 Specifies the software version to load/upgrade to. Default is the version of Intel(R) Omni-Path Software presently being run on the server.


       -d dir    Specifies the directory to retrieve  product. release.tgz for load or upgrade.


       -I install_options
                 Specifies the software install options.


       -U upgrade_options
                 Specifies the software upgrade options.


       -T product
                 Specifies the product type to install. Default is IntelOPA-Basic. <distro> or IntelOPA-IFS. <distro> where <distro> is the distribution and CPU.


       -P packages
                 Specifies the packages to install. Default is oftools ipoib psm_mpi


       -m netmask
                 Specifies the IPoIB netmask to use for configipoib operation.


       -S        Securely prompts for user password on remote system.


       operation Performs the specified operation, which can be one or more of the following:




                 load      Starts initial installation of all hosts.





                 upgrade   Upgrades installation of all hosts.





                 configipoib
                           Creates ifcfg-ib1 using host IP address from /etc/hosts file.





                 reboot    Reboots hosts, ensures they go down and come back.





                 sacache   Confirms sacache has all hosts in it.





                 ipoibping Verifies this host can ping each host through IPoIB.





                 mpiperf   Verifies latency and bandwidth for each host.





                 mpiperfdeviation
                           Verifies latency and bandwidth for each host against a defined threshold (or relative to average host performance).



Example
       opahostadmin -c reboot
       opahostadmin upgrade
       opahostadmin -h 'elrond arwen' reboot
       HOSTS='elrond arwen' opahostadmin reboot

Details
       opahostadmin provides detailed logging of its results. During each run, the following files are produced:

       ·      test.res : Appended with summary results of run.

       ·      test.log : Appended with detailed results of run.

       ·      save_tmp/ : Contains a directory per failed test with detailed logs.

       ·      test_tmp*/ : Intermediate result files while test is running.

       The -c option removes all log files.

       Results from opahostadmin are grouped into test suites, test cases, and test items. A given run of opahostadmin represents a single test suite. Within a test suite, multiple test cases occur;  typi‐
       cally one test case per host being operated on. Some of the more complex operations may have multiple test items per test case. Each test item represents a major step in the overall test case.

       Each  opahostadmin  run appends to test.res and test.log, and creates temporary files in test_tmp$PID in the current directory. test.res provides an overall summary of operations performed and their
       results. The same information is also displayed while opahostadmin is executing. test.log contains detailed information about what was performed, including the specific  commands  executed  and  the
       resulting  output.  The test_tmp directories contain temporary files which reflect tests in progress (or killed). The logs for any failures are logged in the save_temp directory with a directory per
       failed test case. If the same test case fails more than once, save_temp retains the information from the first failure. Subsequent runs of opahostadmin are appended  to  test.log.  Intel  recommends
       reviewing failures and using the -c option to remove old logs before subsequent runs of opahostadmin.

       opahostadmin  implicitly  performs  its  operations in parallel. However, as for the other tools, FF_MAX_PARALLEL can be exported to change the degree of parallelism. 1000 parallel operations is the
       default.

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts, used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       FF_MAX_PARALLEL
                 Maximum concurrent operations are performed.


       FF_SERIALIZE_OUTPUT
                 Serialize output of parallel operations (yes or no).


       FF_TIMEOUT_MULT
                 Multiplier for all timeouts associated with this command. Used if the systems are slow for some reason.



opahostadmin Operation Details
       (Host) Intel recommends that you set up password SSH or SCP for use during this operation. Alternatively, the -S option can be used to securely prompt for a password, in which case the same password
       is used for all hosts. Alternately, the password may be put in the environment or the opafastfabric.conf file using FF_PASSWORD and FF_ROOTPASS.

       load      Performs  an  initial  installation of Intel(R) Omni-Path Software on a group of hosts. Any existing installation is uninstalled and existing configuration files are removed. Subsequently,
                 the hosts are installed with a default Intel(R) Omni-Path Software configuration. The -I option can be used to select different install packages. Default is oftools ipoib mpi The -r option
                 can  be used to specify a release to install other than the one that this host is presently running. The  FF_PRODUCT. FF_PRODUCT_VERSION.tgz file (for example, IntelOPA-Basic. version.tgz)
                 is expected to exist in the directory specified by -d. Default is the current working directory. The specified software is copied to all the selected hosts and installed.


       upgrade   Upgrades all selected hosts without modifying existing configurations. This operation is comparable to the -U option when running ./INSTALL manually. The -r option can be used  to  upgrade
                 to  a  release different from this host. The default is to upgrade to the same release as this host. The  FF_PRODUCT. FF_PRODUCT_VERSION.tgz file (for example, IntelOPA-Basic. version.tgz)
                 is expected to exist in the directory specified by -d. The default is the current working directory. The specified software is copied to all the end nodes and installed.




       NOTE: Only components that are currently installed are upgraded. This operation fails for hosts that do not have Intel(R) Omni-Path Software installed.



       configipoib
                 Creates a ifcfg-ib1 configuration file for each node using the IP address found using the resolver on the node. The standard Linux* resolver is used through the host command.  (If  running
                 OFA Delta, this option configures ifcfg-ib0 .)


                 If  the host is not found, /etc/hosts on the node is checked. The -i option specifies an IPoIB suffix to apply to the host name to create the IPoIB host name for the node. The default suf‐
                 fix is -ib. The -m option specifies a netmask other than the default for the given class of IP address, such as when dividing a class A or B address into smaller IP subnets. IPoIB is  con‐
                 figured  for  a  static  IP  address and is autostarted at boot. For the Intel(R) OP Software Stack, the default /etc/ipoib.cfg file is used, which provides a redundant IPoIB configuration
                 using both ports of the first HFI in the system.




       NOTE: opahostadmin configipoib now supports DHCP (auto or static options) for configuring the IPoIB interface. You must specify these options in /etc/opa/opafastfabric.conf against the FF_IPOIB_CON‐
       FIG  variable.  If  no  options  are  found,  the static IP configuration is used by default. If auto is specified, then one IP address from either static or dhcp is chosen. Static is used if the IP
       address can be obtained out of /etc/hosts or the resolver, otherwise DHCP is used.



       reboot    Reboots the given hosts and ensures they go down and come back up by pinging them during the reboot process. The ping rate is slow (5 seconds), so if the servers  boot  faster  than  this,
                 false failures may be seen.


       sacache   Verifies  the given hosts can properly communicate with the SA and any cached SA data that is up to date. To run this command, Intel(R) Omni-Path Fabric software must be installed and run‐
                 ning on the given hosts. The subnet manager and switches must be up. If this test fails: opacmdall 'opasaquery -o desc' can be run against any problem hosts.





       NOTE: This operation requires that the hosts being queried are specified by a resolvable TCP/IP host name. This operation FAILS if the selected hosts are specified by IP address.



       ipoibping Verifies IPoIB basic operation by ensuring that the host can ping all other nodes through IPoIB. To run this command, Intel(R) Omni-Path Fabric software must be installed,  IPoIB  must  be
                 configured and running on the host, and the given hosts, the SM, and switches must be up. The -i option can specify an alternate IPoIB hostname suffix.


       mpiperf   Verifies that MPI is operational and checks MPI end-to-end latency and bandwidth between pairs of nodes (for example, 1-2, 3-4, 5-6). Use this to verify switch latency/hops, PCI bandwidth,
                 and overall MPI performance. The test.res file contains the results of each pair of nodes tested.





       NOTE: This option is available for the Intel(R) Omni-Path Fabric Host Software OFA Delta packaging, but is not presently available for other packagings of OFED.



              To obtain accurate results, this test should be run at a time when no other stressful applications (for example, MPI jobs or high stress file system  operations)  are  running  on  the  given
              hosts.

              Bandwidth  issues  typically  indicate  server  configuration issues (for example, incorrect slot used, incorrect BIOS settings, or incorrect HFI model), or fabric issues (for example, symbol
              errors, incorrect link width, or speed). Assuming opareport has previously been used to check for link errors and link speed issues, the server configuration should be verified.

              Note that BIOS settings and differences between server models can account for 10-20% differences in bandwidth. For more details about BIOS settings, consult the documentation from the  server
              supplier and/or the server PCI chipset manufacturer.

       mpiperfdeviation
                 Specifies  the  enhanced version of mpiperf that verifies MPI performance. Can be used to verify switch latency/hops, PCI bandwidth, and overall MPI performance. It performs assorted pair-
                 wise bandwidth and latency tests, and reports pairs outside an acceptable tolerance range. The tool identifies specific nodes that have problems and provides a concise summary of  results.
                 The test.res file contains the results of each pair of nodes tested.


                 By  default,  concurrent mode is used to quickly analyze the fabric and host performance. Pairs that have 20% less bandwidth or 50% more latency than the average pair are reported as fail‐
                 ures.

                 The tool can be run in a sequential or a concurrent mode. Sequential mode runs each host against a reference host. By default, the reference host is selected based on the best  performance
                 from  a  quick test of the first 40 hosts. In concurrent mode, hosts are paired up and all pairs are run concurrently. Since there may be fabric contention during such a run, any poor per‐
                 forming pairs are then rerun sequentially against the reference host.

                 Concurrent mode runs the tests in the shortest amount of time, however, the results could be slightly less accurate due to switch contention. In heavily oversubscribed fabric  designs,  if
                 concurrent mode is producing unexpectedly low performance, try sequential mode.




       NOTE: This option is available for the Intel(R) Omni-Path Fabric Host Software OFA Delta packaging, but is not presently available for other packagings of OFED.



              To obtain accurate results, this test should be run at a time when no other stressful applications (for example, MPI jobs, high stress file system operations) are running on the given hosts.

              Bandwidth  issues  typically  indicate  server  configuration issues (for example, incorrect slot used, incorrect BIOS settings, or incorrect HFI model), or fabric issues (for example, symbol
              errors, incorrect link width, or speed). Assuming opareport has previously been used to check for link errors and link speed issues, the server configuration should be verified.

              Note that BIOS settings and differences between server models can account for 10-20% differences in bandwidth. A result 5-10% below the average is typically not cause for serious  alarm,  but
              may reflect limitations in the server design or the chosen BIOS settings.

              For more details about BIOS settings, consult the documentation from the server supplier and/or the server PCI chipset manufacturer.

              The deviation application supports a number of parameters which allow for more precise control over the mode, benchmark and pass/fail criteria. The parameters to use can be selected using the
              FF_DEVIATION_ARGS configuration parameter in opafastfabric.conf

              Available parameters for deviation application:

              [-bwtol bwtol] [-bwdelta MBs] [-bwthres MBs]
              [-bwloop count] [-bwsize size] [-lattol latol]
              [-latdelta usec] [-latthres usec] [-latloop count]
              [-latsize size][-c] [-b] [-v] [-vv]
              [-h reference_host]





              -bwtol    Specifies the percent of bandwidth degradation allowed below average value.





              -bwbidir  Performs a bidirectional bandwidth test.





              -bwunidir Performs a unidirectional bandwidth test (Default).





              -bwdelta  Specifies the limit in MB/s of bandwidth degradation allowed below average value.





              -bwthres  Specifies the lower limit in MB/s of bandwidth allowed.





              -bwloop   Specifies the number of loops to execute each bandwidth test.





              -bwsize   Specifies the size of message to use for bandwidth test.





              -lattol   Specifies the percent of latency degradation allowed above average value.





              -latdelta Specifies the imit in &#181;sec of latency degradation allowed above average value.





              -latthres Specifies the lower limit in &#181;sec of latency allowed.





              -latloop  Specifies the number of loops to execute each latency test.





              -latsize  Specifies the size of message to use for latency test.





              -c        Runs test pairs concurrently instead of the default of sequential.





              -b        When comparing results against tolerance and delta, uses best instead of average.





              -v        Specifies the verbose output.





              -vv       Specifies the very verbose output.





              -h        Specifies the reference host to use for sequential pairing.



              Both bwtol and bwdelta must be exceeded to fail bandwidth test.

              When bwthres is supplied, bwtol and bwdelta are ignored.

              Both lattol and latdelta must be exceeded to fail latency test.

              When latthres is supplied, lattol and latdelta are ignored.

              For consistency with OSU benchmarks, MB/s is defined as 1000000 bytes/s.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opahostadmin(8)
