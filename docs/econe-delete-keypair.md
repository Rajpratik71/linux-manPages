ECONE-DELETecone-delete-keypair(1) -- Deletes the named keypair, removes the asECONE-DELETE-KEYPAIR(1)

NAME
       econe-delete-keypair - Deletes the named keypair, removes the associated keys

SYNOPSIS
       econe-delete-keypair OPTIONS keypair name

       Deletes  the  named  keypair, removes the associated keys. On success returns the identifier of
       the removed key.

OPTIONS
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        -K, --access-key id       The username of the user
        -S, --secret-key key      The sha1 hashed password of the user
        -U, --url url             Set url as the web service url to use

       keyName

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                       ECONE-DELETE-KEYPAIR(1)
