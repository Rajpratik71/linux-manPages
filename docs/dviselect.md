DVISELECT(1)                                                                     General Commands Manual                                                                     DVISELECT(1)

NAME
       dviselect - extract pages from DVI files

SYNOPSIS
       dviselect [ -s ] [ -i infile ] [ -o outfile ] list of pages [ infile [ outfile ] ]

DESCRIPTION
       Dviselect selects pages from a DVI file produced by TeX, creating a new DVI file usable by any of the TeX conversion programs, or even by dviselect itself.

       A range is a string of the form even, odd, or first:last where both first and last are optional numeric strings, with negative numbers indicated by a leading underscore character
       ``_''.  If both first and last are omitted, the colon may also be omitted, or may be replaced with an asterisk ``*''.  A page range is a list of ranges separated by  periods.   A
       list of pages is described by a set of page ranges separated by commas and/or white space.

       Dviselect actually looks at the ten count variables that TeX writes; the first of these (\count0) is the page number, with \count1 through \count9 having varied uses depending on
       which macro packages are in use.  (Typically \count1 might be a chapter or section number.)  A page is included in dviselect's output if all its \count values match  any  one  of
       the  ranges  listed  on  the  command line.  For example, the command ``dviselect *.1,35:'' might select everything in chapter 1, as well as pages 35 and up.  ``dviselect 10:30''
       would select pages 10 through 30 (inclusive).  ``:43'' means everything up to and including page 43 (including negative-numbered pages).  To  get  all  even-numbered  pages,  use
       ``even'';  to  get all odd-numbered pages, use ``odd''.  If a Table of Contents has negative page numbers, ``:_1'' will select it.  Note that ``*'' must be quoted from the shell;
       the empty string is more convenient to use, if harder to read.

       Instead of \count values, dviselect can also select by ``absolute page number'', where the first page is page 1, the second page 2, and so forth.  Absolute page numbers are indi‐
       cated by a leading equal sign ``=''.  Ranges of absolute pages are also allowed: ``dviselect =3:7'' will extract the third through seventh pages.  Dot separators are not legal in
       absolute ranges, and there are no negative absolute page numbers.  Even/odd specifiers, however, are legal; ``dviselect =even'' selects every other page, starting with  the  sec‐
       ond.

       More  precisely, an asterisk or an empty string implies no limit; an equal sign means absolute page number rather than \counts; a leading colon means everything up to and includ‐
       ing the given page; a trailing colon means everything from the given page on; the word ``even'' means only even values shall be accepted; the word ``odd'' means only  odd  values
       shall  be  accepted; and a period indicates that the next \count should be examined.  If fewer than 10 ranges are specified, the remaining \counts are left unrestricted (that is,
       ``1:5'' and ``1:5.*'' are equivalent).  A single number n is treated as if it were the range n:n.  An arbitrary number of page selectors may be  given,  separated  by  commas  or
       whitespace; a page is selected if any of the selectors matches its \counts or absolute page number.

       Dviselect normally prints the page numbers of the pages selected; the -s option suppresses this.

AUTHOR
       Chris Torek, University of Maryland

SEE ALSO
       dviconcat(1), latex(1), tex(1)
       MC-TeX User's Guide
       The TeXbook

BUGS
       A leading ``-'' ought to be allowed for negative numbers, but it is currently used as a synonym for ``:'', for backwards compatibility.

       Section or subsection selection will sometimes fail, for the DVI file lists only the \count values that were active when the page ended.  Clever macro packages can alleviate this
       by making use of other ``free'' \count registers.  Chapters normally begin on new pages, and do not suffer from this particular problem.

       The heuristic that decides which arguments are page selectors and which are file names is often wrong.  Using shell redirection or the -i and -o options is safest.

       Dviselect does not adjust the parameters in the postamble; however, since these values are normally used only to size certain structures in the output  conversion  programs,  and
       the parameters never need to be adjusted upward, this has not proven to be a problem.

                                                                                                                                                                             DVISELECT(1)
