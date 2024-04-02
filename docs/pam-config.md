PAM-CONFIG(8)                                                                                  Reference Manual                                                                                 PAM-CONFIG(8)



NAME
       pam-config - Adjust common PAM config files

SYNOPSIS
       pam-config [--debug] [--list-modules] [--service service-name] -a | -c | -d | -q  [-f] [module-name]

       pam-config --version

DESCRIPTION
       pam-config adjusts predefined PAM config files.

OPTIONS
   COMMON OPTIONS
       --debug
           Print debug messages.

       -f, --force
           The new configuration will be activated regardless if there are other local changes.

       --list-modules
           Prints out a list of all supported modules to stdout.

       --nullok
           Add nullok to all modules which support this.

       --pam-debug
           Add debug to all modules which support this.

   MODIFIER OPTIONS
       Use the following options to specifiy the action you want pam-config to apply. They need to be followed by a supported module option. See the section called “SUPPORTED PAM MODULES”.

       -a, --add
           Add options or new PAM modules to existing PAM configuration files.

       -c, --create
           Create new PAM configuration files for plain UNIX authentication, overwriting existing ones.

       -d, --delete
           Remove options or PAM modules from existing PAM configuration files.

       -q, --query
           Print a list of types and the corresponding module options for the queried PAM module.

       --verify
           Do some sanity checks on the current common PAM configuration files.

   SUPPORTED PAM MODULES
       This is a list of modules supported by pam-config. They are split into two categories: global and single service modules.

       GLOBAL MODULES
           The global modules get inserted into the common-{account,auth,password,session} files which are included by the single service files.

           --access
               pam_access for account access rules

           --access-debug
               Add debug option to all pam_access.so invocations.

           --access-nodefgroup
               Add nodefgroup option to all pam_access.so invocations.

           --access-noaudit
               Add noaudit option to all pam_access.so invocations.

           --access-accessfile=value
               Add accessfile=value option to pam_access.so.

           --access-fieldsep=value
               Add fieldsep=value option to pam_access.so.

           --access-listsep=value
               Add listsep=value option to pam_access.so.

           --apparmor
               Enable/Disable pam_apparmor.so

           --apparmor-debug
               Add debug option to all pam_apparmor.so invocations.

           --ccreds
               Enable/Disable pam_ccreds.so

           --cracklib
               Enable/Disable pam_cracklib.so

           --cracklib-debug
               Add debug option to all pam_cracklib.so invocations.

           --cracklib-authtok_type=value
               Add authtok_type=value option to pam_cracklib.so.

           --cracklib-retry=value
               Add retry=value option to pam_cracklib.so.

           --cracklib-difok=value
               Add difok=value option to pam_cracklib.so.

           --cracklib-difignore=value
               Add difignore=value option to pam_cracklib.so.

           --cracklib-minlen=value
               Add minlen=value option to pam_cracklib.so.

           --cracklib-dcredit=value
               Add dcredit=value option to pam_cracklib.so.

           --cracklib-ucredit=value
               Add ucredit=value option to pam_cracklib.so.

           --cracklib-lcredit=value
               Add lcredit=value option to pam_cracklib.so.

           --cracklib-ocredit=value
               Add ocredit=value option to pam_cracklib.so.

           --cracklib-minclass=value
               Add minclass=value option to pam_cracklib.so.

           --cracklib-dictpath=value
               Add dictpath=value option to pam_cracklib.so.

           --ecryptfs
               Enable/Disable pam_ecryptfs.so

           --ecryptfs-unwrap
               Add unwrap option to all pam_ecryptfs.so invocations.

           --env
               Enable/Disable pam_env.so

           --env-debug
               Add debug option to all pam_env.so invocations.

           --env-conffile=value
               Add conffile=value option to pam_env.so.

           --env-envfile=value
               Add envfile=value option to pam_env.so.

           --env-readenv=value
               Add readenv=value option to pam_env.so.

           --exec
               pam_exec for password management

           --exec-debug
               Add debug option to all pam_exec.so invocations.

           --exec-expose_authtok
               Add expose_authtok option to all pam_exec.so invocations.

           --exec-seteuid
               Add seteuid option to all pam_exec.so invocations.

           --exec-quiet
               Add quiet option to all pam_exec.so invocations.

           --exec-log=value
               Add log=value option to pam_exec.so.

           --exec-option=value
               Add option=value option to pam_exec.so.

           --fp
               Enable/Disable pam_fp.so

           --fp-debug
               Add debug option to all pam_fp.so invocations.

           --fprint
               Enable/Disable pam_fprint.so

           --fprint-debug
               Add debug option to all pam_fprint.so invocations.

           --fprintd
               Enable/Disable pam_fprintd.so

           --fprintd-debug
               Add debug option to all pam_fprintd.so invocations.

           --gnome_keyring
               Enable/Disable pam_gnome_keyring.so

           --gnome_keyring-auto_start
               Add auto_start option to all pam_gnome_keyring.so invocations.

           --gnome_keyring-only_if=value
               Add only_if=value option to pam_gnome_keyring.so.

           --group
               Enable/Disable pam_group.so

           --krb5
               Enable/Disable pam_krb5.so

           --krb5-debug
               Add debug option to all pam_krb5.so invocations.

           --krb5-ignore_unknown_principals
               Add ignore_unknown_principals option to all pam_krb5.so invocations.

           --krb5-minimum_uid=value
               Add minimum_uid=value option to pam_krb5.so.

           --ldap
               Enable/Disable pam_ldap.so

           --ldap-debug
               Add debug option to all pam_ldap.so invocations.

           --limits
               Enable/Disable pam_limits.so

           --limits-debug
               Add debug option to all pam_limits.so invocations.

           --limits-change_uid
               Add change_uid option to all pam_limits.so invocations.

           --limits-utmp_early
               Add utmp_early option to all pam_limits.so invocations.

           --limits-conf=value
               Add conf=value option to pam_limits.so.

           --localuser
               Enable/Disable pam_localuser.so

           --localuser-debug
               Add debug option to all pam_localuser.so invocations.

           --localuser-file=value
               Add file=value option to pam_localuser.so.

           --mkhomedir
               Enable/Disable pam_mkhomedir.so

           --mkhomedir-debug
               Add debug option to all pam_mkhomedir.so invocations.

           --mkhomedir-silent
               Add silent option to all pam_mkhomedir.so invocations.

           --mkhomedir-umask=value
               Add umask=value option to pam_mkhomedir.so.

           --mkhomedir-skel=value
               Add skel=value option to pam_mkhomedir.so.

           --nam
               Enable/Disable pam_nam.so

           --passwdqc
               Enable/Disable pam_passwdqc.so

           --passwdqc-ask_oldauthtok
               Add ask_oldauthtok option to all pam_passwdqc.so invocations.

           --passwdqc-check_oldauthtok
               Add check_oldauthtok option to all pam_passwdqc.so invocations.

           --passwdqc-use_first_pass
               Add use_first_pass option to all pam_passwdqc.so invocations.

           --passwdqc-use_authtok
               Add use_authtok option to all pam_passwdqc.so invocations.

           --passwdqc-min=value
               Add min=value option to pam_passwdqc.so.

           --passwdqc-max=value
               Add max=value option to pam_passwdqc.so.

           --passwdqc-passphrase=value
               Add passphrase=value option to pam_passwdqc.so.

           --passwdqc-match=value
               Add match=value option to pam_passwdqc.so.

           --passwdqc-similar=value
               Add similar=value option to pam_passwdqc.so.

           --passwdqc-random=value
               Add random=value option to pam_passwdqc.so.

           --passwdqc-enforce=value
               Add enforce=value option to pam_passwdqc.so.

           --passwdqc-retry=value
               Add retry=value option to pam_passwdqc.so.

           --pkcs11
               Enable/Disable pam_pkcs11.so

           --pkcs11-debug
               Add debug option to all pam_pkcs11.so invocations.

           --pkcs11-configfile=value
               Add configfile=value option to pam_pkcs11.so.

           --pwcheck
               Enable/Disable pam_pwcheck.so module in password section.

           --pwcheck-debug
               Add debug option to all pam_pwcheck.so invocations.

           --pwcheck-nullok
               Add nullok option to all pam_pwcheck.so invocations.

           --pwcheck-cracklib
               Add cracklib option to pam_pwcheck.so.

           --pwcheck-no_obscure_checks
               Add no_obscure_checks option to pam_pwcheck.so.

           --pwcheck-enforce_for_root
               Add enforce_for_root option to pam_pwcheck.so.

           --pwcheck-cracklib_path=path
               Add cracklib_path=path to pam_pwcheck.so.

           --pwcheck-maxlen=N
               Add maxlen=N to pam_pwcheck.so.

           --pwcheck-minlen=N
               Add minlen=N to pam_pwcheck.so.

           --pwcheck-tries=N
               Add tries=N to pam_pwcheck.so.

           --pwcheck-remember=N
               Add remember=N to pam_pwcheck.so.

           --pwhistory
               Enable/Disable pam_pwhistory.so

           --pwhistory-debug
               Add debug option to all pam_pwhistory.so invocations.

           --pwhistory-use_authtok
               Add use_authtok option to all pam_pwhistory.so invocations.

           --pwhistory-enforce_for_root
               Add enforce_for_root option to all pam_pwhistory.so invocations.

           --pwhistory-remember=value
               Add remember=value option to pam_pwhistory.so.

           --pwhistory-retry=value
               Add retry=value option to pam_pwhistory.so.

           --pwhistory-authtok_type=value
               Add authtok_type=value option to pam_pwhistory.so.

           --selinux
               Enable/Disable pam_selinux.so

           --selinux-debug
               Add debug option to all pam_selinux.so invocations.

           --ssh
               Enable/Disable pam_ssh.so

           --ssh-debug
               Add debug option to all pam_ssh.so invocations.

           --ssh-nullok
               Add nullok option to all pam_ssh.so invocations.

           --ssh-keyfiles=value
               Add keyfiles=value option to pam_ssh.so.

           --sss
               Enable/Disable pam_sss.so

           --sss-debug
               Add debug option to all pam_sss.so invocations.

           --systemd
               Enable/Disable pam_systemd.so

           --systemd-debug
               Add debug option to all pam_systemd.so invocations.

           --systemd-kill_session_processes=value
               Add kill_session_processes=value option to pam_systemd.so.

           --systemd-kill_only_users=value
               Add kill_only_users=value option to pam_systemd.so.

           --systemd-kill_exclude_users=value
               Add kill_exclude_users=value option to pam_systemd.so.

           --systemd-controllers=value
               Add controllers=value option to pam_systemd.so.

           --systemd-reset_controllers=value
               Add reset_controllers=value option to pam_systemd.so.

           --thinkfinger
               Enable/Disable pam_thinkfinger.so

           --thinkfinger-debug
               Add debug option to all pam_thinkfinger.so invocations.

           --umask
               Add pam_umask.so as optional session module.

           --umask-debug
               Add debug option to all pam_umask.so invocations in session management.

           --umask-silent
               Add silent option to all pam_umask.so invocations in session management.

           --umask-usergroups
               Add usergroups option to all pam_umask.so invocations in session management.

           --umask-umask=mode
               Add umask=mode to pam_umask.so.

           --unix
               Enable/Disable pam_unix.so

           --unix-debug
               Add debug option to all pam_unix.so invocations.

           --unix-audit
               Add audit option to all pam_unix.so invocations.

           --unix-nodelay
               Add nodelay option to all pam_unix.so invocations.

           --unix-nullok
               Add nullok option to all pam_unix.so invocations.

           --unix-shadow
               Add shadow option to all pam_unix.so invocations.

           --unix-md5
               Add md5 option to all pam_unix.so invocations.

           --unix-bigcrypt
               Add bigcrypt option to all pam_unix.so invocations.

           --unix-sha256
               Add sha256 option to all pam_unix.so invocations.

           --unix-sha512
               Add sha512 option to all pam_unix.so invocations.

           --unix-blowfish
               Add blowfish option to all pam_unix.so invocations.

           --unix-not_set_pass
               Add not_set_pass option to all pam_unix.so invocations.

           --unix-nis
               Add nis option to all pam_unix.so invocations.

           --unix-broken_shadow
               Add broken_shadow option to all pam_unix.so invocations.

           --unix-use_first_pass
               Add use_first_pass option to all pam_unix.so invocations.

           --unix-try_first_pass
               Add try_first_pass option to all pam_unix.so invocations.

           --unix-remember=value
               Add remember=value option to pam_unix.so.

           --unix-rounds=value
               Add rounds=value option to pam_unix.so.

           --unix-minlen=value
               Add minlen=value option to pam_unix.so.

           --unix2
               Use pam_unix2.so as standard UNIX PAM module.

           --unix2-nullok
               Add nullok option to all pam_unix2.so invocations.

           --unix2-debug
               Add debug option to all pam_unix2.so invocations.

           --unix2-trace
               Add trace option to pam_unix2.so.

           --unix2-none
               Add option none to pam_unix2.so.

           --unix2-call_modules=modules,...
               Add call_modules=list of modules to pam_unix2.so.

           --unix2-nisdir=path
               Add nisdir=path to pam_unix2.so.

           --winbind
               Enable/Disable pam_winbind.so

           --winbind-debug
               Add debug option to all pam_winbind.so invocations.

       SINGLE SERVICE MODULES
           These modules can only be added to single service files. See also the section called “USAGE EXAMPLES”.

           --ck_connector
               Enable/Disable pam_ck_connector.so

           --ck_connector-debug
               Add debug option to all pam_ck_connector.so invocations.

           --cryptpass
               Enable/Disable pam_cryptpass.so

           --csync
               Enable/Disable pam_csync.so

           --csync-use_first_pass
               Add use_first_pass option to all pam_csync.so invocations.

           --csync-try_first_pass
               Add try_first_pass option to all pam_csync.so invocations.

           --csync-soft_try_pass
               Add soft_try_pass option to all pam_csync.so invocations.

           --csync-nullok
               Add nullok option to all pam_csync.so invocations.

           --csync-debug
               Add debug option to all pam_csync.so invocations.

           --csync-silent
               Add silent option to all pam_csync.so invocations.

           --lastlog
               Enable/Disable pam_lastlog.so

           --lastlog-debug
               Add debug option to all pam_lastlog.so invocations.

           --lastlog-silent
               Add silent option to all pam_lastlog.so invocations.

           --lastlog-never
               Add never option to all pam_lastlog.so invocations.

           --lastlog-nodate
               Add nodate option to all pam_lastlog.so invocations.

           --lastlog-nohost
               Add nohost option to all pam_lastlog.so invocations.

           --lastlog-noterm
               Add noterm option to all pam_lastlog.so invocations.

           --lastlog-nowtmp
               Add nowtmp option to all pam_lastlog.so invocations.

           --lastlog-noupdate
               Add noupdate option to all pam_lastlog.so invocations.

           --lastlog-showfailed
               Add showfailed option to all pam_lastlog.so invocations.

           --loginuid
               Enable/Disable pam_loginuid.so

           --loginuid-require_auditd
               Add require_auditd option to all pam_loginuid.so invocations.

           --mount
               Enable/Disable pam_mount.so

           --google_authenticator
               Enable/Disable pam_google_authenticator.so

           --google_authenticator-noskewadj
               Add noskewadj option to all pam_google_authenticator.so invocations.

           --google_authenticator-nullok
               Add nullok option to all pam_google_authenticator.so invocations.

           --google_authenticator-secret=value
               Add secret=value option to pam_google_authenticator.so.

NOTES
       The configuration for gobal service modules written by pam-config is ignored by the system if the common-{account,auth,password,session} symlinks don't point to the
       common-{account,auth,password,session}-pc files.

USAGE EXAMPLES
       pam-config -q --unix
           Query state of pam_unix.so.

       pam-config -a --ldap
           Enable ldap authentication.

       pam-config --service gdm -a --mount
           Enable pam_mount.so for service gdm.

       pam-config --debug -a --force --umask
           Enable pam_umask.so whether installed or not, and print debug information during the process.

SEE ALSO
       PAM(8), pam_unix(8), pam_cracklib(8), pam_mkhomedir(8), pam_limits(8), pam_env(8), pam_xauth(8), pam_make(8)

AUTHOR
       pam-config was written by Thorsten Kukuk <kukuk@thkukuk.de>.



Reference Manual                                                                                  04/01/2016                                                                                    PAM-CONFIG(8)
