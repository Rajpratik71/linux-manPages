lxterm(1)                                                                                General Commands Manual                                                                                lxterm(1)

NAME
       lxterm - locale-sensitive wrapper for xterm

SYNOPSIS
       lxterm [ xterm-options ]

DESCRIPTION
       lxterm  is  a wrapper around the xterm(1) program that invokes xterm, koi8rxterm(1), or uxterm(1) as appropriate, based on the user's locale setting.  All arguments to lxterm are passed to xterm
       without processing; the -class, -k8, and -u8 options should not be specified because they are used by koi8rxterm and uxterm.  See the xterm manual page for more information on xterm-options.

       The locale(1) utility is used to determine the character set used by the current locale.  If the character set is UTF-8, uxterm is invoked; if the character set is KOI8-R, koi8rxtem is  invoked;
       otherwise, ‘plain’ xterm is invoked.

AUTHOR
       Branden Robinson

SEE ALSO
       locale(1), koi8rxterm(1), uxterm(1), xterm(1)

Debian Project                                                                                  2004-12-19                                                                                      lxterm(1)
