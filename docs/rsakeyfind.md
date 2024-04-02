rsakeyfind(1)                                                      User Commands                                                     rsakeyfind(1)

NAME
       rsakeyfind - Locates BER-encoded RSA private keys in memory images.

SYNOPSIS
       rsakeyfind MEMORY-IMAGE [MODULUS-FILE]

DESCRIPTION
       rsakeyfind is a tool that locates BER-encoded RSA private keys in MEMORY-IMAGE.  If a MODULUS-FILE is specified, it will locate private and
       public keys matching the hex-encoded modulus read from this file.

BUGS
       Likely.

SEE ALSO
       aesfix(1), biosmemimage(1), aeskeyfind(1)

AUTHOR
       rsakeyfind was written by Nadia Heninger and J. Alex Halderman.

       This manual page was written by Jacob Appelbaum <jacob@appelbaum.net> for the Debian system (but may be used  by  others).   Permission  is
       granted  to  copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any later version
       published by the Free Software Foundation.

User Commands                                                       08-17-2008                                                       rsakeyfind(1)
