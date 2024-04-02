ECONE-DETACH-VOLUME(econe-detach-volume(1) -- Detaches a DATABLOCK from an instaECONE-DETACH-VOLUME(1)

NAME
       econe-detach-volume - Detaches a DATABLOCK from an instance

SYNOPSIS
       econe-detach-volume OPTIONS VOLUME-ID

       Detaches  a volume from an instance. Make sure to unmount any file systems on the device within
       your operating system before detaching the volume VOLUME-ID: The ID of the DATABLOCK

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

                                              March 2015                        ECONE-DETACH-VOLUME(1)
