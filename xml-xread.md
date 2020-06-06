XML-XREAD(1)                                                                                    User commands                                                                                    XML-XREAD(1)



NAME
       xml-xread - A simple command-line XML parsing application


SYNOPSIS
       xml-xread [options] document.xml


DESCRIPTION
       xml-xread is a simple command-line XML Parser. It's just a little wrapper around the JAXP XMLReader with support for catalogs.

       The process ends with error-level 1, if there were errors.


OPTIONS
       Command-line options are described below.


       -c catalogfile
           Load a particular catalog file

       -w
           Perform a well-formed parse, not a validating parse

       -v (default)
           Perform a validating parse

       -s
           Enable W3C XML Schema validation

       -n
           Perform a namespace-ignorant parse

       -N (default)
           Perform a namespace-aware parse

       -d integer
           Set the debug level. Warnings are shown if the debug level is > 2

       -E integer
           Set the maximum number of errors to display




xml-commons-resolver                                                                            11 April 2013                                                                                    XML-XREAD(1)
