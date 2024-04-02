jrunscript(1)                                                     Scripting Tools                                                    jrunscript(1)

NAME
       jrunscript - Runs a command-line script shell that supports interactive and batch modes. This command is experimental and unsupported.

SYNOPSIS
       jrunscript [options] [arguments]

       options
              The command-line options. See Options.

       arguments
              Arguments, when used, follow immediately after options or the command name. See Arguments.

DESCRIPTION
       The jrunscript command is a language-independent command-line script shell. The jrunscript command supports both an interactive (read-eval-
       print) mode and a batch (-f option) mode of script execution. By default, JavaScript is the language used, but the -l option can be used to
       specify a different language. By using Java to scripting language communication, the jrunscript command supports an exploratory programming
       style.

OPTIONS
       -classpath path
              Indicate where any class files are that the script needs to access.

       -cp path
              Same as -classpathpath.

       -Dname=value
              Sets a Java system property.

       -Jflag
              Passes flag directly to the Java Virtual Machine where the jrunscript command is running.

       -I language
              Uses the specified scripting language. By default, JavaScript is used. To use other scripting languages, you must specify the
              corresponding script engine's JAR file with the -cp or -classpath option.

       -e script
              Evaluates the specified script. This option can be used to run one-line scripts that are specified completely on the command line.

       -encoding encoding
              Specifies the character encoding used to read script files.

       -f script-file
              Evaluates the specified script file (batch mode).

       -f -
              Reads and evaluates a script from standard input (interactive mode).

       -help
              Displays a help message and exits.

       -?
              Displays a help message and exits.

       -q
              Lists all script engines available and exits.

ARGUMENTS
       If arguments are present and if no -e or -f option is used, then the first argument is the script file and the rest of the arguments, if
       any, are passed to the script. If arguments and -e or the -f option are used, then all arguments are passed to the script. If arguments, -e
       and -f are missing, then interactive mode is used. Script arguments are available to a script in an engine variable named arguments of type
       String array.

EXAMPLES
   EXECUTE INLINE SCRIPTS
       jrunscript -e "print('hello world')"
       jrunscript -e "cat('http://www.example.com')"

   USE SPECIFIED LANGUAGE AND EVALUATE THE SCRIPT FILE
       jrunscript -l js -f test.js

   INTERACTIVE MODE
       jrunscript
       js> print('Hello World\n');
       Hello World
       js> 34 + 55
       89.0
       js> t = new java.lang.Thread(function() { print('Hello World\n'); })
       Thread[Thread-0,5,main]
       js> t.start()
       js> Hello World
       js>

   RUN SCRIPT FILE WITH SCRIPT ARGUMENTS
       The test.js file is the script file. The arg1, arg2 and arg3 arguments are passed to the script. The script can access these arguments with
       an arguments array.

       jrunscript test.js arg1 arg2 arg3

SEE ALSO
       If JavaScript is used, then before it evaluates a user defined script, the jrunscript command initializes certain built-in functions and
       objects. These JavaScript built-ins are documented in JsDoc-Toolkit at http://code.google.com/p/jsdoc-toolkit/

JDK 8                                                            21 November 2013                                                    jrunscript(1)
