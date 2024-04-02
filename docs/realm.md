REALM(8)                                                           User Commands                                                          REALM(8)

NAME
       realm - Manage enrollment in realms

SYNOPSIS
       realm discover [realm-name]

       realm join [-U user] [realm-name]

       realm leave [-U user] [realm-name]

       realm list

       realm permit [-ax] [-R realm] {user@domain...}

       realm deny -a [-R realm]

DESCRIPTION
       realm is a command line tool that can be used to manage enrollment in kerberos realms, like Active Directory domains or IPA domains.

       See the various sub commands below. The following global options can be used:

       --install=/path
           Run in install mode. This makes realmd chroot into the specified directory and place files in appropriate locations for use during an
           installer. No packages will be installed or services will be started when running in this mode.

       --unattended
           Run in unattended mode without prompting for input.

       --verbose, -v
           Display verbose diagnostics while doing running commands.

DISCOVER
       Discover a realm and its capabilities.

           $ realm discover

           $ realm discover domain.example.com

       After discovering a realm, its name, type and capabilities are displayed.

       If no domain is specified, then the domain assigned through DHCP is used as a default.

       The following options can be used:

       --all
           Show all discovered realms (in various configurations).

       --client-software=xxx
           Only discover realms for which we can use the given client software. Possible values include sssd or winbind.

       --server-software=xxx
           Only discover realms which run the given server software. Possible values include active-directory or ipa.

       --membership-software=xxx
           Only discover realms for which the given membership software can be used to subsequently perform enrollment. Possible values include
           samba or adcli.

JOIN
       Configure the local machine for use with a realm.

           $ realm join domain.example.com

           $ realm join --user=admin --computer-ou=OU=Special domain.example.com

       The realm is first discovered, as we would with the discover command. If no domain is specified, then the domain assigned through DHCP is
       used as a default.

       After a successful join, the computer will be in a state where it is able to resolve remote user and group names from the realm. For
       kerberos realms, a computer account and host keytab is created.

       Joining arbitrary kerberos realms is not supported. The realm must have a supported mechanism for joining from a client machine, such as
       Active Directory or IPA.

       If the domain has been preconfigured, and unless --user is explicitly specified, an automatic join is attempted first.

       Note that the --user, --no-password, and --one-time-password options are mutually exclusive. At most one of them can be specified.

       It is generally possible to use kerberos credentials to perform a join operation. Use the kinit command to acquire credentials prior to
       starting the join. Do not specify the --user argument, the user will be selected automatically from the credential cache. The realm
       respects the KRB5_CCACHE environment variable, but uses the default kerberos credential cache if it's not present. Not all types of servers
       can be joined using kerberos credentials, some (like IPA) insist on prompting for a password.

       The following options can be used:

       --automatic-id-mapping=no
           Do not perform UID/GID mapping for users and groups, but expect these identifiers to be present in the domain already.

       --user=xxx
           The user name to be used to authenticate with when joining the machine to the realm. You will be prompted for a password.

       --computer-ou=OU=xxx
           The distinguished name of an organizational unit to create the computer account. The exact format of the distinguished name depends on
           the client software and membership software. You can usually omit the root DSE portion of distinguished name. This is an Active
           Directory specific option.

       --no-password
           Perform the join automatically without a password.

       --one-time-password=xxxx
           Perform the join using a one time password specified on the command line. This is not possible with all types of realms.

       --client-software=xxx
           Only join realms for which we can use the given client software. Possible values include sssd or winbind. Not all values are supported
           for all realms. By default the client software is automatically selected.

       --server-software=xxx
           Only join realms for run the given server software. Possible values include active-directory or ipa.

       --membership-software=xxx
           The software to use when joining to the realm. Possible values include samba or adcli. Not all values are supported for all realms. By
           default the membership software is automatically selected.

       --user-principal=host/name@REALM
           Set the userPrincipalName field of the computer account to this kerberos principal. If you omit the value for this option, then a
           principal will be set in the form of host/shortname@REALM

LEAVE
       Deconfigure the local machine for use with a realm.

           $ realm leave

           $ realm leave domain.example.com

       If no realm name is specified, then the first configured realm will be used.

       The following options can be used:

       --client-software=xxx
           Only leave the realm which is using the given client software. Possible values include sssd or winbind.

       --server-software=xxx
           Only leave the realm which is using the given server software. Possible values include active-directory or ipa.

       --remove
           Remove or disable computer account from the directory while leaving the realm. This will usually prompt for a pasword.

       --user
           The user name to be used to authenticate with when leaving the realm. You will be prompted for a password. Implies --remove.

LIST
       List all the discovered and configured realms.

           $ realm list

       By default, realms that have been discovered, but not configured (using the join command), are not displayed. Also, by default, the list of
       realm details displayed is verbose. The options below can be used to change this default behavior

       The following options can be used:

       --all
           Show all discovered realms (whether or not they have been configured).

       --name-only
           Display only realm names (as opposed to verbose output).

PERMIT
       Permit local login by users of the realm.

           $ realm permit --all
           $ realm permit user@example.com
           $ realm permit DOMAIN\\User2
           $ realm permit --withdraw user@example.com

       The current login policy and format of the user names can be seen by using the realm list command.

       The following options can be used:

       --all, -a
           Permit logins using realm accounts on the local machine according to the realm policy.This usually defaults to allowing any realm user
           to log in.

       --groups, -g
           Treat the specified names as groups rather than user login names. Permit login by users in the specified groups.

       --realm, -R
           Specify the of the realm to change login policy for.

       --withdraw, -x
           Remove a login from the list of realm accounts permitted to log into the machine.

DENY
       Deny local login by realm accounts.

           $ realm deny --all

       This command prevents realm accounts from logging into the local machine. Use realm permit to restrict logins to specific accounts.

       The following options can be used:

       --all, -a
           This option should be specified

       --realm, -R
           Specify the name of the realm to deny users login to.

AUTHOR
       Stef Walter <stef@thewalter.net>
           Maintainer

realmd                                                              01/27/2016                                                            REALM(8)
