DWWW(1)                          Debian                          DWWW(1)

NAME
       dwww - access documentation via WWW

SYNOPSIS
       http://localhost/dwww/index.html
       dwww
       dwww program-name | package-name

DESCRIPTION
       A  typical Linux system has documentation in many formats (manual
       pages, info files, READMEs, and so on).  dwww makes  it  possible
       to  access  all  of  these via the same interface, a WWW browser.
       This makes it easier to use the documentation.

       To use dwww, load the URL given in the SYNOPSIS.  If you  have  a
       web  browser  installed,  you  can also just run the dwww command
       which loads the URL.  If BROWSER  environment  variable  is  set,
       dwww  uses  sensible-browser(1) to load the URL.  Otherwise, dwww
       first  tries  to  use  browser  specified  by   DWWW_BROWSER   or
       DWWW_X11_BROWSER configuration variable (cf.  dwww(7)), than will
       use sensible-browser(1) command.

       If optional argument program-name or package-name  is  specified,
       dwww  will  search  all documentation related to given program or
       package.

ENVIRONMENT
       BROWSER
              Program used to load the above mentioned URL.

FILES
       /etc/dwww/dwww.conf
              Configuration file for dwww.

SEE ALSO
       dwww-find(8), dwww(7), sensible-browser(1).

AUTHOR
       Lars  Wirzenius  <liw@iki.fi>.   Modified   by   Robert   Luberda
       <robert@debian.org>.
       Bugs  should  be  reported via the  Debian Bug Tracking System at
       <URL:http://bugs.debian.org/>.

       dwww is licensed via the GNU General Public  License.   While  it
       has  been  written  for  Debian,  porting  it to other systems is
       strongly encouraged.

dwww 1.11.1                February 15th, 2009                   DWWW(1)
