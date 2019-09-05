LOGIN_DUO(8)                                                BSD System Manager's Manual                                               LOGIN_DUO(8)

NAME
     login_duo — second-factor authentication via Duo login service

SYNOPSIS
     login_duo [-d] [-c file] [-h host] [-f user] [command [args...]]

DESCRIPTION
     login_duo provides secondary authentication via the Duo authentication service, executing the user's login shell or command only if success‐
     ful.

     The following options are available:

     -c        Specify an alternate configuration file to load. Default is /etc/duo/login_duo.conf

     -d        Debug mode; send logs to stderr instead of syslog.

     -h        Specify the remote IP address for this login (normally taken from the SSH_CONNECTION environment variable, if set).

     -f        Specify an alternate Duo user to authenticate as.

     If login_duo is installed setuid root (the default), these options are only available to the super-user.

     After successful Duo authentication, the user's login shell is invoked, or if an alternate command or SSH_ORIGINAL_COMMAND environment vari‐
     able is specified, it will be executed via the user's shell with a -c option.

CONFIGURATION
     The INI-format configuration file must have a “duo” section with the following options:

     host      Duo API host (required).

     ikey      Duo integration key (required).

     skey      Duo secret key (required).

     groups    If specified, Duo authentication is required only for users whose primary group or supplementary group list matches one of the
               space-separated pattern-lists (see PATTERNS below).

     failmode  On service or configuration errors that prevent Duo authentication, fail “safe” (allow access) or “secure” (deny access). Default
               is “safe”.

     pushinfo  Send command to be approved via Duo Push authentication. Default is “no”.

     http_proxy
               Use the specified HTTP proxy, same format as the HTTP_PROXY environment variable.

     autopush  Upon successful first-factor authentication, automatically send a login request to the primary second-factor (usually Duo Push).
               Can be “yes” or “no”.  Default is “no”.

     motd      Print the contents of /etc/motd to screen after a successful login. Either "yes" or "no."  Default is "no".

     prompts   Number of login attempts a user gets. Default is 3. If using autopush, it is recommended to set prompts to 1.

     accept_env_factor
               Look for factor selection or passcode in the DUO_PASSCODE environment variable, before prompting the user. Can override autopush.
               Default is "no".

     fallback_local_ip
               If unable to determine the authentication users's IP address, fallback on the IP address of the server. Default is "no".

     An example configuration file:

             [duo]
             host = api-deadbeef.duosecurity.com
             ikey = SI9F...53RI
             skey = 4MjR...Q2NmRiM2Q1Y
             pushinfo = yes
             autopush = yes

     If installed setuid root (the default), login_duo performs Duo authentication as a dedicated privilege separation user, requiring that the
     configuration file be owned and readable only by this user.

PATTERNS
     A pattern consists of zero or more non-whitespace characters, ‘*’ (a wildcard that matches zero or more characters), or ‘?’ (a wildcard that
     matches exactly one character).

     A pattern-list is a comma-separated list of patterns. Patterns within pattern-lists may be negated by preceding them with an exclamation mark
     (‘!’).  For example, to specify Duo authentication for all users (except those that are also admins), and for guests:

           groups = users,!wheel,!*admin guests

EXAMPLES
     login_duo can be enabled system-wide by specifying its full path as a ForceCommand in sshd_config(5) to capture any SSH remote login (includ‐
     ing subsystems, remote commands, and interactive login):

             ForceCommand /usr/local/sbin/login_duo

     Similarly, a group of administrators could require two-factor authentication for login to a shared root account by specifying login_duo as
     the forced command for each public key in ~root/.ssh/authorized_keys:

             command="/usr/local/sbin/login_duo -f alice"
             ssh-rsa AAAAB2...19Q== alice@example.net
             command="/usr/local/sbin/login_duo -f bob"
             ssh-dss AAAAC3...51R== bob@example.net

     A user without root access could configure their own account to require Duo authentication via the same ~/.ssh/authorized_keys forced command
     mechanism and a user-installed (non-setuid) login_duo.

FILES
     /etc/duo/login_duo.conf
               Default configuration file path

AUTHORS
     login_duo was written by Duo Security <support@duosecurity.com>

NOTES
     When used to protect remote SSH access, only interactive sessions support interactive Duo login. For scp(1), sftp(1), rsync(1), and other
     ssh(1) remote commands, login_duo automatically tries the user's default out-of-band factor (smartphone push or voice callback) and disables
     real-time login progress reporting to provide a clean shell environment.

BSD                                                              September 3, 2010                                                             BSD
