LOOKBIB(1)                                                    General Commands Manual                                                   LOOKBIB(1)

NAME
       lookbib - search bibliographic databases

SYNOPSIS
       lookbib [ -v ] [ -istring ] [ -tn ] filename...

DESCRIPTION
       lookbib  prints a prompt on the standard error (unless the standard input is not a terminal), reads from the standard input a line contain‐
       ing a set of keywords, searches the bibliographic databases filename... for references containing those  keywords,  prints  any  references
       found  on  the  standard  output,  and repeats this process until the end of input.  For each database filename to be searched, if an index
       filename.i created by indxbib(1) exists, then it will be searched instead; each index can cover multiple databases.

OPTIONS
       It is possible to have whitespace between a command line option and its parameter.

       -v     Print the version number.

       -istring
              When searching files for which no index exists, ignore the contents of fields whose names are in string.

       -tn    Only require the first n characters of keys to be given.  Initially n is 6.

FILES
       filename.i  Index files.

SEE ALSO
       refer(1), lkbib(1), indxbib(1)

COPYING
       Copyright © 1989-2014 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this  permission  notice  are
       preserved on all copies.

       Permission  is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this manual into another language, under the  above  conditions  for  modified
       versions,  except  that  this  permission notice may be included in translations approved by the Free Software Foundation instead of in the
       original English.

Groff Version 1.22.3                                              28 January 2016                                                       LOOKBIB(1)
