REMOTECTL(8)                                                                                      remotectl                                                                                      REMOTECTL(8)



NAME
       remotectl - Remote Access Configuration

SYNOPSIS
       remotectl {COMMAND} [OPTIONS...]

DESCRIPTION
       The remotectl program will configure remote access to the system. Currently it manages cockpit's SSL certificate.

COMMANDS
       certificate
           Manage Cockpit's SSL certificate. If used without options will check if cockpit has a valid certificate without making any changes.

           --ensure Ensure that a certificate exists and can be loaded. Certificate will be created if it does not already exist.

           --user username The unix user that should own the certificate. Only takes effect if used with --ensure.

           --group groupname The unix group that should read the certificate. Only takes effect if used with --ensure.

           If any additional arguments are given, they are treated as files that should be combined to create a certificate file. If the combined files validate, they will be saved in the appropriate
           location using the name of the first file given with the extension changed to .cert. For example:

           remotectl certificate server.pem chain.pem key.pem

           will result in server.cert. If server.cert already exists it will be overwritten.

OPTIONS
       --help
           Show help options.

       --verbose
           Print verbose messages about the task

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker[1].

AUTHOR
       Cockpit has been written by many contributors[2].

SEE ALSO
       cockpit-ws(8)

NOTES
        1. upstream bug tracker
           https://github.com/cockpit-project/cockpit/issues/new

        2. contributors
           https://github.com/cockpit-project/cockpit/



cockpit                                                                                           09/15/2019                                                                                     REMOTECTL(8)
