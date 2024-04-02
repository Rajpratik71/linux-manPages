ANTLR(1)                                                               antlr                                                              ANTLR(1)

NAME
       ANTLR - ANother Tool for Language Recognition

SYNOPSIS
       java antlr.Tool or runantlr ["args"] file.g

DESCRIPTION
       ANTLR,  ANother  Tool for Language Recognition, (formerly PCCTS) is a language tool that provides a framework for constructing recognizers,
       compilers, and translators from grammatical descriptions containing C++ or Java actions.

       -o outputDir
              specify output directory where all output generated.

       -glib superGrammar
              specify location of supergrammar file.

       -debug launch the ParseView debugger upon parser invocation.

       -html  generate an html file from your grammar (minus actions).

       -diagnostic
              generate a textfile with diagnostics.

       -trace have all rules call traceIn/traceOut.

       -traceParser
              have parser rules call traceIn/traceOut.

       -traceLexer
              have lexer rules call traceIn/traceOut.

       -traceTreeParser
              have tree parser rules call traceIn/traceOut.

AUTHOR
       This manual page was written by John Leuner <jewel@debian.org>

SEE ALSO
       java(1), http://www.antlr.org/

GNU                                                              December 22, 2001                                                        ANTLR(1)
