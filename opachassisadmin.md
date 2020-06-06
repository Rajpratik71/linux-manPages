
opachassisadmin(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opachassisadmin(8)



NAME
       opachassisadmin



       (Switch) Performs a number of multi-step chassis initialization and verification operations, including initial chassis setup, firmware upgrades, chassis reboot, and others.

Syntax
       opachassisadmin [-c] [-F chassisfile] [-H 'chassis'] [-P packages]
       [-a action] [-I fm_bootstate] [-S] [-d upload_dir] [-s securityfiles]
       operation...

Options
       --help    Produces full help text.


       -c        Overwrites the result files from any previous run before starting this run.


       -F chassisfile
                 Specifies the file with chassis in cluster. The default is /etc/opa/chassis.


       -H chassis
                 Specifies the list of chassis to execute the operation against.


       -P packages
                 Specifies the filenames and directories of firmware images to install.



                 ·      For directories specified, all .pkg, .dpkg, and .spkg files in directory tree are used. shell wild cards may also be used within quotes.

                 ·      For fmconfig, filename of FM config file is used.

                 ·      For fmgetconfig, filename to upload to is used. Default opafm.xml.



       -a action Specifies the action for the supplied file. The default is push.



                 For chassis upgrade:




                           push      Ensures firmware is in primary or alternate.





                           select    Ensures firmware is in primary.





                           run       Ensures firmware is in primary and running.







                 For chassis fmconfig :




                           push      Ensures the configuration file is in chassis.





                           run       After push, restarts FM on master, stops on secondary.





                           runall    After push, restarts FM on all management modules.






                 For chassis fmcontrol :




                           stop      Stops FM on all management modules.





                           run       Ensures FM running on master, stopped on secondary.





                           runall    Ensures FM running on all management modules.





                           restart   Restarts FM on master, stops on secondary.





                           restartall
                                     Restarts FM on all MM.






                 For chassis fmsecurityfiles :




                           push      Ensures FM security files are in chassis.





                           restart   After push, restarts FM on master, stop on slave.





                           restartall
                                     After push, restarts FM on all MM




       -I fm_bootstate
                 Specifies the fmconfig and fmcontrol install options.



                 disable   Disables FM start at chassis boot.





                 enable    Enables FM start on master at chassis boot.





                 enableall Enables FM start on all MM at chassis boot.




       -d upload_dir
                 Specifies the directory to upload FM configuration files to. Default is uploads.


       -S        Securely prompts for password for user on chassis.


       -s securityFiles
                 Specifies the security files to install. Default is *.pem. For Chassis fmsecurityfiles, filenames/directories of security files to install. For directories specified, all security files in
                 directory tree are used. Shell wildcards may also be used within quotes.


                 For Chassis fmgetsecurityfiles, filename to upload to. Default is *.pem

       operation Specifies the operation to perform. Can be one or more of:



                 reboot    Reboots chassis, ensures they go down and come back.





                 configure Runs wizard to perform chassis configuration.





                 upgrade   Upgrades install of all chassis.





                 getconfig Gets basic configuration of chassis.





                 fmconfig  FM configuration operation on all chassis.





                 fmgetconfig
                           Fetches FM configuration from all chassis.





                 fmcontrol Controls FM on all chassis.





                 fmsecurityfiles
                           FM security files operation on all chassis.





                 fmgetsecurityfiles
                           Fetches FM security files from all chassis.


       For more information on the operations that can be performed, see Operation Details


Example
       opachassisadmin -c reboot
       opachassisadmin -P /root/ChassisFw4.2.0.0.1 upgrade
       opachassisadmin -H 'chassis1 chassis2' reboot
       CHASSIS='chassis1 chassis2' opachassis_admin reboot
       opachassisadmin -a run -P '*.pkg' upgrade

Environment Variables
       The following environment variables are also used by this command:

       CHASSIS   List of chassis, used if -H and -F option not supplied.


       CHASSIS_FILE
                 File containing list of chassis, used in absence of -F and -H.


       FF_MAX_PARALLEL
                 Maximum concurrent operations.


       FF_SERIALIZE_OUTPUT
                 Serializes output of parallel operations (yes or no).


       FF_TIMEOUT_MULT
                 Multiplier for all timeouts associated with this command. Used if the systems are slow for some reason.


       UPLOADS_DIR
                 Directory to upload to, used in absence of -d.



Operation Details
       (Switch) All chassis operations log into the chassis as chassis user admin. Intel recommends using the -S option to securely prompt for a password, in which case the same password is  used  for  all
       chassis. Alternately, the password may be put in the environment or the opafastfabric.conf file using FF_CHASSIS_ADMIN_PASSWORD.

       All  versions  of  Intel(R)  Omni-Path  Switch  100  Series firmware permit SSH keys to be configured within the chassis for secure password-less login. In this case, there is no need to configure a
       FF_CHASSIS_ADMIN_PASSWORD ; and, FF_CHASSIS_LOGIN_METHOD can be SSH. Refer to the Intel(R) Omni-Path Fabric Suite FastFabric User Guide

        for more information.

       upgrade   Upgrades the firmware on each chassis or slot specified. The -P option selects a directory containing .pkg files or provides an explicit list of .pkg files for the  chassis  and/or  slots.
                 The -a option selects the desired minimal state for the new firmware. For each chassis and/or slot selected for upgrade, the .pkg file applicable to that slot is selected and used. If more
                 than one .pkg file is specified of a given card type, the operation is undefined.


                 The upgrade is intelligent and does not upgrade chassis that already have the desired firmware in the desired state (as specified by -a).

                 When the -a option specifies run, chassis that are not already running the desired firmware are rebooted. By selecting the proper FF_MAX_PARALLEL value, a rolling  upgrade  or  a  parallel
                 upgrade may be accomplished. In most cases, a parallel upgrade is recommended for expediency.

                 For more information about chassis firmware, refer to the Intel(R) Omni-Path Fabric Switches GUI User Guide

                 and Intel(R) Omni-Path Fabric Switches Release Notes


       configure Runs  the  chassis setup wizard, which asks a series of questions. Once the wizard has finished prompting for configuration information, all the selected chassis are configured through the
                 CLI interface according to the responses. The following options may be configured for all chassis:



                 ·      Syslog server IP address, TCP/UDP port number, syslog facility code, and the chassis LogMode.


                 ·      NTP server


                 ·      Local time zone


                 ·      Link CRC Mode


                 ·      Link width supported


                 ·      Node description




       reboot    Reboots the given chassis and ensures they go down and come back up by pinging them during the reboot process.


                 By selecting the proper FF_MAX_PARALLEL value, a rolling reboot or a parallel reboot may be accomplished. In most cases, a parallel upgrade is recommended for expediency.

       getconfig Retrieves basic information from a chassis such as syslog, NTP configuration, timezone info, Link CRC Mode, Link Width, and node description.


       fmconfig  Updates the Fabric Manager configuration file on each chassis specified. The -P option selects a file to transfer to the chassis. The -a option selects the desired minimal  state  for  the
                 new configuration and controls whether the FM is started/restarted after the file is updated. The -I option can be used to configure the FM start at boot for the selected chassis.


       fmgetconfig
                 Uploads  the  FM  configuration  file from all selected chassis. The file is uploaded to the selected uploads directory. The -P option specifies the desired destination filename within the
                 uploads directory.


       fmcontrol Allows the FM to be controlled on each chassis specified. The -a option selects the desired state for the FM.


                 The -I option configures the FM start at boot for the selected chassis.

       fmsecurityfiles
                 Updates the FM security files on each chassis specified. The -s option selects file(s) to transfer to the chassis. The -a option selects the desired minimal  state  for  the  new  security
                 files. In this release, push is the only supported action.


       fmgetsecurityfiles
                 Uploads  the  FM  security  files  from  all selected chassis. The files are uploaded to the selected uploads directory. The -s option specifies the desired destination filename within the
                 uploads directory.


Logging
       opachassisadmin provides detailed logging of its results. During each run, the following files are produced:

       test.res  This file is appended with summary results of run.


       test.log  This file is appended with detailed results of run.


       save_tmp/ This file is contains a directory per failed test with detailed logs.


       test_tmp*/
                 This file contains the intermediate results while the test is running.


       The -c option removes all log files.

ssh Keys
       When performing operations against chassis, Intel recommends setting up SSH keys. If SSH keys are not set up, all chassis must be configured with the same admin password. In this case, Intel  recom‐
       mends using the -S option. The -S option avoids the need to keep the password in configuration files.

Results
       Results  from opachassisadmin are grouped into test suites, test cases, and test items. A given run of opachassisadmin represents a single test suite. Within a test suite, multiple test cases occur;
       typically one test case per chassis being operated on. Some of the more complex operations may have multiple test items per test case. Each test item represents a major  step  in  the  overall  test
       case.

       Each opachassisadmin run appends to test.res and test.log, and creates temporary files in test_tmp$PID in the current directory. The test.res file provides an overall summary of operations performed
       and their results. The same information is also displayed while opachassisadmin is executing. test.log contains detailed information about what was performed, including the  specific  commands  exe‐
       cuted  and  the  resulting output. The test_tmp directories contain temporary files that reflect tests in progress (or killed). The logs for any failures are logged in the save_temp directory with a
       directory per failed test case. If the same test case fails more than once, save_temp retains the information from the first failure. Subsequent runs of opachassisadmin  are  appended  to  test.log.
       Intel recommends reviewing failures and using the -c option to remove old logs before subsequent runs of opachassisadmin.

       opachassisadmin  implicitly performs its operations in parallel. However, as for the other tools, FF_MAX_PARALLEL can be exported to change the degree of parallelism. 1000 parallel operations is the
       default.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opachassisadmin(8)
