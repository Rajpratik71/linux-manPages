lusermod(1)                                                                                General Commands Manual                                                                                lusermod(1)



NAME
       lusermod - Modify an user


SYNOPSIS
       lusermod [OPTION]... user


DESCRIPTION
       Modifies the user with name user.


OPTIONS
       -c, --gecos=gecos
              Set user's GECOS field to gecos.  The GECOS field is traditionally used to store user's real name and other information.


       -d, --directory=directory
              Set user's home directory to directory.


       -g, --gid=gid
              Change user's primary group ID to gid.  If group with ID gid does not exist, a warning is printed, but the operation is performed anyway.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -L, --lock
              Lock user's account.  This prevents logging in using user's password.


       -l, --login=name
              Rename user to name.


       -m, --movedirectory
              After changing user's home directory (using the -d option), move the old home directory to the new location.


       -P, --plainpassword=password
              Set user's password to password.  Note that the password can be viewed while running lusermod using tools such as ps(1).


       -p, --password=encrypted
              Set user's password to the password represented by the hash encrypted.  Note that the hash can be viewed while running lusermod using tools such as ps(1).


       -s, --shell=shell
              Set user's login shell to shell.


       -U, --unlock
              Unlock user's account.


       -u, --uid=uid
              Change user's user ID to uid.


       --commonname=name
              Set user's common name to name.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --givenname=name
              Set user's given name to name.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --homephone=phone
              Set user's home telephone number to phone.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --roomnumber=room
              Set user's room number to room.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --surname=name
              Set user's surname to name.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


       --telephonenumber=phone
              Set user's telephone number to phone.  This attribute is only supported in some backends (e.g.LDAP), and its support may have further limitations (e.g. LDAP schema rules).


EXIT STATUS
       The exit status is 0 on success, nonzero on error.



libuser                                                                                           2009-12-11                                                                                      lusermod(1)
