APTURL(8)                               System Manager's Manual                              APTURL(8)

NAME
       apturl - graphical apt-protocol interpreting package installer

SYNOPSIS
       apturl [options...] <URL>

DESCRIPTION
       apturl  is  a  simple graphical application that takes an URL (following the apt-protocol) as a
       command line option, parses it and carries out the operations that the URL describes (that  is,
       it  asks the user if he wants the indicated packages to be installed and if the answer is posi‐
       tive does so).

USAGE
       apturl just needs an URL conforming with the apt-protocol in order to  work.  Additionally,  it
       recognizes the following options:

       -p, --http-proxy
              Use the given HTTP proxy in order to download the packages.

EXAMPLES
       apturl apt:pidgin,pidgin-plugin-pack
              Installs Pidgin and Pidgin Plugin Pack (if the user confirms).

       apturl apt:freevial?section=universe
              Enables the "universe" component and installs package Freevial.

       apturl apt:adobe-flashplugin?channel=lucid-partner
              Enables  the  "partner"  repository  and  installs package adobe-flashplugin.  Available
              repositories are listed in /usr/share/app-install/channels/.

       apturl apt+http://launchpad.net/~mvo/ppa?package=2vcard
              Installs 2vcard from the indicated PPA (if the user confirms), and afterward asks if the
              PPA should be removed again or it should remain enabled.
              Warning: This is currently disabled because of security concerns.

EXIT CODES
       0      All requested packages have been successfully installed or were already installed.

       1      The user aborted the installation of one or more packages.

       2      There  was an error doing the requested operations, or the user aborted the installation
              while Synaptic (and not apturl itself) was working.

       3      The arguments with which apturl was called were incorrect (e.g., it was  called  without
              any argument or the given URL was wrong).

BUGS
       Please report any bug on https://bugs.launchpad.net/ubuntu/+source/apturl.

SEE ALSO
       synaptic

AUTHORS
       apturl  was written by Michael Vogt <michael.vogt@ubuntu.com> for Canonical, Ltd. and this man‐
       ual page by Siegfried-A. Gevatter <rainct@ubuntu.com>.

       It is released under the GNU General Public License, version 2 or any later  version  published
       by the Free Software Foundation.

                                          September 01, 2008                                 APTURL(8)
