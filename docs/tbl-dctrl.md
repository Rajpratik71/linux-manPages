tbl-dctrl(1)                                               Debian administrator's manual                                              tbl-dctrl(1)

NAME
       tbl-dctrl - generate tabular representations of data in dctrl format

SYNOPSIS
       tbl-dctrl [ options ] [ -c column-specification ...  ] [ filename ] ...

       tbl-dctrl --version

       tbl-dctrl --help

DESCRIPTION
       tbl-dctrl creates tabular representations of data given to it in Debian control file format.

       By  default, tbl-dctrl reads the whole database, looking for the longest entry in each requested column; it then outputs a table, with bor‐
       ders and column titles, where each column is just wide enough to fit the longest entry.  Most  of  this  behaviour  can  be  customized  as
       described below.

       A column is requested by specifying the -c (--column) switch with a column specification.  The simplest kind of a column specification con‐
       sists solely of the name of a field.  In such a case, tbl-dctrl will include in the output a column whose title is the literal column spec‐
       ification  and  whose  data is drawn from fields with that name.  If no -c options are given, tbl-dctrl will use all fields in the input in
       the order in which they first appear.

       There are two optional additions one can make to a column specification.  Prefixing the field name with some text followed by  an  equality
       sign  (for example, -c 'Package name=Package') modifies the column in such a way that the text before the equality sign is used as the col‐
       umn title, while the text after the equality sign is used as the name of the field from which data is drawn.  One can also append  a  colon
       followed  by  a  positive  whole  number  to the field name.  In such a case, the number after the colon specifies the width of the column.
       These two additions can be used separately or together.  If there are more than one colon, the last one is significant.  If there are  more
       than  one  equals  sign,  the first one is significant.  Other colons and equals signs are used simply as data.  Note that the whole column
       specification must be given to tbl-dctrl as one argument, so if it contains spaces, it must be quoted for the shell.

       If all requested columns have a specified width, tbl-dctrl will produce output immediately, not waiting for the whole input to be read in.

OPTIONS
       -d delimiter, --delimiter=delimiter
              Instead of drawing nice borders to the table, use the specified delimiter string to delimit columns in a row.

       -H, --no-heading
              Do not print a table heading (column titles).

       -l level, --errorlevel=level
              Set log level to level.  level is one of fatal, important, informational and debug, but the last may not be available, depending  on
              the  compile-time options.  These categories are given here in order; every message that is emitted when fatal is in effect, will be
              emitted in the important error level, and so on. The default is important.

       -V, --version
              Print out version information.

       -C, --copying
              Print out the copyright license.  This produces much output; be sure to redirect or  pipe  it  somewhere  (such  as  your  favourite
              pager).

       -h, --help
              Print out a help summary.

OPERANDS
       tbl-dctrl  will  read its input from the files named on the command line, in the specified order.  A file called - represents the program's
       standard input stream.  If no files are named, the program behaves as if - alone had been named, that is, input is read from  the  standard
       input stream.

STDIN
       The standard input stream may be used as input as specified above in the OPERANDS section.

INPUT FILES
       All input to tbl-dctrl is in the format of a Debian control file.

       A  Debian control (dctrl) file is a semistructured single-table database stored in a machine-parseable text file.  Such a database consists
       of a set of records; each record is a mapping from field names to field content.  Textually, records are separated by  empty  lines,  while
       each  field  is  encoded as one or more nonempty lines inside a record.  A field starts with its name, followed by a colon, followed by the
       field content.  The colon must reside on the first line of the field, and the first line must start with no whitespace.  Subsequent  lines,
       in contrast, always start with linear whitespace (one or more space or tab characters).

       When input is read from multiple files, a record separator is implicit between two adjacent files.

ENVIRONMENT VARIABLES
       The  standard  locale  environment,  specifically  its  character  set setting, affects the interpretation of input and output as character
       streams.

ASYNCHRONOUS EVENTS
       Standard UNIX signals have their usual meaning.

STDOUT
       All output is sent to the standard output stream.  The output is a tabular representation of the input database restricted to the specified
       fields.   Logically,  the output is a table; when the -d option is used, this table is represented simply by separating columns in each row
       by the specified delimiter; when the option is not used, a frame is drawn around the table.  The order of the columns is the  same  as  the
       order of the column specifications on the command line.

OUTPUT FILES
       There are no output files.

EXIT STATUS
       This utility exits with 0 when successful.  It uses a nonzero exit code inconsistently when an error is noticed (this is a bug).

CONSEQUENCES OF ERRORS
       In  case  of  errors  in  the input, the output will be partially or completely garbage.  In case of errors in invocation, the program will
       refuse to function.

EXAMPLES
       The following command line pipe outputs a table of all packages, with their maintainer data, sorted by the maintainer data,  that  have  no
       content:
       % grep-available -FInstalled-Size --eq 0 | sort-dctrl -kMaintainer - \
         | tbl-dctrl -cPackage -cMaintainer

AUTHOR
       The tbl-dctrl program and this manual page were written by Antti-Juhani Kaijanaho.

SEE ALSO
       apt-cache(1), ara(1), dpkg-awk(1), dpkg-query(1), grep-dctrl(1), sort-dctrl(1), dpkg(8)

Debian Project                                                      2006-04-02                                                        tbl-dctrl(1)
