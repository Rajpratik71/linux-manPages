ONEVROUTER(1)            onevrouter(1) -- manages OpenNebula Virtual Routers            ONEVROUTER(1)

NAME
       onevrouter - manages OpenNebula Virtual Routers

SYNOPSIS
       onevrouter command [args] [options]

OPTIONS
        --name name               Name of the new VM or TEMPLATE. When
                                  instantiating multiple VMs you can use the "%i"
                                  wildcard to produce different names such as
                                  vm-0, vm-1...
        -m, --multiple x          Instance multiple VMs
        --hold                    Creates the new VM on hold state instead of
                                  pending
        --cpu cpu                 CPU percentage reserved for the VM (1=100% one
                                  CPU)
        --vcpu vcpu               Number of virtualized CPUs
        --arch arch               Architecture of the VM, e.g.: i386 or x86_64
        --memory memory           Memory amount given to the VM. By default the
                                  unit is megabytes. To use gigabytes add a ´g´,
                                  floats can be used: 8g=8192, 0.5g=512
        --disk image0,image1      Disks to attach. To use an image owned by other
                                  user use user[disk]. Add any additional
                                  attributes separated by ´:´ and in the shape of
                                  KEY=VALUE. For example, if the disk must be
                                  resized, use image0:size=1000 . Or
                                  image0:size=1000:target=vda,image1:target=vdb
        --nic network0,network1   Networks to attach. To use a network owned by
                                  other user use user[network]. Additional
                                  attributes are supported like with the --disk
                                  option. Also you can use auto if you want that
                                  OpenNebula select automatically the network
        --raw string              Raw string to add to the template. Not to be
                                  confused with the RAW attribute
        --vnc                     Add VNC server to the VM
        --vnc-password password   VNC password
        --vnc-listen ip           VNC IP where to listen for connections. By
                                  default is 0.0.0.0 (all interfaces).
        --vnc-keymap keymap       VNC keyboard layout
        --spice                   Add spice server to the VM
        --spice-password password spice password
        --spice-listen ip         spice IP where to listen for connections. By
                                  default is 0.0.0.0 (all interfaces).
        --spice-keymap keymap     spice keyboard layout
        --ssh [file]              Add an ssh public key to the context. If the file
                                  is omited then the user variable SSH_PUBLIC_KEY
                                  will be used.
        --net_context             Add network contextualization parameters
        --context line1,line2,line3 Lines to add to the context section
        --boot device_list        Set boot device list e.g. disk0,disk2,nic0
        --files_ds file1,file2    Add files to the contextualization CD from
                                  thefiles datastore
        --init script1,script2    Script or scripts to start in context
        --startscript [file]      Start script to be executed
        --report_ready            Sends READY=YES to OneGate, useful for OneFlow
        --vcenter_vm_folder path  In a vCenter environment sets the the VMs and
                                  Template folder where the VM will be placed in.
                                  The path uses slashes to separate folders. For
                                  example: --vcenter_vm_folder "/Management/VMs"
        --as_gid gid              The Group ID to instantiate the VM
        --as_uid uid              The User ID to instantiate the VM
        -a, --append              Append new attributes to the current template
        -f, --file file           Selects the template file
        -n, --network id|name     Selects the virtual network
        -i, --ip ip               IP address for the new NIC
        --float                   Makes this IP request a Floating one
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
        --all                     Show all template data
        --use                     lock use actions
        --manage                  lock manage actions
        --admin                   lock admin actions
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create file Creates a new Virtual Router from the given description

       ·   instantiate vrouterid templateid [file] Creates a new VM instance from the given Template.
           This VM can be managed with the ´onevm´ command.

           The NIC elements defined in the Virtual Router will be used. The
           source Template can be modified adding or replacing attributes with
           the optional file argument, or with the options.
           valid options: name, multiple, hold, cpu, vcpu, arch, memory, disk, nic, raw, vnc, vnc_password, vnc_listen, vnc_keymap, spice, spice_password, spice_listen, spice_keymap, ssh, net_context, context, boot, files_ds, init, startscript, report_ready, vcenter_vm_folder, as_gid, as_uid

       ·   delete range|vrouterid_list Deletes the given Virtual Router

       ·   chgrp range|vrouterid_list groupid Changes the Virtual Router group

       ·   chown range|vrouterid_list userid [groupid] Changes the Virtual Router owner and group

       ·   chmod range|vrouterid_list octet Changes the Virtual Router permissions

       ·   update vrouterid [file] Update the Virtual Router contents. If a path is not provided  the
           editor will be launched to modify the current content. valid options: append

       ·   rename vrouterid name Renames the Virtual Router

       ·   nic-attach  vrouterid  Attaches  a  NIC  to a VirtualRouter, and each one of its VMs. When
           using --file add only one NIC instance.

           Note if you are using a HA configuration for this router, --float can be
           added. When an IP is requested in HA clusters use --float.
           valid options: file, network, ip, float

       ·   nic-detach vrouterid nicid Detaches a NIC from a VirtualRouter, and each one of its VMs

       ·   list [filterflag] Lists the Virtual Routers in the pool  valid  options:  list,  listconf,
           delay,  filter,  operator,  csv,  csv_del,  no_pager,  no_header,  adjust,  size,  expand,
           no_expand, xml, numeric, describe

       ·   show vrouterid Shows information for the given Virtual Router valid options: xml, all

       ·   top [filterflag] Lists Virtual Routers continuously valid options: list, listconf,  delay,
           filter, operator, csv, csv_del, no_pager, no_header, adjust, size, expand, no_expand, xml,
           numeric, describe

       ·   lock vrouterid Locks a VM with differents levels for lock any actions with this  VM,  show
           and  monitoring  never  will be locked. Valid states are: All. Levels: [Use]: locks Admin,
           Manage and Use actions. [Manage]: locks Manage and Use actions. [Admin]: locks only  Admin
           actions. valid options: use, manage, admin, all

       ·   unlock vrouterid Unlocks a VM for unlock any actions with this VM. valid states are: All.

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   vrouterid OpenNebula VROUTER name or id

       ·   vrouterid_list Comma-separated list of OpenNebula VROUTER names or ids

       ·   filterflag  a,  all  all  the  known VROUTERs m, mine the VROUTER belonging to the user in
           ONE_AUTH g, group ´mine´ plus the VROUTER belonging to the groups the user is member of G,
           primary  group  the VROUTER owned the user´s primary group uid VROUTER of the user identi‐
           fied by this uid user VROUTER of the user identified by the username

       ·   templateid OpenNebula VMTEMPLATE name or id

LICENSE
       OpenNebula 5.10.1 Copyright 2002-2019, OpenNebula Project, OpenNebula Systems

       Licensed under the Apache License, Version 2.0 (the "License"); you  may  not  use  this  file
       except   in   compliance  with  the  License.  You  may  obtain  a  copy  of  the  License  at
       http://www.apache.org/licenses/LICENSE-2.0

                                            December 2019                               ONEVROUTER(1)
