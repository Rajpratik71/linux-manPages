XML-RESOLVER(1)                                                                                 User commands                                                                                 XML-RESOLVER(1)



NAME
       xml-resolver - A simple command-line resolver


SYNOPSIS
       xml-resolver [options] keyword


DESCRIPTION
       xml-resolver is a simple command-line resolver. It takes some parameters and passes them through the resolver, printing the result.

       The process ends with error-level 1, if there were errors.


OPTIONS
       Command-line options are described below.


       -c catalogfile
           Load a particular catalog file

       -n name
           Sets the name

       -p publicId
           Sets the public identifier

       -s systemId
           Sets the system identifier

       -a
           Absolute system URI

       -u uri
           Sets the URI

       -d integer
           Set the debug level

       And keyword is one of: doctype, document, entity, notation, public, system, or uri.




xml-commons-resolver                                                                            11 April 2013                                                                                 XML-RESOLVER(1)
