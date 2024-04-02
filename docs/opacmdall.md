
opacmdall(8)                                                                                IFSFFCLIRG (Man Page)                                                                                opacmdall(8)



NAME
       opacmdall



       (Linux  and Switch) Executes a command on all hosts or Intel(R) Omni-Path Chassis. This powerful command can be used for configuring servers or chassis, verifying that they are running, starting and
       stopping host processes, and other tasks.

       NOTE: opacmdall depends on the Linux* convention that utilities return 0 for success and >0 for failure. If opacmdall is used to execute a non-standard utility like diff or a program that uses  cus‐
       tom  exit  codes,  then  opacmdall  may erroneously report "Command execution FAILED" when it encounters a non-zero exit code. However, command output is still returned normally and the error may be
       safely ignored.


Syntax
       opacmdall [-CpqPS] [-f hostfile] [-F chassisfile] [-h hosts]
       [-H chassis] [-u user] [-m marker] [-T timelimit] cmd

Options
       --help    Produces full help text.


       -C        Performs command against chassis. Default is hosts.


       -p        Runs command in parallel on all hosts/chassis.


       -q        Quiet mode, do not show command to execute.


       -P        Outputs the hostname/chassis name as prefix to each output line. This can make script processing of output easier.


       -S        Securely prompts for password for user on chassis.


       -f hostfile
                 Specifies the file with hosts in cluster. Default is /etc/opa/hosts file.


       -F chassisfile
                 Specifies the file with chassis in cluster. Default is /etc/opa/chassis file.


       -h host   Specifies the list of hosts to execute command on.


       -H chassis
                 Specifies the list of chassis to execute command on.


       -u user   Specifies the user to perform the command as:


                 ·      For hosts, the default is current user code.

                 ·      For chassis, the default is admin.




       -m marker Specifies the marker for end of chassis command output. If omitted, defaults to chassis command prompt. This may be a regular expression.


       -T timelimit
                 Specifies the time limit in seconds when running host commands. Default is -1 (infinite).


Examples
Operations on Host
       opacmdall date
       opacmdall 'uname -a'
       opacmdall -h 'elrond arwen' date
       HOSTS='elrond arwen' opacmdall date


Operations on Chassis
       opacmdall -C 'ismPortStats -noprompt'
       opacmdall -C -H 'chassis1 chassis2' ismPortStats -noprompt'
       CHASSIS='chassis1 chassis2' opacmdall -C ismPortStats -noprompt'

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts, used if -h option not supplied.


       CHASSIS   List of chassis, used if -C is used and -H and -F options not supplied.


       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       CHASSIS_FILE
                 File containing list of chassis, used in absence of -F and -H.


       FF_MAX_PARALLEL
                 When -p option is used, maximum concurrent operations are performed.


       FF_SERIALIZE_OUTPUT
                 Serialize output of parallel operations (yes or no).


       FF_CHASSIS_LOGIN_METHOD
                 How to log into chassis. Can be Telnet or SSH.


       FF_CHASSIS_ADMIN_PASSWORD
                 Password for admin on all chassis. Used in absence of -S option.


Notes
       All commands performed with opacmdall must be non-interactive in nature. opacmdall waits for the command to complete before proceeding. For example, when running host commands such  as  rm,  the  -i
       option  (interactively  prompt before removal) should not be used. (Note that this option is sometimes part of a standard bash alias list.) Similarly, when running chassis commands such as fwUpdate‐
       Chassis, the -reboot option should not be used because this option causes an immediate reboot and therefore the command never returns. Also, the chassis command reboot should not be  executed  using
       opacmdall.  Instead,  use  the  opachassisadmin  reboot  command  to  reboot one or more chassis. For further information about individual chassis CLI commands, consult the Intel(R) Omni-Path Fabric
       Switches Command Line Interface Reference Guide


       When performing opacmdall against hosts, internally SSH is used. The command opacmdall requires that password-less SSH be set up between the host running the Intel(R) Omni-Path Fabric Suite FastFab‐
       ric Toolset and the hosts opacmdall is operating against. The opasetupssh FastFabric tool can aid in setting up password-less SSH.

       When  performing  opacmdall  against a set of chassis, all chassis must be configured with the same admin password. Alternatively, the opasetupssh FastFabric tool can be used to set up password-less
       SSH to the chassis.

       When performing operations against chassis, Intel recommends that you set up SSH keys using opasetupssh. If SSH keys are not set up, Intel recommends that you use the -S option to avoid keeping  the
       password in configuration files.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                  opacmdall(8)
