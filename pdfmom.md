PDFMOM(1)                                                     General Commands Manual                                                    PDFMOM(1)

NAME
       pdfmom - Produce PDF documents using the mom macro set

SYNOPSIS
       pdfmom [-Tps [pdfroff options]] [groff options] files ...

       pdfmom [-Tpdf] [groff options] files ...

DESCRIPTION
       pdfmom is a wrapper around groff that facilitates the production of PDF documents from files formatted with the mom macros.

       pdfmom prints to stdout, so output must be redirected to a destination file.  The size of the final PDF can be reduced by piping the output
       through ps2pdf.

       If called with the -Tpdf option (which is the default), pdfmom processes files using groff's native PDF driver, gropdf.  If -Tps is  given,
       processing  is passed over to pdfroff, which uses groff's PostScript driver.  In either case, multiple runs of the source file are peformed
       in order to satisfy any forward references in the document.

       pdfmom accepts all the same options as groff.  If -Tps is given, the options associated with pdfroff are accepted  as  well.   Please  note
       that when pdfmom calls pdfroff, the

              -mpdfmark -mom --no-toc

       options  are  implied  and should not be given on the command line.  Equally, it is not necessary to supply the -mom or -m mom options when
       -Tps is absent.

       PDF integration with the mom macros is discussed in full in the PDF manual, Producing PDFs with groff and mom.

BUGS
       pdfmom sometimes issues warnings of the type

         ...: can't transparently output node at top level

       This is more of an annoyance than a bug, and may safely be ignored.

SEE ALSO
       groff(1), pdfroff(1), ps2pdf(1)

COPYING
       Copyright © 2012-2014 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this  permission  notice  are
       preserved on all copies.

       Permission  is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this manual into another language, under the  above  conditions  for  modified
       versions,  except  that  this  permission notice may be included in translations approved by the Free Software Foundation instead of in the
       original English.

AUTHORS
       This document was written by Deri James ⟨deri@chuzzlewit.demon.co.uk⟩ and Peter Schaffter ⟨peter@schaffter.ca⟩.

Groff Version 1.22.3                                              28 January 2016                                                        PDFMOM(1)
