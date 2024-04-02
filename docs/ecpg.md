ECPG(1)                                                                                PostgreSQL 9.2.24 Documentation                                                                                ECPG(1)



NAME
       ecpg - embedded SQL C preprocessor

SYNOPSIS
       ecpg [option...] file...

DESCRIPTION
       ecpg is the embedded SQL preprocessor for C programs. It converts C programs with embedded SQL statements to normal C code by replacing the SQL invocations with special function calls. The output
       files can then be processed with any C compiler tool chain.

       ecpg will convert each input file given on the command line to the corresponding C output file. Input files preferably have the extension .pgc. The extension will be replaced by .c to determine the
       output file name. The output file name can also be overridden using the -o option.

       This reference page does not describe the embedded SQL language. See Chapter 33, ECPG - Embedded SQL in C, in the documentation for more information on that topic.

OPTIONS
       ecpg accepts the following command-line arguments:

       -c
           Automatically generate certain C code from SQL code. Currently, this works for EXEC SQL TYPE.

       -C mode
           Set a compatibility mode.  mode can be INFORMIX or INFORMIX_SE.

       -D symbol
           Define a C preprocessor symbol.

       -h
           Parse a header file, this option includes otion -c.

       -i
           Parse system include files as well.

       -I directory
           Specify an additional include path, used to find files included via EXEC SQL INCLUDE. Defaults are .  (current directory), /usr/local/include, the PostgreSQL include directory which is defined
           at compile time (default: /usr/local/pgsql/include), and /usr/include, in that order.

       -o filename
           Specifies that ecpg should write all its output to the given filename.

       -r option
           Selects run-time behavior.  Option can be one of the following:

           no_indicator
               Do not use indicators but instead use special values to represent null values. Historically there have been databases using this approach.

           prepare
               Prepare all statements before using them. Libecpg will keep a cache of prepared statements and reuse a statement if it gets executed again. If the cache runs full, libecpg will free the
               least used statement.

           questionmarks
               Allow question mark as placeholder for compatibility reasons. This used to be the default long ago.

       --regression
           Run in regression testing mode.

       -t
           Turn on autocommit of transactions. In this mode, each SQL command is automatically committed unless it is inside an explicit transaction block. In the default mode, commands are committed only
           when EXEC SQL COMMIT is issued.

       -v
           Print additional information including the version and the "include" path.

       --version
           Print the ecpg version and exit.

       -?, --help
           Show help about ecpg command line arguments, and exit.

NOTES
       When compiling the preprocessed C code files, the compiler needs to be able to find the ECPG header files in the PostgreSQL include directory. Therefore, you might have to use the -I option when
       invoking the compiler (e.g., -I/usr/local/pgsql/include).

       Programs using C code with embedded SQL have to be linked against the libecpg library, for example using the linker options -L/usr/local/pgsql/lib -lecpg.

       The value of either of these directories that is appropriate for the installation can be found out using pg_config(1).

EXAMPLES
       If you have an embedded SQL C source file named prog1.pgc, you can create an executable program using the following sequence of commands:

           ecpg prog1.pgc
           cc -I/usr/local/pgsql/include -c prog1.c
           cc -o prog1 prog1.o -L/usr/local/pgsql/lib -lecpg




PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                          ECPG(1)
