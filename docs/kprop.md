KPROP(8)                                                                                         MIT Kerberos                                                                                        KPROP(8)



NAME
       kprop - propagate a Kerberos V5 principal database to a slave server

SYNOPSIS
       kprop [-r realm] [-f file] [-d] [-P port] [-s keytab] slave_host

DESCRIPTION
       kprop  is  used to securely propagate a Kerberos V5 database dump file from the master Kerberos server to a slave Kerberos server, which is specified by slave_host.  The dump file must be created by
       kdb5_util(8).

OPTIONS
       -r realm
              Specifies the realm of the master server.

       -f file
              Specifies the filename where the dumped principal database file is to be found; by default the dumped database file is normally /var/kerberos/krb5kdc/slave_datatrans.

       -P port
              Specifies the port to use to contact the kpropd(8) server on the remote host.

       -d     Prints debugging information.

       -s keytab
              Specifies the location of the keytab file.

ENVIRONMENT
       kprop uses the following environment variable:

       · KRB5_CONFIG

SEE ALSO
       kpropd(8), kdb5_util(8), krb5kdc(8)

AUTHOR
       MIT

COPYRIGHT
       1985-2017, MIT




1.15.1                                                                                                                                                                                               KPROP(8)
