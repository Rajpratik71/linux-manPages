BLAHTEXML(1)                                                  General Commands Manual                                                 BLAHTEXML(1)

NAME
       blahtexml - Converts TeX equations into MathML

SYNOPSIS
       blahtexml [options] files...

DESCRIPTION
       This manual page documents briefly the blahtexml command.

       blahtexml  converts  an equation given in a syntax close to TeX into MathML. Blahtexml is a simple extension of blahtex. In addition to the
       functionality of blahtex, blahtexml has XML processing in mind and is able to process a whole  XML  document  into  another  XML  document.
       Instead of converting only one formula at a time, blahtexml can convert all the formulas of the given XML file into MathML.

OPTIONS
       These  programs  follow  the  usual  GNU  command  line  syntax, with long options starting with two dashes (`-').  A summary of options is
       included below.  For a complete description, see the online documentation.

       --help Show summary of options.

       --texvc-compatible-commands
              Enables use of commands that are specific to texvc, but that are not standard TeX/LaTeX/AMS-LaTeX commands.

       --print-error-messages
              This will print out a list of all error IDs and corresponding messages that blahtex can possibly emit inside an <error> block.

MATHML OPTIONS
       These options control the MathML output of the blahtexml program.

       --mathml
              Enables MathML output.

       --xmlin
              This allows one to embed TeX equations in an existing MathML code, using a special notation. The equations are given  as  attributes
              (inline  or  block) in the http://gva.noekeon.org/blahtexml namespace. Whenever blahtexml meets such an equation, it expands it into
              the equivalent MathML code.

              For more information check
              http://gva.noekeon.org/blahtexml/how_to_use.html
              or the blahtexml manual.

       --annotate-TeX
              Produces TeX annotations in the MathML output.

       --annotate-PNG
              Produces PNG files and annotates the MathML output with the PNG file name.

SEE ALSO
       The program is documented fully by the online manual available at: http://gva.noekeon.org/blahtexml

AUTHOR
       blahtexml was written by Gilles Van Assche.
       blahtex (whose superset is blahtexml) was written by David Harvey.

       This manual page was written by Abhishek Dasgupta <abhidg@gmail.com>, for the Debian project (but may be used by others).

                                                                  March 17, 2010                                                      BLAHTEXML(1)
