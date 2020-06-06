
opacaptureall(8)                                                                            IFSFFCLIRG (Man Page)                                                                            opacaptureall(8)



NAME
       opacaptureall



       (Chassis and Host) Captures supporting information for a problem report from all hosts or Intel(R) Omni-Path Chassis and uploads to this system.

       For Hosts: When a host opacaptureall is performed, opacapture is run to create the specified capture file within ~root on each host (with the .tgz suffix added as needed). The files are uploaded and
       unpacked into a matching directory name within upload_dir/hostname/ on the local system. The default file name is hostcapture.

       For Chassis: When a chassis opacaptureall is performed, opacapture is run on each chassis and its output is saved to upload_dir/chassisname/file on the local system. The default file name  is  chas‐
       siscapture.

       For both host and chassis capture, the uploaded captures are combined into a .tgz file with the file name specified and the suffix .all.tgz added.

Syntax
       opacaptureall [-C] [-p] [-f hostfile] [-F chassisfile] [-h 'hosts']
       [-H 'chassis'] [-t portsfile] [-d upload_dir] [-S] [-D detail_level]
       [ file]

Options
       --help    Produces full help text.


       -C        Performs capture against chassis. Default is hosts.


       -p        Performs capture upload in parallel on all host/chassis. For a host capture, this only affects the upload phase.


       -f hostfile
                 Specifies the file with hosts in cluster. Default is /etc/opa/hosts file.


       -F chassisfile
                 Specifies the file containing a list of chassis in the cluster. Default is /etc/opa/chassis file.


       -h hosts  Specifies the list of hosts on which to perform a capture.


       -H chassis
                 Specifies the list of chassis on which to perform a capture.


       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for switch access. Default is /etc/opa/ports file.


       -d upload_dir
                 Specifies the directory to upload to. Default is uploads. If not specified, the environment variable UPLOADS_DIR is used. If that is not exported, the default ./uploads is used.


       -S        Securely prompts for password for administrator on a chassis.


       -D detail_level
                 Specifies the level of detail of the capture passed to host opacapture. (Only used for host captures; ignored for chassis captures.)



                 1 (Local) Obtains local information from each host.




                 2 (Fabric)
                           In addition to Local, also obtains basic fabric information by queries to the SM and fabric error analysis using opareport.





                 3 (Fabric+FDB)
                           In addition to Fabric, also obtains the Forwarding Database (FDB), which includes the switch forwarding tables from the SM.





                 4 (Analysis)
                           In addition to Fabric+FDB, also obtains opaallanalysis results. If opaallanalysis has not yet been run, it is run as part of the capture.







       NOTE:  Detail  levels  2-4 can be used when fabric operational problems occur. If the problem is node-specific, detail level 1 should be sufficient. Detail levels 2-4 require an operational Intel(R)
       Omni-Path Fabric Suite Fabric Manager. Typically your support representative requests a given detail level. If a given detail level takes excessively long or fails to be gathered, try a lower detail
       level.


       For detail levels 2-4, the additional information is only gathered on the node running the opacaptureall command. The information is gathered for every fabric specified in the /etc/opa/ports file.


       file      Specifies the name for capture file. The suffix .tgz is appended if it is not specified in the name.


Examples
Host Capture Examples
       opacaptureall
       # Creates a hostcapture directory in upload_dir/hostname/ for each host
       in /etc/opa/hosts file, then creates hostcapture.all.tgz.

       opacaptureall mycapture
       # Creates a mycapture directory in upload_dir/hostname/ for each host
       in /etc/opa/hosts file, then creates mycapture.all.tgz.

       opacaptureall -h 'arwen elrond' 030127capture
       # Gets the list of hosts from arwen elrond file and creates
       030127capture.tgz file.


Chassis Capture Examples
       opacaptureall -C
       # Creates a chassiscapture file in upload_dir/chassisname/ for each
       chassis in /etc/opa/chassis file, then creates chassiscapture.all.tgz.

       opacaptureall -C mycapture
       # Creates a mycapture.tgz file in upload_dir/chassisname/ for each
       chassis in /etc/opa/chassis file, then creates mycapture.all.tgz.

       opacaptureall -C -H 'chassis1 chassis2' 030127capture
       # Captures from chassis1 and chassis2, and creates 030127capture.tgz file.

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts, used if -h option not supplied.


       CHASSIS   List of chassis, used if -C is used and -h option is not supplied.


       HOSTS_FILE
                 File containing a list of hosts, used in the absence of -f and -h.


       CHASSIS_FILE
                 File containing a list of chassis, used in the absence of -F and -H.


       UPLOADS_DIR
                 Directory to upload to, used in the absence of -d.


       FF_MAX_PARALLEL
                 When -p option is used, maximum concurrent operations are performed.


       FF_CHASSIS_LOGIN_METHOD
                 How to log into chassis. Can be Telnet or SSH.


       FF_CHASSIS_ADMIN_PASSWORD
                 Password for administrator on all chassis. Used in absence of -S option.


More Information
       When  performing  opacaptureall  against  hosts,  internally SSH is used. The command opacaptureall requires that password-less SSH be set up between the host running Intel(R) Omni-Path Fabric Suite
       FastFabric Toolset and the hosts opacaptureall is operating against. The opasetupssh command can aid in setting up password-less SSH.

       When performing operations against chassis, Intel recommends that you set up SSH keys using opasetupssh. If SSH keys are not set up, Intel recommends that all chassis be  configured  with  the  same
       admin password and that you use of the -S option to avoid keeping the password in configuration files.

       NOTE:  The  resulting  host  capture  files  can  require  significant  amounts of space on the Intel(R) Omni-Path Fabric Suite FastFabric Toolset host. Actual size varies, but sizes can be multiple
       megabytes per host. Intel recommends that you ensure adequate space is available on the Intel(R) Omni-Path Fabric Suite FastFabric Toolset system. In many cases, it  may  not  be  necessary  to  run
       opacaptureall against all hosts or chassis; instead, a representative subset may be sufficient. Consult with your support representative for further information.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                              opacaptureall(8)
