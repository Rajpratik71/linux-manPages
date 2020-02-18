ONEVM(1)     onevm(1) -- manages OpenNebula virtual machines    ONEVM(1)

NAME
       onevm - manages OpenNebula virtual machines

SYNOPSIS
       onevm command [args] [options]

OPTIONS
        -m, --multiple x          Instance multiple VMs
        --hold                    Creates the new VM on hold state instead of
                                  pending
        --name name               Name for the new VM
        --cpu cpu                 CPU percentage reserved for the VM (1=100% one
                                  CPU)
        --vcpu vcpu               Number of virtualized CPUs
        --arch arch               Architecture of the VM, e.g.: i386 or x86_64
        --memory memory           Memory amount given to the VM. By default the
                                  unit is megabytes. To use gigabytes add a ´g´,
                                  floats can be used: 8g=8192, 0.5g=512
        --disk image0,image1      Disks to attach. To use an image owned by other
                                  user use user[disk]
        --nic network0,network1   Networks to attach. To use a network owned by
                                  other user use user[network]
        --raw string              Raw string to add to the template. Not to be
                                  confused with the RAW attribute
        --vnc                     Add VNC server to the VM
        --vnc-password password   VNC password
        --vnc-listen ip           VNC IP where to listen for connections. By
                                  default is 0.0.0.0 (all interfaces).
        --spice                   Add spice server to the VM
        --spice-password password spice password
        --spice-listen ip         spice IP where to listen for connections. By
                                  default is 0.0.0.0 (all interfaces).
        --ssh [file]              Add an ssh public key to the context. If the file
                                  is omited then the user variable SSH_PUBLIC_KEY
                                  will be used.
        --net_context             Add network contextualization parameters
        --context line1,line2,line3 Lines to add to the context section
        --boot device             Select boot device (hd|fd|cdrom|network)
        --files_ds file1,file2    Add files to the contextualization CD from
                                  thefiles datastore
        --init script1,script2    Script or scripts to start in context
        --dry                     Just print the template
        -a, --append              Append new attributes to the current template
        --schedule TIME           Schedules this action to be executed afterthe
                                  given time. For example: onevm resume 0
                                  --schedule "09/23 14:15"
        --recreate                Resubmits a fresh VM
        -t, --type type           Type of the new Image
        --live                    Do the action with the VM running
        -c, --clonetemplate       Clone original VM Template and replace disk with
                                  saved one
        --hard                    Does not communicate with the guest OS
        -e, --enforce             Enforce that the host capacity is not exceeded
        --success                 Recover a VM by succeeding the pending action
        --failure                 Recover a VM by failing the pending action
        -f, --file file           Selects the template file
        -i, --image id|name       Selects the image
        -t, --target target       Device where the image will be attached
        --cache cache_mode        Hypervisor cache mode: default, none,
                                  writethrough, writeback, directsync or unsafe.
                                  (Only KVM driver)
        -n, --network id|name     Selects the virtual network
        -i, --ip ip               IP address for the new NIC
        -l, --list x,y,z          Selects columns to display with list command
        -d, --delay x             Sets the delay in seconds for top command
        -f, --filter x,y,z        Filter data. An array is specified with
                                  column=value pairs.
        --csv                     Write table in csv format
        -x, --xml                 Show the resource in xml format
        -n, --numeric             Do not translate user and group IDs
        -k, --kilobytes           Show units in kilobytes
        --describe                Describe list columns
        --all                     Show all template data
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create  [file]  Creates  a  new VM from the given description
           instead of using a previously defined template (see  ´onetem‐
           plate create´ and ´onetemplate instantiate´).

           Examples:

             - using a template description file:

               onevm create vm_description.tmpl

             - new VM named "arch vm" with a disk and a nic

               onevm create --name "arch vm" --memory 128 --cpu 1 --disk arch \
                            --network private_lan

             - a vm with two disks

               onevm create --name "test vm" --memory 128 --cpu 1 --disk arch,data
           valid options: multiple, hold, name, cpu, vcpu, arch, memory, disk, nic, raw, vnc, vnc_password, vnc_listen, spice, spice_password, spice_listen, ssh, net_context, context, boot, files_ds, init, dry

       ·   update  vmid  [file]  Update the user template contents. If a
           path is not provided the editor will be  launched  to  modify
           the current content. valid options: append

       ·   delete range|vmid_list Deletes the given VM. Using --recreate
           resubmits the VM.

           Resubmits the VM to PENDING state. This is intended for VMs stuck in a
           transient state. To re-deploy a fresh copy of the same VM, create a
           Template and instantiate it, see ´onetemplate instantiate´

           States: ANY
           valid options: schedule, recreate

       ·   hold range|vmid_list Sets the given VM on hold. A VM on  hold
           is  not  scheduled  until it is released. It can be, however,
           deployed manually; see ´onevm deploy´

           States: PENDING
           valid options: schedule

       ·   release range|vmid_list Releases a VM  on  hold.  See  ´onevm
           hold´

           States: HOLD
           valid options: schedule

       ·   disk-snapshot vmid diskid img_name Sets the specified VM disk
           to be saved in a new Image. The Image is created immediately,
           but the contents are saved only if the VM is shut down grace‐
           fully (i.e., using ´onevm shutdown´ and not ´onevm delete´)

           If ´--live´ is specified, the Image will be saved immediately.

           States: ANY
           valid options: type, live, clonetemplate

       ·   shutdown range|vmid_list Shuts down the given VM. The VM life
           cycle will end.

           With --hard it unplugs the VM.

           States: RUNNING, UNKNOWN (with --hard)
           valid options: schedule, hard

       ·   undeploy  range|vmid_list  Shuts down the given VM. The VM is
           saved in the system Datastore.

           With --hard it unplugs the VM.

           States: RUNNING
           valid options: schedule, hard

       ·   poweroff range|vmid_list Powers off the given VM. The VM will
           remain  in the poweroff state, and can be powered on with the
           ´onevm resume´ command.

           States: RUNNING
           valid options: schedule, hard

       ·   reboot range|vmid_list Reboots the given VM, this is  equiva‐
           lent to execute the reboot command from the VM console.

           The VM will be ungracefully rebooted if --hard is used.

           States: RUNNING
           valid options: schedule, hard

       ·   deploy range|vmid_list hostid [datastoreid] Deploys the given
           VM in the specified Host. This command forces the deployment,
           in a standard installation the Scheduler is in charge of this
           decision

           States: PENDING
           valid options: enforce

       ·   migrate range|vmid_list hostid Migrates the given running  VM
           to  another  Host. If used with --live parameter the miration
           is done without downtime.

           States: RUNNING
           valid options: enforce, live

       ·   boot range|vmid_list Boots the given VM.

           States: UNKNOWN, BOOT
           valid options: schedule

       ·   stop range|vmid_list Stops a running  VM.  The  VM  state  is
           saved  and  transferred  back to the front-end along with the
           disk files

           States: RUNNING
           valid options: schedule

       ·   suspend range|vmid_list Saves a running VM. It is the same as
           ´onevm stop´, but the files are left in the remote machine to
           later restart the VM there (i.e. the resources are not  freed
           and there is no need to re-schedule the VM).

           States: RUNNING
           valid options: schedule

       ·   resume  range|vmid_list  Resumes the execution of the a saved
           VM

           States: STOPPED, SUSPENDED, UNDEPLOYED, POWEROFF
           valid options: schedule

       ·   recover range|vmid_list Recovers a stuck VM that  is  waiting
           for  a  driver operation. The recovery may be done by failing
           or succeeding the pending operation.  YOU  NEED  TO  MANUALLY
           CHECK  THE  VM STATUS ON THE HOST, to decide if the operation
           was successful or not.

           Example: A VM is stuck in "migrate" because of a hardware failure. You
           need to check if the VM is running in the new host or not to recover
           the vm with --success or --failure, respectively.

           States: Any ACTIVE state.
           valid options: success, failure

       ·   disk-attach vmid Attaches a disk to a running VM. When  using
           --file add only one DISK instance.

           States: RUNNING
           valid options: file, image, target, cache

       ·   disk-detach vmid diskid Detaches a disk from a running VM

           States: RUNNING

       ·   nic-attach  vmid  Attaches  a NIC to a running VM. When using
           --file add only one NIC instance.

           States: RUNNING
           valid options: file, network, ip

       ·   nic-detach vmid nicid Detaches a NIC from a running VM

           States: RUNNING

       ·   chgrp range|vmid_list groupid Changes the VM group

       ·   chown range|vmid_list userid [groupid] Changes the  VM  owner
           and group

       ·   chmod range|vmid_list octet Changes the VM permissions

       ·   resched  range|vmid_list  Sets  the rescheduling flag for the
           VM.

           States: RUNNING

       ·   unresched range|vmid_list Clears the  rescheduling  flag  for
           the VM.

           States: RUNNING

       ·   rename vmid name Renames the VM

       ·   snapshot-create range|vmid_list [name] Creates a new VM snap‐
           shot valid options: schedule

       ·   snapshot-revert vmid snapshot_id Reverts  a  VM  to  a  saved
           snapshot

       ·   snapshot-delete vmid snapshot_id Delets a snapshot of a VM

       ·   list  [filterflag] Lists VMs in the pool valid options: list,
           delay, filter, csv, xml, numeric, kilobytes, describe

       ·   show vmid Shows information for the given VM  valid  options:
           xml, all

       ·   top  [filterflag]  Lists  Images  continuously valid options:
           list, delay, filter, csv, xml, numeric, kilobytes

       ·   resize vmid Resizes the capacity of a Virtual  Machine  (off‐
           line,  the  VM  cannot  be RUNNING) valid options: cpu, vcpu,
           memory, enforce, file

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   hostid OpenNebula HOST name or id

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   datastoreid OpenNebula DATASTORE name or id

       ·   vmid OpenNebula VM name or id

       ·   vmid_list Comma-separated list of OpenNebula VM names or ids

       ·   filterflag a, all all the known VMs m, mine the VM  belonging
           to the user in ONE_AUTH g, group ´mine´ plus the VM belonging
           to the groups the user is member of uid VM of the user  iden‐
           tified  by  this  uid  user  VM of the user identified by the
           username

       ·   diskid Integer

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project  (Open‐
       Nebula.org), C12G Labs

       Licensed  under  the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the  License.
       You     may     obtain    a    copy    of    the    License    at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                       ONEVM(1)
