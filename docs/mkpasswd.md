MKPASSWD(1)                                                      Debian GNU/Linux                                                      MKPASSWD(1)

NAME
       mkpasswd - Overfeatured front end to crypt(3)

SYNOPSIS
       mkpasswd PASSWORD SALT

DESCRIPTION
       mkpasswd encrypts the given password with the crypt(3) libc function using the given salt.

OPTIONS
       -S, --salt=STRING
              Use the STRING as salt. It must not contain prefixes such as $1$.

       -R, --rounds=NUMBER
              Use  NUMBER  rounds. This argument is ignored if the method chosen does not support variable rounds. For the OpenBSD Blowfish method
              this is the logarithm of the number of rounds.

       -m, --method=TYPE
              Compute the password using the TYPE method.  If TYPE is help then the available methods are printed.

       -5     Like --method=md5.

       -P, --password-fd=NUM
              Read the password from file descriptor NUM instead of using getpass(3).  If the file descriptor is not connected to a  tty  then  no
              other message than the hashed password is printed on stdout.

       -s, --stdin
              Like --password-fd=0.

ENVIRONMENT
       MKPASSWD_OPTIONS
              A list of options which will be evalued before the ones specified on the command line.

BUGS
       If the --stdin option is used, passwords containing some control characters may not be read correctly.

       This programs suffers of a bad case of featuritis.

SEE ALSO
       passwd(1), passwd(5), crypt(3), getpass(3)

AUTHOR
       mkpasswd  and  this man page were written by Marco d'Itri <md@linux.it> and are licensed under the terms of the GNU General Public License,
       version 2 or higher.

Marco d'Itri                                                       21 March 2008                                                       MKPASSWD(1)
