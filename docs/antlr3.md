ANTLR(1)                                                      General Commands Manual                                                     ANTLR(1)

NAME
       ANTLR - ANother Tool for Language Recognition, version 3

SYNOPSIS
       antlr3 [args] file.g [ file2.g file3.g ...]

DESCRIPTION
       ANTLR  (ANother  Tool for Language Recognition) is a parser generator for reading, processing, executing, or translating structured text or
       binary files. It's widely used to build languages, tools, and frameworks. From a grammar, ANTLR generates a parser that can build and  walk
       parse trees.

       -o outputDir
              specify output directory where all output generated.

       -fo outputDir
              same as -o but force even files with relative paths to dir.

       -lib dir
              specify location of token files.

       -depend
              generate file dependencies.

       -report
              print out a report about the grammar(s) processed.

       -print print out the grammar without actions.

       -debug generate a parser that emits debugging events.

       -profile
              generate a parser that computes profiling information.

       -trace generate a recognizer that traces rule entry/exit.

       -nfa   generate an NFA for each rule.

       -dfa   generate a DFA for each decision point.

       -message-format name
              specify output style for messages.

       -verbose
              generate ANTLR version and other information.

       -make  only build if generated files older than grammar.

       -version
              print the version of ANTLR and exit.

       -language L
              override language grammar option; generate L

       -X     display the list of extended arguments

       -Xgrtree
              print the grammar AST

       -Xdfa  print DFA as text

       -Xnoprune
              test lookahead against EBNF block exit branches

       -Xnocollapse
              collapse incident edges into DFA states

       -Xdbgconversion
              dump lots of info during NFA conversion

       -Xconversiontimeout
              use to restrict NFA conversion exponentiality

       -Xmultithreaded
              run the analysis in 2 threads

       -Xnomergestopstates
              do not merge stop states

       -Xdfaverbose
              generate DFA states in DOT with NFA configs

       -Xwatchconversion
              print a message for each NFA before converting

       -XdbgST
              put tags at start/stop of all templates in output

       -Xnfastates
              for nondeterminisms, list NFA states for each path

       -Xm m  max number of rule invocations during conversion [4]

       -Xmaxdfaedges m
              max "comfortable" number of edges for single DFA state [65534]

       -Xmaxinlinedfastates m
              max DFA states before table used rather than inlining [60]

       -Xmaxswitchcaselabels m
              don't generate switch() statements for dfas bigger than m [300]

       -Xminswitchalts m
              don't generate switch() statements for dfas smaller than m [3]

       -Xsavelexer
              don't delete temporary lexers generated from combined grammars

AUTHOR
       This manual page was written by Ludovic Claude <ludovic.claude@laposte.net>

SEE ALSO
       java(1), runantlr(1), http://www.antlr.org/

antlr                                                              July 22, 2015                                                          ANTLR(1)
