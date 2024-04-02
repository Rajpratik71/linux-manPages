ADCLI(8)                                                                                       System Commands                                                                                       ADCLI(8)



NAME
       adcli - Tool for performing actions on an Active Directory domain

SYNOPSIS
       adcli info domain.example.com

       adcli join domain.example.com

       adcli update

       adcli testjoin

       adcli create-user [--domain=domain.example.com] user

       adcli delete-user [--domain=domain.example.com] user

       adcli create-group [--domain=domain.example.com] user

       adcli delete-group [--domain=domain.example.com] user

       adcli add-member [--domain=domain.example.com] group user...

       adcli remove-member [--domain=domain.example.com] group user...

       adcli preset-computer [--domain=domain.example.com] computer...

       adcli reset-computer [--domain=domain.example.com] computer

       adcli delete-computer [--domain=domain.example.com] computer

GENERAL OVERVIEW
       adcli is a command line tool that can perform actions in an Active Directory domain. Among other things it can be used to join a computer to a domain.

       See the various sub commands below. The following global options can be used:

       -D, --domain=domain
           The domain to connect to. If a domain is not specified, then the domain part of the local computer's host name is used.

       -R, --domain-realm=REALM
           Kerberos realm for the domain. If not specified, then the upper cased domain name is used.

       -S, --domain-controller=server
           Connect to a specific domain controller. If not specified, then an appropriate domain controller is automatically discovered.

       -C, --login-ccache=ccache_name
           Use the specified kerberos credential cache to authenticate with the domain. If no credential cache is specified, the default kerberos credential cache will be used. Credential caches of type
           FILE can be given with the path to the file. For other credential cache types, e.g. DIR, KEYRING or KCM, the type must be specified explicitly together with a suitable identifier.

       -U, --login-user=User
           Use the specified user account to authenticate with the domain. If not specified, then the name 'Administrator' will be used.

       --no-password
           Don't show prompts for or read a password from input.

       -W, --prompt-password
           Prompt for a password if necessary. This is the default.

       --stdin-password
           Read a password from stdin input instead of prompting for a password.

       -v, --verbose
           Run in verbose mode with debug output.

QUERYING DOMAIN INFORMATION
       adcli info displays discovered information about an Active Directory domain or an Active Directory domain controller.

           $ adcli info domain.example.com
           ...

           $ adcli info --domain-controller=dc.domain.example.com
           ...

       adcli info will output as much information as it can about the domain. The information is designed to be both machine and human readable. The command will exit with a non-zero exit code if the
       domain does not exist or cannot be reached.

       To show domain info for a specific domain controller use the --domain-controller option to specify which domain controller to query.

       Use the --verbose option to show details of how the domain is discovered and queried. Many of the global options, in particular authentication options, are not usable with the adcli info command.

JOINING THE LOCAL MACHINE TO A DOMAIN
       adcli join creates a computer account in the domain for the local machine, and sets up a keytab for the machine. It does not configure an authentication service (such as sssd).

           $ adcli join domain.example.com
           Password for Administrator:

       In addition to the global options, you can specify the following options to control how this operation is done.

       -N, --computer-name=computer
           The short non-dotted name of the computer account that will be created in the domain. If not specified, then the first portion of the --host-fqdn is used.

       -O, --domain-ou=OU=xxx
           The full distinguished name of the OU in which to create the computer account. If not specified, then the computer account will be created in a default location.

       -H, --host-fqdn=host
           Override the local machine's fully qualified domain name. If not specified, the local machine's hostname will be retrieved via gethostname(). If gethostname() only returns a short name
           getaddrinfo() with the AI_CANONNAME hint is called to expand the name to a fully qualified domain name.

       -K, --host-keytab=/path/to/keytab
           Specify the path to the host keytab where host credentials will be written after a successful join operation. If not specified, the default location will be used, usually /etc/krb5.keytab.

       --login-type={computer|user}
           Specify the type of authentication that will be performed before creating the machine account in the domain. If set to 'computer', then the computer must already have a preset account in the
           domain. If not specified and none of the other --login-xxx arguments have been specified, then will try both 'computer' and 'user' authentication.

       --os-name=name
           Set the operating system name on the computer account. The default depends on where adcli was built, but is usually something like 'linux-gnu'.

       --os-service-pack=pack
           Set the operating system service pack on the computer account. Not set by default.

       --os-version=version
           Set the operating system version on the computer account. Not set by default.

       --service-name=service
           Additional service name for a kerberos principal to be created on the computer account. This option may be specified multiple times.

       --user-principal=host/name@REALM
           Set the userPrincipalName field of the computer account to this kerberos principal. If you omit the value for this option, then a principal will be set in the form of host/host.example.com@REALM

       --one-time-password
           Specify a one time password for a preset computer account. This is equivalent to using --login-type=computer and providing a password as input.

       --trusted-for-delegation=yes|no|true|false
           Set or unset the TRUSTED_FOR_DELEGATION flag in the userAccountControl attribute to allow or not allow that Kerberos tickets can be forwarded to the host.

       --add-service-principal=service/hostname
           Add a service principal name. In contrast to the --service-name the hostname part can be specified as well in case the service should be accessible with a different host name as well.

       --show-details
           After a successful join print out information about join operation. This is output in a format that should be both human and machine readable.

       --show-password
           After a successful join print out the computer machine account password. This is output in a format that should be both human and machine readable.

       --add-samba-data
           After a successful join add the domain SID and the machine account password to the Samba specific databases by calling Samba's net utility.

           Please note that Samba's net requires some settings in smb.conf to create the database entries correctly. Most important here is currently the workgroup option, see smb.conf(5) for details.

       --samba-data-tool=/path/to/net
           If Samba's net cannot be found at /usr/bin/net, this option can be used to specific an alternative location with the help of an absolute path.

UPDATING THE MACHINE ACCOUNT PASSWORD AND OTHER ATTRIBUTES
       adcli update updates the password of the computer account on the domain controller for the local machine, write the new keys to the keytab and removes older keys. It keeps the previous key on
       purpose because AD will need some time to replicate the new key to all DCs hence the previous key might still be used.

           $ adcli update

       If used with a credential cache, other attributes of the computer account can be changed as well if the principal has sufficient privileges.

           $ kinit Administrator
           $ adcli update --login-ccache=/tmp/krbcc_123

       In addition to the global options, you can specify the following options to control how this operation is done.

       -N, --computer-name=computer
           The short non-dotted name of the computer account that will be created in the domain. If not specified, it will be retrieved from the keytab entries.

       -H, --host-fqdn=host
           The local machine's fully qualified domain name. If not specified, the local machine's hostname will be retrieved from the keytab entries.

       -K, --host-keytab=/path/to/keytab
           Specify the path to the host keytab where current host credentials are stored and the new ones will be written to. If not specified, the default location will be used, usually /etc/krb5.keytab.

       --os-name=name
           Set the operating system name on the computer account. Not set by default.

       --os-service-pack=pack
           Set the operating system service pack on the computer account. Not set by default.

       --os-version=version
           Set the operating system version on the computer account. Not set by default.

       --service-name=service
           Additional service name for a Kerberos principal to be created on the computer account. This option may be specified multiple times.

       --user-principal=host/name@REALM
           Set the userPrincipalName field of the computer account to this Kerberos principal.

       --computer-password-lifetime=lifetime
           Only update the password of the computer account if it is older than the lifetime given in days. By default the password is updated if it is older than 30 days.

       --trusted-for-delegation=yes|no|true|false
           Set or unset the TRUSTED_FOR_DELEGATION flag in the userAccountControl attribute to allow or not allow that Kerberos tickets can be forwarded to the host.

       --add-service-principal=service/hostname
           Add a service principal name. In contrast to the --service-name the hostname part can be specified as well in case the service should be accessible with a different host name as well.

       --remove-service-principal=service/hostname
           Remove a service principal name from the keytab and the AD host object.

       --show-details
           After a successful join print out information about join operation. This is output in a format that should be both human and machine readable.

       --add-samba-data
           After a successful join add the domain SID and the machine account password to the Samba specific databases by calling Samba's net utility.

           Please note that Samba's net requires some settings in smb.conf to create the database entries correctly. Most important here is currently the workgroup option, see smb.conf(5) for details.

       --samba-data-tool=/path/to/net
           If Samba's net cannot be found at /usr/bin/net, this option can be used to specific an alternative location with the help of an absolute path.

TESTING IF THE MACHINE ACCOUNT PASSWORD IS VALID
       adcli testjoin uses the current credentials in the keytab and tries to authenticate with the machine account to the AD domain. If this works the machine account password and the join are still
       valid. If it fails the machine account password or the whole machine account have to be refreshed with adcli join or adcli update.

           $ adcli testjoin

       Only the global options not related to authentication are available, additionally you can specify the following options to control how this operation is done.

       -K, --host-keytab=/path/to/keytab
           Specify the path to the host keytab where current host credentials are stored and the new ones will be written to. If not specified, the default location will be used, usually /etc/krb5.keytab.

CREATING A USER
       adcli create-user creates a new user account in the domain.

           $ adcli create-user Fry --domain=domain.example.com \
                --display-name="Philip J. Fry" --mail=fry@domain.example.com

       In addition to the global options, you can specify the following options to control how the user is created.

       --display-name="Name"
           Set the displayName attribute of the new created user account.

       -O, --domain-ou=OU=xxx
           The full distinguished name of the OU in which to create the user account. If not specified, then the computer account will be created in a default location.

       --mail=email@domain.com
           Set the mail attribute of the new created user account. This attribute may be specified multiple times.

       --unix-home=/home/user
           Set the unixHomeDirectory attribute of the new created user account, which should be an absolute path to the user's home directory.

       --unix-gid=111
           Set the gidNumber attribute of the new created user account, which should be the user's numeric primary group id.

       --unix-shell=/bin/shell
           Set the loginShell attribute of the new created user account, which should be a path to a valid shell.

       --unix-uid=111
           Set the uidNumber attribute of the new created user account, which should be the user's numeric primary user id.

       --nis-domain=nis_domain
           Set the msSFU30NisDomain attribute of the new created user account, which should be the user's NIS domain is the NIS/YP service of Active Directory's Services for Unix (SFU) are used. This is
           needed to let the 'UNIX attributes' tab of older Active Directoy versions show the set UNIX specific attributes. If not specified adcli will try to determine the NIS domain automatically if
           needed.

DELETING A USER
       adcli delete-user deletes a user account from the domain.

           $ adcli delete-user Fry --domain=domain.example.com

       The various global options can be used.

CREATING A GROUP
       adcli create-group creates a new group in the domain.

           $ adcli create-group Pilots --domain=domain.example.com \
                --description="Group for all pilots"

       In addition to the global options, you can specify the following options to control how the group is created.

       --description="text"
           Set the description attribute of the new created group.

       -O, --domain-ou=OU=xxx
           The full distinguished name of the OU in which to create the group. If not specified, then the group will be created in a default location.

DELETING A GROUP
       adcli delete-group deletes a group from the domain.

           $ adcli delete-group Pilots --domain=domain.example.com

       The various global options can be used.

ADDING A MEMBER TO A GROUP
       adcli add-member adds one or more users to a group in the domain. The group is specified first, and then the various users to be added.

           $ adcli add-member --domain=domain.example.com Pilots Leela Scruffy

       The various global options can be used.

REMOVING A MEMBER FROM A GROUP
       adcli remove-member removes a user from a group in the domain. The group is specified first, and then the various users to be removed.

           $ adcli remove-member --domain=domain.example.com Pilots Scruffy

       The various global options can be used.

PRESET COMPUTER ACCOUNTS
       adcli preset-computer pre-creates one or more computer accounts in the domain for machines to later use when joining the domain. By doing this machines can join using a one time password or
       automatically without a password.

           $ adcli preset-computer --domain=domain.example.com \
                host1.example.com host2
           Password for Administrator:

       If the computer names specified contain dots, then they are treated as fully qualified host names, otherwise they are treated as short computer names. The computer accounts must not already exist.

       In addition to the global options, you can specify the following options to control how this operation is done.

       -O, --domain-ou=OU=xxx
           The full distinguished name of the OU in which to create the computer accounts. If not specified, then the computer account will be created in a default location.

       --one-time-password
           Specify a one time password to use when presetting the computer accounts. If not specified, then a default password will be used, which allows for later automatic joins.

       --os-name=name
           Set the operating system name on the computer account. The default depends on where adcli was built, but is usually something like 'linux-gnu'.

       --os-service-pack=pack
           Set the operating system service pack on the computer account. Not set by default.

       --os-version=version
           Set the operating system version on the computer account. Not set by default.

       --service-name=service
           Additional service name for a kerberos principal to be created on the computer account. This option may be specified multiple times.

       --user-principal
           Set the userPrincipalName field of the computer account to this kerberos principal in the form of host/host.example.com@REALM

RESET COMPUTER ACCOUNT
       adcli reset-computer resets a computer account in the domain. If the appropriate machine is currently joined to the domain, then its membership will be broken. The account must already exist.

           $ adcli reset-computer --domain=domain.example.com host2

       If the computer names specified contain dots, then they are treated as fully qualified host names, otherwise they are treated as short computer names.

       In addition to the global options, you can specify the following options to control how this operation is done.

       --login-type={computer|user}
           Specify the type of authentication that will be performed before creating the machine account in the domain. If set to 'computer', then the computer must already have a preset account in the
           domain. If not specified and none of the other --login-xxx arguments have been specified, then will try both 'computer' and 'user' authentication.

DELETE COMPUTER ACCOUNT
       adcli delete-computer deletes a computer account in the domain. The account must already exist.

           $ adcli delete-computer --domain=domain.example.com host2
           Password for Administrator:

       If the computer name contains a dot, then it is treated as fully qualified host name, otherwise it is treated as short computer name.

       If no computer name is specified, then the host name of the computer adcli is running on is used, as returned by gethostname().

       The various global options can be used.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker at https://bugs.freedesktop.org/enter_bug.cgi?product=realmd&component=adcli

SEE ALSO
       realmd(8), net(8), sssd(8)

       Further details available in the realmd online documentation at http://www.freedesktop.org/software/realmd/



realmd                                                                                                                                                                                               ADCLI(8)
