join-dctrl(1)                                                                            General Commands Manual                                                                            join-dctrl(1)

NAME
       join-dctrl - perform relational join on data in dctrl format

SYNOPSIS
       join-dctrl [ options ] filename filename

       join-dctrl --version

       join-dctrl --help

DESCRIPTION
       join-dctrl performs a relational join operation on data given to it in Debian control file format.

       A  join  field  must be specified using either the switches -1 and -2 or the switch -j.  Conceptually, the program creates all ordered pairs of records that can be formed by having a record from
       the first file as the first member of the pair and having a record from the second file as the second member of the pair; and then it deletes all such pairs where the join fields are not  equal.
       Effectively, each of the input files is treated as a relational database table.

       Every input file must be in ascending order on its join field; this allows the program to work fast.  The sort-dctrl(1) program can be used to make it so.

OPTIONS
       -1 field, --1st-join-field=field
              Specify the join field of the first input file.

       -2 field, --2nd-join-field=field
              Specify the join field of the second input file.

       -j field, --join-field=field
              Specify a common join field for all files.

       -a fileno, --unpairable-from=fileno
              Specify that unmatched paragraphs from the first (if 1 is given) or the second (if 2 is given) file are printed.

       -o fieldspec, --output-fields=fieldspec
              Specify  which  fields are included in the output.  Fields are separated by commas (more than one -o option can be used, too).  Each field is specified in the format fileno.field in which
              fileno is the ordinal number of the input file from which the field is drawn (either 1 or 2), and field gives the name of the field to use.  As a  special  case,  simple  0  can  be  used
              instead of fileno.field to refer to the common value of the join fields.

              The  name  of  the  field  (not including the file number) is used in the output as the name of the field.  However, a different name for output purposes can be specified by suffixing the
              field specification by a colon and the preferred visible name.

              For example, the option -o 0,1.Version:Old-Version,2.Version specifies that the first field in any output record should be the join field, the second field should be  Old-Version  drawing
              its  data  from the Version field of the first input file, and the third field should be Version drawing its data from the field with the same name in the second input file, and these are
              the only fields in an output record.

              If no -o option is given, all fields of all the records being joined are included in the output.

       -l level, --errorlevel=level
              Set log level to level.  level is one of fatal, important, informational and debug, but the last may not be available, depending on the compile-time options.  These categories  are  given
              here in order; every message that is emitted when fatal is in effect, will be emitted in the important error level, and so on. The default is important.

       -V, --version
              Print out version information.

       -C, --copying
              Print out the copyright license.  This produces much output; be sure to redirect or pipe it somewhere (such as your favourite pager).

       -h, --help
              Print out a help summary.

OPERANDS
       join-dctrl  will  treat each file named on the command line as a relational database table.  A file called - represents the program's standard input stream.  Currently, exactly two files must be
       named.

STDIN
       The standard input stream may be used as input as specified above in the OPERANDS section.

INPUT FILES
       All input to join-dctrl is in the format of a Debian control file.

       A Debian control (dctrl) file is a semistructured single-table database stored in a machine-parseable text file.  Such a database consists of a set of records; each  record  is  a  mapping  from
       field names to field content.  Textually, records are separated by empty lines, while each field is encoded as one or more nonempty lines inside a record.  A field starts with its name, followed
       by a colon, followed by the field content.  The colon must reside on the first line of the field, and the first line must start with no whitespace.  Subsequent lines, in contrast,  always  start
       with linear whitespace (one or more space or tab characters).

       Each input file must be in the ascending order of its join field.

ENVIRONMENT VARIABLES
       The standard locale environment, specifically its character set setting, affects the interpretation of input and output as character streams.

ASYNCHRONOUS EVENTS
       Standard UNIX signals have their usual meaning.

STDOUT
       All output is sent to the standard output stream.  The output is in the format of a Debian control file, described above in the INPUT FILES section.  The output will be in the ascending order of
       the join field, if that field is included in the output.

OUTPUT FILES
       There are no output files.

EXIT STATUS
       This utility exits with 0 when successful.  It uses a nonzero exit code inconsistently when an error is noticed (this is a bug).

CONSEQUENCES OF ERRORS
       In case of errors in the input, the output will be partially or completely garbage.  In case of errors in invocation, the program will refuse to function.

EXAMPLES
       Suppose that a file containing data about binary packages for the AMD64 architecture contained in the Debian squeeze (6.0) release, section main, is in the current directory and named  Packages.
       Suppose that we are currently on a Debian system.  Suppose further that the current directory does not contain files named stat and pkg.  The following commands gives, for each package currently
       installed and available in Debian squeeze (6.0), its currently installed version (as Old-Version) and the version in squeeze (as New-Version):
       $ sort-dctrl -kPackage /var/lib/dpkg/status > stat
       $ sort-dctrl -kPackage Packages > pkg
       $ join-dctrl -j Package \
         -o 0,1.Version:Old-Version,2.Version:New-Version \
         stat pkg

AUTHOR
       The join-dctrl program and this manual page were written by Antti-Juhani Kaijanaho.

SEE ALSO
       grep-dctrl(1), sort-dctrl(1), tbl-dctrl(1)

                                                                                                                                                                                            join-dctrl(1)
