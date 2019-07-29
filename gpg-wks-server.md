GPG-WKS-SERVER(1)               User Commands               GPG-WKS-SERVER(1)

NAME
       gpg-wks-server - Server for the Web Key Service

SYNOPSIS
       gpg-wks-server [COMMAND] [OPTIONS] [ARGS]

DESCRIPTION
       gpg-wks-server  is  a  server  for the Web Key Service.  It can handle
       incoming mails with the --receive command.

       See the EXAMPLES section for procmail and crontab configurations.

       You  also  need  a  webserver  configured   to   alias   requests   to
       /.well-known/openpgp/   and   below  to  the  /var/lib/gnupg/wks/<wkd-
       domain>/ directory.

COMMANDS
       --receive
              Receive a submission or confirmation.

       --cron Run regular jobs.

       --list-domains
              List configured domains, and checks  some  file  and  directory
              permissions.

       --version
              Show program version and some meta information.

       -h, --help
              Output a short usage information.

       --warranty
              Print warranty information.

       --dump-options
              Dump all available options and commands.

OPTIONS
       -v, --verbose
              Enable verbose output.

       -q, --quiet
              Be somewhat more quiet.

       --send Send the mail using sendmail.

       -o, --output FILE
              Write the mail to FILE.

       --from ADDR
              Use ADDR as the default sender.

       --header NAME=VALUE
              Add "NAME: VALUE" as header to all mails.

              Can  be  used to add a header for loop detections, see procmail
              example.

       --debug
              Set  debugging  flags.  All flags are or-ed and  flags  may  be
              given in C syntax (e.g. 0x0042) or as a comma separated list of
              flag names.  To get a list of all supported  flags  the  single
              word "help" can be used.

       --gpg GPG
              Use the specified command instead of gpg.

DIRECTORIES
       /var/lib/gnupg/wks/
              Contains  a subdirectory for each domain to run the server for.
              Each subdirectory is supposed to contain what should show up on
              https://.../.well-known/openpgp/.

              The  user  running  gpg-wks-server  needs write access to these
              subdirectories.

EXAMPLES
   ~/.procmailrc
       Store received emails in ~/Mail/  (create  it  manually  first),  uses
       From:  key-submission@example.com  and X-WKS-Loop: example.com as loop
       detection:

           MAILDIR=$HOME/Mail
           LOGFILE=$HOME/Mail/from
           LOCKFILE=$HOME/Mail/.lockmail
           VERBOSE=yes

           # filter out FROM_DAEMON mails (bounces, ...) into separate mailbox
           :0
           * ^FROM_DAEMON
           from-daemon/

           # archive (copy!) all "normal" mails
           :0 c
           archive/

           # if not in a loop: handle mails with gpg-wks-server
           :0 w
           * !^From: key-submission@example.com
           * !^X-WKS-Loop: example.com
           |gpg-wks-server -v --receive \
               --header X-WKS-Loop=example.com \
               --from key-submission@example.com --send

           # if handling failed: store in separate mailbox
           :0 e
           cruft/

   ~/.forward
       In case procmail is not used automatically  the  following  ~/.forward
       file might be useful:

           "|exec /usr/bin/procmail || exit 75"

       The double quotes are supposed to be included in the file!

   crontab
       You should run the --cron command once a day.  Edit the crontab with

           crontab -e

       and append the following line:

           42 3 * * * gpg-wks-server --cron

SEE ALSO
       —   Latest    draft    for    the    Web    Key    Service   protocol:
           <https://tools.ietf.org/html/draft-koch-openpgp-webkey-service>

       —   GnuPG on Web Key Service: <https://wiki.gnupg.org/WKS>

BUGS
       Please report bugs to <https://dev.gnupg.org>.

COPYRIGHT
       Copyright © 2017 Free Software Foundation, Inc.  License  GPLv3+:  GNU
       GPL version 3 or later <https://gnu.org/licenses/gpl.html>

       This  is  free  software:  you are free to change and redistribute it.
       There is NO WARRANTY, to the extent permitted by law.

       This manpage was written by Stefan Bühler for the Debian  distribution
       (but may be used by others).

gpg-wks-server (GnuPG) 2.1.20      May 2017                 GPG-WKS-SERVER(1)
