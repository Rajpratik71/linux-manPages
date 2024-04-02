SSS_CACHE(8)                                                                                  SSSD Manual pages                                                                                  SSS_CACHE(8)



NAME
       sss_cache - perform cache cleanup

SYNOPSIS
       sss_cache [options]

DESCRIPTION
       sss_cache invalidates records in SSSD cache. Invalidated records are forced to be reloaded from server as soon as related SSSD backend is online. Options that invalidate a single object only accept
       a single provided argument.

OPTIONS
       -E,--everything
           Invalidate all cached entries.

       -u,--user login
           Invalidate specific user.

       -U,--users
           Invalidate all user records. This option overrides invalidation of specific user if it was also set.

       -g,--group group
           Invalidate specific group.

       -G,--groups
           Invalidate all group records. This option overrides invalidation of specific group if it was also set.

       -n,--netgroup netgroup
           Invalidate specific netgroup.

       -N,--netgroups
           Invalidate all netgroup records. This option overrides invalidation of specific netgroup if it was also set.

       -s,--service service
           Invalidate specific service.

       -S,--services
           Invalidate all service records. This option overrides invalidation of specific service if it was also set.

       -a,--autofs-map autofs-map
           Invalidate specific autofs maps.

       -A,--autofs-maps
           Invalidate all autofs maps. This option overrides invalidation of specific map if it was also set.

       -h,--ssh-host hostname
           Invalidate SSH public keys of a specific host.

       -H,--ssh-hosts
           Invalidate SSH public keys of all hosts. This option overrides invalidation of SSH public keys of specific host if it was also set.

       -r,--sudo-rule rule
           Invalidate particular sudo rule.

       -R,--sudo-rules
           Invalidate all cached sudo rules. This option overrides invalidation of specific sudo rule if it was also set.

       -d,--domain domain
           Restrict invalidation process only to a particular domain.

       -?,--help
           Display help message and exit.

SEE ALSO
       sssd(8), sssd.conf(5), sssd-ldap(5), sssd-krb5(5), sssd-simple(5), sssd-ipa(5), sssd-ad(5), sssd-sudo(5),sssd-secrets(5),sssd-session-recording(5), sss_cache(8), sss_debuglevel(8), sss_groupadd(8),
       sss_groupdel(8), sss_groupshow(8), sss_groupmod(8), sss_useradd(8), sss_userdel(8), sss_usermod(8), sss_obfuscate(8), sss_seed(8), sssd_krb5_locator_plugin(8), sss_ssh_authorizedkeys(8),
       sss_ssh_knownhostsproxy(8),sssd-ifp(5),pam_sss(8).  sss_rpcidmapd(5)sssd-systemtap(5)

AUTHORS
       The SSSD upstream - https://pagure.io/SSSD/sssd/



SSSD                                                                                              08/12/2019                                                                                     SSS_CACHE(8)
