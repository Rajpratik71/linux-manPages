make-ssl-cert(8)                                                                        System Manager's Manual                                                                       make-ssl-cert(8)

NAME
       make-ssl-cert - Debconf wrapper for openssl

SYNOPSIS
       make-ssl-cert template output-certificate [--force-overwrite]
       make-ssl-cert generate-default-snakeoil [--force-overwrite]

DESCRIPTION
       make-ssl-cert  is  a simple debconf to openssl wrapper to create self-signed certificates.  It requires a source template (Ex: /usr/share/ssl-cert/ssleay.cnf) and it will place the new gener‐
       ated certificate in the specified output file.
       Invoked with "generate-default-snakeoil", it will generate /etc/ssl/certs/ssl-cert-snakeoil.pem and /etc/ssl/private/ssl-cert-snakeoil.key.

OPTIONS
       A summary of options are included below.

       --force-overwrite
              Use this option ONLY when strictly required since it will overwrite the output certificate.

SEE ALSO
       openssl(1)

AUTHOR
       The program author is Thom May <thom@debian.org>, manual page was written for completness by Fabio M. Di Nitto <fabbione@fabbione.net>, for the Debian GNU/Linux system (but  may  be  used  by
       others).

                                                                                                                                                                                      make-ssl-cert(8)
