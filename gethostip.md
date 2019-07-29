GETHOSTIP(1)                                                  General Commands Manual                                                 GETHOSTIP(1)

NAME
       gethostip — convert an IP address into various formats

SYNOPSIS
       gethostip [-dxnf]  [HOSTNAME|IP]

DESCRIPTION
       This manual page documents briefly the gethostip command.

       The  gethostip utility converts the given hostname or IP address into a variety formats.  It is provided by the syslinux package to make it
       easier to calculate the appropriate names for pxelinux configuration files.  These filenames can be the complete hexadecimal representation
       for a given IP address, or a partial hexadecimal representation to match a range of IP addresses.

OPTIONS
       A summary of options is included below.

       -d        Output the IP address in decimal format.

       -x        Output the IP address in hexadecimal format.

       -n        Output the host's canonical name.

       -f        Full output.  Outputs the IP address in all supported formats.  Same as -xdn.

SEE ALSO
       syslinux(1)

       More  details can be found in the pxelinux documentation, which can be found in /usr/share/doc/syslinux/pxelinux.doc.gz on Debian GNU/Linux
       systems.

AUTHOR
       This manual page was compiled by dann frazier <dannf@debian.org> for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                      GETHOSTIP(1)
