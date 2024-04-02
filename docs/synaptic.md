SYNAPTIC(8)                                                                             System Manager's Manual                                                                            SYNAPTIC(8)

NAME
       synaptic - graphical management of software packages

SYNOPSIS
       synaptic [options]

DESCRIPTION
       Synaptic  is  a  frontend  for  the  apt  package managent system.  It allows you to perform all actions of the command line tool apt-get in a graphical environemnt. This includes installing,
       upgrading, downgrading  and removing of single packages or even upgrading your whole system.

       A manual with detailed instructions can be found in the help menu of Synaptic.

OPTIONS
       Synaptic accepts all of the standard Gtk+ toolkit command line options as well as the following:

       -f, --filter-file=filename
              specify an alternative filter settings file

       -i, --initial-filter=int
              apply the filter with number int at startup

       -o, --option=option
              set an internal option (experts only)

AUTHORS
       Synaptic was originally developed by Alfredo K. Kojima <kojima@conectiva.com.br>. His last official release was 0.16. Michael Vogt <mvo@debian.org> took over his  CVS  version,  that  already
       included  a  nearly complete port to Gtk+. Michael completed the port and added new features. See the NEWS file for the user visible changes from that point on. Conectiva is still involved in
       the development of synaptic. Gustavo Niemeyer <niemeyer@conectiva.com> is doing a great deal of work.

       All development is done at http://savannah.gnu.org/projects/synaptic

       This manual page was originally written by Wybo Dekker <wybo@servalys.nl> and Michael Vogt <mvo@debian.org> and modified by Sebastian Heinlein <sebastian.heinlein@campus.lmu.de>.

COPYRIGHT
       Copyright  (C)  2001-2004 Conectiva S/A

       Copyright  (C)  2002-2004 Michael Vogt

       There is NO warranty.  You may redistribute this software under the terms of  the  GNU General  Public License.  For more information about these matters, see the files named COPYING.

                                                                                              Mar 4, 2004                                                                                  SYNAPTIC(8)
