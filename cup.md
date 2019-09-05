CUP(1)                                                        General Commands Manual                                                       CUP(1)

NAME
       cup - LALR parser generator for Java(tm)

SYNOPSIS
       cup [options] <file

DESCRIPTION
       This manual page documents briefly the cup command.  This manual page was written for the Debian GNU/Linux distribution (but may be used by
       others),  because  the  original  program  does  not  have  a  manual  page.   Instead,  it  has  documentation   in   HTML   format;   see
       /usr/share/doc/cup/manual.html.

OPTIONS
       -package name
              specify package generated classes go in [default none].

       -parser name
              specify parser class name [default "parser"].

       -symbols name
              specify name for symbol constant class [default "sym"]

       -nonterms
              put non terminals in symbol constant class.

       -expect #
              number of conflicts expected/allowed [default 0].

       -compact_red
              compact tables by defaulting to most frequent reduce.

       -nowarn
              don't warn about useless productions, etc.

       -nosummary
              don't print the usual summary of parse states, etc.

       -nopositions
              don't propagate the left and right token position values.

       -progress
              print messages to indicate progress of the system.

       -time  print time usage summary.

       -dump_grammar
              produce a human readable dump of the symbols and grammar.

       -dump_states
              produce a dump of parse state machine.

       -dump_tables
              produce a dump of the parse tables

       -dump  produce a dump of all of the above.

SEE ALSO
       jlex(1), javac(1).

AUTHORS
       The  author  of  CUP is Scott E. Hudson <http://www.cc.gatech.edu/gvu/people/Faculty/Scott.E.Hudson.html>.  This manual page was written by
       Vincent Renardias <vincent@waw.com>, for the Debian GNU/Linux system.

                                                                                                                                            CUP(1)
