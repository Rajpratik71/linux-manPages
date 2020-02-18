ONEACCT(1)      oneacct(1) -- OpenNebula Accounting Tool      ONEACCT(1)

NAME
       oneacct - OpenNebula Accounting Tool

SYNOPSIS
       oneacct [options]

OPTIONS
        -s, --start TIME          First day of the data to retrieve
        -e, --end TIME            Last day of the data to retrieve
        -u, --userfilter user     User name or id to filter the results
        -g, --group group         Group name or id to filter the results
        -H, --host HOST           Host name or id to filter the results
        --xpath XPATH_EXPRESSION  Xpath expression to filter the results. For
                                  example: oneacct --xpath ´HISTORY[ETIME>0]´
        -x, --xml                 Show the resource in xml format
        -j, --json                Show the resource in json format
        --split                   Split the output in a table for each VM
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --describe                Describe list columns
        -l, --list x,y,z          Selects columns to display with list command
        --csv                     Write table in csv format
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                     ONEACCT(1)
