goldeneye(1)                                                    HTTP DoS test tool                                                    goldeneye(1)

NAME
       goldeneye - HTTP DoS test tool

SYNOPSIS
       goldeneye <URL> [OPTIONS]

DESCRIPTION
       GoldenEye  is a HTTP DoS Test Tool. This tool can be used to test if a site is susceptible to Deny of Service (DoS) attacks. Is possible to
       open several parallel connections against a URL to check if the web server can be compromised.

       The program tests the security in networks and uses 'HTTP Keep Alive + NoCache' as attack vector.

OPTIONS
       -u, --useragents
              File with user-agents to use. Default: randomly generated. On Debian systems, there are lists of user-agents  at  /usr/share/golden‐
              eye/useragents/ directory.

       -w, --workers
              Number of concurrent workers. Default: 10.

       -s, --sockets
              Number of concurrent sockets. Default: 500.

       -m, --method
              HTTP method to use. Values: 'get', 'post' and 'random'. Default: get.

       -d, --debug
              Enable debug mode [more verbose output].

       -h, --help
              Show this help.

NOTES
       GoldenEye can create several concurrent workers and it can use all local resources.  Choose good parameters to avoid local problems.

AUTHOR
       GoldenEye was written by Jan Seidl <jseidl@wroot.org>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

GOLDENEYE 1.2.0                                                      Mar 2016                                                         goldeneye(1)
