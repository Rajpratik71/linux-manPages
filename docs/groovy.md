GROOVY(1)                                                     General Commands Manual                                                    GROOVY(1)

NAME
       Groovy - Agile dynamic language for the Java Virtual Machine

DESCRIPTION
       usage: groovy [options] [args] options:

       -D,--define <name=value>
              define a system property

       -a,--autosplit <splitPattern>
              automatically split current line (defaults to '\s')

       -c,--encoding <charset>
              specify the encoding of the files

       -d,--debug
              debug mode will print out full stack traces

       -e <script>
              specify a command line script

       -h,--help
              usage information

       -i <extension>
              modify files in place, create backup if extension is given (e.g. '.bak')

       -l <port>
              listen on a port and process inbound lines

       -n     process files line by line

       -p     process files line by line and print result

       -v,--version
              display the Groovy and JVM versions

COMMANDS
       groovy:
              Command to run a set of Groovy statements entered on the command line (with -e), or stored in a text file whose name is given on the
              command.

              example: groovy -e 'System.in.readLines().each { println it }'

       groovysh:
              Terminal-based interpreter for Groovy.

       groovyConsole:
              GUI interpreter for composing Groovy interactively.

       java2groovy:
              The java2groovy tool reads class and interface definitions, written in the Java programming language, and converts them into  groovy
              source files.

SEE ALSO
       groovyc(1)

AUTHOR
       This  manual  page was generated using help2man and edited by Varun Hiremath <varun@debian.org>, for the Debian project (but may be used by
       others).

                                                                   December 2007                                                         GROOVY(1)
