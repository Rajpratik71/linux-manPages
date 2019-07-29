NTP-KEYGEN(8)                                                 System Manager's Manual                                                NTP-KEYGEN(8)

NAME
       ntp-keygen - generate public and private keys

SYNOPSIS
       ntp-keygen  [  -deGgHIMnPT ] [ -c [RSA-MD2 | RSA-MD5 | RSA-SHA | RSA-SHA1 | RSA-MDC2 | RSA-RIPEMD160 | DSA-SHA | DSA-SHA1 ] ] [ -i name ] [
       -p password ] [ -S [ RSA | DSA ] ] [ -s name ] [ -v nkeys ]

DESCRIPTION
       This program generates cryptographic data files used by the NTPv4 authentication and identification schemes. It  generates  MD5  key  files
       used  in  symmetric  key  cryptography. In addition, if the OpenSSL software library has been installed, it generates keys, certificate and
       identity files used in public key cryptography. These files are used for cookie encryption, digital signature and challenge/response  iden‐
       tification algorithms compatible with the Internet standard security infrastructure.

SEE ALSO
       /usr/share/doc/ntp-doc/html/keygen.html for the full documentation.

Network Time Protocol                                             October 7, 2006                                                    NTP-KEYGEN(8)
