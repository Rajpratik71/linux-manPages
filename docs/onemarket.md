ONEMARKET(1)          onemarket(1) -- manages internal and external Marketplaces         ONEMARKET(1)

NAME
       onemarket - manages internal and external Marketplaces

SYNOPSIS
       onemarket command [args] [options]

OPTIONS
        -l, --list x,y,z          Selects columns to display with list command
        -c, --listconf conf       Selects a predefined column list
        -d, --delay x             Sets the delay in seconds for top command
        -f, --filter x,y,z        Filter data. An array is specified with
                                  column=value pairs.
        --operator operator       Logical operator used on filters: AND, OR.
                                  Default: AND.
        --csv                     Write table in csv format
        --csv-del del             Set delimiter for csv output
        --no-pager                Disable pagination
        --no-header               Hides the header of the table
        --adjust x,y,z            Adjust size to not truncate selected columns
        -s, --size x=size,y=size  Change the size of selected columns. For example:
                                  $ onevm list --size "name=20" will make column
                                  name size 20.
        --expand [x=prop,y=prop]  Expands the columns size to fill the terminal.
                                  For example: $onevm list --expand
                                  name=0.4,group=0.6 will expand name 40% and
                                  group 60%. $onevm list --expand name,group will
                                  expand name and group based on its size.$onevm
                                  list --expand will expand all columns.
        --no-expand               Disable expand
        -x, --xml                 Show the resource in xml format
        -n, --numeric             Do not translate user and group IDs
        --describe                Describe list columns
        -a, --append              Append new attributes to the current template
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create file Creates a new Marketplace from the given template file

       ·   delete range|marketplaceid_list Deletes the given Marketplace

       ·   chgrp range|marketplaceid_list groupid Changes the Marketplace group

       ·   chown range|marketplaceid_list userid [groupid] Changes the Marketplace owner and group

       ·   chmod range|marketplaceid_list octet Changes the Marketplace permissions

       ·   list  Lists  Marketplaces  valid  options:  list,  listconf, delay, filter, operator, csv,
           csv_del, no_pager, no_header, adjust, size, expand, no_expand, xml, numeric, describe

       ·   show marketplaceid Shows Marketplace information valid options: xml

       ·   update marketplaceid [file] Update the template contents. If a path is  not  provided  the
           editor will be launched to modify the current content. valid options: append

       ·   rename marketplaceid name Renames the Marketplace

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   marketplaceid OpenNebula MARKETPLACE name or id

       ·   marketplaceid_list Comma-separated list of OpenNebula MARKETPLACE names or ids

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

LICENSE
       OpenNebula 5.10.1 Copyright 2002-2019, OpenNebula Project, OpenNebula Systems

       Licensed  under  the  Apache  License,  Version 2.0 (the "License"); you may not use this file
       except  in  compliance  with  the  License.  You  may  obtain  a  copy  of  the   License   at
       http://www.apache.org/licenses/LICENSE-2.0

                                            December 2019                                ONEMARKET(1)
