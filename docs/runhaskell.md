RUNGHC(1)                              General Commands Manual                              RUNGHC(1)

NAME
       runghc - program to run Haskell programs without first having to compile them.

SYNOPSIS
       runghc [runghc|flags] [GHC|flags] module [program|flags]...

DESCRIPTION
       runghc  is  considered a non-interactive interpreter and part of The Glasgow Haskell Compiler.
       runghc is a compiler that automatically runs its results at the end.

OPTIONS
       the flags are:

       -f     it tells runghc which GHC to use to run the program. If it is  not  given  then  runghc
              will  search  for  GHC  in  the  directories  in  the  system  search  path.  runghc -f
              /path/to/ghc

       --     runghc will try to work out where  the  boundaries  between  [runghc  flags]  and  [GHC
              flags],  and [GHC flags] and module are, but you can use a -- flag if it doesn't get it
              right. For example, runghc -- -fglasgow-exts Foo means runghc won't try to use glasgow-
              exts as the path to GHC, but instead will pass the flag to GHC.

EXAMPLES
       runghc foo

       runghc -f /path/to/ghc foo

       runghc -- -fglasgow-exts Foo

SEE ALSO
       ghc(1), ghci(1).

COPYRIGHT
       Copyright 2002, The University Court of the University of Glasgow. All rights reserved.

AUTHOR
       This manual page was written by Efrain Valles Pulgar <effie.jayx@gmail.com>. This is free doc‐
       umentation; see the GNU General Public Licence version 2  or  later  for  copying  conditions.
       There is NO WARRANTY.

                                           28 NOVEMBER 2007                                 RUNGHC(1)
