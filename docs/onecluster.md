ONECLUSTER(1)                onecluster(1) -- manages OpenNebula clusters                ONECLUSTER(1)

NAME
       onecluster - manages OpenNebula clusters

SYNOPSIS
       onecluster command [args] [options]

OPTIONS
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
       •   create name Creates a new Cluster

       •   delete range|clusterid_list Deletes the given Cluster

       •   list  Lists Clusters in the pool valid options: list, delay, filter, csv, xml, numeric, de‐
           scribe

       •   show clusterid Shows information for the given Cluster valid options: xml

       •   addhost clusterid hostid Adds a Host to the given Cluster

       •   delhost clusterid hostid Deletes a Host from the given Cluster

       •   adddatastore clusterid datastoreid Adds a Datastore to the given Cluster

       •   deldatastore clusterid datastoreid Deletes a Datastore from the given Cluster

       •   addvnet clusterid vnetid Adds a Virtual Network to the given Cluster

       •   delvnet clusterid vnetid Deletes a Virtual Network from the given Cluster

       •   update clusterid [file] Update the template contents. If a path is not provided the  editor
           will be launched to modify the current content. valid options: append

       •   rename clusterid name Renames the Cluster

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

       •   clusterid OpenNebula CLUSTER name or id

       •   clusterid_list Comma-separated list of OpenNebula CLUSTER names or ids

       •   vnetid OpenNebula VNET name or id

       •   hostid OpenNebula HOST name or id

       •   datastoreid OpenNebula DATASTORE name or id

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed  under  the Apache License, Version 2.0 (the "License"); you may not use this file ex‐
       cept  in  compliance  with  the  License.  You  may  obtain  a   copy   of   the   License   at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                                 ONECLUSTER(1)
