SSI-CGI(1)                                                    General Commands Manual                                                   SSI-CGI(1)

NAME
       ssi-cgi - Server Side Includes parser as a CGI program

SYNOPSIS
       ssi-cgi
       -h: show help and exit.
       -v: show version and compile information and exit.

DESCRIPTION
       SSI parser which works like a CGI application.

SSI COMMANDS
       SSI  commands  have  the  following  format: <!--#command parameter="value"-->. This chapter shows all the available SSI commands and their
       parameters in ssi-cgi.

       config Use the config command to control the output.

              Parameters:
              errmsg: Set the message ssi-cgi must print in case of an error.

              Example: <!--#config errmsg="SSI error"-->

       echo   Print the value of a variable.

              Parameters:
              var: Print the value of an environment variable.

              Example: <!--#echo var="DOCUMENT_ROOT"-->

       exec   Execute a program and include its output at the position of the exec command.

              Parameters:
              cgi: Execute a CGI program relative to the website root.
              cmd: Execute any command as a parameter of /bin/sh.

              Example: <!--#exec cmd="ls -Flsh"-->

       fsize  Print the size of a file.

              Parameters:
              file: The file of which the size should be printed.

              Example: <!--#fsize file="info.txt"-->

       include
              Include another file at the position of the include command.

              Parameters:
              file: Include another file relative to the current file.
              virtual: Include another file relative to the website root.

              Example: <!--#include file="information.txt"-->

       printenv
              Print all environment variables.

              Example: <!--#printenv-->

SEE ALSO
       SSI-CGI is part of the Hiawatha webserver. See hiawatha(1) for more information about Hiawatha.

AUTHOR
       Hugo Leisink <hugo@hiawatha-webserver.org> - http://www.hiawatha-webserver.org/

                                                                                                                                        SSI-CGI(1)
