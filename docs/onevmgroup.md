ONEVMGROUP(1)                     onevmgroup(1) -- manages VM groups                    ONEVMGROUP(1)

NAME
       onevmgroup - manages VM groups

SYNOPSIS
       onevmgroup command [args] [options]

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
        --use                     lock use actions
        --manage                  lock manage actions
        --admin                   lock admin actions
        --all                     lock all actions
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create file Creates a new VM Group from the given description

       ·   delete range|vmgroupid_list Deletes the VM Group

       ·   list [filterflag] Lists VM Group in the pool valid options: list, listconf, delay, filter,
           operator, csv,  csv_del,  no_pager,  no_header,  adjust,  size,  expand,  no_expand,  xml,
           numeric, describe

       ·   show vmgroupid Shows information for the given VM Group valid options: xml

       ·   chgrp range|vmgroupid_list groupid Changes the VM Group´s group

       ·   chown range|vmgroupid_list userid [groupid] Changes the VM Group´s owner and group

       ·   chmod range|vmgroupid_list octet Changes the VM Group permissions

       ·   update vmgroupid [file] Update the template contents. If a path is not provided the editor
           will be launched to modify the current content. valid options: append

       ·   rename vmgroupid name Renames the VM Group

       ·   lock vmgroupid Locks a VM with differents levels for lock any actions with this  VM,  show
           and  monitoring  never  will be locked. Valid states are: All. Levels: [Use]: locks Admin,
           Manage and Use actions. [Manage]: locks Manage and Use actions. [Admin]: locks only  Admin
           actions. valid options: use, manage, admin, all

       ·   unlock vmgroupid Unlocks a VM for unlock any actions with this VM. Valid states are: All.

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   vmgroupid OpenNebula VM_GROUP name or id

       ·   vmgroupid_list Comma-separated list of OpenNebula VM_GROUP names or ids

       ·   filterflag  a,  all  all the known VM_GROUPs m, mine the VM_GROUP belonging to the user in
           ONE_AUTH g, group ´mine´ plus the VM_GROUP belonging to the groups the user is  member  of
           G,  primary  group  the  VM_GROUP  owned the user´s primary group uid VM_GROUP of the user
           identified by this uid user VM_GROUP of the user identified by the username

LICENSE
       OpenNebula 5.10.1 Copyright 2002-2019, OpenNebula Project, OpenNebula Systems

       Licensed under the Apache License, Version 2.0 (the "License"); you  may  not  use  this  file
       except   in   compliance  with  the  License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                            December 2019                               ONEVMGROUP(1)
