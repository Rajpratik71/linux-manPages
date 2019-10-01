PDBEDIT(8)                                                                               System Administration tools                                                                               PDBEDIT(8)



NAME
       pdbedit - manage the SAM database (Database of Samba Users)

SYNOPSIS
       pdbedit [-a] [-b passdb-backend] [-c account-control] [-C value] [-d debuglevel] [-D drive] [-e passdb-backend] [-f fullname] [--force-initialized-passwords] [-g] [-h homedir] [-i passdb-backend]
        [-I domain] [-K] [-L] [-m] [-M SID|RID] [-N description] [-P account-policy] [-p profile] [--policies-reset] [-r] [-s configfile] [-S script] [--set-nt-hash] [-t] [--time-format] [-u username]
        [-U SID|RID] [-v] [-V] [-w] [-x] [-y] [-z] [-Z]

DESCRIPTION
       This tool is part of the samba(7) suite.

       The pdbedit program is used to manage the users accounts stored in the sam database and can only be run by root.

       The pdbedit tool uses the passdb modular interface and is independent from the kind of users database used (currently there are smbpasswd, ldap, nis+ and tdb based and more can be added without
       changing the tool).

       There are five main ways to use pdbedit: adding a user account, removing a user account, modifying a user account, listing user accounts, importing users accounts.

OPTIONS
       -L|--list
           This option lists all the user accounts present in the users database. This option prints a list of user/uid pairs separated by the ':' character.

           Example: pdbedit -L

               sorce:500:Simo Sorce
               samba:45:Test User

       -v|--verbose
           This option enables the verbose listing format. It causes pdbedit to list the users in the database, printing out the account fields in a descriptive format. Used together with -w also shows
           passwords hashes.

           Example: pdbedit -L -v

               ---------------
               username:       sorce
               user ID/Group:  500/500
               user RID/GRID:  2000/2001
               Full Name:      Simo Sorce
               Home Directory: \\BERSERKER\sorce
               HomeDir Drive:  H:
               Logon Script:   \\BERSERKER\netlogon\sorce.bat
               Profile Path:   \\BERSERKER\profile
               ---------------
               username:       samba
               user ID/Group:  45/45
               user RID/GRID:  1090/1091
               Full Name:      Test User
               Home Directory: \\BERSERKER\samba
               HomeDir Drive:
               Logon Script:
               Profile Path:   \\BERSERKER\profile

       -w|--smbpasswd-style
           This option sets the "smbpasswd" listing format. It will make pdbedit list the users in the database, printing out the account fields in a format compatible with the smbpasswd file format. (see
           the smbpasswd(5) for details). Instead used together with (-v) displays the passwords hashes in verbose output.

           Example: pdbedit -L -w

               sorce:500:508818B733CE64BEAAD3B435B51404EE:
                         D2A2418EFC466A8A0F6B1DBB5C3DB80C:
                         [UX         ]:LCT-00000000:
               samba:45:0F2B255F7B67A7A9AAD3B435B51404EE:
                         BC281CE3F53B6A5146629CD4751D3490:
                         [UX         ]:LCT-3BFA1E8D:

       -u|--user username
           This option specifies the username to be used for the operation requested (listing, adding, removing). It is required in add, remove and modify operations and optional in list operations.

       -f|--fullname fullname
           This option can be used while adding or modifying a user account. It will specify the user's full name.

           Example: -f "Simo Sorce"

       -h|--homedir homedir
           This option can be used while adding or modifying a user account. It will specify the user's home directory network path.

           Example: -h "\\\\BERSERKER\\sorce"

       -D|--drive drive
           This option can be used while adding or modifying a user account. It will specify the windows drive letter to be used to map the home directory.

           Example: -D "H:"

       -S|--script script
           This option can be used while adding or modifying a user account. It will specify the user's logon script path.

           Example: -S "\\\\BERSERKER\\netlogon\\sorce.bat"

       --set-nt-hash
           This option can be used while modifying a user account. It will set the user's password using the nt-hash value given as hexadecimal string. Useful to synchronize passwords.

           Example: --set-nt-hash 8846F7EAEE8FB117AD06BDD830B7586C

       -p|--profile profile
           This option can be used while adding or modifying a user account. It will specify the user's profile directory.

           Example: -p "\\\\BERSERKER\\netlogon"

       -M|'--machine SID' SID|rid
           This option can be used while adding or modifying a machine account. It will specify the machines' new primary group SID (Security Identifier) or rid.

           Example: -M S-1-5-21-2447931902-1787058256-3961074038-1201

       -U|'--user SID' SID|rid
           This option can be used while adding or modifying a user account. It will specify the users' new SID (Security Identifier) or rid.

           Example: -U S-1-5-21-2447931902-1787058256-3961074038-5004

           Example: '--user SID' S-1-5-21-2447931902-1787058256-3961074038-5004

           Example: -U 5004

           Example: '--user SID' 5004

       -c|--account-control account-control
           This option can be used while adding or modifying a user account. It will specify the users' account control property. Possible flags are listed below.


                  ·   N: No password required

                  ·   D: Account disabled

                  ·   H: Home directory required

                  ·   T: Temporary duplicate of other account

                  ·   U: Regular user account

                  ·   M: MNS logon user account

                  ·   W: Workstation Trust Account

                  ·   S: Server Trust Account

                  ·   L: Automatic Locking

                  ·   X: Password does not expire

                  ·   I: Domain Trust Account


           Example: -c "[X ]"

       -K|--kickoff-time
           This option is used to modify the kickoff time for a certain user. Use "never" as argument to set the kickoff time to unlimited.

           Example: pdbedit -K never user

       -a|--create
           This option is used to add a user into the database. This command needs a user name specified with the -u switch. When adding a new user, pdbedit will also ask for the password to be used.

           Example: pdbedit -a -u sorce

               new password:
               retype new password


               Note
               pdbedit does not call the unix password synchronization script if unix password sync has been set. It only updates the data in the Samba user database.

               If you wish to add a user and synchronise the password that immediately, use smbpasswd's -a option.

       -t|--password-from-stdin
           This option causes pdbedit to read the password from standard input, rather than from /dev/tty (like the passwd(1) program does). The password has to be submitted twice and terminated by a
           newline each.

       -r|--modify
           This option is used to modify an existing user in the database. This command needs a user name specified with the -u switch. Other options can be specified to modify the properties of the
           specified user. This flag is kept for backwards compatibility, but it is no longer necessary to specify it.

       -m|--machine
           This option may only be used in conjunction with the -a option. It will make pdbedit to add a machine trust account instead of a user account (-u username will provide the machine name).

           Example: pdbedit -a -m -u w2k-wks

       -x|--delete
           This option causes pdbedit to delete an account from the database. It needs a username specified with the -u switch.

           Example: pdbedit -x -u bob

       -i|--import passdb-backend
           Use a different passdb backend to retrieve users than the one specified in smb.conf. Can be used to import data into your local user database.

           This option will ease migration from one passdb backend to another.

           Example: pdbedit -i smbpasswd:/etc/smbpasswd.old

       -e|--export passdb-backend
           Exports all currently available users to the specified password database backend.

           This option will ease migration from one passdb backend to another and will ease backing up.

           Example: pdbedit -e smbpasswd:/root/samba-users.backup

       -g|--group
           If you specify -g, then -i in-backend -e out-backend applies to the group mapping instead of the user database.

           This option will ease migration from one passdb backend to another and will ease backing up.

       -b|--backend passdb-backend
           Use a different default passdb backend.

           Example: pdbedit -b xml:/root/pdb-backup.xml -l

       -P|--account-policy account-policy
           Display an account policy

           Valid policies are: minimum password age, reset count minutes, disconnect time, user must logon to change password, password history, lockout duration, min password length, maximum password age
           and bad lockout attempt.

           Example: pdbedit -P "bad lockout attempt"

               account policy value for bad lockout attempt is 0

       -C|--value account-policy-value
           Sets an account policy to a specified value. This option may only be used in conjunction with the -P option.

           Example: pdbedit -P "bad lockout attempt" -C 3

               account policy value for bad lockout attempt was 0
               account policy value for bad lockout attempt is now 3

       -y|--policies
           If you specify -y, then -i in-backend -e out-backend applies to the account policies instead of the user database.

           This option will allow one to migrate account policies from their default tdb-store into a passdb backend, e.g. an LDAP directory server.

           Example: pdbedit -y -i tdbsam: -e ldapsam:ldap://my.ldap.host

       --force-initialized-passwords
           This option forces all users to change their password upon next login.

       -N|--account-desc description
           This option can be used while adding or modifying a user account. It will specify the user's description field.

           Example: -N "test description"

       -Z|--logon-hours-reset
           This option can be used while adding or modifying a user account. It will reset the user's allowed logon hours. A user may login at any time afterwards.

           Example: -Z

       -z|--bad-password-count-reset
           This option can be used while adding or modifying a user account. It will reset the stored bad login counter from a specified user.

           Example: -z

       --policies-reset
           This option can be used to reset the general password policies stored for a domain to their default values.

           Example: --policies-reset

       -I|--domain
           This option can be used while adding or modifying a user account. It will specify the user's domain field.

           Example: -I "MYDOMAIN"

       --time-format
           This option is currently not being used.

       -?|--help
           Print a summary of command line options.

       --usage
           Display brief usage message.

       -d|--debuglevel=level
           level is an integer from 0 to 10. The default value if this parameter is not specified is 0.

           The higher this value, the more detail will be logged to the log files about the activities of the server. At level 0, only critical errors and serious warnings will be logged. Level 1 is a
           reasonable level for day-to-day running - it generates a small amount of information about operations carried out.

           Levels above 1 will generate considerable amounts of log data, and should only be used when investigating a problem. Levels above 3 are designed for use only by developers and generate HUGE
           amounts of log data, most of which is extremely cryptic.

           Note that specifying this parameter here will override the log level parameter in the smb.conf file.

       -V|--version
           Prints the program version number.

       -s|--configfile=<configuration file>
           The file specified contains the configuration details required by the server. The information in this file includes server-specific information such as what printcap file to use, as well as
           descriptions of all the services that the server is to provide. See smb.conf for more information. The default configuration file name is determined at compile time.

       -l|--log-basename=logdirectory
           Base directory name for log/debug files. The extension ".progname" will be appended (e.g. log.smbclient, log.smbd, etc...). The log file is never removed by the client.

       --option=<name>=<value>
           Set the smb.conf(5) option "<name>" to value "<value>" from the command line. This overrides compiled-in defaults and options read from the configuration file.

NOTES
       This command may be used only by root.

VERSION
       This man page is part of version 4.9.1 of the Samba suite.

SEE ALSO
       smbpasswd(5), samba(7)

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The pdbedit manpage was written by Simo Sorce and Jelmer Vernooij.



Samba 4.9.1                                                                                       08/09/2019                                                                                       PDBEDIT(8)
