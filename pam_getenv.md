PAM_GETENV(8)                     User Contributed Perl Documentation                    PAM_GETENV(8)

NAME
       pam_getenv - get environment variables from /etc/environment

SYNOPSIS
       pam_getenv [-l] [-s] env_var

DESCRIPTION
       This tool  will print out the value of env_var from /etc/environment.  It will attempt to
       expand environment variable references in the definition of env_var but will fail if PAM items
       are expanded.

       The -l option indicates the script should return an environment variable related to default
       locale information.

       The -s option indicates that the script should return an system default environment variable.

       Currently neither the -l or -s options do anything.  They are included because future versions
       of Debian may have a separate repository for the initial environment used by init scripts and
       for system locale information.  These options will allow this script to be a stable interface
       even in that environment.

Debian GNU/Linux                              2019-02-14                                 PAM_GETENV(8)
