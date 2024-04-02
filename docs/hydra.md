HYDRA(1)                                                      General Commands Manual                                                     HYDRA(1)

NAME
       hydra - a very fast network logon cracker which support many different services

SYNOPSIS
       hydra
        [[[-l LOGIN|-L FILE] [-p PASS|-P FILE|-x OPT]] | [-C FILE]] [-e nsr]
        [-u] [-f] [-F] [-M FILE] [-o FILE] [-t TASKS] [-w TIME] [-W TIME]
        [-m OPTIONS] [-s PORT] [-S] [-4/6] [-vV] [-d]
        server service [OPTIONS]

DESCRIPTION
       Hydra is a parallelized login cracker which supports numerous protocols to attack. New modules are easy to add, beside that, it is flexible
       and very fast.

       This tool gives researchers and security consultants the possibility to show how easy it would be to gain unauthorized access  from  remote
       to a system.

       Currently this tool supports:
        AFP, Cisco AAA, Cisco auth, Cisco enable, CVS, Firebird, FTP, FTPS,
        HTTP-FORM-GET, HTTP-FORM-POST, HTTP-GET, HTTP-HEAD, HTTP-PROXY,
        HTTP-PROXY-URLENUM, ICQ, IMAP, IRC, LDAP2, LDAP3, MS-SQL, MYSQL, NCP, NNTP,
        Oracle, Oracle-Listener, Oracle-SID, PC-Anywhere, PCNFS, POP3, POSTGRES,
        RDP, REXEC, RLOGIN, RSH, SAP/R3, SIP, SMB, SMTP, SMTP-Enum, SNMP,
        SOCKS5, SSH(v1 and v2), SSHKEY, Subversion, Teamspeak (TS2), Telnet,
        VMware-Auth, VNC and XMPP.
        For most protocols, SSL mode is available (e.g. https-get, ftp-ssl, etc.)
        If not all necessary libraries are found during compile time, your
        available services will be less. Type "hydra" to see what is available.

Options
       target a target to attack, can be an IPv4 address, IPv6 address or DNS name.

       service
              a service to attack, see the list of protocols available

       OPTIONAL SERVICE PARAMETER
              Some modules have optional or mandatory options. type "hydra -U <servicename>"
               to get help on on the options of a service.

       -R     restore a previously aborted session. Requires a hydra.restore file was written. No other options are allowed when using -R

       -S     connect via SSL

       -s PORT
              if the service is on a different default port, define it here

       -l LOGIN
              or -L FILE login with LOGIN name, or load several logins from FILE

       -p PASS
              or -P FILE try password PASS, or load several passwords from FILE

       -x min:max:charset
              generate passwords from min to max length. charset can contain 1
               for numbers, a for lowcase and A for upcase characters.
               Any other character is added is put to the list.
                 Example: 1:2:a1%.
                 The generated passwords will be of length 1 to 2 and contain
                 lowcase letters, numbers and/or percent signs and dots.

       -e nsr additional checks, "n" for null password, "s" try login as pass, "r" try the reverse login as pass

       -C FILE
              colon separated "login:pass" format, instead of -L/-P options

       -u     by  default  Hydra  checks all passwords for one login and then tries the next login. This option loops around the passwords, so the
              first password is tried on all logins, then the next password.

       -f     exit after the first found login/password pair (per host if -M)

       -F     exit after the first found login/password pair for any host (for usage with -M)

       -M FILE
              server list for parallel attacks, one entry per line

       -o FILE
              write found login/password pairs to FILE instead of stdout

       -t TASKS
              run TASKS number of connects in parallel (default: 16)

       -m OPTIONS
              module specific options. See hydra -U <module> what options are available.

       -w TIME
              defines the max wait time in seconds for responses (default: 32)

       -W TIME
              defines a wait time between each connection a task performs. This usually only makes sense if a low task number is used, .e.g -t 1

       -4 / -6
              prefer IPv4 (default) or IPv6 addresses

       -v / -V
              verbose mode / show login+pass combination for each attempt -d debug mode

       -h, --help
              Show summary of options.

SEE ALSO
       xhydra(1), pw-inspector(1).
       The programs are documented fully by van Hauser <vh@thc.org>

AUTHOR
       hydra was written by van Hauser / THC <vh@thc.org>

       This manual page was written by Daniel Echeverry <epsilon77@gmail.com>, for the Debian project (and may be used by others).

                                                                    24/05/2012                                                            HYDRA(1)
