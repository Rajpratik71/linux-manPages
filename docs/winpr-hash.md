winpr-hash(1)                                                                                      FreeRDP                                                                                      winpr-hash(1)



NAME
       winpr-hash - NTLM hashing tool

SYNOPSIS
       winpr-hash -u username -p password [-d domain] [-f { default | sam }] [-v { 1 | 2 }]

DESCRIPTION
       winpr-hash is a small utility that can be used to create a NTLM hash from a username and password pair. The created hash can be outputed as plain hash or in SAM format.

OPTIONS
       -u username
              The username to use.

       -p password
              Password to use.

       -d domain
              A optional parameter to specify the domain of the user.

       -f format
              Specify the output format. The default outputs only the plain NTLM hash. The second output format available is sam which outputs the created hash in a format that it can be used in SAM file:

              user:domain::hash:::

       -v version
              Version allows it to specify the NTLM version to use. The default is to use version 1. In case version 2 is used a domain needs to be specified.

EXAMPLES
       winpr-hash -u user -p password -d domain -f sam -v 2

       Create a version 2 NTLM hash for user with domain and password and output it in sam format.

EXIT STATUS
       0      Successful program execution.

       1      Missing or invalid arguments.

AUTHOR
       FreeRDP <team@freerdp.com>



2.0.0-rc4                                                                                         2017-01-11                                                                                    winpr-hash(1)
