luseradd(1)                                                                                General Commands Manual                                                                                luseradd(1)



NAME
       luseradd - Add an user


SYNOPSIS
       luseradd [OPTION]... user


DESCRIPTION
       Adds an user with name user.


OPTIONS
       -c, --gecos=gecos
              Set the GECOS field to gecos.  The GECOS field is traditionally used to store user's real name and other information.


       -d, --directory=directory
              Set user's home directory to directory.  If this option is not present, a default specified by libuser configuration is used.


       -g, --gid=group
              Set  user's  primary group to group.  group can either be a group ID of an existing group, or a group name; if group is a group name and the group does not exist, it is created.  If the --gid
              option is not specified, the default group name is user.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -k, --skeleton=directory
              Populate the newly created user's home directory with a copy of directory.  If this option is not present, a default directory specified by libuser configuration, or /etc/skel if libuser con‐
              figuration does not specify a default, is used.


       -M, --nocreatehome
              Don't create a home directory and a mail spool for the newly created user.


       -n, --nocreategroup
              If a group is not specified using -g, use group name "users" instead of user.  Note that despite the name of the option, the group will still be created if it does not exist.


       -P, --plainpassword=password
              Set user's password to password.  Note that the password can be viewed while running luseradd using tools such as ps(1).


       -p, --password=encrypted
              Set user's password to the password represented by the hash encrypted.  Note that the hash can be viewed while running luseradd using tools such as ps(1).


       -r, --reserved
              The  user is a system user.  Users that are not marked as system user usually have automatically selected user IDs above a certain value (configured as LU_UIDNUMBER in libuser.conf(5)).  This
              information is also passed to the libuser backends.  This option implies the -M option.


       -s, --shell=shell
              Set user's login shell to shell.  If this option is not present, a default specified by libuser configuration is used.


       -u, --uid=uid
              Use user ID uid for the newly created user.  An user ID is selected automatically if this option is not present.


       --commonname=name
              Use common name name for the newly created user.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --givenname=name
              Use given name name for the newly created user.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --homephone=phone
              Use home telephone number phone for the newly created user.  This attribute is only supported in some backends (e.g.LDAP), and its support may  have  further  limitations  (e.g.  LDAP  schema
              rules).


       --roomnumber=room
              Use room number room for the newly created user.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --surname=name
              Use surname name for the newly created user.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --telephonenumber=phone
              Use telephone number phone for the newly created user.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


EXIT STATUS
       The exit status is 0 on success, nonzero on error.



libuser                                                                                           2009-12-09                                                                                      luseradd(1)
