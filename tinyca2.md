TINYCA(1)                                                     General Commands Manual                                                    TINYCA(1)

NAME
       tinyca - Very simple Certification Authority

SYNOPSIS
       tinyca

DESCRIPTION
       This  manual page documents briefly the tinyca command.  This manual page was written for the Debian distribution because the original pro‐
       gram does not have a manual page.

       tinyca is a very simple Certification Authority.  It features a graphical interface to create Certificate Requests, sign them with the  key
       of the Certificate Authority and export the signed certificate and the corresponding keys in various formats.

       Upon first invocation, information for a new Certificate Authority is generated.

OPTIONS
       Tinyca has no commandline options.

FILES
       /etc/tinyca/openssl.cnf
              Openssl configuration for tinyca

       ~/.TinyCA/
              Storage place for the different CAs

SEE ALSO
       openssl(1).

AUTHOR
       This  manual  page  was written by Ulrich Scholler <scholler@fnb.tu-darmstadt.de>, for the Debian GNU/Linux system (but may be used by oth‐
       ers).

                                                                   July  9, 2003                                                         TINYCA(1)
