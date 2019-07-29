srptool(1)                                                         User Commands                                                        srptool(1)

NAME
       srptool - GnuTLS SRP tool

SYNOPSIS
       srptool [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       Simple  program  that emulates the programs in the Stanford SRP (Secure Remote Password) libraries using GnuTLS.  It is intended for use in
       places where you don't expect SRP authentication to be the used for system users.

       In  brief,  to use SRP you need to create two files. These are the password file that holds the users and  the  verifiers  associated  with
       them  and  the configuration file to hold the group parameters (called tpasswd.conf).

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       -i number, --index=number
              specify the index of the group parameters in tpasswd.conf to use.  This option takes an integer number as its argument.  The default
              number for this option is:
                   1

       -u string, --username=string
              specify a username.

       -p string, --passwd=string
              specify a password file.

       -s number, --salt=number
              specify salt size.  This option takes an integer number as its argument.

       --verify
              just verify the password..

              Verifies the password provided against the password file.

       -v string, --passwd-conf=string
              specify a password conf file..

              Specify a filename or a PKCS #11 URL to read the CAs from.

       --create-conf=string
              Generate a password configuration file..

              This generates a password configuration file (tpasswd.conf) containing the required for TLS parameters.

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXAMPLES
       To create tpasswd.conf which holds the g and n values for SRP protocol (generator and a large prime), run:
           $ srptool --create-conf /etc/tpasswd.conf

       This command will create /etc/tpasswd and will add user 'test' (you will also be prompted for a password). Verifiers are stored by default
       in the way libsrp expects.
           $ srptool --passwd /etc/tpasswd --passwd-conf /etc/tpasswd.conf -u test

       This command will check against a password. If the password matches the one in /etc/tpasswd you will get an ok.
           $ srptool --passwd /etc/tpasswd --passwd-conf /etc/tpasswd.conf --verify -u test

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
           gnutls-cli-debug (1), gnutls-serv (1), srptool (1), psktool (1), certtool (1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the srptool option definitions.

3.4.10                                                              2019-05-28                                                          srptool(1)
