FIPSCHECK(8)                                                                                      fipscheck                                                                                      FIPSCHECK(8)



NAME
       fipscheck - perform a FIPS-140-2 validation check of one or more files

SYNTAX
       fipscheck [-s <hmac-suffix>] file1 [file2 ...]

DESCRIPTION
       fipscheck will perform a FIPS-140-2 validation of a file using a stored checksum of a file. The file containing the checksum value is first looked up in the /usr/lib{64,}/fipscheck directory and if
       not found there, it will be searched for in the same directory as the file which is being checksummed.

       The checksum file must have '.' prepended and '.hmac' appended to the original file name. The '.' must not be prepended to the file names in the /usr/lib{64,}/fipscheck directory.

       If invoked correctly the fipscheck command will not print anything to the standard output or error and set the return code based on the test result. A return code of 0 means the file passed the
       checksum test. A value of non-zero means the checksum failed.

       The -s option allows to specify the suffix of the hmac file names. The default value .hmac is used when this option is not specified.

RETURN CODES
       fipscheck can return the following return codes:

       0 Checksum OK

       1 Checksum mismatch

       2 Missing filename

       3 Cannot open the checksum file

       4 Cannot read the file to be checksummed, or the checksum computation failed

       5 Memory allocation error

       10 and higher - Failure during self-checking the libfipscheck.so shared library

       20 and higher - Failure during self-checking the fipscheck binary

ENVIRONMENT VARIABLES
       If you set the environment variable FIPSCHECK_DEBUG to "error", all error messages are sent to stderr. Setting this variable to "syslog" will send all error messages to the syslog daemon.

FIPS MODE
       A kernel compiled with CONFIG_CRYPTO_FIPS=y can be booted in fips mode by specifying fips=1 as kernel parameter. If the /boot director resides on a different partition, this needs to be specfied,
       for example boot=/dev/sda2.

SEE ALSO
       fipshmac(8), fipscheck.h(3), https://fedorahosted.org/fipscheck/

AUTHOR
       Tomas Mraz <tmraz@redhat.com>.

       Man page by Paul Wouters <pwouters@redhat.com>

COPYRIGHT
       Copyright 2008, 2012 Red Hat, Inc. All rights reserved.

       Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

       1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

       2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the
       distribution.



fipscheck                                                                                       April 11, 2012                                                                                   FIPSCHECK(8)
