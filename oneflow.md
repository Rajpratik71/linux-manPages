ONEFLOW(1)        oneflow(1) -- Manage oneFlow Services       ONEFLOW(1)

NAME
       oneflow - Manage oneFlow Services

SYNOPSIS
       oneflow command [args] [options]

OPTIONS
        -j, --json                Print the resource in JSON
        -t, --top                 Top for the command
        -d, --delay x             Sets the delay in seconds for top command
        -f, --force               Force the new cardinality even if it is outside
                                  the limits
        -p, --period x            Seconds between each group of actions
        -n, --number x            Number of VMs to apply the action to each period
        -s, --server url          Service endpoint
        -u, --username name       User name
        -p, --password pass       User password
        -V, --version             Show version and copyright information
        -h, --help                Show this message

COMMANDS
       ·   list List the available services valid options: json

       ·   show  service_id Show detailed information of a given service
           valid options: json

       ·   top [service_id] Top the services or the extended information
           of  the  target  service  if a id is specified valid options:
           json, top, delay

       ·   delete range|service_id_list Delete a given service

       ·   shutdown range|service_id_list Shutdown a service. From  RUN‐
           NING or WARNING shuts down the Service

       ·   recover   range|service_id_list  Recover  a  failed  service,
           cleaning the  failed  VMs.  From  FAILED_DEPLOYING  continues
           deploying  the  Service From FAILED_SCALING continues scaling
           the Service From FAILED_UNDEPLOYING continues  shutting  down
           the  Service  From  COOLDOWN  the  Service  is set to running
           ignoring the cooldown duration From WARNING  failed  VMs  are
           deleted, and new VMs are instantiated

       ·   scale  service_id  role_name  cardinality Scale a role to the
           given cardinality valid options: force

       ·   chgrp range|service_id_list groupid Changes the service group

       ·   chown range|service_id_list userid [groupid] Changes the ser‐
           vice owner and group

       ·   chmod range|service_id_list octet Changes the service permis‐
           sions

       ·   action service_id role_name vm_action Perform  an  action  on
           all the Virtual Machines of a given role.  Actions supported:
           shutdown,  shutdown-hard,  undeploy,   undeploy-hard,   hold,
           release,  stop,  suspend, resume, boot, delete, delete-recre‐
           ate,  reboot,  reboot-hard,  poweroff,  poweroff-hard,  snap‐
           shot-create valid options: period, number

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   service_id OpenNebula SERVICE name or id

       ·   service_id_list  Comma-separated  list  of OpenNebula SERVICE
           names or ids

       ·   vm_action Actions supported: shutdown,  shutdown-hard,  unde‐
           ploy,  undeploy-hard,  hold,  release, stop, suspend, resume,
           boot, delete, delete-recreate, reboot, reboot-hard, poweroff,
           poweroff-hard, snapshot-create

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                     ONEFLOW(1)
