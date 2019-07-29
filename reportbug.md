reportbug(1)                                                  General Commands Manual                                                 reportbug(1)

NAME
       reportbug - reports a bug to a debbugs server

SYNOPSIS
       reportbug [options] <package | pseudo-package | absolute-pathname>

DESCRIPTION
       reportbug  is primarily designed to report bugs in the Debian distribution; by default, it creates an email to the Debian bug tracking sys‐
       tem at submit@bugs.debian.org with information about the bug you've found, and makes a carbon copy of the report for you as well.

       Using the --bts option, you can also report bugs to other servers that use the Debian bug tracking system, debbugs.

       You may specify either a package name or a filename; if you use a filename, it must either be an absolute filename (so beginning with a  /)
       or  if  you  want reportbug to search the system for a filename, see the --filename and --path options below. If installed, also dlocate is
       used to identify the filename location and thus the package containing it.

       You can also specify a pseudo-package; these are used in the Debian bug tracking system to track issues that are not related  to  one  spe‐
       cific  package.   Run  reportbug  without  any  arguments,  then enter other at the package prompt, to see a list of the most commonly-used
       pseudo-packages.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with  two  dashes  (`--').   A  summary  of  options  are
       included below.

       -h, --help
              Show summary of options.

       --version
              Show the version of reportbug and exit.

       -A FILENAME, --attach=FILENAME
              Attach  a  file  to the bug report; both text and binary files are acceptable; this option can be specified multiple times to attach
              several files.  This routine will create a MIME attachment with the file included; in some cases (usually text files), it is  proba‐
              bly better to use -i/--include option.  (Please note that Debian's bug tracking system has limited support for MIME attachments.)

              This  option supports also globbing (i.e. names with wildcards, like file.*) but remember to include them between single quotes (the
              previous example becomes: 'file.*') else the shell would expand it before calling reportbug leading to an error.

              Be aware that when using an external MUA to send the message (such as mutt), the attachment feature is not  available  and  no  file
              will be attached at all: the MUA feature to attach files must be used instead (so from within the MUA).

       -b, --no-query-bts
              Don't  check  the  Debian  bug tracking system to see if this problem has already been reported; useful for offline use or if you're
              really sure it's a bug.

       --query-bts
              Check the Debian bug tracking system to see if this problem has already been reported (default).

       -B SYSTEM, --bts=SYSTEM
              Instead of the Debian bug server (or the bug server specified in /etc/reportbug.conf, use the server specified by SYSTEM.

       --body=BODY
              Use the specified BODY as the body of the message.  The body text will be wrapped at 70 columns, and the  normal  reportbug  headers
              and footers will be added as appropriate.  The editor prompt and any "special" prompting will be bypassed.

       --body-file=BODYFILE, --bodyfile=BODYFILE
              The  contents  of the (assumed to be) text file BODYFILE will be used as the message body.  This file is assumed to be properly for‐
              matted (i.e. reasonable line lengths, etc.).  The usual headers and footers will be added, and the editor step and "special" prompts
              will be skipped.  (BODYFILE may also be a named pipe; using a device special file may lead to unusual results.)

       -c, --no-config-files
              Omit  configuration files from the bug report without asking.  By default, you are asked if you want to include them; in some cases,
              doing so may cause sensitive information to be sent via email.

       -C CLASS, --class=CLASS
              Specify report class for GNATS BTSes.

       --configure
              Rerun the reportbug first time configuration routine, and write a new $HOME/.reportbugrc file.  This  will  erase  any  pre-existing
              settings in the file; however, a backup will be written as $HOME/.reportbugrc~.

       --check-available
              Check  for  newer  releases of the package at packages.debian.org (default).  In advanced and expert mode, check incoming.debian.org
              and http://ftp-master.debian.org/new.html too.

       --no-check-available
              Do not check for newer releases of the package at packages.debian.org.

       --debconf
              Include debconf settings in your report.

       --no-debconf
              Do not include debconf settings from your report.

       -d, --debug
              Don't send a real bug report to Debian; send it to yourself instead.  This is primarily used for testing by the maintainer.

       --test Operate in test mode (maintainer use only).

       --draftpath=DRAFTPATH
              Save the draft (for example, when exiting and saving the report without reporting it) into DRAFTPATH directory.

       -e EDITOR, --editor=EDITOR
              Specify the editor to use, overriding any EDITOR or VISUAL environment variable setting.

       --email=ADDRESS
              Set the email address your report should appear to be sent from (i.e. the address that appears in the From header).  This should  be
              the  actual  Internet  email address on its own (i.e. without a real name or comment part, like foo@example.com).  This setting will
              override the EMAIL and DEBEMAIL environment variables, but not REPORTBUGEMAIL.

       --envelope-from
              Specify the Envelope From mail header (also known as Return-path); by default it's the From address but it can be selected a differ‐
              ent one in case the MTA doesn't canonicalize local users to public addresses.

       --mbox-reader-cmd=MBOX_READER_CMD
              Specify  a command to open the bug reports mbox file. You can use %s to substitute the mbox file to be used, and %% to insert a lit‐
              eral percent sign. If no %s is specified, the mbox file name is supplied at the end of the argument list.

       --exit-prompt
              Display a prompt before exiting; this is useful if reportbug is run in a transient terminal (i.e. from its Debian menu entry).

       -f FILENAME, --filename=FILENAME
              Report a bug in the package containing FILENAME so you don't have to figure out what package the file belongs to.  The path will  be
              searched  for  an exact path for FILENAME before attempting to broaden the search to all files. If dlocate is installed, FILENAME is
              actually a regular expression.

       --from-buildd=BUILDD_FORMAT
              This options is a shortcut for buildd admins to report bugs  from  buildd  log;  the  option  expects  a  value  in  the  format  of
              $source_$version where $source is the source package the bug will be reported against and $version is its version.

       --path If  the  -f/--filename  option is also specified, only search the path for the specified FILENAME.  Specifying an absolute path with
              the -f/--filename option (i.e. one beginning with a /) overrides this behavior.

       -g, --gnupg, --gpg
              Attach a digital signature to the bug report using GnuPG (the GNU Privacy Guard).  (This argument will be ignored if you  are  using
              an MUA to edit and send your report.)

       -G, --gnus
              Use the Gnus mail and news reader to send your report, rather than using the editor.

       -H HEADER, --header=HEADER
              Add  a  custom RFC2822 header to your email; for example, to send a carbon copy of the report to debian-68k@lists.linux-m68k.org you
              could use -H 'X-Debbugs-CC: debian-68k@lists.linux-m68k.org'

       -i FILE, --include=FILE
              Include the specified FILE as part of the body of the message to be edited.  Can be used multiple times to add multiple files; text-
              only please!  From a suggestion by Michael Alan Dorman in the bug mailing list.  (See also the -a/--attach option.)

       -I, --no-check-installed
              Do not check whether the package is installed before filing a report.  This is generally only useful when filing a report on a pack‐
              age you know is not installed on your system.

       --check-installed
              Check if the specified package is installed when filing reports.  (This is the default behavior of reportbug.)

       -j JUSTIFICATION, --justification=JUSTIFICATION
              Bugs in Debian that have serious, grave, or critical severities must meet certain criteria to be classified as  such.   This  option
              allows you to specify the justification for a release-critical bug, instead of being prompted for it.

       -k, --kudos
              Send  appreciative  email to the recorded maintainer address, rather than filing a bug report.  (You can also send kudos to package‐
              name@packages.debian.org, for packages in the Debian archive; however, this option uses the  Maintainer  address  from  the  control
              file, so it works with other package sources too.)

       -K KEYID, --keyid=KEYID
              Private  key to use for PGP/GnuPG signatures.  If not specified, the first key in the secret keyring that matches your email address
              will be used.

       --latest-first
              Display the bug reports list sorted and with the latest reports at the top.

       --license
              Show reportbug's copyright and license information on standard output.

       --list-cc=ADDRESS
              Send a carbon copy of the report to the specified list after a report number is assigned; this is the equivalent to  the  option  -H
              'X-Debbugs-CC: ADDRESS'.  This option will only work as intended with debbugs systems.

       -m, --maintonly
              Only send the bug to the package maintainer; the bug tracking system will not send a copy to the bug report distribution lists.

       --max-attachment-size=MAX_ATTACHMENT_SIZE
              Specify  the maximum size any attachment file can have (this also include the file for --body-file option). If an attachment file is
              too big, there could be problems in delivering the email (and also to compose it), so we set a limit to attachment size. By  default
              this is 10 megabytes.

       --mirror=MIRRORS
              Add a BTS mirror.

       --mode=MODE
              Set  the  operating mode for reportbug.  reportbug currently has four operating modes: novice (the default), standard, advanced, and
              expert.

              novice mode is designed to minimize prompting about things that "ordinary users" would be unlikely to know or care  about,  shifting
              the triage burden onto the maintainer.  Checking for new versions is only done for the stable distribution in this mode.  It is cur‐
              rently the default mode.

              standard mode includes a relatively large number of prompts and tries to encourage users to not  file  frivolous  or  duplicate  bug
              reports.

              advanced mode is like standard mode, but may include shortcuts suitable for more advanced users of Debian, without being as close to
              the metal (and potential flamage) as expert mode.  (Currently, the only differences from standard mode are that it assumes familiar‐
              ity  with the "incoming" queue; it allows the reporting of bugs on "dependency" packages; and it does not prompt where to insert the
              report text in the editor.)

              expert mode is designed to minimize prompts that are designed to discourage frivolous or unnecessary bug reports,  "severity  infla‐
              tion,"  and  the  like.   In expert mode, reportbug assumes the user is thoroughly familiar with Debian policies.  In practice, this
              means that reporters are no longer required to justify setting a high severity on a bug report, and certain  automated  cleanups  of
              the  message  are  bypassed.   Individuals  who  do not regularly contribute to the Debian project are highly discouraged from using
              expert mode, as it can lead to flamage from maintainers when used improperly.

       -M, --mutt
              Instead of spawning an editor to revise the bug report, use the mutt mail reader to edit and send it.

       --mta=MTA
              Specify an alternate MTA, instead of /usr/sbin/sendmail (the default).  Any smtphost setting will override this one.

       --mua=MUA
              Instead of spawning an editor to revise the bug report, use the specified MUA (mail user agent) to edit  and  send  it.  --mutt  and
              --nmh options are processed.

       -n, --mh, --nmh
              Instead  of spawning an editor to revise the bug report, use the comp command (part of the nmh and mh mail systems) to edit and send
              it.

       -N BUGNUMBER, --bugnumber BUGNUMBER
              Run reportbug against the specified bug report, useful when following-up a bug and its number is already known.

       --no-bug-script
              Do not execute the bug script (if present); this option can be  useful  together  with  --template  to  suppress  every  interactive
              actions, since some bug scripts can ask questions.

       --no-cc-menu
              Don't display the menu to enter additional addresses (CC).

       --no-tags-menu
              Don't display the menu to enter additional tags.

       -o FILE, --output=FILE
              Instead of sending an email, redirect it to the specified filename.

              The  output file is a full dump of the email message, so it contains both headers and mail body. If you want to use it as a template
              to create a new bug report, then you have to remove all the headers (mind the Subject one, though) and start the report at the Pack‐
              age pseudo-header.

       -O, --offline
              Disable all external queries.  Currently has the same effect as --no-check-available --no-query-bts.

       -p, --print
              Instead  of  sending  an email, print the bug report to standard output, so you can redirect it to a file or pipe it to another pro‐
              gram.

              This option only outputs a template for a bug report (but, differently from --template it's more interactive); you will need to fill
              in the long description.

       --paranoid
              Show the contents of the message before it is sent, including all headers.  Automatically disabled if in template mode.

       --no-paranoid
              Don't show the full contents of the message before it is sent (default).

       --pgp  Attach  a  digital  signature  to  the bug report using PGP (Pretty Good Privacy).  Please note, however, that the Debian project is
              phasing out the use of PGP in favor of GnuPG.  (This argument will be ignored if using an MUA to edit and send your report.)

       --proxy=PROXY, --http_proxy=PROXY
              Specify the WWW proxy server to use to handle the query of the bug tracking system.  You should only need this parameter if you  are
              behind a firewall.  The PROXY argument should be formatted as a valid HTTP URL, including (if necessary) a port number; for example,
              http://192.168.1.1:3128/.

       -P PSEUDO-HEADER, --pseudo-header=PSEUDO-HEADER
              Add a custom pseudo-header to your report; for example, to add the mytag usertag for the user humberto@example.com to the  bug,  you
              could use -P 'User: humberto@example.com' -P 'Usertags: mytag'.

       -q, --quiet
              Suppress diagnostic messages to standard error.

       -Q, --query-only
              Do not submit a bug report; just query the BTS.  Option ignored if you specify --no-bts-query.

       --query-source
              Query on all binary packages built by the same source, not just the binary package specified.

       --no-query-source
              Only query on the binary package specified on the command line.

       --realname=NAME
              Set the real name (human-readable name) to use for your report.

       --report-quiet
              Register the bug in the bug tracking system, but don't send a report to the package maintainer or anyone else.  Don't do this unless
              you're the maintainer of the package in question, or you really know what you are doing.

       --reply-to=ADDRESS, --replyto=ADDRESS
              Set the Reply-To address header in your report.

       -s SUBJECT, --subject=SUBJECT
              Set the subject of the bug report (i.e. a brief explanation of the problem, less than 60 characters).  If you do  not  specify  this
              switch, you will be prompted for a subject.

       --security-team
              If the 'security' tag is set, this option will explicitly specify to send the report only to the Debian Security Team, as this is an
              undisclosed vulnerability.

       --no-security-team
              If the 'security' tag is set, this option will explicitly specify to not send the report only to the Debian Security Team,  as  this
              is not an undisclosed vulnerability.

       -S SEVERITY, --severity=SEVERITY
              Specify a severity level, from critical, grave, serious, important, normal, minor, and wishlist.

       --smtphost=HOST[:PORT]
              Use  the mail transport agent (MTA) at HOST to send your report, instead of your local /usr/sbin/sendmail program.  This should gen‐
              erally be your ISP's outgoing mail server; you can also use 'localhost' if you have a working mail server running on  your  machine.
              If the PORT is omitted, the standard port for SMTP, port 25, is used.

       --timeout=SECONDS
              Specify  the network timeout, the number of seconds to wait for a resource to respond. If nothing is specified, a default timeout of
              1 minute is selected.

              In case of a network error, there are chances it's due to a too low timeout: try passing the --timeout option with  a  higher  value
              than default.

       --tls  If  using  SMTP,  use  Transport Layer Security (TLS) encryption to secure the connection to the mail server.  Some SMTP servers may
              require this option.

       --smtpuser=USERNAME
              If using SMTP, use the specified USERNAME for authentication.

       --smtppasswd=PASSWORD
              If using SMTP, use the specified PASSWORD for authentication.  If the password isn't specified on the command line or in the config‐
              uration file, a prompt will be displayed asking for it.

              Use  of  this  option  is insecure on multiuser systems.  Instead, you should set this option in $HOME/.reportbugrc and ensure it is
              only readable by your user (e.g. with chmod 600 $HOME/.reportbugrc).

       --src, --source
              Specify to report the bug against the source package, and not the binary package (default behaviour).  In order for this  option  to
              work,  you  have to populate the relevant 'deb-src' lines in /etc/apt/sources.list so that apt cache will know about source packages
              too.

       -t TYPE, --type=TYPE
              Specify the type of report to be submitted; currently accepts either gnats or debbugs.

       -T TAG, --tag=TAG
              Specify a tag to be filed on this report, for example --tag=patch.  Multiple tags can be specified  using  multiple  -T/--tag  argu‐
              ments.

              Alternatively,  you can specify the 'tag' none to bypass the tags prompt without specifying any tags; this will also ignore any tags
              specified on the command line.

       --template
              Output a template report to standard output. Differently from -p/--print, it tries to be not interactive, and  presents  a  template
              without user's input.

       -u INTERFACE, --interface=INTERFACE, --ui=INTERFACE
              Specify  the  user  interface  to  use.   Valid options are text, urwid, and gtk2; default is taken from the reportbug configuration
              files.

       -v, --verify
              Verify the integrity of the package (if installed) using debsums before reporting.

       --no-verify
              Do not verify the integrity of the package with debsums.

       -V VERSION, --package-version=VERSION
              Specify the version of the package the problem was found in.  This is probably most useful if you are reporting a bug in  a  package
              that is not installable or installed on a different system.

       -x, --no-cc
              Don't send a blind carbon copy (BCC) of the bug report to the submitter (i.e. yourself).

       -z, --no-compress
              Don't compress configuration files by removing comments and blank lines.

EXAMPLES
       reportbug lynx-ssl
              Report a bug in the lynx-ssl package.

       reportbug --path --filename=ls
              Report a bug in the installed package that includes a program in your path called ls.

CONFIGURATION FILES
       From  version  0.22  on,  reportbug  has  supported  a  simple  run  control  file  syntax.  Commands are read from /etc/reportbug.conf and
       $HOME/.reportbugrc with commands in the latter overriding those in the former.

       Commands are not case sensitive, and currently take 0 or 1 argument; arguments containing whitespace must be enclosed in quotes.

       Any line starting with # is taken to be a comment and will be ignored.

       Generally, options corresponding to the long options for reportbug are supported, without leading -- sequences.  See reportbug.conf(5)  for
       all acceptable options and detailed information.

ENVIRONMENT
       VISUAL Editor to use for editing your bug report.

       EDITOR Editor to use for editing the bug report (overridden by VISUAL).

       REPORTBUGEMAIL, EMAIL, DEBEMAIL
              Email  address  to  use as your from address (in this order). If no environment variable exists, the default is taken from your user
              name and /etc/mailname.

       DEBFULLNAME, DEBNAME, NAME
              Real name to use; default is taken from /etc/passwd.

       REPLYTO
              Address for Reply-To header in outgoing mail.

       MAILCC Use the specified CC address on your email.  Note you can also use the -H option for this (and for Bcc's too).

       MAILBCC
              Use the specified BCC address, instead of your email address.  (CC and BCC based on suggestions from  Herbert  Thielen  in  the  bug
              wishlist).

       http_proxy
              Provides  the  address of a proxy server to handle the BTS query.  This should be a valid http URL for a proxy server, including any
              required port number (simply specifying a hostname, or omitting a port other than 80, WILL NOT WORK).

NOTES
       reportbug should probably be compatible with other bug tracking systems, like bugzilla (used by the GNOME and Mozilla projects) and jitter‐
       bug (used by Samba, AbiSource and FreeCiv) but it isn't.

SEE ALSO
       reportbug.conf(5), http://www.debian.org/Bugs/Developer#tags for available tags, querybts(1)

AUTHOR
       Chris Lawrence <lawrencc@debian.org>, Sandro Tosi <morph@debian.org>.

                                                                                                                                      reportbug(1)
