PYCHECKER(1)                                                       User Commands                                                      PYCHECKER(1)

NAME
       pychecker - program to check python scripts for common mistakes

SYNOPSIS
       pychecker [options] files...

DESCRIPTION
       This manual page documents briefly the pychecker command. It was written for the Debian GNU/Linux distribution because the original program
       does not have a manual page.

       pychecker is a program that finds common bugs in python source code. It finds problems that are typically caught by  a  compiler  for  less
       dynamic  languages,  like  C  and  C++. Because of the dynamic nature of python, some warnings may be incorrect; however, spurious warnings
       should be fairly infrequent.

       pychecker works in a combination of ways.  First, it imports each module. If there is an import error, the module cannot be processed.  The
       import provides some basic information about the module.  The code for each function, class, and method is checked for possible problems.

CHOICE OF PYTHON VERSION
       By  default, the /usr/bin/pychecker script executes pychecker using the default Python interpreter in /usr/bin/python.  Some users may want
       to run pychecker with a different Python interpreter.  To accommodate this, the
        /usr/bin/pychecker script supports the use of $PYTHONVER on the command-line, i.e.

       PYTHONVER=2.3 pychecker file.py

       If $PYTHONVER is set, /usr/bin/pychecker will attempt to execute pychecker using /usr/bin/python$PYTHONVER instead of /usr/bin/python.

       Note, however, that this will only work for versions of the python interpreter supported by the current Debian Python  infrastructure,  not
       for any arbitrary Python interpreter installed in /usr/bin.

OPTIONS
       Long options can be preceded with no- to turn off (e.g., no-namedargs). Default settings are indicated by [brackets]

   Major Options:
       --only only warn about files passed on the command line [off]

       -e, --level
              the maximum error level of warnings to be displayed

       -#, --limit
              the maximum number of warnings to be displayed [10]

       -F, --config
              specify .pycheckrc file to use

       --quixote
              support Quixote's PTL modules

       --evil list of evil C extensions that crash the interpreter [[]]

   Error Control:
       -i, --import
              unused imports [on]

       -k, --pkgimport
              unused imports from __init__.py [on]

       -M, --reimportself module imports itself [on]

       -X, --reimport
              reimporting a module [on]

       -x, --miximport
              module does import and from ... import [on]

       -l, --local
              unused local variables, except tuples [on]

       -t, --tuple
              all unused local variables, including tuples [off]

       -9, --members
              all unused class data members [off]

       -v, --var
              all unused module variables [off]

       -p, --privatevar
              unused private module variables [on]

       -g, --allglobals
              report each occurrence of global warnings [off]

       -n, --namedargs
              functions called with named arguments (like keywords) [off]

       -a, --initattr
              Attributes (members) must be defined in __init__() [off]

       -I, --initsubclass Subclass.__init__() not defined [off]

       -u, --callinit
              Baseclass.__init__() not called [on]

       -0, --abstract
              Subclass needs to override methods that only throw exceptions [on]

       -N, --initreturn
              Return None from __init__() [on]

       -8, --unreachable
              unreachable code [off]

       -2, --constCond
              a constant is used in a conditional statement [on]

       -1, --constant1
              1 is used in a conditional statement (if 1: or while 1:) [off]

       --stringiter
              check if iterating over a string [on]

       --stringfind
              check improper use of string.find() [on]

       -A, --callattr
              Calling data members as functions [off]

       -y, --classattr
              class attribute does not exist [on]

       -S, --self
              First argument to methods [self]

       --classmethodargs First argument to classmethods [['cls', 'klass']]

       -T, --argsused
              unused method/function arguments [on]

       -z, --varargsused
              unused method/function variable arguments [on]

       -G, --selfused
              ignore if self is unused in methods [off]

       -o, --override
              check if overridden methods have the same signature [on]

       --special
              check if __special__ methods exist and have the correct signature [on]

       -U, --reuseattr
              check if function/class/method names are reused [on]

       -Y, --positive
              check if using unary positive (+) which is usually meaningless [on]

       -j, --moddefvalue
              check if modify (call method) on a parameter that has a default value [on]

       --changetypes
              check if variables are set to different types [off]

       --unpack
              check if unpacking a non-sequence [on]

       --unpacklen
              check if unpacking sequence with the wrong length [on]

       --badexcept
              check if raising or catching bad exceptions [on]

       -4, --noeffect
              check if statement appears to have no effect [on]

       --modulo1
              check if using (expr % 1), it has no effect on integers and strings [on]

       --isliteral
              check if using (expr is const-literal), doesn't always work on integers and strings [on]

   Possible Errors:
       -r, --returnvalues check consistent return values [on]

       -C, --implicitreturns check if using implict and explicit return values [on]

       -O, --objattrs
              check that attributes of objects exist [on]

       -7, --slots
              various warnings about incorrect usage of __slots__ [on]

       -3, --properties
              using properties with classic classes [on]

       --emptyslots
              check if __slots__ is empty [on]

       -D, --intdivide
              check if using integer division [on]

       -w, --shadow
              check if local variable shadows a global [on]

       -s, --shadowbuiltin check if a variable shadows a builtin [on]

   Security:
       --input
              check if input() is used [on]

       -6, --exec
              check if the exec statement is used [off]

   Suppressions:
       -q, --stdlib
              ignore warnings from files under standard library [off]

       -b, --blacklist
              ignore warnings from the list of modules [['Tkinter', 'wxPython', 'gtk', 'GTK', 'GDK']]

       -Z, --varlist
              ignore  global  variables  not used if name is one of these values [['__version__', '__warningregistry__', '__all__', '__credits__',
              '__test__', '__author__', '__email__', '__revision__', '__id__', '__copyright__', '__license__', '__date__']]

       -E, --unusednames
              ignore unused locals/arguments if name is one of these values [['_', 'empty', 'unused', 'dummy']]

       --deprecated
              ignore use of deprecated modules/functions [on]

   Complexity:
       -L, --maxlines
              maximum lines in a function [200]

       -B, --maxbranches
              maximum branches in a function [50]

       -R, --maxreturns
              maximum returns in a function [10]

       -J, --maxargs
              maximum # of arguments to a function [10]

       -K, --maxlocals
              maximum # of locals in a function [40]

       -5, --maxrefs
              maximum # of identifier references (Law of Demeter) [5]

       -m, --moduledoc
              no module doc strings [off]

       -c, --classdoc
              no class doc strings [off]

       -f, --funcdoc
              no function/method doc strings [off]

   Debug:
       --rcfile
              print a .pycheckrc file generated from command line args

       -P, --printparse
              print internal checker parse structures [off]

       -d, --debug
              turn on debugging for checker [off]

       -Q, --quiet
              turn off all output except warnings [off]

       -V, --version
              print the version of PyChecker and exit

AUTHOR
       Pychecker was written by Neal Norwitz and Eric C. Newton. Other contributors are listed in /usr/share/doc/pychecker/MAINTAINERS

       This manual page was written by Fredrik Steen <stone@debian.org> for the Debian GNU/Linux system (but may be used by others).  It has  been
       subsequently modified by Kenneth J. Pronovici <pronovic@debian.org>.

SEE ALSO
       python(1)

       Running  pychecker  --help may provide more complete documentation of program options.  The pychecker web page at <http://pychecker.source‐
       forge.net> contains some guidance on using the program.

pychecker 0.8.19                                                     Jan 2011                                                         PYCHECKER(1)
