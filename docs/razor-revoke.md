RAZOR-REVOKE(1p)                                        User Contributed Perl Documentation                                       RAZOR-REVOKE(1p)

NAME
       "razor-revoke" - Razor Revoking Agent

SYNOPSIS
           razor-revoke [options]  file_with_mail_in_rfc822_format

           $ cat mail | razor-revoke
           $ razor-revoke ./mail
           $ razor-revoke -d ./mail

DESCRIPTION
       "razor-revoke" is the Razor Revoking Agent which is used for reporting messages as NOT spam to a Razor Nomination Server. For instance, it
       can be invoked if a check incorrectly marked a message as spam or after a message was incorrectly reported as spam. "razor-revoke" should
       be generally called from a MUA, although there are no restrictions on invoking it from the command-line. "razor-revoke" is a filter, which
       means that spam messages should be piped through it. By default, "razor-revoke" backgrounds and detaches itself from the control terminal
       at start-up.

       If "razor-revoke" is passed more than one mail, it will revoke each against the database.  Please use this with caution, we don't want the
       database to have inaccurate information.  "razor-revoke" supports mbox-formatted files with 1 or more mails in them as well as files
       containing a single RFC 822 (non-mbox) mail.  More than one file may be present on the command line, can be either a non-mbox or mbox in
       any order.  However, more than one non-mbox mail cannot be read from stdin.

       Both razor-report(1) and "razor-revoke" require user authentication to work, see razor-admin(1). This allows the Razor Nomination Server to
       keep track of how many messages a user reports and revokes. The more messages a user correctly reports and/or correctly revokes, the more
       trust the user earns. Likewise, when messages are incorrectly reported or revoked, the trust goes down for that user. Highly trusted users
       will have the most affect on the Razor database.

       Note that even after a successful revoke, a mail might still be considered spam in the Razor Catalogue. For instance, this can occur if
       more trusted users consider the mail spam than not spam.

USAGE
       "razor-revoke" takes following arguments:

       "-h"
           Print a usage message and exit.

       "-v"
           Print the version number and exit.

       "-d | --verbose"
           Print debugging information.

       "-debuglevel=n | -dl=n"
           Set debug level to 'n'.  Default is 3 without "-d" option, 9 with.

       "-whitelist=file"
           Specify file to use for whitelisting.  Overrides 'whitelist' option in "razor-agent.conf".

       "-s"
           Simulate a check. Do everything except talk to the server.

       "-conf=filename"
           Specifies an alternate configuration file.  If not specified, it is computed, see razor-agents(1) manpage for details.  See
           razor-agent.conf(5) manpage for various configuration options.  The default is "<razorhome>/razor-agent.conf".

       "-home=dir"
           Specify razorhome directory.  This is where the configuration file, logfiles, identities, and server files live.  If not specified, it
           is computed, see razor-agents(1) manpage for details.

       "-logfile=file"
           Specify file to log to instead of whats in configuration file.  The default is "<razorhome>/razor-agent.log".

       "-ident=filename"
           Specify an identify file to use for authenticating with Razor Servers.  If not specified, "<razorhome>/identity-<user>" is used.

       "-rs=razor.server.com"
           Use this Razor Nomination Server instead of reading "servers.nomination.lst".

       "-M | --mbox"
           Accept a mailbox name on the command line and revoke every mail in the mailbox against the database. If in foreground, "-f",
           "razor-revoke" will print out the mail number of every mail that was accepted by the Catalogue server.

            C<razor-revoke -f -M ~/Mail/incorrectly-marked-spam>

       "-i=filename"
           Used identity from filename instead of reading <razorhome>/identity.

       "-a"
           Authenticate only. If authenticated, exit 0; if not, exit 1.

       "-f"
           Stay in foreground, do not detach and run in background.

INTEGRATION WITH MUTT
       Add the following line to "mutt.conf"

            macro index R "|/usr/bin/razor-revoke"

       Then press R on the spam message in "mutt" to report it with "razor-revoke". Since "razor-revoke" forks, the control will return
       immediately.

AUTHORS
       Vipul Ved Prakash <mail@vipul.net>, and Chad Norwood <chad@samo.org>

SEE ALSO
       razor-agents(1), razor-agent.conf(5), razor-check(1), razor-admin(1), razor-report(1), razor-whitelist(5)

LICENSE
       This is free software, distributed under the Artistic License 2.0.

perl v5.22.1                                                        2008-07-21                                                    RAZOR-REVOKE(1p)
