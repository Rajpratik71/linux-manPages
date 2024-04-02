ONEVNET(1)                     onevnet(1) -- manages OpenNebula networks                    ONEVNET(1)

NAME
       onevnet - manages OpenNebula networks

SYNOPSIS
       onevnet command [args] [options]

OPTIONS
        -c, --cluster id|name     Selects the cluster
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend
        -s, --size size           Number of addresses
        -m, --mac mac             First MAC address in : notation
        -i, --ip ip               First IP address in . notation
        -g, --ip6_global ip6_pref IP6 global prefix
        -u, --ip6_ula ip6_pref    IP6 ula prefix
        --gateway ip              IP of the gateway
        --netmask mask            Netmask in dot notation
        --vlan                    Use network isolation
        --vlanid id               VLAN ID assigned
        -a, --address_range ar_id ID of the address range
        -n, --name reservation name Name of the address reservation
        -l, --list x,y,z          Selects columns to display with list command
        -d, --delay x             Sets the delay in seconds for top command
        -f, --filter x,y,z        Filter data. An array is specified with
                                  column=value pairs.
        --csv                     Write table in csv format
        -x, --xml                 Show the resource in xml format
        -n, --numeric             Do not translate user and group IDs
        -k, --kilobytes           Show units in kilobytes
        --describe                Describe list columns
        --show-ar                 Show also AR templates
        -a, --append              Append new attributes to the current template
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       •   create file Creates a new Virtual Network from the given template file valid options: clus‐
           ter

       •   delete range|vnetid_list Deletes the given Virtual Network

       •   addar vnetid [file] Adds an address range to the Virtual Network  valid  options:  verbose,
           help,  version, user, password, endpoint, size, mac, ip, ip6_global, ip6_ula, gateway, net‐
           mask, vlan, vlanid

       •   addleases vnetid ip [mac] (DEPRECATED, use addar) Adds a lease to the Virtual Network

       •   rmar vnetid ar_id Removes an address range from the Virtual Network

       •   rmleases vnetid ip (DEPRECATED, use rmar) Removes a lease from the Virtual Network

       •   free vnetid ar_id Frees a reserved address range from the Virtual Network

       •   hold vnetid ip Holds a Virtual Network lease, marking it as used  valid  options:  verbose,
           help, version, user, password, endpoint, address_range

       •   release  vnetid  ip  Releases a Virtual Network lease on hold valid options: verbose, help,
           version, user, password, endpoint, address_range

       •   reserve vnetid [vnetid] Reserve addresses from the Virtual Network. A new  virtual  network
           will  be  created  to hold the reservation. Optionally the reservation can be put on an ex‐
           isiting VNET, as long as it contains a valid reservation from the same VNET valid  options:
           verbose, help, version, user, password, endpoint, address_range, name, size, mac, ip

       •   chgrp range|vnetid_list groupid Changes the Virtual Network group

       •   chown range|vnetid_list userid [groupid] Changes the Virtual Network owner and group

       •   chmod range|vnetid_list octet Changes the Virtual Network permissions

       •   list  [filterflag]  Lists  Virtual Networks in the pool valid options: list, delay, filter,
           csv, xml, numeric, kilobytes, describe

       •   show vnetid Shows information for the given Virtual Network valid options: xml, show_ar

       •   update vnetid [file] Update the template contents. If a path is  not  provided  the  editor
           will be launched to modify the current content. valid options: append

       •   updatear  vnetid ar_id [file] Update Address Range variables. SIZE, IP, MAC and TYPE cannot
           be updated

       •   rename vnetid name Renames the Virtual Network

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

       •   groupid OpenNebula GROUP name or id

       •   userid OpenNebula USER name or id

       •   vnetid OpenNebula VNET name or id

       •   vnetid_list Comma-separated list of OpenNebula VNET names or ids

       •   filterflag a, all all the known VNETs m, mine the VNET belonging to the user in ONE_AUTH g,
           group  ´mine´  plus  the VNET belonging to the groups the user is member of uid VNET of the
           user identified by this uid user VNET of the user identified by the username

       •   ar_id Integer

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                                    ONEVNET(1)
