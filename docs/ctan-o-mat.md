CTAN-O-MAT(1)                                                                        Gerd Neugebauer                                                                        CTAN-O-MAT(1)

NAME
       ctan-o-mat - Validate and upload a package for CTAN

SYNOPSIS
       ctan-o-mat [options] [<package configuration>]

DESCRIPTION
       This program can be used to automate the upload of a package to the Comprehensive TeX Archive Network (https://www.ctan.org). The description of the package is taken from a
       configuration file. Thus it can be updated easily without the need to fill a Web form with the same old information again and again.

       The provided information is validated in any case. If the validation succeeds and not only the validation is requested then the provided archive file is placed in the incoming
       area of the CTAN for further processing by the CTAN team.

       In any case any finding during the validation is reported at the end of the processing. Note that the validation is the default and a official submission has to be requested by
       the an appropriate command line option.

       ctan-o-mat requires an Internet connection to the CTAN server. Even the validation retrieves the known attributes and the basic constraints from the server.

CONFIGURATION
       The default configuration is read from a file with the same name as the current directory an the extension .pkg. This file name can be overwritten on the command line.

       The configuration depends on the features currently supported by the CTAN server.  Since these features can change over time the configuration is not hard-coded in ctan-o-mat.
       You can request an empty template of the configuration via the command line parameter "--init".

OPTIONS
       -h
       --help
           Print this short summary about the usage and exit the program.

       -i
       --init
           Create an empty template for a configuration.

       --list licenses
           List the known licenses of CTAN to the standard output stream.  Each license is represented as one line. The line contains the fields key, name, free indicator. Those fields
           are separated by tab characters.  Afterwards the program terminates without processing any further arguments.

       --config <package configuration>
       --pkg <package configuration>
       --package <package configuration>
           Set the package configuration file.

       -s
       --submit
           Upload the submission, validate it and officially submit it to CTAN it the validation succeeds.

       -v
       --verbose
           Print some more information during the processing (verbose mode).

       --version
           Print the version number of this program and exit.

       --validate
       -n
       --noaction
           Do not perform the final upload. The package is validated and the resulting messages are printed.

       <package>
           This parameter is the name of a package configuration (see section CONFIGURATION) contained in a file.  If not set otherwise the package configuration defaults to the name of
           the current directory with ".pkg" appended.

ENVIRONMENT
       The following environment variables are recognized by ctan-o-mat.

       CTAN_O_MAT_URL
           The value is the URL prefix for the CTAN server to be contacted. The default is "https://ctan.org/submit". The complete URL is constructed by appending "validate", "upload",
           or "fields" to use the respective CTAN REST API.

CONNECTING VIA PROXIES
       If you need to connect to the Internet via a proxy then this can be achieved by setting some environment variables before running ctan-o-mat.  To redirect the request via the
       proxy simply define an environment variable "http_proxy" to point to the proxy host -- including protocol and port as required. Note that the name of the environment variable is
       supposed to be in lower case.

AUTHOR
       Gerd Neugebauer (gene@gerd-neugebauer.de)

BUGS
       ·   The program can not be used without a working connection to the Internet.

ctan-o-mat                                                                              2017-11-23                                                                          CTAN-O-MAT(1)
