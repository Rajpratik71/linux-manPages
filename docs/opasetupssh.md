
opasetupssh(8)                                                                              IFSFFCLIRG (Man Page)                                                                              opasetupssh(8)



NAME
       opasetupssh



       (Linux  or Switch) Creates SSH keys and configures them on all hosts or chassis so the system can use SSH and SCP into all other hosts or chassis without a password prompt. Typically, during cluster
       setup this tool enables the root user on the Management Node to log into the other hosts (as root) or chassis (as admin) using password-less SSH.

Syntax
       opasetupssh [-C|p|U] [-f hostfile] [-F chassisfile] [-h 'hosts']
       [-H 'chassis'] [-i ipoib_suffix] [-u user] [-S] [-R|P]

Options
       --help    Produces full help text.


       -C        Performs operation against chassis. Default is hosts.


       -p        Performs operation against all chassis or hosts in parallel.


       -U        Performs connect only (to enter in local hosts, known hosts). When run in this mode, the -S option is ignored.


       -f hostfile
                 Specifies the file with hosts in cluster.
                 Default is /etc/opa/hosts file.


       -F chassisfile
                 Specifies the file with chassis in cluster.
                 Default is /etc/opa/chassis file.


       -h hosts  Specifies the list of hosts to set up.


       -H chassis
                 Specifies the list of chassis to set up.


       -i ipoib_suffix
                 Specifies the suffix to apply to host names to create IPoIB host names. Default is -opa.


       -u user   Specifies the user on remote system to allow this user to SSH to. Default is current user code for host(s) and admin for chassis.


       -S        Securely prompts for password for user on remote system.


       -R        Skips setup of SSH to local host.


       -P        Skips ping of host (for SSH to devices on Internet with ping
                 firewalled).


Examples
Operations on Hosts
       opasetupssh -S -i ''
       opasetupssh -U
       opasetupssh -h 'arwen elrond' -U
       HOSTS='arwen elrond' opasetupssh -U


Operations on Chassis
       opasetupssh -C
       opasetupssh -C -H 'chassis1 chassis2'
       CHASSIS='chassis1 chassis2' opasetupssh -C

Environment Variables
       The following environment variables are also used by this command:

       HOSTS_FILE
                 File containing list of hosts, used in absence of -f and -h.


       CHASSIS_FILE
                 File containing list of chassis, used in absence of -F and -H.


       HOSTS     List of hosts, used if -h option not supplied.


       CHASSIS   List of chassis, used if -C is used and -H and -F options not supplied.


       FF_MAX_PARALLEL
                 When -p option is used, maximum concurrent operations.


       FF_IPOIB_SUFFIX
                 Suffix to append to hostname to create IPoIB hostname. Used in absence of -i.


       FF_CHASSIS_LOGIN_METHOD
                 How to log into chassis. Can be Telnet or SSH.


       FF_CHASSIS_ADMIN_PASSWORD
                 Password for admin on all chassis. Used in absence of -S option.


Description
       The Intel(R) Omni-Path Fabric Suite FastFabric Toolset provides additional flexibility in the translation between IPoIB and management network hostnames.

       opasetupssh provides an easy way to create SSH keys and distribute them to the hosts or chassis in the cluster. Many of the FastFabric tools (as well as many versions of MPI) require that SSH is set
       up for password-less operation. Therefore, opasetupssh is an important setup step.

       This tool also sets up SSH to the local host and the local host's IPoIB name. This capability is required by selected FastFabric Toolset commands and may be used by some applications (such as MPI).

       opasetupssh has two modes of operation. The mode is selected by the presence or absence of the -U option. Typically, opasetupssh is first run without the -U option, then it may later be run with the
       -U option.

Host Initial Key Exchange
       When run without the -U option, opasetupssh performs the initial key exchange and enables password-less SSH and SCP. The preferred way to use opasetupssh for initial key  exchange  is  with  the  -S
       option. This requires that all hosts are configured with the same password for the specified "user" (typically root). In this mode, the password is prompted for once and then SSH and SCP are used in
       conjunction with that password to complete the setup for the hosts. This mode also avoids the need to set up rsh/rcp/rlogin (which can be a security risk).

       opasetupssh configures password-less SSH/SCP for both the management network and IPoIB. Typically, the management network is used for FastFabric Toolset operations while IPoIB is used  for  MPI  and
       other applications.

       During  initial cluster installation, where the Intel(R) Omni-Path Fabric software is not yet installed on all the hosts, IPoIB is not yet running. In this situation, use the -i option with an empty
       string as follows:

       opasetupssh -i ''



       This causes the last part of the setup of SSH for IPoIB to be skipped.

Refreshing Local Systems Known Hosts
       If aspects of the host have changed, such as IP addresses, MAC addresses, software installation, or server OS reinstallation, you can refresh the local host's SSH known_hosts file by running  opase‐
       tupssh  with the -U option. This option does not transfer the keys, but instead connects to each host (management network and IPoIB) to refresh the SSH keys. Existing entries for the specified hosts
       are replaced within the local known_hosts file. When run in this mode, the -S option is ignored. This mode assumes SSH has previously been set up for the hosts, as such no files are  transferred  to
       the specified hosts and no passwords should be required.

       Typically after completing the installation and booting of Intel(R) Omni-Path Fabric software, opasetupssh must be rerun with the -U option to update the known_hosts file.

Chassis Initial Key Exchange
       When  run  without the -U option, opasetupssh performs the initial key exchange and enables password-less SSH and SCP. For chassis, the key exchange uses SCP and the chassis CLI. During this command
       you log into the chassis using the configured mechanism for chassis login.

       The preferred way to use opasetupssh for initial key exchange is with the -S option. This requires that all chassis are configured with the same password for admin. In this mode,  you  are  prompted
       for  the  password  once  and then the FF_CHASSIS_LOGIN_METHOD and SCP are used in conjunction with that password to complete the setup for the chassis. This method also avoids the need to setup the
       chassis password in /etc/opa/opafastfabric.conf (which can be a security risk).

       For chassis, the -i option is ignored.

Chassis Refreshing Local Systems Known Hosts
       If aspects of the chassis have changed, such as IP addresses or MAC addresses, you can refresh the local host's SSH known_hosts file by running opasetupssh with the -U option. This option  does  not
       transfer the keys, but instead connects to each chassis to refresh the SSH keys. Existing entries for the specified chassis are replaced within the local known_hosts file. When run in this mode, the
       -S option is ignored. This mode assumes SSH has previously been set up for the chassis, because no files are transferred to the specified hosts and no passwords are required.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opasetupssh(8)
