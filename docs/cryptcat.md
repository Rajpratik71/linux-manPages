cryptcat(1)                                                          Cryptcat                                                          cryptcat(1)

NAME
       cryptcat - twofish encryption enabled version of nc(1)

SYNOPSIS
       cryptcat -k secret [-options] hostname port[s] [ports]
       cryptcat -k secret -l -p port [-options] [hostname] [port]

DESCRIPTION
       This  manual  page  documents briefly the cryptcat command.  This manual page was written for the Debian GNU/Linux distribution because the
       original program does not have a manual page. It only documents the features specific to cryptcat and not the features that  are  described
       at length in the manpage for nc(1).
       If you do not know nc then the chances are you won't have much use for this manpage.

       cryptcat  can  act  as a tcp or udp client or server - connecting to or listening on a socket, while otherwise working as the standard Unix
       command cat(1).

       cryptcat takes a password as a salt to encrypt the data being sent over the connection.  Without a specified password cryptcat will default
       to  the  hardcoded  password  ``metallica''. Needless to say, failure to specify a different password makes the connection as good as unen‐
       crypted.

OPTIONS
       This programs does not follow the usual GNU command line syntax, with long options starting with  two  dashes  (`-').   A  summary  of  the
       options specific to cryptcat is included below.

       -h
              Show summary of options.

       -k secret password
              Change the shared secret password to be used to establish a connection.

BUGS
       This version of cryptcat does not support the -e command command line option available in some versions of nc.

SEE ALSO
       nc(1), cat(1).
       /usr/share/doc/cryptcat/README.gz
       /usr/share/doc/cryptcat/README.cryptcat
       /usr/share/doc/cryptcat/README.Debian

AUTHOR
       The original netcat was written by hobbit@avian.org.

       cryptcat is the work of farm9 <info@farm9.org> with the help of Dan F, Jeff Nathan, Matt W, Frank Knobbe, Dragos, Bill Weiss, Jimmy.

       This manual page was written by Lars Bahner <bahner@debian.org> for Debian.

Debian GNU/Linux                                                  August 9, 2001                                                       cryptcat(1)
