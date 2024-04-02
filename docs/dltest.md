dltest(1)                                                                                   UnixODBC manual pages                                                                                   dltest(1)



NAME
       dltest - A simple library symbol test


SYNOPSIS
       dltest [ library symbol ]


DESCRIPTION
       dltest is simple test of occurence of the symbol in the library.  The library must be a full (with path) file name of the shared object, in which the search for symbol should be performed.

       Without any parameters, dltest print short help message.


EXAMPLES
       To determine if the symbol printf is found in the libc-2.18.so:

              $ dltest /usr/lib/libc-2.18.so printf


AUTHORS
       The authors of unixODBC are Peter Harvey ⟨pharvey@codebydesign.com⟩ and Nick Gorham ⟨nick@easysoft.com⟩.  For the full list of contributors see the AUTHORS file.


COPYRIGHT
       unixODBC is licensed under the GNU Lesser General Public License. For details about the license, see the COPYING file.



version 2.3.1                                                                                  Thu 13 Feb 2014                                                                                      dltest(1)
