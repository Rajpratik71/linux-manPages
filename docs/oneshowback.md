ONESHOWBACK(1)                oneshowback(1) -- OpenNebula Showback Tool                ONESHOWBACK(1)

NAME
       oneshowback - OpenNebula Showback Tool

SYNOPSIS
       oneshowback command [options]

OPTIONS
        -s, --start TIME          First month of the data
        -e, --end TIME            Last month of the data
        -u, --userfilter user     User name or id to filter the results
        -g, --group group         Group name or id to filter the results
        -x, --xml                 Show the resource in xml format
        -j, --json                Show the resource in json format
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --describe                Describe list columns
        -l, --list x,y,z          Selects columns to display with list command
        --csv                     Write table in csv format
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       •   list  Returns  the showback records valid options: start_time, end_time, userfilter, group,
           xml, json, verbose, help, version, describe, list, csv, user, password, endpoint

       •   calculate Calculates the showback records valid options: start_time, end_time

ARGUMENT FORMATS
LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                                ONESHOWBACK(1)
