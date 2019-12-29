ippserver(1)                                  Apple Inc.                                  ippserver(1)

NAME
       ippserver - a simple internet printing protocol server

SYNOPSIS
       ippserver  [  -2  ]  [  -M  manufacturer  ]  [  -P ] [ -c command ] [ -d spool-directory ] [ -f
       type/subtype[,...]  ] [ -h ] [ -i iconfile.png ] [ -k ] [ -l location ] [ -m model ] [ -n host‐
       name ] [ -p port ] [ -r subtype ] [ -s speed[,color-speed] ] [ -v[vvv] ] service-name

DESCRIPTION
       ippserver  is a simple Internet Printing Protocol (IPP) server conforming to the IPP Everywhere
       (PWG 5100.14) specification. It can be used to test client software or  act  as  a  very  basic
       print server that runs a command for every job that is printed.

OPTIONS
       The following options are recognized by ippserver:

       -2   Report support for two-sided (duplex) printing.

       -M manufacturer
            Set the manufacturer of the printer.  The default is "Test".

       -P   Report support for PIN printing.

       -c command
            Run the specified command for each document that is printed.

       -d spool-directory
            Specifies  the directory that will hold the print files.  The default is a directory under
            the user's current temporary directory.

       -f type/subtype[,...]
            Specifies a list of MIME media types that the server will accept.  The default is  "appli‐
            cation/pdf,image/jpeg,image/pwg-raster".

       -h   Shows program help.

       -i iconfile.png
            Specifies the printer icon file for the server.  The default is "printer.png".

       -k   Keeps the print documents in the spool directory rather than deleting them.

       -l location
            Specifies  the human-readable location string that is reported by the server.  The default
            is the empty string.

       -m model
            Specifies the model name of the printer.  The default is "Printer".

       -n hostname
            Specifies the hostname that is reported by the server.  The default is the  name  returned
            by the hostname(1) command.

       -p port
            Specifies  the  port number to listen on.  The default is a user-specific number from 8000
            to 8999.

       -r subtype
            Specifies the Bonjour subtype(s) to advertise.  Separate multiple subtypes with  a  comma.
            The default is "_print".

       -s speed[,color-speed]
            Specifies  the  printer  speed  in pages per minute.  If two numbers are specified and the
            second number is greater than zero, the server will report  support  for  color  printing.
            The default is "10,0".

       -v[vvv]
            Be (very) verbose when logging activity to the standard output.

EXIT STATUS
       The ippserver program returns 1 if it is unable to process the command-line arguments or regis‐
       ter the IPP service.  Otherwise ippserver will run continuously until terminated.

CONFORMING TO
       The ippserver program is unique to CUPS and conforms to the IPP Everywhere (PWG 5100.14) speci‐
       fication.

ENVIRONMENT
       ippserver  adds  environment  variables  starting with "IPP_" for all IPP Job attributes in the
       print request.  For example, when executing a command for an IPP Job containing the "media" Job
       Template  attribute,  the "IPP_MEDIA" environment variable will be set to the value of that at‐
       tribute.

       Enumerated values are converted to their keyword equivalents.  For example,  a  "print-quality"
       Job  Template  attribute with a enum value of 3 will become the "IPP_PRINT_QUALITY" environment
       variable with a value of "draft".

EXAMPLES
       Run ippserver with a service name of My Cool Printer:

           ippserver "My Cool Printer"

       Run the file(1) command whenever a job is sent to the server:

           ippserver -c file "My Cool Printer"

SEE ALSO
       PWG Internet Printing Protocol Workgroup (http://www.pwg.org/ipp)

COPYRIGHT
       Copyright © 2007-2014 by Apple Inc.

28 August 2014                                   CUPS                                     ippserver(1)
