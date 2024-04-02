ECONE-REGISTER(1)               econe-register(1) -- Registers an image              ECONE-REGISTER(1)

NAME
       econe-register - Registers an image

SYNOPSIS
       econe-register OPTIONS IMAGE-ID

       <<-EOT Register a previously uploaded image for use with an OpenNebula Cloud. IMAGE-ID: The im‐
       age identification as returned by the econe-upload command EOT

OPTIONS
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        -K, --access-key id       The username of the user
        -S, --secret-key key      The sha1 hashed password of the user
        -U, --url url             Set url as the web service url to use

       instance_id

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                             ECONE-REGISTER(1)
