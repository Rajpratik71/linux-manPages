docbook-to-man(1)                                             General Commands Manual                                            docbook-to-man(1)

NAME
       docbook-to-man — convert DocBook       SGML into roff -man macros

SYNOPSIS
       docbook-to-man [source.sgml]  [>]  [destination.1]

DESCRIPTION
       The  docbook-to-man  tool  is  a  batch converter that transforms UNIX-style manpages from the DocBook SGML       DTD into nroff/troff -man
       macros.

       docbook-to-man is the shell command that runs the low-level components to translate a single DocBook SGML document instance (whose document
       element is <RefEntry>) into pretty-much vanilla -man macros, with tables rendered in tbl.

       This is not the original version by Fred Dalrymple, but one with the ANS Modifications by David Bolen (db3l@ans.net).

       This manual page and some small changes are by W. Borgert debacle@debian.org for Debian GNU/Linux.  Permission is granted to copy, distrib‐
       ute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or any later version  published  by  the
       Free Software Foundation; with no Invariant Sections, no Front-Cover Texts and no Back-Cover Texts.

White space and special characters
       If  you  want to use tabs in your manpage you should use <programlisting>, <literal> or <screen> and invoke docbook-to-man with INSTANT_OPT
       set to a tab character. Be aware that multiple tabs will be collapsed into one.

       When you want to collapse white space into one, you should invoke docbook-to-man with INSTANT_OPT set to a space character.

       Special characters like \, ' or . will not be interpreted if you set INSTANT_OPT to a space or tab character.

ENVIRONMENT
       If the variable INSTANT_OPT is not set, the instant(1) is called with the parameter -d by docbook-to-man.  If you don't want this, e.g.  if
       you want to use some special characters literally in your SGML file, you can set INSTANT_OPT to just a space character:

       INSTANT_OPT=" " docbook-to-man src.sgml > dst.1

       Note: The better way to use special characters like ^ or > is to write them in the SGML way, i.e. &caret; or &gt;.

COPYRIGHT
       Copyright (c) 1996 X Consortium

       Copyright (c) 1996 Dalrymple Consulting

       Permission  is  hereby  granted,  free  of  charge, to any person obtaining a copy of this software and associated documentation files (the
       "Software"), to deal in the Software without restriction, including without limitation the rights to use,  copy,  modify,  merge,  publish,
       distribute,  sublicense,  and/or  sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
       the following conditions:

       The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO  THE  WARRANTIES  OF  MER‐
       CHANTABILITY,  FITNESS  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE X CONSORTIUM OR DALRYMPLE CONSULTING BE LIABLE
       FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION  WITH
       THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

       Except as contained in this notice, the names of the X Consortium and Dalrymple Consulting shall not be used in advertising or otherwise to
       promote the sale, use or other dealings in this Software without prior written authorization.

See also
       instant(1) and transpec(5)

                                                                                                                                 docbook-to-man(1)
