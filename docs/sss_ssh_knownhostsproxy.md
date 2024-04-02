SSS_SSH_KNOWNHOSTSPR(1)                                                                       SSSD Manual pages                                                                       SSS_SSH_KNOWNHOSTSPR(1)



NAME
       sss_ssh_knownhostsproxy - get OpenSSH host keys

SYNOPSIS
       sss_ssh_knownhostsproxy [options] HOST [PROXY_COMMAND]

DESCRIPTION
       sss_ssh_knownhostsproxy acquires SSH host public keys for host HOST, stores them in a custom OpenSSH known_hosts file (see the “SSH_KNOWN_HOSTS FILE FORMAT” section of sshd(8) for more information)
       /var/lib/sss/pubconf/known_hosts and establishes the connection to the host.

       If PROXY_COMMAND is specified, it is used to create the connection to the host instead of opening a socket.

       ssh(1) can be configured to use sss_ssh_knownhostsproxy for host key authentication by using the following directives for ssh(1) configuration:

           ProxyCommand /usr/bin/sss_ssh_knownhostsproxy -p %p %h
           GlobalKnownHostsFile /var/lib/sss/pubconf/known_hosts


OPTIONS
       -p,--port PORT
           Use port PORT to connect to the host. By default, port 22 is used.

       -d,--domain DOMAIN
           Search for host public keys in SSSD domain DOMAIN.

       -k,--pubkey
           Print the host ssh public keys for host HOST.

       -?,--help
           Display help message and exit.

EXIT STATUS
       In case of success, an exit value of 0 is returned. Otherwise, 1 is returned.

SEE ALSO
       sssd(8), sssd.conf(5), sssd-ldap(5), sssd-krb5(5), sssd-simple(5), sssd-ipa(5), sssd-ad(5), sssd-sudo(5),sssd-secrets(5),sssd-session-recording(5), sss_cache(8), sss_debuglevel(8), sss_groupadd(8),
       sss_groupdel(8), sss_groupshow(8), sss_groupmod(8), sss_useradd(8), sss_userdel(8), sss_usermod(8), sss_obfuscate(8), sss_seed(8), sssd_krb5_locator_plugin(8), sss_ssh_authorizedkeys(8),
       sss_ssh_knownhostsproxy(8),sssd-ifp(5),pam_sss(8).  sss_rpcidmapd(5)sssd-systemtap(5)

AUTHORS
       The SSSD upstream - https://pagure.io/SSSD/sssd/



SSSD                                                                                              08/12/2019                                                                          SSS_SSH_KNOWNHOSTSPR(1)
