ECONE-ATTACH-VOLUME(1econe-attach-volume(1) -- Attaches a DATABLOCK to an instanECONE-ATTACH-VOLUME(1)

NAME
       econe-attach-volume - Attaches a DATABLOCK to an instance

SYNOPSIS
       econe-attach-volume OPTIONS VOLUME-ID

       Attaches  a  DATABLOCK to a running instance and exposes it as the specified device. VOLUME-ID:
       The ID of the DATABLOCK

OPTIONS
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        -K, --access-key id       The username of the user
        -S, --secret-key key      The sha1 hashed password of the user
        -U, --url url             Set url as the web service url to use
        -i, --instance instance_id The ID of the instance to attach the volume to
        -d, --device device       Specifies the device name to expose to the
                                  instance. Example: -d /dev/sdf

       volume_id

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                        ECONE-ATTACH-VOLUME(1)
