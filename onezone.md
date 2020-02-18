ONEZONE(1)       onezone(1) -- manages OpenNebula zones       ONEZONE(1)

NAME
       onezone - manages OpenNebula zones

SYNOPSIS
       onezone command [args] [options]

OPTIONS
        -a, --append              Append new attributes to the current template
        -l, --list x,y,z          Selects columns to display with list command
        -d, --delay x             Sets the delay in seconds for top command
        -f, --filter x,y,z        Filter data. An array is specified with
                                  column=value pairs.
        --csv                     Write table in csv format
        -x, --xml                 Show the resource in xml format
        -n, --numeric             Do not translate user and group IDs
        --describe                Describe list columns
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create file Creates a new Zone

       ·   rename zoneid name Renames the Zone

       ·   update  zoneid [file] Update the template contents. If a path
           is not provided the editor will be  launched  to  modify  the
           current content. valid options: append

       ·   delete range|zoneid_list Deletes the given Zone

       ·   list Lists Zones in the pool valid options: list, delay, fil‐
           ter, csv, xml, numeric, describe

       ·   show zoneid  Shows  information  for  the  given  Zone  valid
           options: xml

       ·   set  zoneid Set shell session access point for the CLI to the
           given Zone

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   zoneid OpenNebula ZONE name or id

       ·   zoneid_list Comma-separated list of OpenNebula ZONE names  or
           ids

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                     ONEZONE(1)
