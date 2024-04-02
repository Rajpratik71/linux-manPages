phpcs(1)                                                      General Commands Manual                                                     phpcs(1)

NAME
       phpcs - PHP code sniffer CLI tool

SYNOPSIS
       phpcs  [-nwlsaepvi] [-d key[=value]] [--colors] [--no-colors] [--report=report] [--report-file=reportFile] [--report-report=reportFile] ...
       [--report-width=reportWidth]  [--generator=generator]  [--tab-width=tabWidth]  [--severity=severity]  [--error-severity=severity]  [--warn‐
       ing-severity=severity]  [--runtime-set  key value]  [--config-set  key value]  [--config-delete  key] [--config-show] [--standard=standard]
       [--sniffs=sniffs] [--encoding=encoding] [--extensions=extensions [--ignore=patterns] [--bootstrap=bootstrap] file ...

DESCRIPTION
       phpcs (or PHP_CodeSniffer) is a PHP5 script that tokenises PHP, JavaScript and CSS files to detect violations of a defined coding standard.
       It  is  an  essential  development tool that ensures your code remains clean and consistent.  It can also help prevent some common semantic
       errors made by developers.

PARAMETERS
       file

              One or more files and/or directories to check

       bootstrap

              A comma separated list of files to run before processing starts

       encoding

              The encoding of the files being checked (default is iso-8859-1)

       extensions

              A comma separated list of file extensions to check (extension filtering only valid when checking a directory).  The type of the file
              can be specified using: ext/type e.g., module/php,es/js

       generator

              Uses either the "HMTL", "Markdown" or "Text" generator (forces documentation generation instead of checking)

       patterns

              A comma separated list of patterns to ignore files and directories

       report

              Print  either  the full, xml, checkstyle, csv, json, emacs, source, summary, diff, svnblame, gitblame, hgblame, or notifysend report
              (the full report is printed by default)

       reportFile

              Write the report to the specified file path

       reportWidth

              How many columns wide screen reports should be printed or set to "auto" to use current screen width, where supported

       sniffs

              A comma separated list of sniff codes to limit the check to (all sniffs must be part of the specified standard)

       severity

              The minimum severity required to display an error or warning

       standard

              The name or path of the coding standard to use

       tabWidth

              The number of spaces each tab represents

OPTION
       -n

              Do not print warnings (shortcut for --warning-severity=0)

       -w

              Print both warnings and errors (this is the default)

       -l

              Local directory only, no recursion

       -s

              Show sniff codes in all reports

       -a

              Run interactively

       -e

              Explain a standard by showing the sniffs it includes

       -p

              Show progress of the run

       -v[v][v]

              Print verbose output

       -i

              Show a list of installed coding standards

       -d

              Set the key php.ini value to value or true if value is omitted

       --help

              Print the help message

       --version

              Print version information

       --colors

              Use colors in output

       --no-colors

              Do not use colors in output (this is the default)

SEE ALSO
       phpcbf(1)

                                                                    2015-12-13                                                            phpcs(1)
