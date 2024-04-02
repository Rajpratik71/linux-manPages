ONEHOOK(1)                      onehook(1) -- manages OpenNebula hooks                     ONEHOOK(1)

NAME
       onehook - manages OpenNebula hooks

SYNOPSIS
       onehook command [args] [options]

OPTIONS
        --dry                     Just print the template
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
        --extended                Show info extended (it only works with xml
                                  output)
        -e, --execution exeid     execution ID
        --use                     lock use actions
        --manage                  lock manage actions
        --admin                   lock admin actions
        --all                     lock all actions
        --error                   Show only fail executions
        --success                 Show only success executions
        --hook-id id              Hook ID to check logs
        --since date              First date to take logs
        --until date              Last date to take logs
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create file Creates a new Hook from the given description

           Examples:
             - using a Hook description file:

               onehook create hook.tmpl
           valid options: dry

       ·   delete range|hookid_list Deletes the given Hook

       ·   update  hookid  [file] Update the Hook contents. If a path is not provided the editor will
           be launched to modify the current content. valid options: append

       ·   rename hookid name Renames the Hook

       ·   list [filterflag] Lists Hooks in the pool valid options: list,  listconf,  delay,  filter,
           operator,  csv,  csv_del,  no_pager,  no_header,  adjust,  size,  expand,  no_expand, xml,
           numeric, describe

       ·   show hookid Shows information for the given Hook. An execution ID can be given  to  obtain
           detailed information of a given hook execution valid options: xml, extended, execution

       ·   top  [filterflag]  Lists  Hooks continuously valid options: list, listconf, delay, filter,
           operator, csv,  csv_del,  no_pager,  no_header,  adjust,  size,  expand,  no_expand,  xml,
           numeric, describe

       ·   lock  hookid Locks a Hook with differents levels for lock any actions with this Hook, show
           and monitoring never will be locked. Valid states are: All. Levels:  [Use]:  locks  Admin,
           Manage  and Use actions. [Manage]: locks Manage and Use actions. [Admin]: locks only Admin
           actions. valid options: use, manage, admin, all

       ·   unlock hookid Unlocks a Hook for unlock any actions with this Hook. Valid states are: All.

       ·   retry hookid execid Retry a previous hook execution.

       ·   log Get logs about hook executions

           Examples:

               ~ $ onehook log --since 09/19/19 # returns all logs since that date
               ~ $ onehook log --error          # returns all failing execs logs
               ~ $ onehook log --hook-id 0      # returns all logs from hook 0
           valid options: error, success, hook_id, since, until, xml

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   hookid OpenNebula HOOK name or id

LICENSE
       OpenNebula 5.10.1 Copyright 2002-2019, OpenNebula Project, OpenNebula Systems

       Licensed under the Apache License, Version 2.0 (the "License"); you  may  not  use  this  file
       except   in   compliance  with  the  License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                            December 2019                                  ONEHOOK(1)
