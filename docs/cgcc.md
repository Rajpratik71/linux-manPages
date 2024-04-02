cgcc(1)                                                       General Commands Manual                                                      cgcc(1)

NAME
       cgcc - Compiler wrapper to run Sparse after compiling

SYNOPSIS
       cgcc [SPARSE OPTIONS]... [COMPILER OPTIONS]... [INPUT FILES]...
       make CC=cgcc

DESCRIPTION
       cgcc provides a wrapper around a C compiler (cc by default) which also invokes the Sparse static analysis tool.

       cgcc accepts all Sparse command-line options, such as warning options, and passes all other options through to the compiler.

       By  providing the same interface as the C compiler, cgcc allows projects to run Sparse as part of their build without modifying their build
       system, by using cgcc as the compiler.  For many projects, setting CC=cgcc on the make command-line will work.

ENVIRONMENT
       REAL_CC
              If set, cgcc will use this as the compiler to invoke, rather than the default cc.

       CHECK  If set, cgcc will use this as the Sparse program to invoke, rather than the default sparse.

SEE ALSO
       sparse(1)

                                                                                                                                           cgcc(1)
