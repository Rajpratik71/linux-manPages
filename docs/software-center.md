SOFTWARE-CENTER(1)                                            General Commands Manual                                           SOFTWARE-CENTER(1)

NAME
       software-center - manage software

SYNOPSIS
       software-center [options] [ package-name | apt-url  | deb-file ]

DESCRIPTION
       software-center a graphical interface for package management in Ubuntu.

OPTIONS
       Listed below are the command line options for software-center:

       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       --debug
              enable debug mode

EXAMPLES
       software-center
              Display the main screen of software-center.

       software-center gedit
              Display the details view of the gedit package.

       software-center banshee?section=universe
              Display the details view of the banshee package and offer to enable the universe component.

       software-center adobe-flashplugin?channel=maverick-partner
              Display the details view of the adobe-flashplugin package and offer to enable the maverick-partner channel.

       software-center cheese,gtg
              Display a list containing the cheese and gtg packages.

       software-center /home/pgg/skype.deb
              Display the details view of the local debian file '/home/pgg/skype.deb'.

AUTHOR
       software-center was written by Michael Vogt <mvo@canonical.com>, and this manual page by Andrew Higginson <rugby471@gmail.com>.

       Both are released under the GNU General Public License, version 3 or later.

August 2010                                                            2.1.8                                                    SOFTWARE-CENTER(1)
