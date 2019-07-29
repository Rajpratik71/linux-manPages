MMROFF(1)                                                     General Commands Manual                                                    MMROFF(1)

NAME
       mmroff - cross reference preprocessor

SYNOPSIS
       mmroff [ -x ] groff_arguments

DESCRIPTION
       mmroff  is  a  simple  preprocessor  for groff, it is used for expanding cross references in mm, see groff_mm(7).  groff is executed twice,
       first with -z and -rRef=1 to collect all cross references and then to do the real processing when the cross reference file is up to date.

       -x     Just create the cross reference file.  This can be used to refresh the cross reference file, it isn't always needed to have accurate
              cross references and by using this option groff will only be run once.

FILES
       /usr/share/groff/1.22.3/tmac/m.tmac

       /usr/share/groff/1.22.3/tmac/mm/*.cov

       /usr/share/groff/1.22.3/tmac/mm/*.MT

       /usr/share/groff/1.22.3/tmac/mm/locale

SEE ALSO
       groff_mm(7), groff_mmse(7) (only in Swedish locales), groff(1), troff(1), tbl(1), pic(1), eqn(1)

COPYING
       Copyright © 1989-2014 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this manual into another language, under the above conditions for modified
       versions, except that this permission notice may be included in translations approved by the Free Software Foundation instead of in the
       original English.

AUTHORS
Groff Version 1.22.3                                              28 January 2016                                                        MMROFF(1)
