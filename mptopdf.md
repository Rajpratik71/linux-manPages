MPTOPDF(1)                                                                                         ConTeXt                                                                                         MPTOPDF(1)



NAME
       mptopdf - convert MetaPost to PDF


SYNOPSIS
       mptopdf FILE [ ...  ]


DESCRIPTION
       mptopdf can convert MetaPost-generated EPS files to PDF, or it can process a MetaPost source file directly (see mpost(1)) and convert the generated EPS files to PDF.


OPTIONS
       All switches are specified in full here but can be abbreviated to the shortest unique prefix.   Thus, --metaf works the same as --metafun.

       --help Print a terse help message.

       --metafun
              Use  the  metafun  pre-compiled  format to process the MetaPost source file.  You usually don't need this option, since metafun input is usually produced and processed as part of a texexec(1)
              run.  Needs the --rawmp switch to take effect.

       --rawmp
              Process the source file with mpost(1) directly, rather than with texexec(1).  This option is needed if you want to specify --metafun.

       --latex
              Typeseting labels using latex(1) rather than plain tex(1).


USAGE
       To convert manfig.20 to manfig-20.pdf:
          mptopdf manfig.20

       You can convert more than one EPS file at once:
          mptopdf manfig.20 otherfig.17 finalfig.8

       Or you can give mptopdf(1) a pattern that it will expand:
          mptopdf 'manfig.*'
       Note the single quotes to protect the * from the shell.  Of course, usually you can let the shell do the wildcard expansion and therefore leave off the quotes.

       To convert figs.mp to figs-1.pdf, figs-2.pdf, ...
          mptopdf figs.mp

       If the labels are typeset with latex(1):
          mptopdf --latex figs.mp


SEE ALSO
       tex(1), latex(1), mpost(1), pdftex(1), texexec(1).

       ConTeXt wiki ⟨http://www.contextgarden.net⟩.


AUTHOR
       mptopdf(1) is part of the ConTeXt system by Hans Hagen et al, which is available from PRAGMA ADE ⟨http://www.pragma-ade.com/⟩.  This manpage was written by Sanjoy Mahajan <sanjoy@mit.edu> and is  in
       the public domain.



mptopdf 1.3.2                                                                                    January 2007                                                                                      MPTOPDF(1)
