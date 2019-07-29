LOOK(1)                  BSD General Commands Manual                  LOOK(1)

NAME
     look — display lines beginning with a given string

SYNOPSIS
     look [-bdf] [-t termchar] string [file ...]

DESCRIPTION
     The look utility displays any lines in file which contain string as a
     prefix.

     If file is not specified, the file /usr/share/dict/words is used, only
     alphanumeric characters are compared and the case of alphabetic charac‐
     ters is ignored.

     The following options are available:

     -b, --binary
             Use a binary search on the given word list. If you are ignoring
             case with -f or ignoring non-alphanumeric characters with -d,
             the file must be sorted in the same way. Please note that these
             options are the default if no filename is given. See sort(1) for
             more information on sorting files.

     -d, --alphanum
             Dictionary character set and order, i.e., only alphanumeric
             characters are compared.

     -f, --ignore-case
             Ignore the case of alphabetic characters.

     -t, --terminate termchar
             Specify a string termination character, i.e., only the charac‐
             ters in string up to and including the first occurrence of
             termchar are compared.

ENVIRONMENT
     The LANG, LC_ALL and LC_CTYPE environment variables affect the execution
     of the look utility.  Their effect is described in environ(7).

FILES
     /usr/share/dict/words  the dictionary

EXIT STATUS
     The look utility exits 0 if one or more lines were found and displayed,
     1 if no lines were found, and >1 if an error occurred.

COMPATIBILITY
     The original manual page stated that tabs and blank characters partici‐
     pated in comparisons when the -d option was specified.  This was incor‐
     rect and the current man page matches the historic implementation.

     look uses a linear search by default instead of a binary search, which
     is what most other implementations use by default.

     The -a and --alternative flags are ignored for compatibility.

SEE ALSO
     grep(1), sort(1)

HISTORY
     A look utility appeared in Version 7 AT&T UNIX.

BUGS
     Lines are not compared according to the current locale's collating
     order.  Input files must be sorted with LC_COLLATE set to ‘C’.

BSD                             July 17, 2004                             BSD
