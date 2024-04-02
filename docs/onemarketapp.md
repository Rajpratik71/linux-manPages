ONEMARKETAPP(1)        onemarketapp(1) -- manages appliances from Marketplaces        ONEMARKETAPP(1)

NAME
       onemarketapp - manages appliances from Marketplaces

SYNOPSIS
       onemarket command [args] [options]

OPTIONS
        -m, --marketplace id|name Selects the marketplace
        --name name               Name of the new MarketPlaceApp
        --description description Description for the new MarketPlaceApp
        --image id|name           Selects the image
        --dry                     Just print the template
        -d, --datastore id|name   Selects the datastore
        --vmname name             Selects the name for the new VM Template, if the
                                  App contains one
        --force                   Overwrite the file
        -a, --append              Append new attributes to the current template
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
       ·   create  [file]  Creates a new marketplace app in the given marketplace valid options: mar‐
           ketplace, name, description, image, dry

       ·   export appid name Exports the marketplace app to the OpenNebula cloud valid options: data‐
           store, vmname

       ·   download appid path Downloads a MarketApp to a file valid options: force

       ·   delete range|appid_list Deletes the given marketplace app

       ·   update  appid  [file]  Update the template contents for the app. If a path is not provided
           the editor will be launched to modify the current content. valid options: append

       ·   chgrp range|appid_list groupid Changes the marketplace app group

       ·   chown range|appid_list userid [groupid] Changes the marketplace app owner and group

       ·   chmod range|appid_list octet Changes the marketplace app permissions

       ·   rename appid name Renames the marketplace app

       ·   list [filterflag] Lists marketplace apps valid options:  list,  listconf,  delay,  filter,
           operator,  csv,  csv_del,  no_pager,  no_header,  adjust,  size,  expand,  no_expand, xml,
           numeric, describe

       ·   show appid Shows information for the given marketplace app valid options: xml

       ·   enable range|appid_list Enables the marketplace app

       ·   disable range|appid_list Disables the marketplace app. A disabled marketplace  app  cannot
           be exported to a cloud

       ·   lock  appid  Locks a VM with differents levels for lock any actions with this VM, show and
           monitoring never will be locked. Valid states are: All. Levels: [Use]: locks Admin, Manage
           and  Use  actions.  [Manage]:  locks  Manage  and  Use  actions. [Admin]: locks only Admin
           actions. valid options: use, manage, admin, all

       ·   unlock appid Unlocks a VM for unlock any actions with this VM. Valid states are: All.

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   appid OpenNebula MARKETPLACEAPP name or id

       ·   appid_list Comma-separated list of OpenNebula MARKETPLACEAPP names or ids

       ·   filterflag a, all all the known MARKETPLACEAPPs m, mine the  MARKETPLACEAPP  belonging  to
           the  user  in ONE_AUTH g, group ´mine´ plus the MARKETPLACEAPP belonging to the groups the
           user is member of G, primary group the MARKETPLACEAPP owned the user´s primary  group  uid
           MARKETPLACEAPP  of the user identified by this uid user MARKETPLACEAPP of the user identi‐
           fied by the username

LICENSE
       OpenNebula 5.10.1 Copyright 2002-2019, OpenNebula Project, OpenNebula Systems

       Licensed under the Apache License, Version 2.0 (the "License"); you  may  not  use  this  file
       except   in   compliance  with  the  License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                            December 2019                             ONEMARKETAPP(1)
