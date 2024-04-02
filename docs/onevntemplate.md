ONEVNTEMPLATE(1)        onevntemplate(1) -- manages Virtual Network Templates        ONEVNTEMPLATE(1)

NAME
       onevntemplate - manages Virtual Network Templates

SYNOPSIS
       onevntemplate command [args] [options]

OPTIONS
        --dry                     Just print the template
        --name name               Name of the new VN TEMPLATE. When instantiating
                                  multiple VNs you can use the "%i" wildcard to
                                  produce different names such as vm-0, vm-1...
        -m, --multiple x          Instance multiple VNs
        --extended                Process the template and included extended
                                  information
        --as_uid uid              The User ID to instantiate the VM
        --as_gid gid              The Group ID to instantiate the VM
        -s, --size size           Number of addresses
        -m, --mac mac             First MAC address in : notation
        -i, --ip ip               First IP address in . notation
        -6, --ip6 ip6             First IPv6 address, in CIDR notation e.g.
                                  2001::1/48
        -g, --ip6_global ip6_pref IP6 global prefix
        -u, --ip6_ula ip6_pref    IP6 ula prefix
        --gateway ip              IP of the gateway
        --netmask mask            Netmask in dot notation
        --vn_mad mad              Use this driver for the network
        --vlanid id               VLAN ID assigned
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
       ·   create [file] Creates a new Virtual Network Template from the given description

           Examples:
             - using a Virtual Network Template description file:

               onevntemplate create vn_description.tmpl
           valid options: dry

       ·   clone templateid name Creates a new VN Template from an existing one

       ·   delete range|templateid_list Deletes the given VN Template

       ·   instantiate  templateid  [file] Creates a new VN instance from the given VN Template. This
           VN can be managed with the ´onevnet´ command.

           The source Template can be modified adding or replacing attributes with
           the optional file argument, or with the options.
           valid options: name, multiple, extended, as_uid, as_gid, size, mac, ip, ip6, ip6_global, ip6_ula, gateway, netmask, vn_mad, vlanid

       ·   chgrp range|templateid_list groupid Changes the VN Template group

       ·   chown range|templateid_list userid [groupid] Changes the VN Template owner and group

       ·   chmod range|templateid_list octet Changes the VN Template permissions

       ·   update templateid [file] Update the VN template contents. If a path is  not  provided  the
           editor will be launched to modify the current content. valid options: append

       ·   rename templateid name Renames the VN Template

       ·   list  [filterflag]  Lists  VN  Templates in the pool valid options: list, listconf, delay,
           filter, operator, csv, csv_del, no_pager, no_header, adjust, size, expand, no_expand, xml,
           numeric, describe

       ·   show templateid Shows information for the given VN Template valid options: xml, extended

       ·   top  [filterflag]  Lists Templates continuously valid options: list, listconf, delay, fil‐
           ter, operator, csv, csv_del, no_pager, no_header, adjust, size,  expand,  no_expand,  xml,
           numeric, describe

       ·   lock  templateid Locks a VN template with differents levels for lock any actions with this
           VN template, show and monitoring never will be locked.  Valid  states  are:  All.  Levels:
           [Use]:  locks  Admin,  Manage  and  Use  actions.  [Manage]: locks Manage and Use actions.
           [Admin]: locks only Admin actions. valid options: use, manage, admin, all

       ·   unlock templateid Unlocks a VN template for unlock any  actions  with  this  VN  template.
           Valid states are: All.

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   templateid OpenNebula VNTEMPLATE name or id

       ·   templateid_list Comma-separated list of OpenNebula VNTEMPLATE names or ids

       ·   filterflag  a,  all all the known VNTEMPLATEs m, mine the VNTEMPLATE belonging to the user
           in ONE_AUTH g, group ´mine´ plus the VNTEMPLATE belonging to the groups the user is member
           of  G,  primary  group the VNTEMPLATE owned the user´s primary group uid VNTEMPLATE of the
           user identified by this uid user VNTEMPLATE of the user identified by the username

LICENSE
       OpenNebula 5.10.1 Copyright 2002-2019, OpenNebula Project, OpenNebula Systems

       Licensed under the Apache License, Version 2.0 (the "License"); you  may  not  use  this  file
       except   in   compliance  with  the  License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                            December 2019                            ONEVNTEMPLATE(1)
