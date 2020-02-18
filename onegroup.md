ONEGROUP(1)     onegroup(1) -- manages OpenNebula groups     ONEGROUP(1)

NAME
       onegroup - manages OpenNebula groups

SYNOPSIS
       onegroup command [args] [options]

OPTIONS
        -n, --name name           Name for the new group
        -u, --admin_user name     Creates an admin user for the group with name
        -p, --admin_password pass Password for the admin user of the group
        -d, --admin_driver driver Auth driver for the admin user of the group
        -r, --resources res_str   Which resources can be created by group users
                                  (VM+NET+IMAGE+TEMPLATE by default)
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
       ·   create  [group_name] Creates a new Group. A group name can be
           passed as the only argument, or via command line arguments

           Examples:

             - create a group with an admin user and allow group users
               to only create new templates and VMs

               onegroup create --name groupA
                               --admin_user admin_userA --admin_password somestr
                               --resources TEMPLATE+VM
           valid options: name, admin_user, admin_password, admin_driver, resources

       ·   update groupid [file] Update the template contents. If a path
           is  not  provided  the  editor will be launched to modify the
           current content. valid options: append

       ·   delete range|groupid_list Deletes the given Group

       ·   list Lists Groups in the pool  valid  options:  list,  delay,
           filter, csv, xml, numeric, describe

       ·   show  [groupid]  Shows  information for the given Group valid
           options: xml

       ·   addadmin range|groupid_list userid Adds a User to  the  Group
           administrators set

       ·   deladmin  range|groupid_list  userid  Removes a User from the
           Group administrators set

       ·   quota groupid [file] Set the quota limits for the group. If a
           path  is  not  provided the editor will be launched to modify
           the current quotas.

       ·   batchquota range|groupid_list [file] Sets the quota limits in
           batch  for various groups. If a path is not provided the edi‐
           tor will be launched to create new quotas.

       ·   defaultquota [file] Sets the default  quota  limits  for  the
           groups. If a path is not provided the editor will be launched
           to modify the current default quotas.

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   groupid_list Comma-separated list of OpenNebula  GROUP  names
           or ids

       ·   userid OpenNebula USER name or id

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                    ONEGROUP(1)
