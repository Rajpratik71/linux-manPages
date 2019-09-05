sparse(1)                                                     General Commands Manual                                                    sparse(1)

NAME
       sparse - Semantic Parser for C

SYNOPSIS
       sparse [WARNING OPTIONS]... file.c

DESCRIPTION
       Sparse parses C source and looks for errors, producing warnings on standard error.

       Sparse  accepts  options controlling the set of warnings to generate.  To turn on warnings Sparse does not issue by default, use the corre‐
       sponding warning option -Wsomething.  Sparse issues some warnings by default; to turn off those warnings, pass the negation of the  associ‐
       ated warning option, -Wno-something.

WARNING OPTIONS
       -Wsparse-all
              Turn on all sparse warnings, except for those explicitly disabled via -Wno-something.

       -Waddress-space
              Warn about code which mixes pointers to different address spaces.

              Sparse  allows  an  extended attribute __attribute__((address_space(num))) on pointers, which designates a pointer target in address
              space num (a constant integer).  With -Waddress-space, Sparse treats pointers with identical target types but different address spa‐
              ces  as  distinct  types.  To override this warning, such as for functions which convert pointers between address spaces, use a type
              that includes __attribute__((force)).

              Sparse issues these warnings by default.  To turn them off, use -Wno-address-space.

       -Wbitwise
              Warn about unsupported operations or type mismatches with restricted integer types.

              Sparse supports an extended attribute, __attribute__((bitwise)), which creates a new restricted integer type  from  a  base  integer
              type,  distinct  from the base integer type and from any other restricted integer type not declared in the same declaration or type‐
              def.  For example, this allows programs to create typedefs for integer types with specific endianness.  With -Wbitwise, Sparse  will
              warn on any use of a restricted type in arithmetic operations other than bitwise operations, and on any conversion of one restricted
              type into another, except via a cast that includes __attribute__((force)).

              __bitwise ends up being a "stronger integer separation". That one doesn't allow you to mix with non-bitwise integers,  so  now  it's
              much harder to lose the type by mistake.

              __bitwise  is  for  *unique  types* that cannot be mixed with other types, and that you'd never want to just use as a random integer
              (the integer 0 is special, though, and gets silently accepted iirc - it's kind of like "NULL" for pointers). So "gfp_t" or the "safe
              endianness"  types  would  be __bitwise: you can only operate on them by doing specific operations that know about *that* particular
              type.

              Generally, you want bitwise if you are looking for type safety. Sparse does not issue these warnings by default.

       -Wcast-to-as
              Warn about casts which add an address space to a pointer type.

              A cast that includes __attribute__((force)) will suppress this warning.

              Sparse does not issue these warnings by default.

       -Wcast-truncate
              Warn about casts that truncate constant values.

              Sparse issues these warnings by default.  To turn them off, use -Wno-cast-truncate.

       -Wcontext
              Warn about potential errors in synchronization or other delimited contexts.

              Sparse supports several means of designating functions or statements that delimit contexts, such as synchronization.  Functions with
              the  extended  attribute  __attribute__((context(expression,in_context,out_context)) require the context expression (for instance, a
              lock) to have the value in_context (a constant nonnegative integer) when called, and return with the value out_context  (a  constant
              nonnegative integer).  For APIs defined via macros, use the statement form __context__(expression,in_value,out_value) in the body of
              the macro.

              With -Wcontext Sparse will warn when it sees a function change the context without indicating this with a context attribute,  either
              by  decreasing a context below zero (such as by releasing a lock without acquiring it), or returning with a changed context (such as
              by acquiring a lock without releasing it).  Sparse will also warn about blocks of code which may potentially execute with  different
              contexts.

              Sparse issues these warnings by default.  To turn them off, use -Wno-context.

       -Wdecl Warn about any non-static variable or function definition that has no previous declaration.

              Private  symbols (functions and variables) internal to a given source file should use static, to allow additional compiler optimiza‐
              tions, allow detection of unused symbols, and prevent other code from relying on these internal symbols.   Public  symbols  used  by
              other  source  files  will need declarations visible to those other source files, such as in a header file.  All declarations should
              fall into one of these two categories.  Thus, with -Wdecl, Sparse warns about any symbol definition with neither static nor a decla‐
              ration.  To fix this warning, declare private symbols static, and ensure that the files defining public symbols have the symbol dec‐
              larations available first (such as by including the appropriate header file).

              Sparse issues these warnings by default.  To turn them off, use -Wno-decl.

       -Wdeclaration-after-statement
              Warn about declarations that are not at the start of a block.

              These declarations are permitted in C99 but not in C89.

              Sparse issues these warnings by default only when the C dialect is C89 (i.e. -ansi or -std=c89).  To turn them off, use  -Wno-decla‐
              ration-after-statement.

       -Wdefault-bitfield-sign
              Warn about any bitfield with no explicit signedness.

              Bitfields  have  no  standard-specified  default signedness. (C99 6.7.2) A bitfield without an explicit signed or unsigned creates a
              portability problem for software that relies on the available range of values.  To fix this, specify the bitfield type as signed  or
              unsigned explicitly.

              Sparse does not issue these warnings by default.

       -Wdesignated-init
              Warn about positional initialization of structs marked as requiring designated initializers.

              Sparse  allows an attribute __attribute__((designated_init)) which marks a struct as requiring designated initializers.  Sparse will
              warn about positional initialization of a struct variable or struct literal of a type that has this attribute.

              Requiring designated initializers for a particular struct type will insulate code using that struct type from changes to the  layout
              of the type, avoiding the need to change initializers for that type unless they initialize a removed or incompatibly changed field.

              Common examples of this type of struct include collections of function pointers for the implementations of a class of related opera‐
              tions, for which the default NULL for an unmentioned field in a designated initializer will correctly indicate the absence  of  that
              operation.

              Sparse issues these warnings by default.  To turn them off, use -Wno-designated-init.

       -Wdo-while
              Warn about do-while loops that do not delimit the loop body with braces.

              Sparse does not issue these warnings by default.

       -Wenum-mismatch
              Warn  about  the use of an expression of an incorrect enum type when initializing another enum type, assigning to another enum type,
              or passing an argument to a function which expects another enum type.

              Sparse issues these warnings by default.  To turn them off, use -Wno-enum-mismatch.

       -Winit-cstring
              Warn about initialization of a char array with a too long constant C string.

              If the size of the char array and the length of the string is the same, there is no space for the last nul char of the string in the
              array:

              char s[3] = "abc";

              If  the  array  is  used  as a byte array, not as C string, this warning is just noise. However, if the array is passed to functions
              dealing with C string like printf(%s) and strcmp, it may cause a trouble.

              Sparse does not issue these warnings by default.

       -Wnon-pointer-null
              Warn about the use of 0 as a NULL pointer.

              0 has integer type.  NULL has pointer type.

              Sparse issues these warnings by default.  To turn them off, use -Wno-non-pointer-null.

       -Wold-initializer
              Warn about the use of the pre-C99 GCC syntax for designated initializers.

              C99 provides a standard syntax for designated fields in struct or union initializers:

              struct structname var = { .field = value };

              GCC also has an old, non-standard syntax for designated initializers which predates C99:

              struct structname var = { field: value };

              Sparse will warn about the use of GCC's non-standard syntax for designated initializers.  To fix this  warning,  convert  designated
              initializers to use the standard C99 syntax.

              Sparse issues these warnings by default.  To turn them off, use -Wno-old-initializer.

       -Wone-bit-signed-bitfield
              Warn about any one-bit signed bitfields.

              A  one-bit signed bitfield can only have the values 0 and -1, or with some compilers only 0; this results in unexpected behavior for
              programs which expected the ability to store 0 and 1.

              Sparse issues these warnings by default.  To turn them off, use -Wno-one-bit-signed-bitfield.

       -Wparen-string
              Warn about the use of a parenthesized string to initialize an array.

              Standard C syntax does not permit a parenthesized string as an array initializer.  GCC allows this syntax  as  an  extension.   With
              -Wparen-string, Sparse will warn about this syntax.

              Sparse does not issue these warnings by default.

       -Wptr-subtraction-blows
              Warn when subtracting two pointers to a type with a non-power-of-two size.

              Subtracting  two  pointers to a given type gives a difference in terms of the number of items of that type.  To generate this value,
              compilers will usually need to divide the difference by the size of the type, an potentially expensive  operation  for  sizes  other
              than powers of two.

              Code  written  using pointer subtraction can often use another approach instead, such as array indexing with an explicit array index
              variable, which may allow compilers to generate more efficient code.

              Sparse does not issue these warnings by default.

       -Wreturn-void
              Warn if a function with return type void returns a void expression.

              C99 permits this, and in some cases this allows for more generic code in macros that use typeof or take a type as a macro  argument.
              However, some programs consider this poor style, and those programs can use -Wreturn-void to get warnings about it.

              Sparse does not issue these warnings by default.

       -Wshadow
              Warn when declaring a symbol which shadows a declaration with the same name in an outer scope.

              Such declarations can lead to error-prone code.

              Sparse does not issue these warnings by default.

       -Wtransparent-union
              Warn about any declaration using the GCC extension __attribute__((transparent_union)).

              Sparse issues these warnings by default.  To turn them off, use -Wno-transparent-union.

       -Wtypesign
              Warn when converting a pointer to an integer type into a pointer to an integer type with different signedness.

              Sparse does not issue these warnings by default.

       -Wundef
              Warn about preprocessor conditionals that use the value of an undefined preprocessor symbol.

              Standard  C  (C99 6.10.1) permits using the value of an undefined preprocessor symbol in preprocessor conditionals, and specifies it
              has have a value of 0.  However, this behavior can lead to subtle errors.

              Sparse does not issue these warnings by default.

MISC OPTIONS
       -gcc-base-dir dir
              Look for compiler-provided system headers in dir/include/ and dir/include-fixed/.

       -multiarch-dir dir
              Look for system headers in the multiarch subdirectory dir.  The dir name would normally take the form of the target's normalized GNU
              triplet. (e.g. i386-linux-gnu).

OTHER OPTIONS
       -ftabstop=WIDTH
              Set  the  distance  between tab stops.  This helps sparse report correct column numbers in warnings or errors.  If the value is less
              than 1 or greater than 100, the option is ignored.  The default is 8.

SEE ALSO
       cgcc(1)

HOMEPAGE
       http://www.kernel.org/pub/software/devel/sparse/

MAILING LIST
       linux-sparse@vger.kernel.org

MAINTAINER
       Josh Triplett <josh@kernel.org>

                                                                                                                                         sparse(1)
