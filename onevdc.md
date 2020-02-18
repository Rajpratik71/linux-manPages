ONEVDC(1) onevdc(1) -- manages OpenNebula Virtual Data Centers ONEVDC(1)

NAME
       onevdc - manages OpenNebula Virtual Data Centers

SYNOPSIS
       onevdc command [args] [options]

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
       ·   create name Creates a new VDC

       ·   rename vdcid name Renames the VDC

       ·   update  vdcid  [file] Update the template contents. If a path
           is not provided the editor will be  launched  to  modify  the
           current content. valid options: append

       ·   delete range|vdcid_list Deletes the given VDC

       ·   addgroup  range|vdcid_list  groupid Adds a Group to the given
           VDC

       ·   delgroup range|vdcid_list groupid Deletes a  Group  from  the
           given VDC

       ·   addcluster  range|vdcid_list  zoneid clusterid Adds a Cluster
           (from a specific Zone) to the given VDC

       ·   delcluster range|vdcid_list zoneid clusterid Deletes a  Clus‐
           ter (from a specific Zone) from the given VDC

       ·   addhost  range|vdcid_list  zoneid  hostid Adds a Host (from a
           specific Zone) to the given VDC

       ·   delhost range|vdcid_list zoneid hostid Deletes a Host (from a
           specific Zone) from the given VDC

       ·   adddatastore range|vdcid_list zoneid datastoreid Adds a Data‐
           store (from a specific Zone) to the given VDC

       ·   deldatastore range|vdcid_list zoneid  datastoreid  Deletes  a
           Datastore (from a specific Zone) from the given VDC

       ·   addvnet range|vdcid_list zoneid vnetid Adds a Virtual Network
           (from a specific Zone) to the given VDC

       ·   delvnet range|vdcid_list zoneid vnetid Deletes a Virtual Net‐
           work (from a specific Zone) from the given VDC

       ·   list  Lists VDCs in the pool valid options: list, delay, fil‐
           ter, csv, xml, numeric, describe

       ·   show vdcid Shows information for the given VDC valid options:
           xml

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   vdcid OpenNebula VDC name or id

       ·   vdcid_list  Comma-separated  list  of OpenNebula VDC names or
           ids

       ·   groupid OpenNebula GROUP name or id

       ·   zoneid OpenNebula ZONE name or id

       ·   clusterid OpenNebula CLUSTER name or id. Can be set to ALL

       ·   hostid OpenNebula HOST name or id. Can be set to ALL

       ·   datastoreid OpenNebula DATASTORE name or id. Can  be  set  to
           ALL

       ·   vnetid OpenNebula VNET name or id. Can be set to ALL

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                      ONEVDC(1)
