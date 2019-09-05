RAZOR-REPORT(1p)                                        User Contributed Perl Documentation                                       RAZOR-REPORT(1p)

NAME
       "razor-report" - Razor Reporting Agent

SYNOPSIS
           razor-report [options]  file_with_mail_in_rfc822_format

           $ cat mail | razor-report
           $ razor-report ./mail
           $ razor-report -d ./mail

DESCRIPTION
       "razor-report" is the Razor Reporting Agent which is used for reporting spam messages to a Razor Nomination Server. "razor-report" should
       be generally called from a MUA, although there are no restrictions on invoking it from the command-line. "razor-report" is a filter, which
       means that spam messages should be piped through it. By default, "razor-report" backgrounds and detaches itself from the control terminal
       at start-up.

       If "razor-report" is passed more than one mail, it will report each against the database.  Please use this with caution, we don't want the
       database filled up with mails incorrectly identified as spam.  "razor-report" supports mbox-formatted files with 1 or more mails in them as
       well as files containing a single RFC 822 (non-mbox) mail.  More than one file may be present on the command line, can be either a non-mbox
       or mbox in any order.

       However, more than one non-mbox mail cannot be read from stdin.  Both "razor-report" and razor-revoke(1) require user authentication to
       work, see razor-admin(1). This allows the Razor Nomination Server to keep track of how many messages a user reports and revokes. The more
       messages a user correctly reports and/or correctly revokes, the more trust the user earns. Likewise, when messages are incorrectly reported
       or revoked, the trust goes down for that user. Highly trusted users will have the most affect on the Razor Catalogue.

USAGE
       "razor-report" takes following arguments:

       "-h"
           Print a usage message and exit.

       "-v"
           Print the version number and exit.

       "-d | --verbose"
           Print debugging information to stdout.

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

       "-H"
           Compute and print the signature of the mail contents and exit. If "-e=integer" is not specified, all supported engines will be used.

       "-S=string"
           Accept a list of pre-computed (with "-H") signatures on the command line, instead of computing one from mail content. Signatures can be
           submitted in hex or base64, but base64 is preferred. Requires "-e=integer". Usage:

           razor-report -e 1 -S a8a3d545adb73f9733675571ffeaf10cba87745b

       "-e=integer"
           Specify engine used to create signatures. Must be 1, 2, 3, or 4 in this version. Engine 1, or "-e=1", is used for Razor 1.x signatures.
           Used only with "-S=string" or "-H".

       "-ep4=string"
           String used by engine 4 when computing signatures. Published by the Razor Nomination Servers and updated very frequently. Used only
           when "-e=4".

       "-i=filename"
           Use identity from filename instead of reading <razorhome>/identity.  Razor Servers compute trust for each unique identity.  Razor
           Agents figure out the identity by a 2 step process.  First, check if identity is specified via cmd-line (-i=file).  If not there, then
           look in <razorhome> for identity file.  If <razorhome> has no identity file, authentication will fail - you cannot report or revoke.
           See razor-agents.conf(5) for more on <razorhome>.  ---fixme----

       "-a"
           Authenticate only.  If authenticated, exit 0; if not, exit 1.

       "-f"
           Stay in foreground, do not detach and run in background.

INTEGRATION WITH MUTT
       Add the following line to "mutt.conf"

            macro index S "|/usr/bin/razor-report"

       Then press S on the spam message in "mutt" to report it with "razor-report". Since "razor-report" forks, the control will return
       immediately.

AUTHORS
       Vipul Ved Prakash <mail@vipul.net>, and Chad Norwood <chad@samo.org>

SEE ALSO
       razor-agents(1), razor-agent.conf(5), razor-check(1), razor-admin(1), razor-revoke(1), razor-whitelist(5)

LICENSE
       This is free software, distributed under the Artistic License 2.0.

perl v5.22.1                                                        2008-07-21                                                    RAZOR-REPORT(1p)
