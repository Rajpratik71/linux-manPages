D:(1)                                                              User Commands                                                             D:(1)

NAME
       D: - find defects in conditinal C code

SYNOPSIS
       undertaker [OPTIONS] <file..>

DESCRIPTION
       I: undertaker v1.1+179-2bb9f3f-dirty `undertaker' analyzes conditional C code with #ifdefs.

OPTIONS
       -V     print version information

       -v     increase the log level (more verbose)

       -q     decrease the log level (less verbose)

       -m     specify the model(s) (directory or file)

       -M     specify the main model

       -w     specify a whitelist

       -b     specify a worklist (batch mode)

       -t     specify count of parallel processes

       -I     add an include path for #include directives

       -j     specify the jobs which should be done
              dead
               dead/undead file analysis (default)
              coverage
               coverage file analysis
              cpppc
               CPP Preconditions for whole file
              blockpc: Block precondition (format: <file>:<line>
               <column>)
              symbolpc
               Symbol precondition (format <symbol>)
              checkexpr
               Find a configuration that satisfies expression
              interesting
               Find related items (negated items are not in the model)

   Coverage Options:
       -O: specify the output mode of generated configurations

              kconfig
               generated partial kconfig configuration (default)
              stdout
               print on stdout the found configurations
              cpp
               print on stdout cpp -D command line arguments
              exec:cmd
               pipe file for every configuration to cmd
              model
               print all options which are in the configuration space
              all
               dump every assigned symbol (both items and code blocks)

       -C: specify coverage algorithm

       simple
              - relative simple and fast algorithm (default)

       min    - slow but generates less configuration sets

   Specifying Files:
              You  can  specify  one or many files (the format is according to the job (-j) which should be done. If you specify - as file, under‐
              taker will load models and whitelist and read files from stdin (interactive).

       please specify a file to scan or a worklist

       `undertaker' analyzes conditional C code with #ifdefs.

       Usage: undertaker [OPTIONS] <file..>

       -V     print version information

       -v     increase the log level (more verbose)

       -q     decrease the log level (less verbose)

       -m     specify the model(s) (directory or file)

       -M     specify the main model

       -w     specify a whitelist

       -b     specify a worklist (batch mode)

       -t     specify count of parallel processes

       -I     add an include path for #include directives

       -j     specify the jobs which should be done
              dead
               dead/undead file analysis (default)
              coverage
               coverage file analysis
              cpppc
               CPP Preconditions for whole file
              blockpc: Block precondition (format: <file>:<line>
               <column>)
              symbolpc
               Symbol precondition (format <symbol>)
              checkexpr
               Find a configuration that satisfies expression
              interesting
               Find related items (negated items are not in the model)

   Coverage Options:
       -O: specify the output mode of generated configurations

              kconfig
               generated partial kconfig configuration (default)
              stdout
               print on stdout the found configurations
              cpp
               print on stdout cpp -D command line arguments
              exec:cmd
               pipe file for every configuration to cmd
              model
               print all options which are in the configuration space
              all
               dump every assigned symbol (both items and code blocks)

       -C: specify coverage algorithm

       simple
              - relative simple and fast algorithm (default)

       min    - slow but generates less configuration sets

   Specifying Files:
              You can specify one or many files (the format is according to the job (-j) which should be done. If you specify -  as  file,  under‐
              taker will load models and whitelist and read files from stdin (interactive).

AUTHOR
       Written by the VAMOS team <URL:http://vamos.informatik.uni-erlangen.de>

REPORTING BUGS
       Report bugs to <vamos-dev@i4.informatik.uni-erlangen.de>.

SEE ALSO
       undertaker(1) undertaker-kconfigdump(1), undertaker-linux-tree(1).

D: undertaker v1.1+179-2bb9f3f-dirty                               December 2011                                                             D:(1)
