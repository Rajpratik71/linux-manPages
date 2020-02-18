X2Go(1)                  General Commands Manual                 X2Go(1)

NAME
       pinentry-x2go - PIN or pass-phrase add-on for X2Go Client

SYNOPSIS
       pinentry-x2go [OPTION...]

DESCRIPTION
       pinentry-x2go  is an add-on for X2Go Client. It allows for secure
       entry of PINs or pass phrases.  That means it tries to take  care
       that  the entered information is not swapped to disk or temporar‐
       ily stored anywhere.

       pinentry-x2go is typically used internally by  x2goclient  evoked
       by  gpg-agent.   Users  don't  normally  have a reason to call it
       directly.

OPTIONS
       --version
              Print the program version and licensing information.

       --help Print a usage message summarizing the most useful command-
              line options.

       --debug, -d
              Turn  on  some debugging.  Mostly useful for the maintain‐
              ers.  Note that this may reveal sensitive information like
              the entered pass phrase.

       --enhanced, -e
              Ask  for  timeouts  and insurance, too.  Note that this is
              currently not fully supported.

       --no-global-grab, -g
              Grab the keyboard only when the window  is  focused.   Use
              this  option  if  you  are debugging software using pinen‐
              try-x2go; otherwise you may not be able to to access  your
              X  session anymore (unless you have other means to connect
              to the machine to kill pinentry-x2go).

       --parent-wid N
              Use window ID N as the parent window for  positioning  the
              window.   Note,  that  this  is not fully supported by all
              flavors of pinentry.

       --display STRING, --ttyname STRING, --ttytype  STRING,  --lc-type
       STRING, --lc-messages STRING
              These options are used to pass localization information to
              pinentry-qt.  They are  required  because  pinentry-qt  is
              usually  called  by some background process which does not
              have any information on the locale and  terminal  to  use.
              Assuan  protocol  options  are  an alternative way to pass
              these information.

SEE ALSO
       x2goclient(1), gpg(1), gpg-agent(1)

       The full documentation for pinentry-x2go is maintained as a  Tex‐
       info manual.

              info pinentry

       should give you access to the complete manual.

AUTHOR
       This  manual  page has been derived from the pinentry-qt man page
       by Mike Gabriel. The pinentry-qt man page originally was  written
       by Peter Eisentraut for the Debian project.

                              13 June 2012                       X2Go(1)
