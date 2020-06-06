GHC(1)                                 Glasgow Haskell Compiler                                GHC(1)

NAME
       ghc - the Glasgow Haskell Compiler

SYNOPSIS
          ghc [option|filename]
          ghci [option|filename]

DESCRIPTION
       This manual page documents briefly the ghc and ghci commands. Note that ghci is not yet avail‐
       able on all architectures. Extensive documentation  is  available  in  various  other  formats
       including PDF and HTML; see below.

       Each  of  GHC's  command line options is classified as either static or dynamic. A static flag
       may only be specified on the command line, whereas a dynamic flag may  also  be  given  in  an
       OPTIONS pragma in a source file or set from the GHCi command-line with :set .

       As  a  rule of thumb, all the language options are dynamic, as are the warning options and the
       debugging options.

       The rest are static, with the notable exceptions of -v,  -cpp,  -fasm,  -fvia-C,  -fllvm,  and
       -#include.  The OPTIONS sections lists the status of each flag.

       Common suffixes of file names for Haskell are:

       .hs    Haskell source code; preprocess, compile

       .lhs   literate Haskell source; unlit, preprocess, compile

       .hi    Interface file; contains information about exported symbols

       .hc    intermediate C files

       .⟨way⟩_o
              object files for "way" ⟨way⟩; common ways are:

              dyn    dynamically-linked

              p      built with profiling

       .⟨way⟩_hi
              interface files for "way" ⟨way⟩; common ways are:

OPTIONS
       Code generation
              -fasm  -fllvm  -fno-code  -fwrite-interface  -fbyte-code  -fobject-code  -g⟨n⟩ -dynamic
              -dynamic-too

       Debugging the compiler
              -dcore-lint  -ddump-to-file   -ddump-asm   -ddump-bcos   -ddump-cmm   -ddump-core-stats
              -ddump-cse    -ddump-deriv   -ddump-ds   -ddump-foreign   -ddump-hpc   -ddump-inlinings
              -ddump-llvm  -ddump-occur-anal  -ddump-opt-cmm  -ddump-parsed   -ddump-prep   -ddump-rn
              -ddump-rule-firings    -ddump-rule-rewrites   -ddump-rules   -ddump-vect   -ddump-simpl
              -ddump-simpl-iterations   -ddump-spec    -ddump-splices    -ddump-stg    -ddump-stranal
              -ddump-str-signatures   -ddump-tc   -dth-dec-file   -ddump-types  -ddump-worker-wrapper
              -ddump-if-trace   -ddump-tc-trace   -ddump-vt-trace   -ddump-rn-trace   -ddump-rn-stats
              -ddump-simpl-stats   -dno-debug-output   -dppr-debug   -dppr-user-length  -dppr-cols⟨N⟩
              -dppr-case-as-let   -dsuppress-all    -dsuppress-uniques    -dsuppress-idinfo    -dsup‐
              press-unfoldings     -dsuppress-module-prefixes    -dsuppress-type-signatures    -dsup‐
              press-type-applications  -dsuppress-coercions  -dsource-stats   -dcmm-lint   -dstg-lint
              -dstg-stats   -dverbose-core2core  -dverbose-stg2stg  -dshow-passes  -dfaststring-stats
              -frule-check

       C pre-processor
              -cpp -D⟨symbol⟩[=⟨value⟩] -U⟨symbol⟩ -I⟨dir⟩

       Finding imports
              -i ⟨dir1⟩:⟨dir2⟩:... -i

       Interactive mode
              -ignore-dot-ghci       -ghci-script        -fbreak-on-error        -fbreak-on-exception
              -fghci-hist-size=⟨n⟩  -fprint-evld-with-show  -fprint-bind-result  -fno-print-bind-con‐
              tents -fno-implicit-import-qualified -interactive-print

       Interface files
              -ddump-hi -ddump-hi-diffs -ddump-minimal-imports --show-iface ⟨file⟩

       Keeping intermediate files
              -keep-hc-file,   -keep-hc-files   -keep-llvm-file,    -keep-llvm-files    -keep-s-file,
              -keep-s-files -keep-tmp-files

       Language options
              -fconstraint-solver-iterations=⟨n⟩  -freduction-depth=⟨n⟩  -fcontext-stack=⟨n⟩  -fglas‐
              gow-exts -firrefutable-tuples -fpackage-trust -ftype-function-depth=⟨n⟩  -XAllowAmbigu‐
              ousTypes  -XArrows -XApplicativeDo -XAutoDeriveTypeable -XBangPatterns -XBinaryLiterals
              -XCApiFFI -XConstrainedClassMethods -XConstraintKinds -XCPP -XDataKinds -XDefaultSigna‐
              tures -XDeriveAnyClass -XDeriveDataTypeable -XDeriveFunctor -XDeriveFoldable -XDeriveG‐
              eneric  -XDeriveGeneric  -XDeriveLift  -XDeriveTraversable   -XDisambiguateRecordFields
              -XEmptyCase  -XEmptyDataDecls  -XExistentialQuantification -XExplicitForAll -XExplicit‐
              Namespaces -XExtendedDefaultRules -XFlexibleContexts -XFlexibleInstances -XForeignFunc‐
              tionInterface  -XFunctionalDependencies -XGADTs -XGADTSyntax -XGeneralizedNewtypeDeriv‐
              ing -XGenerics  -XImplicitParams  -XNoImplicitPrelude  -XImpredicativeTypes  -XIncoher‐
              entInstances  -XTypeFamilyDependencies  -XInstanceSigs  -XInterruptibleFFI -XKindSigna‐
              tures -XLambdaCase -XLiberalTypeSynonyms -XMagicHash -XMonadComprehensions -XMonoLocal‐
              Binds -XNoMonomorphismRestriction -XMultiParamTypeClasses -XMultiWayIf -XNamedFieldPuns
              -XNamedWildCards -XNegativeLiterals -XNoNPlusKPatterns -XNullaryTypeClasses  -XNumDeci‐
              mals   -XOverlappingInstances  -XOverloadedLists  -XOverloadedStrings  -XPackageImports
              -XParallelArrays -XParallelListComp -XPartialTypeSignatures -XPatternGuards  -XPattern‐
              Synonyms    -XPolyKinds    -XPolymorphicComponents   -XPostfixOperators   -XQuasiQuotes
              -XRank2Types -XRankNTypes -XRebindableSyntax -XRecordWildCards -XRecursiveDo  -XRoleAn‐
              notations  -XSafe  -XScopedTypeVariables  -XStandaloneDeriving -XStrictData -XTemplate‐
              Haskell   -XTemplateHaskellQuotes    -XNoTraditionalRecordSyntax    -XTransformListComp
              -XTrustworthy  -XTupleSections  -XTypeFamilies  -XTypeOperators  -XTypeSynonymInstances
              -XUnboxedTuples  -XUndecidableInstances  -XUnicodeSyntax  -XUnliftedFFITypes   -XUnsafe
              -XViewPatterns

       Linking options
              -shared   -staticlib  -fPIC  -dynload  -framework⟨name⟩  -framework-path⟨name⟩  -l⟨lib⟩
              -L⟨dir⟩     -main-is     --mk-dll     -no-hs-main     -rtsopts,-rtsopts={none,some,all}
              -with-rtsopts=opts -no-rtsopts-suggestions -no-link -split-objs -split-sections -static
              -threaded    -debug    -ticky    -eventlog    -fno-gen-manifest     -fno-embed-manifest
              -fno-shared-implib -dylib-install-name ⟨path⟩ -rdynamic

       Miscellaneous options
              -jN  -fno-hi-version-check  -fhistory-size  -fno-ghci-history  -fno-ghci-sandbox  -fre‐
              verse-errors

       Modes of operation
              --help,-? --interactive --make -e  expr  --show-iface  -M  --frontend  ⟨module⟩  --sup‐
              ported-extensions,    --supported-languages   --show-options   --info   --version,   -V
              --numeric-version --print-libdir

       Individual optimizations
              -fcall-arity  -fcase-merge   -fcmm-elim-common-blocks   -fcmm-sink   -fcpr-anal   -fcse
              -fdicts-cheap         -fdicts-strict        -fdmd-tx-dict-sel        -fdo-eta-reduction
              -fdo-lambda-eta-expansion -feager-blackholing -fenable-rewrite-rules -fexcess-precision
              -fexpose-all-unfoldings   -ffloat-in  -ffull-laziness  -ffun-to-thunk  -fignore-asserts
              -fignore-interface-pragmas  -flate-dmd-anal   -fliberate-case   -fliberate-case-thresh‐
              old=⟨n⟩   -floopification   -fmax-inline-alloc-size=⟨n⟩   -fmax-inline-memcpy-insns=⟨n⟩
              -fmax-inline-memset-insns=⟨n⟩ -fmax-relevant-binds=⟨n⟩  -fmax-simplifier-iterations=⟨n⟩
              -fmax-worker-args=⟨n⟩ -fno-opt-coercion -fno-pre-inlining -fno-state-hack -fomit-inter‐
              face-pragmas  -fomit-yields  -foptimal-applicative-do  -fpedantic-bottoms  -fregs-graph
              -fregs-iterative    -fsimplifier-phases=⟨n⟩    -fsimpl-tick-factor=⟨n⟩    -fspec-constr
              -fspec-constr-count=⟨n⟩  -fspec-constr-threshold=⟨n⟩  -fspecialise  -fcross-module-spe‐
              cialise  -fstatic-argument-transformation  -fstrictness  -fstrictness-before=⟨n⟩  -fun‐
              box-small-strict-fields -funbox-strict-fields -funfolding-creation-threshold=⟨n⟩  -fun‐
              folding-dict-discount=⟨n⟩  -funfolding-fun-discount=⟨n⟩  -funfolding-keeness-factor=⟨n⟩
              -funfolding-use-threshold=⟨n⟩ -fvectorisation-avoidance -fvectorise -fworker-wrapper

       Optimization levels
              -O0 -O, -O1 -O2 -Odph

       Package options
              -this-unit-id⟨P⟩  -package⟨P⟩  -hide-all-packages   -hide-package⟨name⟩   -ignore-pack‐
              age⟨name⟩  -package-db⟨file⟩ -clear-package-db -no-global-package-db -global-package-db
              -no-user-package-db  -user-package-db  -no-auto-link-packages  -trust⟨P⟩   -distrust⟨P⟩
              -distrust-all

       Phases of compilation
              -F -E -C -S -c -x⟨suffix⟩

       Overriding external programs
              -pgmL⟨cmd⟩   -pgmP⟨cmd⟩   -pgmc⟨cmd⟩   -pgmlo⟨cmd⟩  -pgmlc⟨cmd⟩  -pgms⟨cmd⟩  -pgma⟨cmd⟩
              -pgml⟨cmd⟩ -pgmdll⟨cmd⟩ -pgmF⟨cmd⟩ -pgmwindres⟨cmd⟩ -pgmlibtool⟨cmd⟩

       Phase-specific options
              -optL⟨option⟩ -optP⟨option⟩ -optF⟨option⟩ -optc⟨option⟩  -optlo⟨option⟩  -optlc⟨option⟩
              -opta⟨option⟩ -optl⟨option⟩ -optdll⟨option⟩ -optwindres⟨option⟩

       Platform-specific options
              -msse2 -msse4.2

       Compiler plugins
              -fplugin=⟨module⟩ -fplugin-opt=⟨module:args⟩

       Profiling
              -prof       -fprof-auto      -fprof-auto-top      -fprof-auto-exported      -fprof-cafs
              -fno-prof-count-entries -ticky

       Program coverage
              -fhpc -hpcdir dir

       Recompilation checking
              -fforce-recomp

       Redirecting output
              -hcsuf ⟨suffix⟩ -hidir ⟨dir⟩ -hisuf ⟨suffix⟩ -o ⟨filename⟩ -odir ⟨dir⟩ -ohi  ⟨filename⟩
              -osuf ⟨suffix⟩ -stubdir ⟨dir⟩ -dumpdir ⟨dir⟩ -outputdir ⟨dir⟩ -dyno <filename> -dynosuf
              <suffix> -dynhisuf <suffix>

       Temporary files
              -tmpdir ⟨dir⟩

       Verbosity options
              -v -v⟨n⟩  -fprint-potential-instances  -fprint-explicit-foralls  -fprint-explicit-kinds
              -fprint-explicit-runtime-reps      -fprint-unicode-syntax     -fprint-expanded-synonyms
              -fprint-typechecker-elaboration -ferror-spans -Rghc-timing

       Warnings
              -W -w -Wall -Wcompat -Werror -Wwarn -Wunrecognised-warning-flags  -fshow-warning-groups
              -fdefer-type-errors -fdefer-typed-holes -fdefer-out-of-scope-variables -fhelpful-errors
              -Wdeprecated-flags -Wduplicate-constraints -Wduplicate-exports -Whi-shadowing -Widenti‐
              ties       -Wimplicit-prelude      -Wincomplete-patterns      -Wincomplete-uni-patterns
              -Wmax-pmcheck-iterations=<N>   -Wincomplete-record-updates   -Wmissing-fields   -Wmiss‐
              ing-import-lists -Wmissing-methods -Wmissing-signatures -Wmissing-exported-sigs -Wmiss‐
              ing-exported-signatures -Wmissing-local-sigs -Wmissing-local-signatures  -Wmissing-mon‐
              adfail-instances   -Wsemigroup   -Wmissed-specialisations  -Wall-missed-specialisations
              -Wmonomorphism-restriction -Wname-shadowing -Wnoncanonical-monad-instances -Wnoncanoni‐
              cal-monadfail-instances  -Wnoncanonical-monoid-instances  -Worphans  -Woverlapping-pat‐
              terns -Wtabs  -Wtype-defaults  -Wunrecognised-pragmas  -Wunticked-promoted-constructors
              -Wunused-binds     -Wunused-top-binds    -Wunused-local-binds    -Wunused-pattern-binds
              -Wunused-imports     -Wunused-matches     -Wunused-foralls      -Wunused-type-variables
              -Wunused-do-bind -Wwrong-do-bind -Wunsafe -Wsafe -Wtrustworthy-safe -Wwarnings-depreca‐
              tions  -Wamp   -Wredundant-constraints   -Wdeferred-type-errors   -Wtyped-holes   -Wde‐
              ferred-out-of-scope-variables -Wpartial-type-signatures -Wderiving-typeable

   Code generation
       -fasm  Use the native code generator

       -fllvm Compile using the LLVM code generator

       -fno-code
              Omit code generation

       -fwrite-interface
              Always write interface files

       -fbyte-code
              Generate byte-code

       -fobject-code
              Generate object code

       -g⟨n⟩  Produce  DWARF  debug  information in compiled object files.⟨n⟩ can be 0, 1, or 2, with
              higher numbers producing richer output. If ⟨n⟩ is omitted level 2 is assumed.

       -dynamic
              Build dynamically-linked object files and executables

       -dynamic-too
              Build dynamic object files as well as static object files during compilation

   Debugging the compiler
       -dcore-lint
              Turn on internal sanity checking

       -ddump-to-file
              Dump to files instead of stdout

       -ddump-asm
              Dump assembly

       -ddump-bcos
              Dump interpreter byte code

       -ddump-cmm
              Dump C-- output

       -ddump-core-stats
              Print a one-line summary of the size of the Core program at the end of the optimisation
              pipeline

       -ddump-cse
              Dump CSE output

       -ddump-deriv
              Dump deriving output

       -ddump-ds
              Dump desugarer output

       -ddump-foreign
              Dump foreign export stubs

       -ddump-hpc
              Dump after instrumentation for program coverage

       -ddump-inlinings
              Dump inlining info

       -ddump-llvm
              Dump LLVM intermediate code. Implies -fllvm.

       -ddump-occur-anal
              Dump occurrence analysis output

       -ddump-opt-cmm
              Dump the results of C-- to C-- optimising passes

       -ddump-parsed
              Dump parse tree

       -ddump-prep
              Dump prepared core

       -ddump-rn
              Dump renamer output

       -ddump-rule-firings
              Dump rule firing info

       -ddump-rule-rewrites
              Dump detailed rule firing info

       -ddump-rules
              Dump rules

       -ddump-vect
              Dump vectoriser input and output

       -ddump-simpl
              Dump final simplifier output

       -ddump-simpl-iterations
              Dump output from each simplifier iteration

       -ddump-spec
              Dump specialiser output

       -ddump-splices
              Dump TH spliced expressions, and what they evaluate to

       -ddump-stg
              Dump final STG

       -ddump-stranal
              Dump strictness analyser output

       -ddump-str-signatures
              Dump strictness signatures

       -ddump-tc
              Dump typechecker output

       -dth-dec-file
              Show evaluated TH declarations in a .th.hs file

       -ddump-types
              Dump type signatures

       -ddump-worker-wrapper
              Dump worker-wrapper output

       -ddump-if-trace
              Trace interface files

       -ddump-tc-trace
              Trace typechecker

       -ddump-vt-trace
              Trace vectoriser

       -ddump-rn-trace
              Trace renamer

       -ddump-rn-stats
              Renamer stats

       -ddump-simpl-stats
              Dump simplifier stats

       -dno-debug-output
              Suppress unsolicited debugging output

       -dppr-debug
              Turn on debug printing (more verbose)

       -dppr-user-length
              Set the depth for printing expressions in error msgs

       -dppr-cols⟨N⟩
              Set the width of debugging output. For example -dppr-cols200

       -dppr-case-as-let
              Print single alternative case expressions as strict lets.

       -dsuppress-all
              In core dumps, suppress everything (except for uniques) that is suppressible.

       -dsuppress-uniques
              Suppress the printing of uniques in debug output (easier to use diff)

       -dsuppress-idinfo
              Suppress extended information about identifiers where they are bound

       -dsuppress-unfoldings
              Suppress the printing of the stable unfolding of a variable at its binding site

       -dsuppress-module-prefixes
              Suppress the printing of module qualification prefixes

       -dsuppress-type-signatures
              Suppress type signatures

       -dsuppress-type-applications
              Suppress type applications

       -dsuppress-coercions
              Suppress the printing of coercions in Core dumps to make them shorter

       -dsource-stats
              Dump haskell source stats

       -dcmm-lint
              C-- pass sanity checking

       -dstg-lint
              STG pass sanity checking

       -dstg-stats
              Dump STG stats

       -dverbose-core2core
              Show output from each core-to-core pass

       -dverbose-stg2stg
              Show output from each STG-to-STG pass

       -dshow-passes
              Print out each pass name as it happens

       -dfaststring-stats
              Show statistics for fast string usage when finished

       -frule-check
              Report sites with rules that could have fired but didn't. Takes a string argument.

   C pre-processor
       -cpp   Run the C pre-processor on Haskell source files

       -D⟨symbol⟩[=⟨value⟩]
              Define a symbol in the C pre-processor

       -U⟨symbol⟩
              Undefine a symbol in the C pre-processor

       -I⟨dir⟩
              Add ⟨dir⟩ to the directory search list for #include files

   Finding imports
       -i ⟨dir1⟩:⟨dir2⟩:...
              add ⟨dir⟩, ⟨dir2⟩, etc. to import path

       -i     Empty the import directory list

   Interactive mode
       -ignore-dot-ghci
              Disable reading of .ghci files

       -ghci-script
              Read additional .ghci files

       -fbreak-on-error
              Break on uncaught exceptions and errors

       -fbreak-on-exception
              Break on any exception thrown

       -fghci-hist-size=⟨n⟩
              Set the number of entries GHCi keeps for :history. See ghci-debugger.

       -fprint-evld-with-show
              Enable usage of Show instances in :print. See breakpoints.

       -fprint-bind-result
              Turn on printing of binding results in GHCi

       -fno-print-bind-contents
              Turn off printing of binding contents in GHCi

       -fno-implicit-import-qualified
              Turn off implicit qualified import of everything in GHCi

       -interactive-print
              Select the function to use for printing evaluated expressions in GHCi

   Interface files
       -ddump-hi
              Dump the new interface to stdout

       -ddump-hi-diffs
              Show the differences vs. the old interface

       -ddump-minimal-imports
              Dump a minimal set of imports

       --show-iface ⟨file⟩
              See modes.

   Keeping intermediate files
       -keep-hc-file, -keep-hc-files
              Retain intermediate .hc files.

       -keep-llvm-file, -keep-llvm-files
              Retain intermediate LLVM .ll files. Implies -fllvm.

       -keep-s-file, -keep-s-files
              Retain intermediate .s files.

       -keep-tmp-files
              Retain all intermediate temporary files.

   Language options
       -fconstraint-solver-iterations=⟨n⟩
              default: 4. Set the iteration limit for the type-constraint solver. Typically one iter‐
              ation suffices; so please yell if you find you need to set it higher than the  default.
              Zero means infinity.

       -freduction-depth=⟨n⟩
              default: 200. Set the limit for type simplification. Zero means infinity.

       -fcontext-stack=⟨n⟩
              Deprecated. Use -freduction-depth=⟨n⟩ instead.

       -fglasgow-exts
              Deprecated.  Enable  most  language  extensions; see options-language for exactly which
              ones.

       -firrefutable-tuples
              Make tuple pattern matching irrefutable

       -fpackage-trust
              Enable Safe Haskell trusted package requirement for trustworthy modules.

       -ftype-function-depth=⟨n⟩
              Deprecated. Use -freduction-depth=⟨n⟩ instead.

       -XAllowAmbiguousTypes
              Allow the user to write ambiguous types, and the type inference engine to infer them.

       -XArrows
              Enable arrow notation extension

       -XApplicativeDo
              Enable Applicative do-notation desugaring

       -XAutoDeriveTypeable
              As of GHC 7.10, this option is not needed, and should  not  be  used.  Previously  this
              would  automatically derive Typeable instances for every datatype and type class decla‐
              ration. Implies -XDeriveDataTypeable.

       -XBangPatterns
              Enable bang patterns.

       -XBinaryLiterals
              Enable support for binary literals.

       -XCApiFFI
              Enable the CAPI calling convention.

       -XConstrainedClassMethods
              Enable constrained class methods.

       -XConstraintKinds
              Enable a kind of constraints.

       -XCPP  Enable the C preprocessor.

       -XDataKinds
              Enable datatype promotion.

       -XDefaultSignatures
              Enable default signatures.

       -XDeriveAnyClass
              Enable deriving for any class.

       -XDeriveDataTypeable
              Enable deriving for the Data class. Implied by -XAutoDeriveTypeable.

       -XDeriveFunctor
              Enable deriving for the Functor class. Implied by -XDeriveTraversable.

       -XDeriveFoldable
              Enable deriving for the Foldable class. Implied by -XDeriveTraversable.

       -XDeriveGeneric
              Enable deriving for the Generic class.

       -XDeriveGeneric
              Enable deriving for the Generic class.

       -XDeriveLift
              Enable deriving for the Lift class

       -XDeriveTraversable
              Enable deriving for the Traversable class. Implies  -XDeriveFunctor  and  -XDeriveFold‐
              able.

       -XDisambiguateRecordFields
              Enable record field disambiguation. Implied by -XRecordWildCards.

       -XEmptyCase
              Allow empty case alternatives.

       -XEmptyDataDecls
              Enable empty data declarations.

       -XExistentialQuantification
              Enable existential quantification.

       -XExplicitForAll
              Enable  explicit universal quantification. Implied by -XScopedTypeVariables, -XLiberal‐
              TypeSynonyms, -XRankNTypes and -XExistentialQuantification.

       -XExplicitNamespaces
              Enable using the keyword type to specify  the  namespace  of  entries  in  imports  and
              exports (explicit-namespaces). Implied by -XTypeOperators and -XTypeFamilies.

       -XExtendedDefaultRules
              Use GHCi's extended default rules in a normal module.

       -XFlexibleContexts
              Enable flexible contexts. Implied by -XImplicitParams.

       -XFlexibleInstances
              Enable flexible instances. Implies -XTypeSynonymInstances. Implied by -XImplicitParams.

       -XForeignFunctionInterface
              Enable foreign function interface.

       -XFunctionalDependencies
              Enable functional dependencies. Implies -XMultiParamTypeClasses.

       -XGADTs
              Enable generalised algebraic data types. Implies -XGADTSyntax and -XMonoLocalBinds.

       -XGADTSyntax
              Enable generalised algebraic data type syntax.

       -XGeneralizedNewtypeDeriving
              Enable newtype deriving.

       -XGenerics
              Deprecated, does nothing. No longer enables generic classes. See also GHC's support for
              generic programming.

       -XImplicitParams
              Enable Implicit Parameters. Implies -XFlexibleContexts and -XFlexibleInstances.

       -XNoImplicitPrelude
              Don't implicitly import Prelude. Implied by -XRebindableSyntax.

       -XImpredicativeTypes
              Enable impredicative types. Implies -XRankNTypes.

       -XIncoherentInstances
              Enable incoherent instances. Implies -XOverlappingInstances.

       -XTypeFamilyDependencies
              Enable injective type families. Implies -XTypeFamilies.

       -XInstanceSigs
              Enable instance signatures.

       -XInterruptibleFFI
              Enable interruptible FFI.

       -XKindSignatures
              Enable kind signatures. Implied by -XTypeFamilies and -XPolyKinds.

       -XLambdaCase
              Enable lambda-case expressions.

       -XLiberalTypeSynonyms
              Enable liberalised type synonyms.

       -XMagicHash
              Allow # as a postfix modifier on identifiers.

       -XMonadComprehensions
              Enable monad comprehensions.

       -XMonoLocalBinds
              Enable do not generalise local bindings. Implied by -XTypeFamilies and -XGADTs.

       -XNoMonomorphismRestriction
              Disable the monomorphism restriction.

       -XMultiParamTypeClasses
              Enable multi parameter type classes. Implied by -XFunctionalDependencies.

       -XMultiWayIf
              Enable multi-way if-expressions.

       -XNamedFieldPuns
              Enable record puns.

       -XNamedWildCards
              Enable named wildcards.

       -XNegativeLiterals
              Enable support for negative literals.

       -XNoNPlusKPatterns
              Disable support for n+k patterns.

       -XNullaryTypeClasses
              Deprecated, does nothing. nullary (no parameter) type classes  are  now  enabled  using
              -XMultiParamTypeClasses.

       -XNumDecimals
              Enable support for 'fractional' integer literals.

       -XOverlappingInstances
              Enable overlapping instances.

       -XOverloadedLists
              Enable overloaded lists.

       -XOverloadedStrings
              Enable overloaded string literals.

       -XPackageImports
              Enable package-qualified imports.

       -XParallelArrays
              Enable parallel arrays. Implies -XParallelListComp.

       -XParallelListComp
              Enable parallel list comprehensions. Implied by -XParallelArrays.

       -XPartialTypeSignatures
              Enable partial type signatures.

       -XPatternGuards
              Enable pattern guards.

       -XPatternSynonyms
              Enable pattern synonyms.

       -XPolyKinds
              Enable kind polymorphism. Implies -XKindSignatures.

       -XPolymorphicComponents
              Enable polymorphic components for data constructors. Synonym for -XRankNTypes.

       -XPostfixOperators
              Enable postfix operators.

       -XQuasiQuotes
              Enable quasiquotation.

       -XRank2Types
              Enable rank-2 types. Synonym for -XRankNTypes.

       -XRankNTypes
              Enable rank-N types. Implied by -XImpredicativeTypes.

       -XRebindableSyntax
              Employ rebindable syntax. Implies -XNoImplicitPrelude.

       -XRecordWildCards
              Enable record wildcards. Implies -XDisambiguateRecordFields.

       -XRecursiveDo
              Enable recursive do (mdo) notation.

       -XRoleAnnotations
              Enable role annotations.

       -XSafe Enable the Safe Haskell Safe mode.

       -XScopedTypeVariables
              Enable lexically-scoped type variables.

       -XStandaloneDeriving
              Enable standalone deriving.

       -XStrictData
              Enable default strict datatype fields.

       -XTemplateHaskell
              Enable Template Haskell.

       -XTemplateHaskellQuotes
              Enable quotation subset of Template Haskell.

       -XNoTraditionalRecordSyntax
              Disable support for traditional record syntax (as supported by Haskell 98) C {f = x}

       -XTransformListComp
              Enable generalised list comprehensions.

       -XTrustworthy
              Enable the Safe Haskell Trustworthy mode.

       -XTupleSections
              Enable tuple sections.

       -XTypeFamilies
              Enable  type families. Implies -XExplicitNamespaces, -XKindSignatures, and -XMonoLocal‐
              Binds.

       -XTypeOperators
              Enable type operators. Implies -XExplicitNamespaces.

       -XTypeSynonymInstances
              Enable type synonyms in instance heads. Implied by -XFlexibleInstances.

       -XUnboxedTuples
              Enable unboxed tuples.

       -XUndecidableInstances
              Enable undecidable instances.

       -XUnicodeSyntax
              Enable unicode syntax.

       -XUnliftedFFITypes
              Enable unlifted FFI types.

       -XUnsafe
              Enable Safe Haskell Unsafe mode.

       -XViewPatterns
              Enable view patterns.

   Linking options
       -shared
              Generate a shared library (as opposed to an executable)

       -staticlib
              On Darwin/OS X/iOS only, generate a standalone static library (as opposed  to  an  exe‐
              cutable). This is the usual way to compile for iOS.

       -fPIC  Generate position-independent code (where available)

       -dynload
              Selects one of a number of modes for finding shared libraries at runtime.

       -framework⟨name⟩
              On  Darwin/OS  X/iOS only, link in the framework ⟨name⟩. This option corresponds to the
              -framework option for Apple's Linker.

       -framework-path⟨name⟩
              On Darwin/OS X/iOS only, add ⟨dir⟩ to the list of directories searched for  frameworks.
              This option corresponds to the -F option for Apple's Linker.

       -l⟨lib⟩
              Link in library ⟨lib⟩

       -L⟨dir⟩
              Add ⟨dir⟩ to the list of directories searched for libraries

       -main-is
              Set main module and function

       --mk-dll
              DLL-creation mode (Windows only)

       -no-hs-main
              Don't assume this program contains main

       -rtsopts,-rtsopts={none,some,all}
              Control  whether  the RTS behaviour can be tweaked via command-lineflags and the GHCRTS
              environment variable. Using none means no RTS flags can be given;  some  means  only  a
              minimum  of  safe  options  can be given (the default), and all (or no argument at all)
              means that all RTS flags are permitted.

       -with-rtsopts=opts
              Set the default RTS options to ⟨opts⟩.

       -no-rtsopts-suggestions
              Don't print RTS suggestions about linking with -rtsopts.

       -no-link
              Omit linking

       -split-objs
              Split objects (for libraries)

       -split-sections
              Split sections for link-time dead-code stripping

       -static
              Use static Haskell libraries

       -threaded
              Use the threaded runtime

       -debug Use the debugging runtime

       -ticky For linking, this simply implies -debug; see ticky-ticky.

       -eventlog
              Enable runtime event tracing

       -fno-gen-manifest
              Do not generate a manifest file (Windows only)

       -fno-embed-manifest
              Do not embed the manifest in the executable (Windows only)

       -fno-shared-implib
              Don't generate an import library for a DLL (Windows only)

       -dylib-install-name ⟨path⟩
              Set the install name (via -install_name passed to Apple's linker), specifying the  full
              install  path of the library file. Any libraries or executables that link with it later
              will pick up that path as their runtime search location for it. (Darwin/OS X only)

       -rdynamic
              This instructs the linker to add all symbols, not only used ones, to the dynamic symbol
              table.  Currently  Linux  and  Windows/MinGW32  only. This is equivalent to using -optl
              -rdynamic on Linux, and -optl -export-all-symbols on Windows.

   Miscellaneous options
       -jN    When compiling with --make, compile ⟨N⟩ modules in parallel.

       -fno-hi-version-check
              Don't complain about .hi file mismatches

       -fhistory-size
              Set simplification history size

       -fno-ghci-history
              Do not use the load/store the GHCi command history from/to ghci_history.

       -fno-ghci-sandbox
              Turn off the GHCi sandbox. Means computations are run in the main thread, rather than a
              forked thread.

       -freverse-errors
              Display errors in GHC/GHCi sorted by reverse order of source code line numbers.

   Modes of operation
       --help,-?
              Display help

       --interactive
              Interactive mode - normally used by just running ghci; see ghci for details.

       --make Build  a  multi-module Haskell program, automatically figuring out dependencies. Likely
              to be much easier, and faster, than using make; see make-mode for details.

       -e expr
              Evaluate expr; see eval-mode for details.

       --show-iface
              display the contents of an interface file.

       -M     generate dependency information suitable for use in a Makefile; see  makefile-dependen‐
              cies for details.

       --frontend ⟨module⟩
              run GHC with the given frontend plugin; see frontend_plugins for details.

       --supported-extensions, --supported-languages
              display the supported language extensions

       --show-options
              display the supported command line options

       --info display information about the compiler

       --version, -V
              display GHC version

       --numeric-version
              display GHC version (numeric only)

       --print-libdir
              display GHC library directory

   Individual optimizations
       -fcall-arity
              Enable call-arity optimisation. Implied by -O.

       -fcase-merge
              Enable case-merging. Implied by -O.

       -fcmm-elim-common-blocks
              Enable Cmm common block elimination. Implied by -O.

       -fcmm-sink
              Enable Cmm sinking. Implied by -O.

       -fcpr-anal
              Turn on CPR analysis in the demand analyser. Implied by -O.

       -fcse  Enable common sub-expression elimination. Implied by -O.

       -fdicts-cheap
              Make dictionary-valued expressions seem cheap to the optimiser.

       -fdicts-strict
              Make dictionaries strict

       -fdmd-tx-dict-sel
              Use a special demand transformer for dictionary selectors. Always enabled by default.

       -fdo-eta-reduction
              Enable eta-reduction. Implied by -O.

       -fdo-lambda-eta-expansion
              Enable lambda eta-expansion. Always enabled by default.

       -feager-blackholing
              Turn on eager blackholing

       -fenable-rewrite-rules
              Switch  on  all rewrite rules (including rules generated by automatic specialisation of
              overloaded functions). Implied by -O.

       -fexcess-precision
              Enable excess intermediate precision

       -fexpose-all-unfoldings
              Expose all unfoldings, even for very large or recursive functions.

       -ffloat-in
              Turn on the float-in transformation. Implied by -O.

       -ffull-laziness
              Turn on full laziness (floating bindings outwards). Implied by -O.

       -ffun-to-thunk
              Allow worker-wrapper to convert a function closure into a thunk if  the  function  does
              not use any of its arguments. Off by default.

       -fignore-asserts
              Ignore assertions in the source. Implied by -O.

       -fignore-interface-pragmas
              Ignore pragmas in interface files. Implied by -O0 only.

       -flate-dmd-anal
              Run demand analysis again, at the end of the simplification pipeline

       -fliberate-case
              Turn on the liberate-case transformation. Implied by -O2.

       -fliberate-case-threshold=⟨n⟩
              default: 2000. Set the size threshold for the liberate-case transformation to ⟨n⟩

       -floopification
              Turn  saturated  self-recursive  tail-calls into local jumps in the generated assembly.
              Implied by -O.

       -fmax-inline-alloc-size=⟨n⟩
              default: 128. Set the maximum size of inline array allocations to ⟨n⟩  bytes  (default:
              128). GHC will allocate non-pinned arrays of statically known size in the current nurs‐
              ery block if they're no bigger than ⟨n⟩ bytes, ignoring GC overheap. This value  should
              be quite a bit smaller than the block size (typically: 4096).

       -fmax-inline-memcpy-insns=⟨n⟩
              default:  32.  Inline  memcpy  calls  if  they  would  generate no more than ⟨n⟩ pseudo
              instructions.

       -fmax-inline-memset-insns=⟨n⟩
              default: 32. Inline memset calls if  they  would  generate  no  more  than  ⟨n⟩  pseudo
              instructions

       -fmax-relevant-binds=⟨n⟩
              default: 6. Set the maximum number of bindings to display in type error messages.

       -fmax-simplifier-iterations=⟨n⟩
              default: 4. Set the max iterations for the simplifier.

       -fmax-worker-args=⟨n⟩
              default: 10. If a worker has that many arguments, none will be unpacked anymore.

       -fno-opt-coercion
              Turn off the coercion optimiser

       -fno-pre-inlining
              Turn off pre-inlining

       -fno-state-hack
              Turn  off the "state hack" whereby any lambda with a real-world state token as argument
              is considered to be single-entry. Hence OK to inline things inside it.

       -fomit-interface-pragmas
              Don't generate interface pragmas. Implied by -O0 only.

       -fomit-yields
              Omit heap checks when no allocation is being performed.

       -foptimal-applicative-do
              Use a slower but better algorithm for ApplicativeDo

       -fpedantic-bottoms
              Make GHC be more precise about its treatment of bottom (but see also  -fno-state-hack).
              In particular, GHC will not eta-expand through a case expression.

       -fregs-graph
              Use  the  graph colouring register allocator for register allocation in the native code
              generator. Implied by -O2.

       -fregs-iterative
              Use the iterative coalescing graph colouring register allocator in the native code gen‐
              erator.

       -fsimplifier-phases=⟨n⟩
              default: 2. Set the number of phases for the simplifier. Ignored with -O0.

       -fsimpl-tick-factor=⟨n⟩
              default: 100. Set the percentage factor for simplifier ticks.

       -fspec-constr
              Turn on the SpecConstr transformation. Implied by -O2.

       -fspec-constr-count=⟨n⟩
              default:  3.* Set to ⟨n⟩ the maximum number of specialisations that will be created for
              any one function by the SpecConstr transformation.

       -fspec-constr-threshold=⟨n⟩
              default: 2000. Set the size threshold for the SpecConstr transformation to ⟨n⟩.

       -fspecialise
              Turn on specialisation of overloaded functions. Implied by -O.

       -fcross-module-specialise
              Turn on specialisation of overloaded functions imported from other modules.

       -fstatic-argument-transformation
              Turn on the static argument transformation.

       -fstrictness
              Turn on strictness analysis. Implied by -O. Implies -fworker-wrapper

       -fstrictness-before=⟨n⟩
              Run an additional strictness analysis before simplifier phase ⟨n⟩

       -funbox-small-strict-fields
              Flatten strict constructor fields with a pointer-sized representation. Implied by -O.

       -funbox-strict-fields
              Flatten strict constructor fields

       -funfolding-creation-threshold=⟨n⟩
              default: 750. Tweak unfolding settings.

       -funfolding-dict-discount=⟨n⟩
              default: 30. Tweak unfolding settings.

       -funfolding-fun-discount=⟨n⟩
              default: 60. Tweak unfolding settings.

       -funfolding-keeness-factor=⟨n⟩
              default: 1.5. Tweak unfolding settings.

       -funfolding-use-threshold=⟨n⟩
              default: 60. Tweak unfolding settings.

       -fvectorisation-avoidance
              Enable vectorisation avoidance. Always enabled by default.

       -fvectorise
              Enable vectorisation of nested data parallelism

       -fworker-wrapper
              Enable the worker-wrapper transformation after a strictness analysis pass.  Implied  by
              -O,  and  by -fstrictness. Disabled by -fno-strictness. Enabling -fworker-wrapper while
              strictness analysis is disabled (by -fno-strictness) has no effect.

   Optimization levels
       -O0    Disable optimisations (default)

       -O, -O1
              Enable level 1 optimisations

       -O2    Enable level 2 optimisations

       -Odph  Enable  level  2  optimisations,  set  -fmax-simplifier-iterations=20   and   -fsimpli‐
              fier-phases=3.

   Package options
       -this-unit-id⟨P⟩
              Compile to be part of unit (i.e. package) ⟨P⟩

       -package⟨P⟩
              Expose package ⟨P⟩

       -hide-all-packages
              Hide all packages by default

       -hide-package⟨name⟩
              Hide package ⟨P⟩

       -ignore-package⟨name⟩
              Ignore package ⟨P⟩

       -package-db⟨file⟩
              Add ⟨file⟩ to the package db stack.

       -clear-package-db
              Clear the package db stack.

       -no-global-package-db
              Remove the global package db from the stack.

       -global-package-db
              Add the global package db to the stack.

       -no-user-package-db
              Remove the user's package db from the stack.

       -user-package-db
              Add the user's package db to the stack.

       -no-auto-link-packages
              Don't automatically link in the base and rts packages.

       -trust⟨P⟩
              Expose package ⟨P⟩ and set it to be trusted

       -distrust⟨P⟩
              Expose package ⟨P⟩ and set it to be distrusted

       -distrust-all
              Distrust all packages by default

   Phases of compilation
       -F     Enable the use of a pre-processor (set with -pgmF)

       -E     Stop after preprocessing (.hspp file)

       -C     Stop after generating C (.hc file)

       -S     Stop after generating assembly (.s file)

       -c     Stop after generating object (.o) file

       -x⟨suffix⟩
              Override default behaviour for source files

   Overriding external programs
       -pgmL⟨cmd⟩
              Use ⟨cmd⟩ as the literate pre-processor

       -pgmP⟨cmd⟩
              Use ⟨cmd⟩ as the C pre-processor (with -cpp only)

       -pgmc⟨cmd⟩
              Use ⟨cmd⟩ as the C compiler

       -pgmlo⟨cmd⟩
              Use ⟨cmd⟩ as the LLVM optimiser

       -pgmlc⟨cmd⟩
              Use ⟨cmd⟩ as the LLVM compiler

       -pgms⟨cmd⟩
              Use ⟨cmd⟩ as the splitter

       -pgma⟨cmd⟩
              Use ⟨cmd⟩ as the assembler

       -pgml⟨cmd⟩
              Use ⟨cmd⟩ as the linker

       -pgmdll⟨cmd⟩
              Use ⟨cmd⟩ as the DLL generator

       -pgmF⟨cmd⟩
              Use ⟨cmd⟩ as the pre-processor (with -F only)

       -pgmwindres⟨cmd⟩
              Use ⟨cmd⟩ as the program for embedding manifests on Windows.

       -pgmlibtool⟨cmd⟩
              Use ⟨cmd⟩ as the command for libtool (with -staticlib only).

   Phase-specific options
       -optL⟨option⟩
              pass ⟨option⟩ to the literate pre-processor

       -optP⟨option⟩
              pass ⟨option⟩ to cpp (with -cpp only)

       -optF⟨option⟩
              pass ⟨option⟩ to the custom pre-processor

       -optc⟨option⟩
              pass ⟨option⟩ to the C compiler

       -optlo⟨option⟩
              pass ⟨option⟩ to the LLVM optimiser

       -optlc⟨option⟩
              pass ⟨option⟩ to the LLVM compiler

       -opta⟨option⟩
              pass ⟨option⟩ to the assembler

       -optl⟨option⟩
              pass ⟨option⟩ to the linker

       -optdll⟨option⟩
              pass ⟨option⟩ to the DLL generator

       -optwindres⟨option⟩
              pass ⟨option⟩ to windres.

   Platform-specific options
       -msse2 (x86 only) Use SSE2 for floating-point operations

       -msse4.2
              (x86 only) Use SSE4.2 for floating-point operations

   Compiler plugins
       -fplugin=⟨module⟩
              Load a plugin exported by a given module

       -fplugin-opt=⟨module:args⟩
              Give arguments to a plugin module; module must be specified with -fplugin

   Profiling
       -prof  Turn on profiling

       -fprof-auto
              Auto-add SCCs to all bindings not marked INLINE

       -fprof-auto-top
              Auto-add SCCs to all top-level bindings not marked INLINE

       -fprof-auto-exported
              Auto-add SCCs to all exported bindings not marked INLINE

       -fprof-cafs
              Auto-add SCCs to all CAFs

       -fno-prof-count-entries
              Do not collect entry counts

       -ticky Turn on ticky-ticky profiling

   Program coverage
       -fhpc  Turn on Haskell program coverage instrumentation

       -hpcdir dir
              Directory to deposit .mix files during compilation (default is .hpc)

   Recompilation checking
       -fforce-recomp
              Turn  off recompilation checking. This is implied by any -ddump-X option when compiling
              a single file (i.e. when using -c).

   Redirecting output
       -hcsuf ⟨suffix⟩
              set the suffix to use for intermediate C files

       -hidir ⟨dir⟩
              set directory for interface files

       -hisuf ⟨suffix⟩
              set the suffix to use for interface files

       -o ⟨filename⟩
              set output filename

       -odir ⟨dir⟩
              set directory for object files

       -ohi ⟨filename⟩
              set the filename in which to put the interface

       -osuf ⟨suffix⟩
              set the output file suffix

       -stubdir ⟨dir⟩
              redirect FFI stub files

       -dumpdir ⟨dir⟩
              redirect dump files

       -outputdir ⟨dir⟩
              set output directory

       -dyno <filename>
              Set the output filename for dynamic object files (see -dynamic-too)

       -dynosuf <suffix>
              Set the object suffix for dynamic object files (see -dynamic-too)

       -dynhisuf <suffix>
              Set the hi suffix for dynamic object files (see -dynamic-too)

   Temporary files
       -tmpdir ⟨dir⟩
              set the directory for temporary files

   Verbosity options
       -v     verbose mode (equivalent to -v3)

       -v⟨n⟩  set verbosity level

       -fprint-potential-instances
              display all available instances in type error messages

       -fprint-explicit-foralls
              Print explicit forall quantification in types. See also -XExplicitForAll

       -fprint-explicit-kinds
              Print explicit kind foralls and kind arguments in types. See also -XKindSignature

       -fprint-explicit-runtime-reps
              Print RuntimeRep variables in types which are runtime-representation polymorphic.

       -fprint-unicode-syntax
              Use unicode syntax when printing expressions, types and kinds. See also -XUnicodeSyntax

       -fprint-expanded-synonyms
              In type errors, also print type-synonym-expanded types.

       -fprint-typechecker-elaboration
              Print extra information from typechecker.

       -ferror-spans
              Output full span in error messages

       -Rghc-timing
              Summarise timing stats for GHC (same as +RTS -tstderr).

   Warnings
       -W     enable normal warnings

       -w     disable all warnings

       -Wall  enable almost all warnings (details in options-sanity)

       -Wcompat
              enable future compatibility warnings (details in options-sanity)

       -Werror
              make warnings fatal

       -Wwarn make warnings non-fatal

       -Wunrecognised-warning-flags
              throw a warning when an unreconised -W... flag is encountered on the command line.

       -fshow-warning-groups
              show which group an emitted warning belongs to.

       -fdefer-type-errors
              Turn type errors into warnings,  deferring  the  error  until  runtime.  Implies  -fde‐
              fer-typed-holes and -fdefer-out-of-scope-variables. See also -Wdeferred-type-errors

       -fdefer-typed-holes
              Convert  typed hole errors into warnings, deferring the error until runtime. Implied by
              -fdefer-type-errors. See also -Wtyped-holes.

       -fdefer-out-of-scope-variables
              Convert variable out  of  scope  variables  errors  into  warnings.  Implied  by  -fde‐
              fer-type-errors. See also -Wdeferred-out-of-scope-variables.

       -fhelpful-errors
              Make suggestions for mis-spelled names.

       -Wdeprecated-flags
              warn about uses of commandline flags that are deprecated

       -Wduplicate-constraints
              warn when a constraint appears duplicated in a type signature

       -Wduplicate-exports
              warn when an entity is exported multiple times

       -Whi-shadowing
              warn when a .hi file in the current directory shadows a library

       -Widentities
              warn  about  uses  of  Prelude  numeric conversions that are probably the identity (and
              hence could be omitted)

       -Wimplicit-prelude
              warn when the Prelude is implicitly imported

       -Wincomplete-patterns
              warn when a pattern match could fail

       -Wincomplete-uni-patterns
              warn when a pattern match in a lambda expression or pattern binding could fail

       -Wmax-pmcheck-iterations=<N>
              the iteration limit for the pattern match checker

       -Wincomplete-record-updates
              warn when a record update could fail

       -Wmissing-fields
              warn when fields of a record are uninitialised

       -Wmissing-import-lists
              warn when an import declaration does not explicitly  list  all  thenames  brought  into
              scope

       -Wmissing-methods
              warn when class methods are undefined

       -Wmissing-signatures
              warn about top-level functions without signatures

       -Wmissing-exported-sigs
              (deprecated)  warn  about  top-level  functions  without  signatures,  only if they are
              exported. takes precedence over -Wmissing-signatures

       -Wmissing-exported-signatures
              warn about top-level functions without signatures, only if  they  are  exported.  takes
              precedence over -Wmissing-signatures

       -Wmissing-local-sigs
              (deprecated) warn about polymorphic local bindings without signatures

       -Wmissing-local-signatures
              warn about polymorphic local bindings without signatures

       -Wmissing-monadfail-instances
              warn  when  a  failable  pattern  is  used in a do-block that does not have a MonadFail
              instance.

       -Wsemigroup
              warn when a Monoid is not Semigroup, and on non-Semigroup definitions of (<>)?

       -Wmissed-specialisations
              warn when specialisation of an imported, overloaded function fails.

       -Wall-missed-specialisations
              warn when specialisation of any overloaded function fails.

       -Wmonomorphism-restriction
              warn when the Monomorphism Restriction is applied

       -Wname-shadowing
              warn when names are shadowed

       -Wnoncanonical-monad-instances
              warn when Applicative or Monad instances have noncanonical definitions of return, pure,
              (>>), or (*>). See flag description in options-sanity for more details.

       -Wnoncanonical-monadfail-instances
              warn  when  Monad or MonadFail instances have noncanonical definitions of fail.See flag
              description in options-sanity for more details.

       -Wnoncanonical-monoid-instances
              warn when Semigroup or Monoid instances have noncanonical definitions of (<>)  or  map‐
              pend. See flag description in options-sanity for more details.

       -Worphans
              warn when the module contains orphan instance declarations or rewrite rules

       -Woverlapping-patterns
              warn about overlapping patterns

       -Wtabs warn if there are tabs in the source file

       -Wtype-defaults
              warn when defaulting happens

       -Wunrecognised-pragmas
              warn about uses of pragmas that GHC doesn't recognise

       -Wunticked-promoted-constructors
              warn if promoted constructors are not ticked

       -Wunused-binds
              warn about bindings that are unused. Alias for -Wunused-top-binds, -Wunused-local-binds
              and -Wunused-pattern-binds

       -Wunused-top-binds
              warn about top-level bindings that are unused

       -Wunused-local-binds
              warn about local bindings that are unused

       -Wunused-pattern-binds
              warn about pattern match bindings that are unused

       -Wunused-imports
              warn about unnecessary imports

       -Wunused-matches
              warn about variables in patterns that aren't used

       -Wunused-foralls
              warn about type variables in user-written foralls that are unused

       -Wunused-type-variables
              warn about variables in type family or data family instances that are unused

       -Wunused-do-bind
              warn about do bindings that appear to throw away values of types other than ()

       -Wwrong-do-bind
              warn about do bindings that appear to throw away monadic values that  you  should  have
              bound instead

       -Wunsafe
              warn if the module being compiled is regarded to be unsafe. Should be used to check the
              safety status of modules when using safe inference. Works on  all  module  types,  even
              those  using  explicit Safe Haskell modes (such as -XTrustworthy) and so can be used to
              have the compiler check any assumptions made.

       -Wsafe warn if the module being compiled is regarded to be safe. Should be used to  check  the
              safety  status  of  modules  when using safe inference. Works on all module types, even
              those using explicit Safe Haskell modes (such as -XTrustworthy) and so can be  used  to
              have the compiler check any assumptions made.

       -Wtrustworthy-safe
              warn  if  the  module being compiled is marked as -XTrustworthy but it could instead be
              marked as -XSafe, a more informative bound. Can be used to detectonce  a  Safe  Haskell
              bound can be improved as dependencies are updated.

       -Wwarnings-deprecations
              warn about uses of functions & types that have warnings or deprecated pragmas

       -Wamp  (deprecated) warn on definitions conflicting with the Applicative-Monad Proposal (AMP)

       -Wredundant-constraints
              Have the compiler warn about redundant constraints in typesignatures.

       -Wdeferred-type-errors
              Report  warnings  when  deferred  type  errors  are  enabled. This option is enabled by
              default. See -fdefer-type-errors.

       -Wtyped-holes
              Report  warnings  when  typed  hole  errors  are  deferred  until  runtime.  See  -fde‐
              fer-typed-holes.

       -Wdeferred-out-of-scope-variables
              Report warnings when variable out-of-scope errors are deferred until runtime. See -fde‐
              fer-out-of-scope-variables.

       -Wpartial-type-signatures
              warn about holes in partial type signatures when  -XPartialTypeSignatures  is  enabled.
              Not  applicable  when  -XPartialTypesignatures is not enabled, in which case errors are
              generated for such holes. See partial-type-signatures.

       -Wderiving-typeable
              warn when encountering a request to derive an instance of class  Typeable.  As  of  GHC
              7.10, such declarations are unnecessary and are ignored by the compiler because GHC has
              a custom solver for discharging this type of constraint.

COPYRIGHT
       Copyright 2015. The University Court of the University of Glasgow.  All rights reserved.

AUTHOR
       The GHC Team

COPYRIGHT
       2018, GHC Team

8.0.2                                        Feb 06, 2018                                      GHC(1)
