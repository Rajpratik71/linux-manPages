AUTHCONFIG(8)                                                                              System Manager's Manual                                                                              AUTHCONFIG(8)



NAME
       authconfig, authconfig-tui - an interface for configuring system authentication resources

SYNOPSIS
       authconfig
              [options] {--update|--updateall|--test|--probe|--restorebackup <name>|--savebackup <name>|--restorelastbackup}

DESCRIPTION
       authconfig  provides a simple method of configuring /etc/sysconfig/network to handle NIS, as well as /etc/passwd and /etc/shadow, the files used for shadow password support.  Basic LDAP, Kerberos 5,
       and Winbind client configuration is also provided.

       If --test action is specified, the authconfig just reads the current settings from the various configuration files and prints their values.  If --update action is specified, authconfig must  be  run
       by  root  (or through console helper), and configuration changes are saved. Only the files affected by the configuration changes are overwritten.  If --updateall action is specified, authconfig must
       be run by root (or through console helper), and all configuration files are written.  The --probe action instructs authconfig to use DNS and other means to guess at configuration information for the
       current host, print its guesses if it finds them, to standard output, and exit.

       The --restorebackup, --savebackup, and --restorelastbackup actions provide a possibility to save and later restore a backup of configuration files which authconfig modifies. Authconfig also saves an
       automatic backup of configuration files before every configuration change. This special backup can be restored by the --restorelastbackup action.

       If --nostart is specified (which is what the install program does), ypbind or other daemons will not be started or stopped immediately following program execution, but only enabled to start or  stop
       at boot time.

       The --enablenis, --enableldap, --enablewinbind, and --enablehesiod options are used to configure user information services in /etc/nsswitch.conf, the --enablecache option is used to configure naming
       services caching, and the --enableshadow, --enableldapauth, --enablekrb5, and --enablewinbindauth options are used to configure authentication functions via  /etc/pam.d/system-auth.   Each  --enable
       has a matching --disable option that disables the service if it is already enabled. The respective services have parameters which configure their server names etc.

       The  algorithm  used  for  storing new password hashes can be specified by the --passalgo option which takes one of the following possible values as a parameter: descrypt, bigcrypt, md5, sha256, and
       sha512.

       The --enablelocauthorize option allows to bypass checking network authentication services for authorization and the --enablesysnetauth allows authentication of system accounts (with uid  <  500)  by
       these services.

       When  the configuration settings allow use of SSSD for user information services and authentication, SSSD will be automatically used instead of the legacy services and the SSSD configuration will be
       set up so there is a default domain populated with the settings required to connect the services.  The  --enablesssd  and  --enablesssdauth  options  force  adding  SSSD  to  /etc/nsswitch.conf  and
       /etc/pam.d/system-auth,  but they do not set up the domain in the SSSD configuration files. The SSSD configuration has to be set up manually. The allowed configuration of services for SSSD are: LDAP
       for user information (--enableldap) and either LDAP (--enableldapauth), or Kerberos (--enablekrb5) for authentication. Please note that even though these options alone do not trigger any  change  in
       SSSD configuration files this may not be true if any of these options is used in conjunction with other options such as --enableldap or --updateall.

       In  case  SSSD  does  not  support  some  feature  of  the  legacy  services  that are required for the site configuration, the use of the legacy services can be forced by setting FORCELEGACY=yes in
       /etc/sysconfig/authconfig.

       The list of options mentioned here in the manual page is not exhaustive, please refer to authconfig --help for the complete list of the options.

       The authconfig-tui supports all options of authconfig but it implies --update as the default action. Its window contains a Cancel button by default. If --back option is specified at run time, a Back
       button  is  presented  instead.  If --kickstart is specified, no interactive screens will be seen. The values the program will use will be those specified by the other options (--passalgo, --enable‐
       shadow, etc.).

       For namelist you may substitute either a single name or a comma-separated list of names.

NOTES
       The authconfig-tui is deprecated. No new configuration settings will be supported by its text user interface. Use system-config-authentication GUI application or the command line options instead.

       The /usr/bin/authconfig uses the consolehelper to authenticate as the system user before it starts up. If you want to run it  directly  without  the  authentication  as  the  system  user,  run  the
       /usr/sbin/authconfig command.

       The SSSD service is enabled and possibly started by authconfig when at least two of the following three conditions are met:
       1) /etc/sssd/sssd.conf file exists (or is configured via the implicit SSSD support)
       2) SSSD authentication is enabled (pam_sss.so is used in PAM configuration)
       3) SSSD is enabled for user identity (nsswitch.conf contains sss)

       When --update action is used the enablement or disablement and possible restart of services happens only in case the changed configuration options affect the service to be restarted. This means that
       if for example the ypbind service is enabled with authconfig --update --nostart --enablenis but not started and you run the same command without the --nostart later the ypbind service  will  not  be
       started because no configuration change affecting ypbind happened.

RETURN CODES
       authconfig returns 0 on success, 1 on backup operation errors, 2 if not running with sufficient privileges, 3 if unknown password hash algorithm is specified or incorrect values are set for password
       strength checking (this error is non fatal), 4 if download of CA certificate fails, 5 if writing configuration files fails on --updateall action, 6 if writing fails on --update action, 7 if  Winbind
       or IPA domain join fails.


       authconfig-tui returns 0 on success, 2 on error, and 1 if the user cancelled the program (by using either the Cancel or Back button). It can also return the same codes as authconfig.


FILES
       /etc/sysconfig/authconfig
              Used  to track whether or not particular authentication mechanisms are enabled.  Currently includes variables named USESHADOW, USEMD5, USEKERBEROS, USELDAPAUTH, USESMBAUTH, USEWINBIND,
              USEWINBINDAUTH, USEHESIOD, USENIS, USELDAP, and others.
       /etc/passwd
       /etc/shadow
              Used for shadow password support.
       /etc/yp.conf
              Configuration file for NIS support.
       /etc/sysconfig/network
              Another configuration file for NIS support.
       /etc/ldap.conf
       /etc/nss_ldap.conf
       /etc/pam_ldap.conf
       /etc/nslcd.conf
       /etc/openldap/ldap.conf
              Used to configure nss_ldap, pam_ldap, nslcd, and the OpenLDAP library. Only the files already existing on the system are modified.
       /etc/krb5.conf
              Used to configure Kerberos 5.
       /etc/hesiod.conf
              Used to configure Hesiod.
       /etc/samba/smb.conf
              Used to configure winbind authentication.
       /etc/nsswitch.conf
              Used to configure user information services.
       /etc/login.defs
              Used to configure parameters of user accounts (minimum UID of a regular user, password hashing algorithm).
       /etc/pam.d/system-auth
              Common PAM configuration for system services which include it using the include directive. It is created as symlink and not relinked if it points to another file.
       /etc/pam.d/system-auth-ac
              Contains the actual PAM configuration for system services and is the default target of the /etc/pam.d/system-auth symlink. If a local configuration of PAM  is  created  (and  symlinked
              from system-auth file) this file can be included there.


SEE ALSO
       authconfig-gtk(8), system-auth-ac(5), passwd(5), shadow(5), pwconv(1), domainname(1), ypbind(8), nsswitch.conf(5), smb.conf(5), sssd(8)


AUTHORS
       Nalin Dahyabhai <nalin@redhat.com>, Preston Brown <pbrown@redhat.com>,
       Matt Wilson <msw@redhat.com>, Tomas Mraz <tmraz@redhat.com>



Red Hat, Inc.                                                                                    22 July 2011                                                                                   AUTHCONFIG(8)
