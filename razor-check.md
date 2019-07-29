RAZOR-CHECK(1p)                                         User Contributed Perl Documentation                                        RAZOR-CHECK(1p)

NAME
       "razor-check" - Razor Filtering Agent

SYNOPSIS
           razor-check [options]  [ mail1 [ mail2 .. ] ]

           $ cat mbox | razor-check
           $ razor-check ./mbox
           $ razor-check -d mbox mail.1 mail.2 mail.3

DESCRIPTION
       "razor-check" checks a mail against the distributed Razor Catalogue by communicating with a Razor Catalogue Server. It should be invoked
       before the mail is delivered or processed by a human. "razor-check" terminates with exit value 0 if the signature for the mail is
       catalogued on the server (spam) or 1 if the mail is not catalogued by the server (not a spam). "razor-check" should be invoked against
       every incoming mail by mail processors (like procmail) or MTAs (like sendmail). An alternate method would be to call "razor-check" from
       cron, at regular intervals, to identify and mark spam in queued mailboxes.

       If "razor-check" is passed more than one mail, it will check each against the database, printing out the serial number of every mail
       considered to be spam.  "razor-check" supports mbox-formatted files with 1 or more mails in them as well as files containing a single RFC
       822 (non-mbox) mail.  More than one file may be present on the command line, can be either a non-mbox or mbox in any order.  However, more
       than one non-mbox mail cannot be read from stdin.

USAGE
       "razor-check" is usually run by piping the contents of the mail to it, or by providing the name of the file that contains the mail message
       to be checked as the last argument. "razor-check" takes the following arguments:

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
           Specify file to log to instead of what is in the configuration file.  The default is "<razorhome>/razor-agent.log".

       "-rs=razor.server.com"
           Use this Razor Catalogue Server instead of reading "servers.catalogue.lst".

       "-H"
           Compute and print the signature of the mail contents and exit. If "-e=integer" is not specified, all supported engines will be used.

       "-S=string"
           Accept a list of pre-computed (with "-H") signatures on the command line, instead of computing one from mail content. Signatures can be
           submitted in hex or base64, but base64 is preferred. Requires "-e=integer". Usage:

           "razor-report -e 1 -S a8a3d545adb73f9733675571ffeaf10cba87745b"

       "-e=integer"
           Specify engine used to create signatures. Must be 1, 2, 3, or 4 in this version. Engine 1, or "-e=1", is used for Razor 1.x signatures.
           Used only with "-S=string" or "-H".

       "-ep4=string"
           String used by engine 4 when computing signatures. Published by the Razor Catalogue Servers and updated very frequently. Used only when
           "-e=4".

RECIPES
       "razor-check" is usually invoked from procmail(1). Here are some common ways of using it with procmail:

       To change the "Subject" header if mail is spam:
               :0 Wc
               | razor-check
               :0 Waf
               | formail -i "Subject: Razor Warning: SPAM/UBE/UCE"

       To add a "X-Razor2-Warning" header to spam:
               :0 Wc
               | razor-check
               :0 Waf
               | formail -A "X-Razor2-Warning: SPAM."

       To file spam in a mailbox
               :0 Wc
               | razor-check
               :0 Wa
               /home/foo/Mail/razor-caught

AUTHORS
       Vipul Ved Prakash <mail@vipul.net>, and Chad Norwood <chad@samo.org>

SEE ALSO
       razor-agents(1), razor-agent.conf(5), razor-admin(1), razor-report(1), razor-revoke(1), razor-whitelist(5)

LICENSE
       This is free software, distributed under the Artistic License 2.0.

perl v5.22.1                                                        2008-07-21                                                     RAZOR-CHECK(1p)
