RAZOR-ADMIN(1p)                                         User Contributed Perl Documentation                                        RAZOR-ADMIN(1p)

NAME
       "razor-admin" - Razor Registering Agent

SYNOPSIS
           razor-admin [options]  [ -register | -create | -discover ]

DESCRIPTION
       "razor-admin" is the Razor Agent that performs administrative functions, most notably registering (-register)

USAGE
       "razor-admin" must have one of the following arguments:

       "-register"
           Registers a new identity, used for authenticating with Razor Nomination Servers.  Identities are a user + password pair stored in
           "<razorhome>/identity-<user>".  The first time "razor-admin -register" exits successfully, a symlink "identity" is created to point to
           the active "identity-<user>" file. After that, new identities can be created, but in order to use them the symlink "identity" must be
           changed to point to them. In general, it should be called once from the command line. Exits 0 for success, exits 1 on failure with a
           human-readable output message.

           Both razor-report(1) and razor-revoke(1) require user authentication to work, razor-check(1) does not. This allows the Razor Nomination
           Server to keep track of how many messages a user reports and revokes. The more messages a user correctly reports and/or correctly
           revokes, the more trust the user earns. Likewise, when messages are incorrectly reported or revoked, the trust goes down for that user.
           Highly trusted users will have the most affect on the Razor database.

       "-discover"
           Force discovery.  This will create "server.*.lst" files in <razorhome>.

       "-create"
           Explicitly creates "razor-agent.conf" file in <razorhome>, as well as <razorhome> if it does not exist.  Normally loads
           "/etc/razor/razor-agent.conf" if it exists, using defaults for anything not found.  Does not attempt to register with server, but will
           do discovery, see "-discover".

OPTIONS
       "razor-admin" takes following optional arguments:

       "-h"
           Print a usage message and exit.

       "-v"
           Print the version number and exit.

       "-d | --verbose"
           Print debugging information.

       "-debuglevel=n | -dl=n"
           Set debug level to 'n'.  Default is 3 without "-d" option, 9 with.

       "-s"
           Simulate a check. Do everything except talk to the server.

       "-conf=filename"
           Specifies an alternate configuration file.  If not specified, it is computed, see razor-agents(1) manpage for details.  See
           razor-agent.conf(5) manpage for various configuration options.  The default is "<razorhome>/razor-agent.conf".

       "-home=directory"
           Specify razorhome directory.  This is where the configuration file, logfiles, identities, and server files live.  If not specified, it
           is computed, see razor-agents(1) manpage for details.

       "-logfile=file"
           Specify file to log to instead of what is in the configuration file.  The default is "<razorhome>/razor-agent.log".

       "-ident=filename"
           Specify an identify file to use for storing a newly registered identity.  If not specified, "<razorhome>/identity-<user>" is used.

       "-rs=razor.server.com"
           Use this Razor Nomination Server instead of reading "servers.nomination.lst".

       "-user=user@domain.com"
           Request to be known as this username. Must be less than 64 chars and may contain A-Z, a-z, 0-9, as well printable chars [ex: - _ @ . +
           / ]. If not specified, a username will be assigned. Razor users are encouraged to use their email addresses as their username.

       "-pass=password"
           Request this password.  Valid chars are the same as for -user.  If not specified, it will be assigned.

       "-l"
           The identity created during this "razor-admin" becomes the default.  Normally, the first identity file created by "razor-admin" is the
           default one used.

EXAMPLES
       razor-admin -d -create
           With no global razorhome defined (default) in /etc/razor/razor-agents.conf, creates .razor directory in user's home directory.

           With global razorhome defined in /etc/razor/razor-agents.conf, will try to use that one, will fail if it does not have correct
           permissions.

       razor-admin -register
           Registers a new identity, storing it in <lt>razorhome<gt>.  User and pass will be server generated.  An identity is required for
           razor-report(1) and razor-revoke(1).

       razor-admin -register -user me@a.com
           Attempts to register a new identity using the user name 'me\@a.com'.  Will fail if user is already taken.

       razor-admin -d -create -home=/home/me/.razor
           Creates .razor directory in user's home directory, which will then be the default home unless specified from cmd-line.  Sends debugging
           information to stdout, and does not talk to any Razor Servers.

       razor-admin -d -create -home=/etc/razor
           Creates global razorhome, /etc/razor.  This is the magic directory that will be consulted if no razorhome is specified on the cmd-line
           or found in user's home directory.

AUTHORS
       Vipul Ved Prakash <mail@vipul.net>, and Chad Norwood <chad@samo.org>

SEE ALSO
       razor-agents(1), razor-agent.conf(5), razor-check(1), razor-report(1), razor-revoke(1), razor-whitelist(5)

LICENSE
       This is free software, distributed under the Artistic License 2.0.

perl v5.22.1                                                        2008-07-21                                                     RAZOR-ADMIN(1p)
