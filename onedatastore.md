ONEDATASTORE(1)            onedatastore(1) -- manages OpenNebula datastores            ONEDATASTORE(1)

NAME
       onedatastore - manages OpenNebula datastores

SYNOPSIS
       onedatastore command [args] [options]

OPTIONS
        -c, --cluster id|name     Selects the cluster
        -l, --list x,y,z          Selects columns to display with list command
        -d, --delay x             Sets the delay in seconds for top command
        -f, --filter x,y,z        Filter data. An array is specified with
                                  column=value pairs.
        --csv                     Write table in csv format
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
       •   create file Creates a new Datastore from the given template file valid options: cluster

       •   delete range|datastoreid_list Deletes the given Datastore

       •   chgrp range|datastoreid_list groupid Changes the Datastore group

       •   chown range|datastoreid_list userid [groupid] Changes the Datastore owner and group

       •   chmod range|datastoreid_list octet Changes the Datastore permissions

       •   list  Lists  Datastores  in the pool valid options: list, delay, filter, csv, xml, numeric,
           describe

       •   show datastoreid Shows information for the given Datastore valid options: xml

       •   update datastoreid [file] Update the template contents. If a path is not provided the  edi‐
           tor will be launched to modify the current content. valid options: append

       •   rename datastoreid name Renames the Datastore

       •   enable range|datastoreid_list Enables the given Datastore. Only available for System Datas‐
           tores

       •   disable range|datastoreid_list Disables the given  Datastore.  Only  available  for  System
           Datastores

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

       •   datastoreid OpenNebula DATASTORE name or id

       •   datastoreid_list Comma-separated list of OpenNebula DATASTORE names or ids

       •   clusterid OpenNebula CLUSTER name or id

       •   groupid OpenNebula GROUP name or id

       •   userid OpenNebula USER name or id

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed  under  the Apache License, Version 2.0 (the "License"); you may not use this file ex‐
       cept  in  compliance  with  the  License.  You  may  obtain  a   copy   of   the   License   at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                               ONEDATASTORE(1)
