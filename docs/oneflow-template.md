ONEFLOW-TEMPLATE(1)         oneflow-template(1) -- Manage oneFlow Templates        ONEFLOW-TEMPLATE(1)

NAME
       oneflow-template - Manage oneFlow Templates

SYNOPSIS
       oneflow-template command [args] [options]

OPTIONS
        -j, --json                Print the resource in JSON
        -t, --top                 Top for the command
        -d, --delay x             Sets the delay in seconds for top command
        -s, --server url          Service endpoint
        -u, --username name       User name
        -p, --password pass       User password
        -V, --version             Show version and copyright information
        -h, --help                Show this message

COMMANDS
       •   list List the available Service Templates valid options: json

       •   top List the available Service Templates continuously valid options: json, top, delay

       •   create file Create a new Service Template valid options: json

       •   show templateid Show detailed information of a given Service Template valid options: json

       •   delete range|templateid_list Delete a given Service Template

       •   instantiate templateid [file] Instantiate a Service Template valid options: json, top

       •   chgrp range|templateid_list groupid Changes the service template group

       •   chown range|templateid_list userid [groupid] Changes the service template owner and group

       •   chmod range|templateid_list octet Changes the service template permissions

       •   update templateid [file] Update the template contents. If a path is not provided the editor
           will be launched to modify the current content.

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

       •   groupid OpenNebula GROUP name or id

       •   userid OpenNebula USER name or id

       •   templateid OpenNebula SERVICE TEMPLATE name or id

       •   templateid_list Comma-separated list of OpenNebula SERVICE TEMPLATE names or ids

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0 (the "License"); you may not use this  file  ex‐
       cept   in   compliance   with   the   License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                           ONEFLOW-TEMPLATE(1)
