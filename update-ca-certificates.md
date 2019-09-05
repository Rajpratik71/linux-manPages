UPDATE-CA-CERTIFICATES(8)                                                               System Manager's Manual                                                              UPDATE-CA-CERTIFICATES(8)

NAME
       update-ca-certificates - update /etc/ssl/certs and ca-certificates.crt

SYNOPSIS
       update-ca-certificates [options]

DESCRIPTION
       This manual page documents briefly the update-ca-certificates command.

       update-ca-certificates is a program that updates the directory /etc/ssl/certs to hold SSL certificates and generates ca-certificates.crt, a concatenated single-file list of certificates.

       It  reads  the  file  /etc/ca-certificates.conf. Each line gives a pathname of a CA certificate under /usr/share/ca-certificates that should be trusted.  Lines that begin with "#" are comment
       lines and thus ignored.  Lines that begin with "!" are deselected, causing the deactivation of the CA certificate in question. Certificates must have a .crt extension in order to be  included
       by update-ca-certificates.

       Furthermore all certificates with a .crt extension found below /usr/local/share/ca-certificates are also included as implicitly trusted.

       Before terminating, update-ca-certificates invokes run-parts on /etc/ca-certificates/update.d and calls each hook with a list of certificates: those added are prefixed with a +, those removed
       are prefixed with a -.

OPTIONS
       A summary of options is included below.

       -h, --help
              Show summary of options.

       -v, --verbose
              Be verbose. Output openssl rehash.

       -f, --fresh
              Fresh updates.  Remove symlinks in /etc/ssl/certs directory.

FILES
       /etc/ca-certificates.conf
              A configuration file.

       /etc/ssl/certs/ca-certificates.crt
              A single-file version of CA certificates.  This holds all CA certificates that you activated in /etc/ca-certificates.conf.

       /usr/share/ca-certificates
              Directory of CA certificates.

       /usr/local/share/ca-certificates
              Directory of local CA certificates (with .crt extension).

SEE ALSO
       openssl(1)

AUTHOR
       This manual page was written by Fumitoshi UKAI <ukai@debian.or.jp>, for the Debian project (but may be used by others).

                                                                                             20 April 2003                                                                   UPDATE-CA-CERTIFICATES(8)
