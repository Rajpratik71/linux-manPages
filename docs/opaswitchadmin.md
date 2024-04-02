
opaswitchadmin(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaswitchadmin(8)



NAME
       opaswitchadmin



       (Switch)  Performs  a number of multi-step initialization and verification operations against one or more externally managed Intel(R) Omni-Path switches. The operations include initial switch setup,
       firmware upgrades, chassis reboot, and others.

Syntax
       opaswitchadmin [-c] [-N 'nodes'] [-L nodefile] [-O] [-P packages]
       [-a action] [-t portsfile] [-p ports] operation...

Options
       -help     Produces full help text.


       -c        Overwrites result files from any previous run before starting this run.


       -N nodes  Specifies the list of nodes to execute the operation against.


       -L nodefile
                 Specifies the file with nodes in the cluster. Default is /etc/opa/switches file.


       -P packages
                 For upgrades: Specifies the file name or directory where the firmware image is to install. For the directory specified, .emfw file in the directory tree is used. shell wild cards may  also
                 be used within quotes.


       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabrics for switch access. Default is /etc/opa/ports file.


       -p ports  Specifies the list of local HFI ports used to access fabrics for switch access.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



       -a action Specifies an action for firmware file for switch upgrade. The action argument can be one or more of the following:




                 select    Ensures firmware is in primary (Default).





                 run       Ensures firmware is in primary and running.



       -O        Specifies the override for firmware upgrades, bypasses the previous firmware version checks, and forces the update unconditionally.


       operation Performs the specified operation, which can be one or more of the following:




                 reboot    Reboots switches, ensures they go down and come back.





                 configure Runs wizard to set up switch configuration.





                 NOTE: You must reboot the switch for any new settings to be applied.





                 upgrade   Upgrades installation of all switches.





                 info      Reports firmware and hardware version, part number, and data rate capability of all nodes.





                 hwvpd     Completes hardware Vital Product Data (VPD) report of all nodes.





                 ping      Pings all nodes and tests for presence.





                 fwverify  Reports integrity of failsafe firmware of all nodes.





                 getconfig Gets port configurations of an externally managed switch.



       For more information on operations, see Operation Details

Example
       opaswitchadmin -c reboot
       opaswitchadmin -P /root/ChassisFw X.X.X.X.X upgrade
       opaswitchadmin -a run -P '*.emfw' upgrade

Environment Variables
       The following environment variables are also used by this command:

       OPASWITCHES
                 List of nodes, used in absence of -N and -L options.


       OPASWITCHES_FILE
                 File containing list of nodes, used in absence of -N and -L options.


       FF_MAX_PARALLEL
                 Maximum concurrent operations.


       FF_SERIALIZE_OUTPUT
                 Serialize output of parallel operations (yes or no).


       FF_TIMEOUT_MULT
                 Multiplier for all timeouts associated with this command. Used if the systems are slow for some reason.


Details
       opaswitchadmin provides detailed logging of its results. During each run, the following files are produced:

       ·      test.res : Appended with summary results of run.

       ·      test.log : Appended with detailed results of run.

       ·      save_tmp/ : Contains a directory per failed test with detailed logs.

       ·      test_tmp*/ : Intermediate result files while test is running.

       The -c option removes all log files.

       Results  from  opaswitchadmin  are grouped into test suites, test cases, and test items. A given run of opaswitchadmin represents a single test suite. Within a test suite, multiple test cases occur;
       typically one test case per chassis being operated on. Some of the more complex operations may have multiple test items per test case. Each test item represents a major  step  in  the  overall  test
       case.

       Each  opaswitchadmin  run appends to test.res and test.log and creates temporary files in test_tmp$PID in the current directory. the test.res file provides an overall summary of operations performed
       and their results. The same information is also displayed while opaswitchadmin is executing. test.log contains detailed information about what was performed, including the specific commands executed
       and  the  resulting output. The test_tmp directories contain temporary files that reflect tests in progress (or killed). The logs for any failures are logged in the save_temp directory with a direc‐
       tory per failed test case. If the same test case fails more than once, save_temp retains the information from the first failure. Subsequent runs of opaswitchadmin are  appended  to  test.log.  Intel
       recommends reviewing failures and using the -c option to remove old logs before subsequent runs of opaswitchadmin. opaswitchadmin also appends to punchlist.csv for failing switches.

       opaswitchadmin  implicitly  performs its operations in parallel. However, as for the other tools, FF_MAX_PARALLEL can be exported to change the degree of parallelism. 1000 parallel operations is the
       default.


Operation Details
       (Switch) All operations against Intel(R) Omni-Path Fabric externally-managed switches (except ping) securely access the selected switches. If a password has been set, the -S option must be  used  to
       securely prompt for a password. In this case, the same password is used for all switches.

       reboot    Reboots the given switches.


                 Use the FF_MAX_PARALLEL value to select either a rolling reboot or a parallel reboot. In most cases, a parallel reboot is recommended for expediency.

       upgrade   Upgrades  the  firmware on each specified switch. The -P option selects a directory containing a .emfw file or provides an explicit .emfw file for the switches. If more than one .emfw file
                 is specified, the operation is undefined. The -a option selects the desired minimal state for the new firmware. Only the select and run options are valid for this operation.


                 When the -a option specifies run, switches are rebooted. Use the FF_MAX_PARALLEL value to select a rolling upgrade or a parallel upgrade. In most cases, a parallel upgrade  is  recommended
                 for expediency.

                 The upgrade process also sets the switch name.

                 The  upgrade  process is used to set, clear, or change the password of the switches using the -s option. When this option is specified, you are prompted for a new password to be set on the
                 switches. To reset (clear) the password, press Enter when prompted. This option can be used to configure the switches to not require a password for subsequent operations. A change  to  the
                 password does not take effect until the next reboot of the switch.

                 For more information about switch firmware, refer to the Intel(R) Omni-Path Fabric Switches GUI User Guide

                 and Intel(R) Omni-Path Fabric Switches Release Notes


       configure Runs  the switch setup wizard, which asks a series of questions. Once the wizard has finished prompting for configuration information, all the selected switches are configured according to
                 the entered responses. The following items are configurable for all Intel(R) Omni-Path Switch 100 Series :



                 ·      FM Enabled

                 ·      Link CRC Mode

                 ·      Link Width Supported

                 ·      OPA Node Description






       NOTE: Typically, the Node Description is updated automatically during a firmware upgrade, if it is configured properly in the switches file. Updating the node description is also available using the
       configure option without performing a firmware upgrade.





       NOTE: You must reboot the switch for any new settings to be applied.


       info      Queries the switches and displays the following information:



                 ·      Firmware version

                 ·      Hardware version

                 ·      Hardware part number, including revision information

                 ·      Speed capability

                 ·      Fan status

                 ·      Power supply status



                 This operation also outputs a summary of various configuration settings for each switch within a fabric.

       hwvpd     Queries the switches and displays the Vital Product Data (VPD) including:



                 ·      Serial number

                 ·      Part number

                 ·      Model name

                 ·      Hardware version

                 ·      Manufacturer

                 ·      Product description

                 ·      Manufacturer ID

                 ·      Manufacture date

                 ·      Manufacture time



       ping      Issues an inband packet to the switches to test for presence and reports on presence/non-presence of each selected switch.





       NOTE: It is not necessary to supply a password (using -S) for this operation.


       fwverify  Verifies the integrity of the firmware images in the EEPROMs of the selected switches.


       getconfig Gets  port configurations of an externally managed switch. This operation also outputs a summary of various configuration settings for each switch within a fabric. For example, in a fabric
                 with seven switches, a report similar to the following is displayed.


                 This summary helps determine if all switches have the same configuration, and if not, indicates how many have each value. If some of the values are not as expected, view the test.res  file
                 to identify which switches have the undesirable values.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaswitchadmin(8)
