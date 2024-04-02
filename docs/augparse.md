AUGPARSE(1)                                                                                         Augeas                                                                                        AUGPARSE(1)



NAME
       augparse - execute an Augeas module

SYNOPSIS
       augparse [OPTIONS] MODULE

DESCRIPTION
       Execute an Augeas module, most commonly to evaluate the tests it contains.

OPTIONS
       -I, --include=DIR
           Add DIR to the module loadpath. Can be given multiple times. The directories set here are searched before any directories specified in the AUGEAS_LENS_LIB environment variable, and before the
           default directory /usr/share/augeas/lenses.

       -t, --trace
           Print a trace of the modules that are being loaded.

       --nostdinc
           Do not search any of the default directories for modules. When this option is set, only directories specified explicitly with -I or specified in AUGEAS_LENS_LIB will be searched for modules.

       --notypecheck
           Do not perform lens type checks. Only use this option during lens development and make sure you typecheck lenses when you are done developing - you should never use a lens that hasn't been
           typechecked. This option is sometimes useful when you are working on unit tests for a lens to speed up the time it takes to repeatedly run and fix tests.

       --version
           Print version information and exit.

       -h  Display this help and exit

EXAMPLES
       To run the tests in lenses/tests/test_foo.aug and use modules from the directory lenses, run

           augparse -I lenses lenses/tests/test_foo.aug

TESTS
       Tests can appear as top-level forms anywhere in a module. Generally, the tests for a module lenses/foo.aug are kept in a separate file, usually in lenses/tests/test_foo.aug.

       There are two different kinds of tests that Augeas can run: get and put tests. The syntax for get tests is

           test LENS get STRING = RESULT

       which applies the get direction of the lens LENS to STRING and compares it with the given RESULT. RESULT can either be a tree literal, the symbol ? to print the result of applying LENS to STRING, or
       the symbol * to indicate that the test should produce an exception.

       The syntax for put tests is

           test LENS put STRING after COMMANDS = RESULT

       which first applies the get direction of the lens LENS to STRING, then applies the given COMMANDS to the resulting tree, and finally transforms the modified tree back to a string using the put
       direction of LENS. The resulting string is then compared to RESULT, which can be a string, the symbol ? to print the result of applying LENS to STRING, or the symbol * to indicate that the test
       should produce an exception.

SEE ALSO
       Augeas project homepage <http://www.augeas.net/>

       augtool



Augeas 1.0.0                                                                                      2013-02-06                                                                                      AUGPARSE(1)
