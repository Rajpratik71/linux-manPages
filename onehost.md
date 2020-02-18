ONEHOST(1)       onehost(1) -- manages OpenNebula hosts       ONEHOST(1)

NAME
       onehost - manages OpenNebula hosts

SYNOPSIS
       onehost command [args] [options]

OPTIONS
        -i, --im im_mad           Set the information driver for the host
        -v, --vm vmm_mad          Set the virtualization driver for the host
        -n, --net vnet_mad        Set the network driver for the host
        -c, --cluster id|name     Selects the cluster
        -a, --append              Append new attributes to the current template
        --force                   Force probe upgrade in onehost sync
        --rsync                   Use rsync to synchronize remotes. In case some
                                  probes are no longer in the fronted are deleted
                                  in the hosts. rsync command must be installed in
                                  the frontend and nodes.
        -l, --list x,y,z          Selects columns to display with list command
        -d, --delay x             Sets the delay in seconds for top command
        -f, --filter x,y,z        Filter data. An array is specified with
                                  column=value pairs.
        --csv                     Write table in csv format
        -x, --xml                 Show the resource in xml format
        -n, --numeric             Do not translate user and group IDs
        -k, --kilobytes           Show units in kilobytes
        --describe                Describe list columns
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create  hostname  Creates  a  new Host valid options: im, vm,
           net, cluster

       ·   delete range|hostid_list Deletes the given Host

       ·   enable range|hostid_list Enables the given Host

       ·   disable range|hostid_list Disables the given Host

       ·   update hostid [file] Update the template contents. If a  path
           is  not  provided  the  editor will be launched to modify the
           current content. valid options: append

       ·   sync    [range|hostid_list]    Synchronizes     probes     in
           /var/lib/one/remotes  ($ONE_LOCATION/var/remotes in self-con‐
           tained installations) with Hosts. Examples: onehost sync one‐
           host  sync  -c  myCluster  onehost  sync host01,host02,host03
           valid options: cluster, force, rsync

       ·   list Lists Hosts in the pool valid options: list, delay, fil‐
           ter, csv, xml, numeric, kilobytes, describe

       ·   show  hostid  Shows  information  for  the  given  Host valid
           options: xml

       ·   top Lists Hosts continuously valid options: list, delay, fil‐
           ter, csv, xml, numeric, kilobytes

       ·   flush range|hostid_list Disables the host and reschedules all
           the running VMs in it.

       ·   rename hostid name Renames the Host

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   hostid OpenNebula HOST name or id

       ·   hostid_list Comma-separated list of OpenNebula HOST names  or
           ids

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                     ONEHOST(1)
