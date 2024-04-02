ONEVCENTER(1)                    onevcenter(1) -- vCenter import tool                    ONEVCENTER(1)

NAME
       onevcenter - vCenter import tool

SYNOPSIS
       onevcenter command [args] [options]

OPTIONS
        --vcenter vCenter         The vCenter hostname
        --vuser username          The username to interact with vCenter
        --vpass password          The password for the user
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       •   hosts Import vCenter clusters as OpenNebula hosts valid options: vcenter, vuser, vpass

       •   templates Import vCenter VM Templates into OpenNebula valid options: vcenter, vuser, vpass

       •   vms  Import vCenter running Virtual Machines into OpenNebula valid options: vcenter, vuser,
           vpass

       •   networks Import vCenter networks into OpenNebula valid options: vcenter, vuser, vpass

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                                 ONEVCENTER(1)
