openvasmd(8)                                                  System Manager's Manual                                                 openvasmd(8)

NAME
       openvasmd - Manager daemon of the Open Vulnerability Assessment System (OpenVAS)

SYNOPSIS
       openvasmd OPTIONS

DESCRIPTION
       OpenVAS Scanner, openvassd(8), acts as a service and offers a communication protocol for its clients called OTP. The core task of the Open‐
       VAS Scanner is the actual scan process.

       The OpenVAS Manager is a OTP client and adds various management functionalities to handle and organise scan results. Thus  OpenVAS  Manager
       acts  as a layer between the OpenVAS Scanner and its own clients (for example omp(8), gsad(8) or gsd(8)) which connect via the OMP protocol
       to the OpenVAS Manager.

       A related service is OpenVAS Administrator, openvasad(8) which among other tasks also manages user accounts for OpenVAS.

OPTIONS
       -a, --listen=ADDRESS
              Listen on ADDRESS.

       --create-user=USERNAME
              Create admin user USERNAME and exit.

       --role=ROLE
              Role for --create-user option.

       --delete-user=USERNAME
              Delete user USERNAME and exit.

       --get-users
              List users and exit.

       --create-scanner=NAME
              Create scanner NAME and exit.

       --scanner-host=HOST
              Scanner host for --create-scanner, --rebuild and --update. Default is 127.0.0.1.

       --scanner-port=PORT
              Scanner port for --create-scanner, --rebuild and --update. Default is 9391.

       --scanner-type=TYPE
              Type for --create-scanner option. Could be "OpenVAS Scanner" or "OSP Ovaldi".

       --scanner-ca-pub=CAPUB
              Scanner CA public key path for --create-scanner.

       --scanner-key-pub=KEYPUB
              Scanner public key path for --create-scanner.

       --scanner-key-priv=KEYPRIV
              Scanner private key path for --create-scanner.

       --delete-scanner=UUID
              Delete scanner with UUID and exit.

       --get-scanners
              List scanners and exit.

       --gnutls-priorities=PRIORITY
              Set the GnuTLS priority string to PRIORITY.

       --dh-params=FILE
              Path to file containing Diffie-Hellman parameters which are needed for DHE-RSA. This file could be generated using openssl or  cert‐
              tool.

       --max-email-attachment-size=SIZE
              Maximum number of bytes permitted in alert email attachments.

              0 to use the default, negative to allow any size.

       --max-email-include-size=SIZE
              Maximum number of bytes permitted in reports inlined in alert email attachments.

              0 to use the default, negative to allow any size.

       --max-ips-per-target=SIZE
              Maximum number of IPs per target.

       -u, --update
              Updates the database with information from a running scanner (openvassd) and exits.

       -p, --port=NUMBER
              Listen on port number NUMBER.

       --rebuild
              Rebuild the database with information from a running scanner (openvassd) and exits.

       --version
              Print version.

       -v, --verbose
              Print progress messages.

       -?, --help
              Show help.

SIGNALS
       SIGHUP causes openvasmd to rebuild the database with information from the Scanner (openvassd).

EXAMPLES
       openvasmd --port 1241

       Serve OMP clients on port 1241 and connect to a OTP server on 7772.

SEE ALSO
       openvassd(8), openvasad(8), gsad(8), omp(8), gsd(8)

MORE INFORMATION ABOUT THE OPENVAS PROJECT
       The  canonical  places  where  you  will  find  more  information  about  the  OpenVAS project are: http://www.openvas.org/ (Official site)
       http://wald.intevation.org/projects/openvas/ (Development Platform)

COPYRIGHT
       The OpenVAS Manager is released under the GNU GPL, version 2, or, at your option, any later version.

Manuals                                                                User                                                           openvasmd(8)
