mutt(1)                                                                                          User Manuals                                                                                         mutt(1)



NAME
       mutt - The Mutt Mail User Agent

SYNOPSIS
       mutt [-nRyzZ] [-e cmd] [-F file] [-m type] [-f file]

       mutt [-Enx] [-e cmd] [-F file] [-H file] [-i file] [-s subj] [-b addr] [-c addr] [-a file [...] --] addr|mailto_url [...]

       mutt [-nx] [-e cmd] [-F file] [-s subj] [-b addr] [-c addr] [-a file [...] --] addr|mailto_url [...]  < message

       mutt [-n] [-e cmd] [-F file] -p

       mutt [-n] [-e cmd] [-F file] -A alias

       mutt [-n] [-e cmd] [-F file] -Q query

       mutt -v[v]

       mutt -D

DESCRIPTION
       Mutt  is a small but very powerful text based program for reading and sending electronic mail under unix operating systems, including support for color terminals, MIME, OpenPGP, and a threaded sort-
       ing mode.

       Note: This manual page gives a brief overview of mutt's command line options. You should find a copy of the full manual in /usr/share/doc/packages/mutt, in text, HTML, and/or PDF format.

OPTIONS
       -A alias
              An expanded version of the given alias is passed to stdout.

       -a file [...]
              Attach a file to your message using MIME.  When attaching single or multiple files, separating filenames and recipient addresses with "--" is mandatory, e.g. mutt -a  image.jpg  --  addr1  or
              mutt -a img.jpg *.png -- addr1 addr2.  The -a option must be placed at the end of command line options.

       -b address
              Specify a blind-carbon-copy (BCC) recipient

       -c address
              Specify a carbon-copy (CC) recipient

       -d level
              If mutt was compiled with +DEBUG log debugging output to ~/.muttdebug0.  Level can range from 1-5 and effects verbosity. A value of 2 is recommended.

       -D     Print the value of all configuration options to stdout.

       -E     Causes the draft file specified by -H or include file specified by -i to be edited during message composition.

       -e command
              Specify a configuration command to be run after processing of initialization files.

       -f mailbox
              Specify which mailbox to load.

       -F muttrc
              Specify an initialization file to read instead of ~/.muttrc

       -h     Display help.

       -H draft
              Specify a draft file which contains header and body to use to send a message.

       -i include
              Specify a file to include into the body of a message.

       -m type
              specify a default mailbox type for newly created folders.

       -n     Causes Mutt to bypass the system configuration file.

       -p     Resume a postponed message.

       -Q query
              Query a configuration variables value.  The query is executed after all configuration files have been parsed, and any commands given on the command line have been executed.

       -R     Open a mailbox in read-only mode.

       -s subject
              Specify the subject of the message.

       -v     Display the Mutt version number and compile-time definitions.

       -vv    Display license and copyright information.

       -x     Emulate the mailx compose mode.

       -y     Start Mutt with a listing of all mailboxes specified by the mailboxes command.

       -z     When used with -f, causes Mutt not to start if there are no messages in the mailbox.

       -Z     Causes Mutt to open the first mailbox specified by the mailboxes command which contains new mail.

       --     Treat remaining arguments as addr even if they start with a dash.  See also "-a" above.

ENVIRONMENT
       EDITOR Specifies the editor to use if VISUAL is unset.

       EMAIL  The user's e-mail address.

       HOME   Full path of the user's home directory.

       MAIL   Full path of the user's spool mailbox.

       MAILDIR
              Full path of the user's spool mailbox if MAIL is unset.  Commonly used when the spool mailbox is a maildir (5) folder.

       MAILCAPS
              Path to search for mailcap files.

       MM_NOASK
              If this variable is set, mailcap are always used without prompting first.

       PGPPATH
              Directory in which the user's PGP public keyring can be found.  When used with the original PGP program, mutt and pgpring (1) rely on this being set.

       TMPDIR Directory in which temporary files are created.

       REPLYTO
              Default Reply-To address.

       VISUAL Specifies the editor to use when composing messages.

FILES
       ~/.muttrc or ~/.mutt/muttrc
              User configuration file.

       /etc/Muttrc
              System-wide configuration file.

       /tmp/muttXXXXXX
              Temporary files created by Mutt.

       ~/.mailcap
              User definition for handling non-text MIME types.

       /etc/mailcap
              System definition for handling non-text MIME types.

       ~/.mime.types
              User's personal mapping between MIME types and file extensions.

       /etc/mime.types
              System mapping between MIME types and file extensions.

       /usr/bin/mutt_dotlock
              The privileged dotlocking program.

       /usr/share/doc/packages/mutt/manual.txt
              The Mutt manual.

BUGS
       None.  Mutts have fleas, not bugs.

FLEAS
       Suspend/resume while editing a file with an external editor does not work under SunOS 4.x if you use the curses lib in /usr/5lib.  It does work with the S-Lang library, however.

       Resizing the screen while using an external pager causes Mutt to go haywire on some systems.

       Suspend/resume does not work under Ultrix.

       The help line for the index menu is not updated if you change the bindings for one of the functions listed while Mutt is running.

       For a more up-to-date list of bugs, errm, fleas, please visit the mutt project's bug tracking system under http://bugs.mutt.org/.

NO WARRANTIES
       This  program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Gen-
       eral Public License for more details.

SEE ALSO
       curses(3), mailcap(5), maildir(5), mbox(5), mutt_dotlock(1), muttrc(5), ncurses(3), sendmail(1), smail(1).

       Mutt Home Page: http://www.mutt.org/

       The Mutt manual

AUTHOR
       Michael Elkins, and others.  Use <mutt-dev@mutt.org> to contact the developers.



Unix                                                                                             January 2009                                                                                         mutt(1)
