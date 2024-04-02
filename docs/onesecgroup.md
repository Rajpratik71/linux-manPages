ONESECGROUP(1)           onesecgroup(1) -- manages OpenNebula security groups           ONESECGROUP(1)

NAME
       onesecgroup - manages OpenNebula security groups

SYNOPSIS
       onesecgroup command [args] [options]

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
       •   create file Creates a new Security Group from the given description

       •   clone secgroupid name Creates a new Security Group from an existing one

       •   delete range|secgroupid_list Deletes the given Security Group

       •   chgrp range|secgroupid_list groupid Changes the Security Group´s group

       •   chown range|secgroupid_list userid [groupid] Changes the Security Group´s owner and group

       •   chmod range|secgroupid_list octet Changes the Security Group permissions

       •   update secgroupid [file] Update the template contents. If a path is not provided the editor
           will be launched to modify the current content. valid options: append

       •   rename secgroupid name Renames the Security Group

       •   list [filterflag] Lists Security Group in the pool valid options: list, delay, filter, csv,
           xml, numeric, describe

       •   show secgroupid Shows information for the given Security Group valid options: xml

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

       •   groupid OpenNebula GROUP name or id

       •   userid OpenNebula USER name or id

       •   secgroupid OpenNebula SECURITY_GROUP name or id

       •   secgroupid_list Comma-separated list of OpenNebula SECURITY_GROUP names or ids

       •   filterflag a, all all the known SECURITY_GROUPs m, mine the SECURITY_GROUP belonging to the
           user in ONE_AUTH g, group ´mine´ plus the SECURITY_GROUP belonging to the groups  the  user
           is  member  of uid SECURITY_GROUP of the user identified by this uid user SECURITY_GROUP of
           the user identified by the username

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                                ONESECGROUP(1)
