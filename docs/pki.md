pki(1)                                                                                 PKI Command-Line Interface (CLI)                                                                                pki(1)



NAME
       pki - Command-Line Interface for accessing Certificate System services.


SYNOPSIS
       pki [CLI options] <command> [command arguments]


DESCRIPTION
       The  pki command provides a command-line interface allowing clients to access various services on the Certificate System server.  These services include certificates, groups, keys, security domains,
       and users.


CLI OPTIONS
       -c <client security database password>
              Specifies the client security database password (mutually exclusive to the '-C' option).

       -C <client-side password file>
              Specifies the file which contains the client security database password (mutually exclusive to the '-c' option).

       -d <client security database location>
              Specifies the client security database location (default: ~/.dogtag/nssdb).

       -h <hostname>
              Specifies the hostname (default: hostname of the local machine).

       --help Prints additional help information.

       --ignore-cert-status <list>
              Comma-separated list of ignored certificate validity statuses.

       --message-format <format>
              Message format: xml (default), json.

       -n <client certificate nickname>
              Specifies the nickname for client certificate authentication (mutually exclusive to the '-u' option). This authentication requires a security database password.

       --output <folder>
              Folder to store HTTP messages.

       -P <protocol>
              Specifies the protocol (default: http).

       -p <port>
              Specifies the port (default: 8080).

       --reject-cert-status <list>
              Comma-separated list of rejected certificate validity statuses.  PKI subsystem type - [CA, KRA, OCSP, TKS, or TPS] (non-case-sensitive).

       -t <type>
              Subsystem type.

       --token
              Security token name

       -U <URI>
              Specifies the server URI.

       -u <username>
              Specifies the username for basic authentication (mutually exclusive to the '-n' option). This authentication requires a user password.

       -v, --verbose
              Displays verbose information.

       --version
              Displays CLI version information.

       -w <password>
              Specifies the user password (mutually exclusive to the '-W' option).

       -W <client-side password file>
              Specifies the file which contains the user password (mutually exclusive to the '-w' option).


OPERATIONS
       To view available commands and options, simply type pki.  Some commands have sub-commands.  To view the sub-commands, type pki <command>.  To view each command's usage, type  pki <command> --help.

       A client security database is needed to execute commands that require SSL connection or client certificate for authentication. See pki-client(1) for more information.


   Connection
       By default, the CLI connects to a server running on the local machine via the non-secure HTTP port 8080.  To specify a different server location, use the appropriate arguments to  give  a  different
       host (-h), port (-p), or connection protocol (-P).

       pki -P <protocol> -h <hostname> -p <port> <command>

       Alternatively, the connection parameters can be specified as a URI:

       pki -U <URI> <command>

       where the URI is of the format <protocol>://<hostname>:<port>.


   Authentication
       Some  commands  require  authentication. These are commands that are restricted to particular sets of users (such as agents or admins) or those operations involving certificate profiles that require
       authentication.

       To execute a command without authentication:

       pki <command>

       To execute a command using basic authentication (i. e. - username/password), see the Basic Authentication section of this man page.

       To execute a command using client authentication (i. e. - client certificate), see the Client Authentication section of this man page.


   Basic Authentication
       To authenticate with a username and password:

       pki -u <username> -w <password> <command>

       Rather than being exposed in plaintext on the command-line, user passwords may be stored in a file instead.  See Client-side Password Files for detailed information.

       To authenticate with a username by obtaining the user password from a client-side password file:

       pki -u <username> -W <client-side password file> <command>

       Finally, if a username has been specified on the command-line, and neither the '-W <client-side password file>' nor the '-w <password>' options have been utilized, the password will be prompted for.

       To authenticate with a username by interactively prompting for a password:

       pki -u <username> <command>

       Note: Prompting for a user password is not suitable for automated batch processing.


   Client Authentication Setup
       A client certificate associated with the desired PKI server must be used for client authentication. This can be done by importing the client certificate into an NSS security database and passing the
       values to the relevant options provided by the pki CLI framework.

       To achieve this, execute the following commands to set up an NSS security database for use by the pki client, import the client certificate into the NSS database, and list information (including the
       nickname of the client certificate) stored in the NSS database:

       - certutil -N -d <CERT_DB_DIR_PATH>

       - pk12util -i <Agent_Cert_P12_FILE_PATH> -d <CERT_DB_DIR_PATH>

       - certutil -L -d <CERT_DB_DIR_PATH>

       The first command creates a client security database, and asks the client user to enter a password for this NSS database.

       The second command imports a client certificate stored in a PKCS12 format into this NSS database; it prompts for the passwords of the PKCS12 file and the  client  security  database.   The  simplist
       example  of  such a client certificate is to obtain the administrator certificate created during the configuration portion of the basic PKI installation of the associated PKI server (e. g. - located
       at /root/.dogtag/pki-tomcat/ca_admin_cert.p12 on the PKI server machine).

       The third command shows the information about the imported client certificate (including its nickname).

       Note: When issuing the first pki command using the authentication parameters (after completion of the setup of the client security database), a user may be greeted with a warning message which indi‐
       cates that an untrusted issuer was encountered.  Simply reply 'Y' to import the CA certificate, and, presuming that the displayed CA server URL is valid, press the carriage return.


   Client Authentication
       To authenticate with a client certificate:

       pki -d <client security database location> -c <client security database password> -n <client certificate nickname> <command>

       Alternatively, to prevent exposure via the command-line, a client security database may store their password in a file instead. See Client-side Password Files for detailed information.

       To authenticate with a client certificate by obtaining the client security database password from a client-side password file:

       pki -d <client security database location> -C <client-side password file> -n <client certificate nickname> <command>

       Finally, if a client certificate has been specified on the command-line, and neither the '-C <client-side password file>' nor the '-c <client security database password>' options have been utilized,
       the client security database password will be prompted for.

       To authenticate with a client certificate by interactively prompting for a client security database password:

       pki -d <client security database location> -n <client certificate nickname> <command>

       Note: Prompting for a client security database password is not suitable for automated batch processing.


   Client-side Password Files
       Both the '-C' (client authentication) and the '-W' (basic authentication) options require the use of a client-side password file.

       For security purposes, client-side password files should be, at a minimum, operating system protected non-world readable files.

       Client-side password files generally store a password in an equals-sign-delimited plaintext format 'token=password' (e. g. - 'internal=foobar' where 'internal' is the token, '='  is  the  delimiter,
       and 'foobar' is the actual password).  The token keyword 'internal' is the default specification for a token, and refers to the "Internal Key Storage Token".  If a client-side password file is being
       used for the sole purposes of the pki command-line tool, a client-side password file also supports the format that merely consists of the plaintext password on a single line (read the Caveats  which
       follow).

       Caveats:

              ·  Since  client-side  password  files  are allowed to use the 'token=password' format, the first '=' character can only be used as a delimiter (i. e. - it cannot be used as a valid character
              within the 'token' name) as escaping the '=' character within a token is not supported.

              · When specifying a password which contains an '=' character, always specify an initial '=' prior to specifying the actual password (mandatory when no token has been  specified)  as  escaping
              the '=' character within a password is not supported.

              · Tokens do not support leading or trailing whitespace since these characters are stripped prior to their use; however, all whitespace inside tokens will be preserved.

              · Passwords preserve all leading, trailing, and internal whitespace since passwords are not trimmed prior to their use.

              ·  TBD:  Supply  code  to handle the case of a non-internal token (e. g. - 'hardware-nethsm' utilized in the following examples) since the current code ignores the specified token (i. e. - it
              always utilizes the default 'internal' token no matter what is currently specified).

              · TBD: Allow numerous 'token=password' lines in a single client-side password file to support the ability to authenticate against specified tokens as well as multiple tokens.


       Valid examples include:

       internal=foobar
          where:  token="internal", password="foobar"

       hardware-nethsm=foobar
          where:  token="hardware-nethsm" (ignored - TBD), password="foobar"

       internal=ack=bar
          where:  token="internal", password="ack=bar"

       hardware-nethsm=ack=bar
          where:  token="hardware-nethsm" (ignored - TBD), password="ack=bar"

       =foobar
          where:  token="internal" (default), password="foobar"

       =foo=bar
          where:  token="internal" (default), password="foo=bar"
                  (Since the password contains an '=' character,
                   an initial '=' character must be specified!)

       foobar
          where:  token="internal" (default), password="foobar"


   Results Paging
       Some commands (e.g. cert-find) may return multiple results. Since the number of results may be large, the results are split into multiple pages. By default the command will  return  only  the  first
       page (e.g. the first 20 results). To retrieve results from another page, additional paging parameters can be specified:

       * start: index of the first result to return (default: 0)
       * size: number of results to return (default: 20)

       For example, to retrieve the first page (index #0-#19):

       pki cert-find --start 0 --size 20

       To retrieve the second page (index #20-#39):

       pki cert-find --start 20 --size 20

       To retrieve the third page (index #40-#59):

       pki cert-find --start 40 --size 20


FILES
       /usr/bin/pki


SEE ALSO
       pki-cert(1)
           Certificate management commands


       pki-client(1)
           Client security database management commands


       pki-group(1)
           Group management commands


       pki-group-member(1)
           Group member management commands


       pki-key(1)
           Key management commands


       pki-securitydomain(1)
           Security domain management commands


       pki-user(1)
           User management commands


       pki-user-cert(1)
           User certificate management commands


       pki-user-membership(1)
           User membership management commands


       pki-ca-profile(1)
           Profile management commands


AUTHORS
       Ade Lee <alee@redhat.com>, Endi Dewata <edewata@redhat.com>, and Matthew Harmsen <mharmsen@redhat.com>.


COPYRIGHT
       Copyright  (c)  2012  Red  Hat,  Inc.  This  is  licensed  under  the  GNU  General  Public  License,  version  2  (GPLv2).  A  copy  of this license is available at http://www.gnu.org/licenses/old-
       licenses/gpl-2.0.txt.



version 10.2                                                                                     May 5, 2014                                                                                           pki(1)
