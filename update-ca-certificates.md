UPDATE-CA-CERTIFICATES(8)                                                                  System Manager's Manual                                                                  UPDATE-CA-CERTIFICATES(8)



NAME
       update-ca-certificates - update system CA certificates

SYNOPSIS
       update-ca-certificates [options]

DESCRIPTION
       update-ca-certificates is intended to keep the certificate stores of various components in sync with the system CA certificates.

       The  canonical source of CA certificates is what p11-kit knows about.  By default p11-kit looks into /usr/share/pki/anchors resp /etc/pki/trust/anchors but there could be other plugins that serve as
       source for certificates as well.

       To blacklist certificates symlinks to the respective certificates can be placed in /etc/pki/trust/blacklist

       update-ca-certificates invokes custom hooks in /usr/lib/ca-certificates/update.d/*.run and /etc/ca-certificates/update.d/*.run to generate various certificate storages as used by differnt  programs.
       The command line options used for invoking update-ca-certificates are passed to the hooks as well.

OPTIONS
       A summary of options is included below.

       -h, --help
              Show summary of options.

       -v, --verbose
              Be verbose. Output c_rehash.

       -f, --fresh
              Fresh updates. Don't update stores incrementally but create from scratch.

FILES
       /usr/share/pki/trust/anchors
              Directory of CA certificate trust anchors.

       /usr/share/pki/trust/blacklist
              Directory of blacklisted CA certificates

       /etc/pki/trust/anchors
              Directory of CA certificate trust anchors for use by the admin

       /etc/pki/trust/blacklist
              Directory of blacklisted CA certificates for use by the admin

SEE ALSO
       c_rehash(1),



                                                                                                27 April 2010                                                                       UPDATE-CA-CERTIFICATES(8)
