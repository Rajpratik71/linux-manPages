ECONE-STOP-INSTANCES(1econe-stop-instances(1) -- Stops a set of virtual machineECONE-STOP-INSTANCES(1)

NAME
       econe-stop-instances - Stops a set of virtual machines

SYNOPSIS
       econe-stop-instances OPTIONS INSTANCE-ID[,INSTANCE-ID...]

       Stop  the selected running instance INSTANCE-ID: The instance identification as returned by the
       econe-run-instances command

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

       •   instance_id The IDs of instances, comma-separated

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                       ECONE-STOP-INSTANCES(1)
