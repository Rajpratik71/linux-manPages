papi_error_codes(1)                                                                                  PAPI                                                                                 papi_error_codes(1)



NAME
       papi_error_codes - papi_error_codes utility.

       file error_codes.c

NAME
       papi_error_codes - lists all currently defined PAPI error codes.

Synopsis
       papi_error_codes

Description
       papi_error_codes is a PAPI utility program that displays all defined error codes from papi.h and their error strings from papi_data.h. If an error string is not defined, a warning is generated. This
       can help trap newly defined error codes for which error strings are not yet defined.

Options
       This utility has no command line options.

Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                            papi_error_codes(1)
