psktool(1)                                                         User Commands                                                        psktool(1)

NAME
       psktool - GnuTLS PSK tool

SYNOPSIS
       psktool [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       Program  that generates random keys for use with TLS-PSK. The keys are stored in hexadecimal format in a key file.

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       -s number, --keysize=number
              specify the key size in bytes.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 512

       -u string, --username=string
              specify a username.

       -p string, --passwd=string
              specify a password file.

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXAMPLES
       To add a user 'psk_identity' in passwd.psk for use with GnuTLS run:
           $ ./psktool -u psk_identity -p passwd.psk
           Generating a random key for user 'psk_identity'
           Key stored to passwd.psk
           $ cat psks.txt
           psk_identity:88f3824b3e5659f52d00e959bacab954b6540344
           $

       This command will create passwd.psk if it does not exist and will add user 'psk_identity' (you will also be prompted for a password).

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
           gnutls-cli-debug (1), gnutls-serv (1), srptool (1), certtool (1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the psktool option definitions.

3.4.10                                                              2019-05-28                                                          psktool(1)
