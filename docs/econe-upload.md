ECONE-UPLOAD(1)            econe-upload(1) -- Uploads an image to OpenNebula           ECONE-UPLOAD(1)

NAME
       econe-upload - Uploads an image to OpenNebula

SYNOPSIS
       econe-upload OPTIONS IMAGE-PATH

       Uploads  an  image  for  use with an OpenNebula Cloud. This image should be later register with
       econe-register using the returned ImageId IMAGE-PATH: Path to the image to upload

OPTIONS
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        -K, --access-key id       The username of the user
        -S, --secret-key key      The sha1 hashed password of the user
        -U, --url url             Set url as the web service url to use
        -M, --multipart           Use ´multipart-post´ library instead of Curb/Curl

       file

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                               ECONE-UPLOAD(1)
