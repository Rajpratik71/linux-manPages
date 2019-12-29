pdfsig(1)                               General Commands Manual                              pdfsig(1)

NAME
       pdfsig - Portable Document Format (PDF) digital signatures tool

SYNOPSIS
       pdfsig [options] [PDF-file]

DESCRIPTION
       pdfsig  verifies  the  digital  signatures in a PDF document.  It also displays the identity of
       each signer (commonName field and full distinguished name of the signer certificate), the  time
       and  date  of  the signature, the hash algorithm used for signing, the type of the signature as
       stated in the PDF and the signed ranges with a statement wether the total document is signed.

       The signer certificate validation uses the trusted certificates stored in the Network  Security
       Services (NSS) Database. The NSS Database is searched for in the following locations:

       •      If the -nssdir option is specified, the directory specified by this option.

       •      The  NSS  Certificate database in the default Firefox profile. i.e. $HOME/.mozilla/fire‐
              fox/*.default.

       •      The NSS Certificate database in /etc/pki/nssdb.

OPTIONS
       -nssdir [prefix]directory
              Specify the database directory containing the certificate and key  database  files.  See
              certutil(1) -d option for details of the prefix. If not specified the other search loca‐
              tions described in DESCRIPTION are used.

       -nocert
              Do not validate the certificate.

       -dump  Dump all signatures into current directory.

       -v     Print copyright and version information.

       -h     Print usage information.  (-help and --help are equivalent.)

AUTHOR
       The pdfsig software and documentation are copyright 1996-2004 Glyph & Cog,  LLC  and  copyright
       2005-2015 The Poppler Developers - http://poppler.freedesktop.org

SEE ALSO
       pdfdetach(1),  pdffonts(1), pdfimages(1), pdfinfo(1), pdftocairo(1), pdftohtml(1), pdftoppm(1),
       pdftops(1), pdftotext(1) pdfseparate(1), pdfunite(1) certutil(1)

                                            28 October 2015                                  pdfsig(1)
