FIPSHMAC(8)                                                                                        fipshmac                                                                                       FIPSHMAC(8)



NAME
       fipshmac - create FIPS-140-2 validation checksum files

SYNTAX
       fipshmac [-d <directory>] file1 [file2 ...]

DESCRIPTION
       fipshmac will create FIPS-140-2 checksum files for all the filenames specified. If the -d option is not specified, checksum files will be written in the same directory as the file being checksummed.
       It will prepend a '.' and append '.hmac' to the original file name. When a directory is specified with the -d option, the '.' will not be prepended and the files are stored into the directory.

       If invoked correctly the fipshmac command will not print anything to the standard output or error. Otherwise it will print an error message to stderr.

       The -s option allows to specify the suffix of the hmac file names. The default value .hmac is used when this option is not specified.

RETURN CODES
       fipscheck can return the following return codes:

       0 OK

       2 Missing filename

       3 Cannot open the checksum file for writing

       4 Cannot read the file to be checksummed, or the checksum computation failed

       5 Memory allocation error

       6,7 Cannot write to the checksum file

SEE ALSO
       fipscheck(8), fipscheck.h(3), https://fedorahosted.org/fipscheck/

AUTHOR
       Tomas Mraz <tmraz@redhat.com>.

       Man page by Paul Wouters <pwouters@redhat.com>

COPYRIGHT
       Copyright 2008, 2012 Red Hat, Inc. All rights reserved.

       Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

       1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

       2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the
       distribution.



fipscheck                                                                                       April 11, 2012                                                                                    FIPSHMAC(8)
