ipa-otptoken-import(1)                                                                         IPA Manual Pages                                                                        ipa-otptoken-import(1)



NAME
       ipa-otptoken-import - Imports OTP tokens from RFC 6030 XML file

SYNOPSIS
       ipa-otptoken-import [options] <infile> <outfile>

DESCRIPTION
       Running  the  command  will  attempt to import all tokens specified in infile. If the command is unable to import a token, the reason for the failure will be printed to standard error and all failed
       tokens will be written to the outfile for further inspection.

       If the infile contains encrypted token data, then the keyfile (-k) option MUST be specified.


OPTIONS
       -k keyfile
              File containing the key used to decrypt the token data.

EXIT STATUS
       0 if the command was successful

       1 if an error occurred



IPA                                                                                              Jun 12 2014                                                                           ipa-otptoken-import(1)
