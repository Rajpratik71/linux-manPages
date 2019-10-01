PROCMAIL(1)                                                                                General Commands Manual                                                                                PROCMAIL(1)



NAME
       procmail - autonomous mail processor

SYNOPSIS
       procmail [-ptoY] [-f fromwhom]
            [parameter=value | rcfile] ...
       procmail [-toY] [-f fromwhom] [-a argument] ...
            -d recipient ...
       procmail [-ptY] -m [parameter=value] ...  rcfile
            [argument] ...
       procmail [-toY] [-a  argument] -z
       procmail -v

DESCRIPTION
       For a quick start, see NOTES at the end.

       Procmail should be invoked automatically over the .forward file mechanism as soon as mail arrives.  Alternatively, when installed by a system administrator (and in the standard Red Hat Linux config‐
       uration), it can be invoked from within the mailer immediately.  When invoked, it first sets some environment variables to default values, reads the mail message from stdin until an  EOF,  separates
       the  body  from the header, and then, if no command line arguments are present, it starts to look for a file named $HOME/.procmailrc.  According to the processing recipes in this file, the mail mes‐
       sage that just arrived gets distributed into the right folder (and more).  If no rcfile is found, or processing of the rcfile falls off the end, procmail will store the mail in  the  default  system
       mailbox.

       If  no  rcfiles  and  no -p have been specified on the command line, procmail will, prior to reading $HOME/.procmailrc, interpret commands from /etc/procmailrc (if present).  Care must be taken when
       creating /etc/procmailrc, because, if circumstances permit, it will be executed with root privileges (contrary to the $HOME/.procmailrc file of course).

       If running suid root or with root privileges, procmail will be able to perform as a functionally enhanced, backwards compatible mail delivery agent.

       Procmail can also be used as a general purpose mail filter, i.e., provisions have been made to enable procmail to be invoked in a special sendmail rule.

       The rcfile format is described in detail in the procmailrc(5) man page.

       The weighted scoring technique is described in detail in the procmailsc(5) man page.

       Examples for rcfile recipes can be looked up in the procmailex(5) man page.

   Signals
       TERMINATE   Terminate prematurely and requeue the mail.

       HANGUP      Terminate prematurely and bounce the mail.

       INTERRUPT   Terminate prematurely and bounce the mail.

       QUIT        Terminate prematurely and silently lose the mail.

       ALARM       Force a timeout (see TIMEOUT).

       USR1        Equivalent to a VERBOSE=off.

       USR2        Equivalent to a VERBOSE=on.

OPTIONS
       -v   Procmail will print its version number, display its compile time configuration and exit.

       -p   Preserve any old environment.  Normally procmail clears the environment upon startup, except for the value of TZ.  However, in any case: any default values will override any  preexisting  envi‐
            ronment  variables,  i.e.,  procmail will not pay any attention to any predefined environment variables, it will happily overwrite them with its own defaults.  For the list of environment vari‐
            ables that procmail will preset see the procmailrc(5) man page.  If both -p and -m are specified, the list of preset environment variables shrinks to just: LOGNAME,  HOME,  SHELL,  ORGMAIL  and
            MAILDIR.

       -t   Make  procmail  fail softly, i.e., if procmail cannot deliver the mail to any of the destinations you gave, the mail will not bounce, but will return to the mailqueue.  Another delivery-attempt
            will be made at some time in the future.

       -f fromwhom
            Causes procmail to regenerate the leading `From ' line with fromwhom as the sender (instead of -f one could use the alternate and obsolete -r).  If fromwhom consists merely  of  a  single  `-',
            then procmail will only update the timestamp on the `From ' line (if present, if not, it will generate a new one).

       -o   Instead of allowing anyone to generate `From ' lines, simply override the fakes.

       -Y   Assume traditional Berkeley mailbox format, ignore any Content-Length: fields.

       -a argument
            This will set $1 to be equal to argument.  Each succeeding -a argument will set the next number variable ($2, $3, etc).  It can be used to pass meta information along to procmail.  This is typ‐
            ically done by passing along the $@x information from the sendmail mailer rule.

       -d recipient ...
            This turns on explicit delivery mode, delivery will be to the local user recipient.  This, of course, only is possible if procmail has root privileges (or if procmail is  already  running  with
            the  recipient's  euid  and  egid).  Procmail will setuid to the intended recipients and delivers the mail as if it were invoked by the recipient with no arguments (i.e., if no rcfile is found,
            delivery is like ordinary mail).  This option is incompatible with -p.

       -m   Turns procmail into a general purpose mail filter.  In this mode one rcfile must be specified on the command line.  After the rcfile, procmail will accept an unlimited number of arguments.   If
            the  rcfile  is  an  absolute  path starting with /etc/procmailrcs/ without backward references (i.e. the parent directory cannot be mentioned) procmail will, only if no security violations are
            found, take on the identity of the owner of the rcfile (or symbolic link).  For some advanced usage of this option you should look in the EXAMPLES section below.

       -z   This turns on LMTP mode, wherein procmail acts as an RFC2033 LMTP server.  Delivery takes place in the same  manner and under the same restrictions as the delivery mode enabled  with -d.   This
            option is incompatible with -p and -f.


ARGUMENTS
       Any arguments containing an '=' are considered to be environment variable assignments, they will all be evaluated after the default values have been assigned and before the first rcfile is opened.

       Any other arguments are presumed to be rcfile paths (either absolute, or if they start with `./' relative to the current directory; any other relative path is relative to $HOME, unless the -m option
       has been given, in which case all relative paths are relative to the current directory); procmail will start with the first one it finds on the command line.  The following ones will only be  parsed
       if the preceding ones have a not matching HOST-directive entry, or in case they should not exist.

       If  no  rcfiles  are  specified,  it looks for $HOME/.procmailrc.  If not even that can be found, processing will continue according to the default settings of the environment variables and the ones
       specified on the command line.

EXAMPLES
       Examples for rcfile recipes can be looked up in the procmailex(5) man page.  A small sample rcfile can be found in the NOTES section below.

       Skip the rest of this EXAMPLES section unless you are a system administrator who is vaguely familiar with sendmail.cf syntax.

       The -m option is typically used when procmail is called from within a rule in the sendmail.cf file.  In order to be able to do this it is convenient to create an  extra  `procmail'  mailer  in  your
       sendmail.cf file (in addition to the perhaps already present `local' mailer that starts up procmail).  To create such a `procmail' mailer I'd suggest something like:

              Mprocmail, P=/usr/bin/procmail, F=mSDFMhun, S=11, R=21,
                      A=procmail -m $h $g $u

       This  enables you to use rules like the following (most likely in ruleset 0) to filter mail through the procmail mailer (please note the leading tab to continue the rule, and the tab to separate the
       comments):

              R$*<@some.where>$*
                      $#procmail $@/etc/procmailrcs/some.rc $:$1@some.where.procmail$2
              R$*<@$*.procmail>$*
                      $1<@$2>$3       Already filtered, map back

       And /etc/procmailrcs/some.rc could be as simple as:

              SENDER = "<$1>"                 # fix for empty sender addresses
              SHIFT = 1                       # remove it from $@

              :0                              # sink all junk mail
              * ^Subject:.*junk
              /dev/null

              :0 w                            # pass along all other mail
              ! -oi -f "$SENDER" "$@"

       Do watch out when sending mail from within the /etc/procmailrcs/some.rc file, if you send mail to addresses which match the first rule again, you could be creating an endless mail loop.

FILES
       /etc/passwd            to set the recipient's LOGNAME, HOME and SHELL variable defaults

       /var/spool/mail/$LOGNAME
                              system mailbox; both the system mailbox and the immediate directory it is in will be created every time procmail starts and either one is not present

       /etc/procmailrc        initial global rcfile

       /etc/procmailrcs/      special privileges path for rcfiles

       $HOME/.procmailrc      default rcfile

       /var/spool/mail/$LOGNAME.lock
                              lockfile for the system mailbox (not automatically used by procmail, unless $DEFAULT equals /var/spool/mail/$LOGNAME and procmail is delivering to $DEFAULT)

       /usr/sbin/sendmail     default mail forwarder

       _????`hostname`        temporary `unique' zero-length files created by procmail

SEE ALSO
       procmailrc(5), procmailsc(5), procmailex(5), sh(1), csh(1), mail(1), mailx(1), binmail(1), uucp(1), aliases(5), sendmail(8), egrep(1), grep(1), biff(1), comsat(8), lockfile(1), formail(1), cron(1)

DIAGNOSTICS
       Autoforwarding mailbox found
                              The system mailbox had its suid or sgid bit set, procmail terminates with EX_NOUSER assuming that this mailbox must not be delivered to.

       Bad substitution of "x"
                              Not a valid environment variable name specified.

       Closing brace unexpected
                              There was no corresponding opening brace (nesting block).

       Conflicting options    Not all option combinations are useful

       Conflicting x suppressed
                              Flag x is not compatible with some other flag on this recipe.

       Couldn't create "x"    The system mailbox was missing and could not/will not be created.

       Couldn't create maildir part "x"
                              The maildir folder "x" is missing one or more required subdirectories and procmail could not create them.

       Couldn't create or rename temp file "x"
                              An error occurred in the mechanics of  delivering to the directory folder "x".

       Couldn't determine implicit lockfile from "x"
                              There were no `>>' redirectors to be found, using simply `$LOCKEXT' as locallockfile.

       Couldn't read "x"      Procmail was unable to open an rcfile or it was not a regular file, or procmail couldn't open an MH directory to find the highest numbered file.

       Couldn't unlock "x"    Lockfile was already gone, or write permission to the directory where the lockfile is has been denied.

       Deadlock attempted on "x"
                              The locallockfile specified on this recipe is equal to a still active $LOCKFILE.

       Denying special privileges for "x"
                              Procmail will not take on the identity that comes with the rcfile because a security violation was found (e.g.  -p or variable assignments on the command line) or procmail had
                              insufficient privileges to do so.

       Descriptor "x" was not open
                              As procmail was started, stdin, stdout or stderr was not connected (possibly an attempt to subvert security)

       Enforcing stricter permissions on "x"
                              The system mailbox of the recipient was found to be unsecured, procmail secured it.

       Error while writing to "x"
                              Nonexistent subdirectory, no write permission, pipe died or disk full.

       Exceeded LINEBUF       Buffer overflow detected, LINEBUF was too small, PROCMAIL_OVERFLOW has been set.

       MAILDIR is not an absolute path

       MAILDIR path too long

       ORGMAIL is not an absolute path

       ORGMAIL path too long

       default rcfile is not an absolute path

       default rcfile path too long
                              The specified item's full path, when expanded, was longer than LINEBUF or didn't start with a file separator.

       Excessive output quenched from "x"
                              The program or filter "x" tried to produce too much output for the current LINEBUF, the rest was discarded and PROCMAIL_OVERFLOW has been set.

       Extraneous x ignored   The action line or other flags on this recipe makes flag x meaningless.

       Failed forking "x"     Process table is full (and NORESRETRY has been exhausted).

       Failed to execute "x"  Program not in path, or not executable.

       Forced unlock denied on "x"
                              No write permission in the directory where lockfile "x" resides, or more than one procmail trying to force a lock at exactly the same time.

       Forcing lock on "x"    Lockfile "x" is going to be removed by force because of a timeout (see also: LOCKTIMEOUT).

       Incomplete recipe      The start of a recipe was found, but it stranded in an EOF.

       Insufficient privileges
                              Procmail either needs root privileges, or must have the right (e)uid and (e)gid to run in delivery mode.  The mail will bounce.

       Invalid regexp "x"     The regular expression "x" contains errors (most likely some missing or extraneous parens).

       Kernel-lock failed     While trying to use the kernel-supported locking calls, one of them failed (usually indicates an OS error), procmail ignores this error and proceeds.

       Kernel-unlock failed   See above.

       Lock failure on "x"    Can  only occur if you specify some real weird (and illegal) lockfilenames or if the lockfile could not be created because of insufficient permissions or nonexistent subdirec‐
                              tories.

       Lost "x"               Procmail tried to clone itself but could not find back rcfile "x" (it either got removed or it was a relative path and you changed directory  since  procmail  opened  it  last
                              time).

       Missing action         The current recipe was found to be incomplete.

       Missing closing brace  A nesting block was started, but never finished.

       Missing name           The -f option needs an extra argument.

       Missing argument       You specified the -a option but forgot the argument.

       Missing rcfile         You specified the -m option, procmail expects the name of an rcfile as argument.

       Missing recipient      You specified the -d option or called procmail under a different name, it expects one or more recipients as arguments.

       No space left to finish writing "x"
                              The filesystem containing "x" does not have enough free space to permit delivery of the message to the file.

       Out of memory          The system is out of swap space (and NORESRETRY has been exhausted).

       Processing continued   The unrecognised options on the command line are ignored, proceeding as usual.

       Program failure (nnn) of "x"
                              Program that was started by procmail returned nnn instead of EXIT_SUCCESS (=0); if nnn is negative, then this is the signal the program died on.

       Quota exceeded while writing "x"
                              The filesize quota for the recipient on the filesystem containing "x" does not permit delivering the message to the file.

       Renaming bogus "x" into "x"
                              The system mailbox of the recipient was found to be bogus, procmail performed evasive actions.

       Rescue of unfiltered data succeeded/failed
                              A filter returned unsuccessfully, procmail tried to get back the original text.

       Skipped: "x"           Couldn't do anything with "x" in the rcfile (syntax error), ignoring it.

       Suspicious rcfile "x"  The  owner  of  the  rcfile  was  not the recipient or root, the file was world writable, or the directory that contained it was world writable, or this was the default rcfile
                              ($HOME/.procmailrc) and either it was group writable or the directory that contained it was group writable (the rcfile was not used).

       Terminating prematurely whilst waiting for ...
                              Procmail received a signal while it was waiting for ...

       Timeout, terminating "x"
                              Timeout has occurred on program or filter "x".

       Timeout, was waiting for "x"
                              Timeout has occurred on program, filter or file "x".  If it was a program or filter, then it didn't seem to be running anymore.

       Truncated file to former size
                              The file could not be delivered to successfully, so the file was truncated to its former size.

       Truncating "x" and retrying lock
                              "x" does not seem to be a valid filename or the file is not empty.

       Unable to treat as directory "x"
                              Either the suffix on "x" would indicate that it should be an MH or maildir folder, or it was listed as an second folder into which to link, but it already exists and is not  a
                              directory.

       Unexpected EOL         Missing closing quote, or trying to escape EOF.

       Unknown user "x"       The specified recipient does not have a corresponding uid.

EXTENDED DIAGNOSTICS
       Extended diagnostics can be turned on and off through setting the VERBOSE variable.

       [pid] time & date      Procmail's pid and a timestamp.  Generated whenever procmail logs a diagnostic and at least a second has elapsed since the last timestamp.

       Acquiring kernel-lock  Procmail now tries to kernel-lock the most recently opened file (descriptor).

       Assigning "x"          Environment variable assignment.

       Assuming identity of the recipient, VERBOSE=off
                              Dropping all privileges (if any), implicitly turns off extended diagnostics.

       Bypassed locking "x"   The mail spool directory was not accessible to procmail, it relied solely on kernel locks.

       Executing "x"          Starting program "x".  If it is started by procmail directly (without an intermediate shell), procmail will show where it separated the arguments by inserting commas.

       HOST mismatched "x"    This host was called "x", HOST contained something else.

       Locking "x"            Creating lockfile "x".

       Linking to "x"         Creating a hardlink between directory folders.

       Match on "x"           Condition matched.

       Matched "x"            Assigned "x" to MATCH.

       No match on "x"        Condition didn't match, recipe skipped.

       Non-zero exitcode (nnn) by "x"
                              Program  that was started by procmail as a condition or as the action of a recipe with the `W' flag returned nnn instead of EXIT_SUCCESS (=0); the usage indicates that this is
                              not an entirely unexpected condition.

       Notified comsat: "$LOGNAME@offset:file"
                              Sent comsat/biff a notice that mail arrived for user $LOGNAME at `offset' in `file'.

       Opening "x"            Opening file "x" for appending.

       Rcfile: "x"            Rcfile changed to "x".

       Reiterating kernel-lock
                              While attempting several locking methods, one of these failed.  Procmail will reiterate until they all succeed in rapid succession.

       Score: added newtotal "x"
                              This condition scored `added' points, which resulted in a `newtotal' score.

       Unlocking "x"          Removing lockfile "x" again.

WARNINGS
       You should create a shell script that uses lockfile(1) before invoking your mail shell on any mailbox file other than the system mailbox (unless of course, your mail shell uses  the  same  lockfiles
       (local or global) you specified in your rcfile).

       In  the  unlikely  event that you absolutely need to kill procmail before it has finished, first try and use the regular kill command (i.e., not kill -9, see the subsection Signals for suggestions),
       otherwise some lockfiles might not get removed.

       Beware when using the -t option, if procmail repeatedly is unable to deliver the mail (e.g., due to an incorrect rcfile), the system mailqueue could fill up.  This could  aggravate  both  the  local
       postmaster and other users.

       The  /etc/procmailrc  file  might  be executed with root privileges, so be very careful of what you put in it.  SHELL will be equal to that of the current recipient, so if procmail has to invoke the
       shell, you'd better set it to some safe value first.  See also: DROPPRIVS.

       Keep in mind that if chown(1) is permitted on files in /etc/procmailrcs/, that they can be chowned to root (or anyone else) by their current owners.  For maximum security, make sure  this  directory
       is executable to root only.

       Procmail is not the proper tool for sharing one mailbox among many users, such as when you have one POP account for all mail to your domain. It can be done if you manage to configure your MTA to add
       some headers with the envelope recipient data in order to tell Procmail who a message is for, but this is usually not the right thing to do.  Perhaps you want to investigate if your MTA offers `vir‐
       tual user tables', or check out the `multidrop' facility of Fetchmail.

BUGS
       After removing a lockfile by force, procmail waits $SUSPEND seconds before creating a new lockfile so that another process that decides to remove the stale lockfile will not remove the newly created
       lock by mistake.

       Procmail uses the regular TERMINATE signal to terminate any runaway filter, but it does not check if the filter responds to that signal and it only sends it to the filter itself, not to any  of  the
       filter's children.

       A continued Content-Length: field is not handled correctly.

       The embedded newlines in a continued header should be skipped when matching instead of being treated as a single space as they are now.

MISCELLANEOUS
       If  there  is  an  existing Content-Length: field in the header of the mail and the -Y option is not specified, procmail will trim the field to report the correct size.  Procmail does not change the
       fieldwidth.

       If there is no Content-Length: field or the -Y option has been specified and procmail appends to regular mailfolders, any lines in the body of the message that look like postmarks are prepended with
       `>' (disarms bogus mailheaders).  The regular expression that is used to search for these postmarks is:
              `\nFrom '

       If  the  destination name used in explicit delivery mode is not in /etc/passwd, procmail will proceed as if explicit delivery mode was not in effect.  If not in explicit delivery mode and should the
       uid procmail is running under, have no corresponding /etc/passwd entry, then HOME will default to /, LOGNAME will default to #uid, SHELL  will  default  to  /bin/sh,  and  ORGMAIL  will  default  to
       /tmp/dead.letter.

       When  in  explicit  delivery mode, procmail will generate a leading `From ' line if none is present.  If one is already present procmail will leave it intact.  If procmail is not invoked with one of
       the following user or group ids: root, daemon, uucp, mail, x400, network, list, slist, lists or news, but still has to generate or accept a new `From ' line, it will generate an additional `>From  '
       line to help distinguish fake mails.

       For  security  reasons  procmail  will  only  use  an absolute or $HOME-relative rcfile if it is owned by the recipient or root, not world writable, and the directory it is contained in is not world
       writable.  The $HOME/.procmailrc file has the additional constraint of not being group-writable or in a group-writable directory.

       If /var/spool/mail/$LOGNAME is a bogus mailbox (i.e., does not belong to the recipient, is unwritable, is a symbolic link or is a hard link), procmail will upon startup try to rename it into a  file
       starting  with  `BOGUS.$LOGNAME.'  and ending in an inode-sequence-code.  If this turns out to be impossible, ORGMAIL will have no initial value, and hence will inhibit delivery without a proper rc‐
       file.

       If /var/spool/mail/$LOGNAME already is a valid mailbox, but has got too loose permissions on it, procmail will correct this.  To prevent procmail from doing this make sure the u+x bit is set.

       When delivering to directories, MH folders, or maildir folders, you don't need to use lockfiles to prevent several concurrently running procmail programs from messing up.

       Delivering to MH folders is slightly more time consuming than delivering to normal directories or mailboxes, because procmail has to search for the next available number (instead of having the file‐
       name immediately available).

       On general failure procmail will return EX_CANTCREAT, unless option -t is specified, in which case it will return EX_TEMPFAIL.

       To make `egrepping' of headers more consistent, procmail concatenates all continued header fields; but only internally.  When delivering the mail, line breaks will appear as before.

       If  procmail is called under a name not starting with `procmail' (e.g., if it is linked to another name and invoked as such), it comes up in explicit delivery mode, and expects the recipients' names
       as command line arguments (as if -d had been specified).

       Comsat/biff notifications are done using udp.  They are sent off once when procmail generates the regular logfile entry.  The notification messages have the following extended format (or as close as
       you can get when final delivery was not to a file):
              $LOGNAME@offset_of_message_in_mailbox:absolute_path_to_mailbox

       Whenever procmail itself opens a file to deliver to, it consistently uses the following kernel locking strategies: fcntl(2).

       Procmail is NFS-resistant and eight-bit clean.

NOTES
       Calling up procmail with the -h or -? options will cause it to display a command-line help and recipe flag quick-reference page.

       There  exists  an  excellent  newbie  FAQ  about  mailfilters  (and  procmail  in  particular);  it is maintained by Nancy McGough <nancym@ii.com> and can be obtained by sending a mail to mail-serv‐
       er@rtfm.mit.edu with the following in the body:
              send usenet/news.answers/mail/filtering-faq

       If procmail is not installed globally as the default mail delivery agent (ask your system administrator), you have to make sure it is invoked when your mail arrives.  In this case  your  $HOME/.for‐
       ward  (beware,  it has to be world readable) file should contain the line below.  Be sure to include the single and double quotes, and unless you know your site to be running smrsh (the SendMail Re‐
       stricted SHell), it must be an absolute path.

       "|exec /usr/bin/procmail"

       Some mailers (notably exim) do not currently accept the above syntax.  In such case use this instead:

       |/usr/bin/procmail

       Procmail can also be invoked to postprocess an already filled system mailbox.  This can be useful if you don't want to or can't use a $HOME/.forward file (in which case the  following  script  could
       periodically be called from within cron(1), or whenever you start reading mail):

              #!/bin/sh

              ORGMAIL=/var/spool/mail/$LOGNAME

              if cd $HOME &&
               test -s $ORGMAIL &&
               lockfile -r0 -l1024 .newmail.lock 2>/dev/null
              then
                trap "rm -f .newmail.lock" 1 2 3 13 15
                umask 077
                lockfile -l1024 -ml
                cat $ORGMAIL >>.newmail &&
                 cat /dev/null >$ORGMAIL
                lockfile -mu
                formail -s procmail <.newmail &&
                 rm -f .newmail
                rm -f .newmail.lock
              fi
              exit 0

   A sample small $HOME/.procmailrc:
       PATH=/usr/local/bin:/usr/bin:/bin
       MAILDIR=$HOME/Mail      #you'd better make sure it exists
       DEFAULT=$MAILDIR/mbox   #completely optional
       LOGFILE=$MAILDIR/from   #recommended

       :0:
       * ^From.*berg
       from_me

       :0
       * ^Subject:.*Flame
       /dev/null

       Other examples for rcfile recipes can be looked up in the procmailex(5) man page.

SOURCE
       This program is part of the procmail mail-processing-package (v3.22) available at http://www.procmail.org/ or ftp.procmail.org in pub/procmail/.

MAILINGLIST
       There exists a mailinglist for questions relating to any program in the procmail package:
              <procmail-users@procmail.org>
                     for submitting questions/answers.
              <procmail-users-request@procmail.org>
                     for subscription requests.

       If you would like to stay informed about new versions and official patches send a subscription request to
              procmail-announce-request@procmail.org
       (this is a readonly list).

AUTHORS
       Stephen R. van den Berg
              <srb@cuci.nl>
       Philip A. Guenther
              <guenther@sendmail.com>



BuGless                                                                                           2001/08/27                                                                                      PROCMAIL(1)
