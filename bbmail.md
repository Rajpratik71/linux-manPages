bbmail(1)                                                                                                                                bbmail(1)

NAME
       bbmail - mailbox flag for X

SYNOPSIS
       bbmail [options]

DESCRIPTION
       bbmail  displays  the  status  of  a  mailbox and warns when new mail has arrived.  It has internal support for mbox and maildir mailboxes.
       Other mailboxes like MH or pop3 can be checked using an external program.

       The tool is designed to mimic the look and feel of the Blackbox window manager when used in combination with  blackbox  bbmail  copies  the
       style from Blackbox.

       A  little picture of an envelope shows if new mail is present.  Multiple mailboxes can be defined and different envelope colors are used to
       indicate new mail.

       If the envelope is pressed with left mouse button a program for example a mail client can be started. When the right button is  pressed  on
       the envelope a menu shows up.  The menu shows all mailboxes and the new mail/total mail of that mail box.

       Another option in the menu is reconfigure, which causes bbmail to reconfigure (reread the config files).

Options
       bbmail supports the following command line options:

       -d displayname, --display displayname
              Set display to displayname

       -c configname, --config configname
              Read configuration from configname instead of the default.

       -v, --version
              Display version number of bbmail

       -h, --help
              Display help on command line options

       -g +x+y, --geometry+x+y
              Set the position of bbmail to x,y. Use +x+y to specify the coordinates relative to the upper left corner, use -x-y specify the coor‐
              dinates relative the lower right corner.  This option is ignored when -withdrawn flag is used.

       -d, --decorated
              Show bbmail in a normal window with title bar.

       -w, --withdrawn
              Put bbmail in the blackbox slit or Windowmaker dock.

       -s, --shape
              Don't display the background of bbmail. This only makes sense in combination with the -withdrawn flag

Configuration
       Global configuration: By default the configuration file bbmail.bb can be found in /usr/local/share/bbtools Local configuration: The default
       configuration file should be placed in ~/.bbtools/

       The following options can be set in the configuration file:

       bbmail.bevelWidth:  width
              Set the width between text label and edge of tool.

       bbmail.position:  +x+y
              Set position of bbmail.

       bbmail.withdrawn: boolean
              Set to True to put bbmail in the blackbox slit or Windowmaker dock.  Default set to false.

       bbmail.shape:boolean
              Set to True if bbmail shouldn't display its background. This gives a nice effect when withdrawn.  Default set to false.

       bbmail.checkDelay: seconds
              Delay between checks. After delay mailbox file is checked for change.

       bbmail.forceCheck.onDelay: seconds
              Delay between checks. After delay external program to check mail is executed.

       bbmail.show.newmail.counter: boolean
              Set to true if bbmail should show the new mail counter.  Default set to true.

       bbmail.show.totalmail.counter: boolean
              Set to true if bbmail should show the total mail counter.  Default set to true.

       bbmail.show.envelope: boolean
              Set to true if bbmail should show envelope which flags new mail.  Default set to true

       bbmail.numberOf.digits:  "value"
              Set the number of digits of the new mail and total mail labels.  Default it is set to 2, this makes it fit nicely in the slit.

       bbmail.show.onlyAtnewmail: boolean
              Set to true if bbmail should only show up when new mail has arrived.  Default set to false

       bbmail.raised: boolean

       bbmail.autoRaise: boolean

       bbmail.pressed.runCommand:    "command"
              The command to run when the envelope is pressed (using the left mouse button).  This command is overridden by the newmail command.

       bbmail.numberOf.mailboxes:    "value"
              Set the number of mailboxes you want to define.  If set to 0, the environment variable MAIL is used to find default mailbox.

       bbmail.mailbox.*.type: value
              Set  the type of mailbox to eother mbox, maildir or other.  bbmail.mailbox.*.filename: filename The filename of the mbox file or the
              directory of maildir

       bbmail.mailbox.*.name: name
              Name of mailbox, this name is shown in menu.

       bbmail.mailbox.*.newmail.pressed.runCommand: command
              The command to run when new mail is indicated. If this command is not defined the command defined  by  bbmail.pressed.runCommand  is
              used.

       bbmail.mailbox.*.newmail.runCommand: command
              The command to run when new mail is received.  Example: cat mail.wav > /dev/dsp

       bbmail.mailbox.*.newmail.bell: boolean
              If set to true the bell is sound when new mail arrives.

       bbmail.mailbox.*.newmail: gradient
              Set the gradient of the envelope when new mail is present.  Example: Raised Gradient Vertical Bevel1

       bbmail.mailbox.*.newmail.color: color
              Set the "from" color of the envelope when new mail is present.

       bbmail.mailbox.*.newmail.colorTo: color
              Set the "to" color of the envelope when new mail is present.

       bbmail.mailbox.*.newmail.pressed:gradient
              Set the gradient of the envelope when new mail is present and the envelope is pressed.  Example: Flat Gradient Vertical Bevel1

       bbmail.mailbox.*.newmail.textColor:     "color"
              Set the color for the lines in the envelope.

       bbmail.mailbox.*.newmail.error.textColor: color
              Set color for the error indication in the envelope.

       bbmail.menu.justify: justify
              Set menu text justify to either CentreJustify, LeftJustify or RightJustify.

       bbmail.menu.bulletStyle: bullet style   diamond
              Set menu bullet style to either diamond

       bbmail.menu.bulletPosition:   "bulletposition"
              Set menu bullet position to either left or right.

       bbmail.menu: gradient
              Set the gradient of the menu.

       bbmail.menu.color:  "color"
              Set the "from" color of the menu.

       bbmail.menu.colorTo: color
              Set the "to" color of the menu.

              type mbox options

              bbmail.mailbox.1.newmail.statusFlag:   " status" Set the status flag which in used in the mbox file to indicate mail is read.  Exam‐
              ple for Netscape: X-Mozilla-Status: [89ABCDEF]

              type other options

              bbmail.mailbox.1.mode: mode mode:  1- unread mail  total mail
                     2- unread mail  read mail
                     3- read mail    total mail
                     4- ignore second value (for both proc and reversed proc)

       bbmail.mailbox.1.proc: program
              The program to run to check for mail, bbmail searches for 2 integers in the output of the program. If none are  found  an  error  is
              reported.  Example program MH: flist Example program fetchmail:  fetchmail -c | ~/.bbtools/bbmailparsefm.pl

BUGS
       The config file of bbmail doesn't handle spaces after commands very well.

John Kennis                                                        May 14, 2001                                                          bbmail(1)
