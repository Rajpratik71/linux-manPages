popbugs(1)                                                        debian-goodies                                                        popbugs(1)

NAME
       popbugs - find RC bugs in packages you commonly use

SYNOPSIS
       popbugs [options] [popularity-contest log]

DESCRIPTION
       The  popbugs  program fetches the list of release critical bugs from the Debian bug tracking system on the internet.  It correlates the bug
       log with the popularity-contest data from your system to obtain a list of release critical bugs in packages, which  are  commonly  used  on
       your  system.   Normally  this  list  is displayed in a web browser.  Helping to resolve these bugs is a good idea, if you want to see your
       favourite programs in the next stable release of Debian.

OPTIONS
       -h

       --help Show a very short usage message.

       -ooutputfile

       --output=outputfile
              Place the output in outputfile instead of displaying it in a browser.

       -d

       --debug
              Output debugging information.

SEE ALSO
       rc-alert(1), popularity-contest(8)

AUTHOR
       The popbugs  program  is  copyright  ©  2001  Matt  Zimmerman  <mdz@debian.org>.   This  manual  page  is  copyright  ©  2004   Jochen  Voß
       <voss@debian.org>.

debian-goodies                                                    January 10 2004                                                       popbugs(1)
