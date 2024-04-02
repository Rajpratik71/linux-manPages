ONEIMAGE(1)                    oneimage(1) -- manages OpenNebula images                    ONEIMAGE(1)

NAME
       oneimage - manages OpenNebula images

SYNOPSIS
       oneimage command [args] [options]

OPTIONS
        -d, --datastore id|name   Selects the datastore
        --name name               Name of the new image
        --description description Description for the new Image
        --type type               Type of the new Image: OS, CDROM, DATABLOCK,
                                  KERNEL, RAMDISK, CONTEXT
        --persistent              Tells if the image will be persistent
        --prefix prefix           Device prefix for the disk (eg. hd, sd, xvd or
                                  vd)
        --target target           Device the disk will be attached to
        --path path               Path of the image file
        --driver driver           Driver to use image (raw, qcow2, tap:aio:...)
        --disk_type disk_type     Type of the image (BLOCK, CDROM, RBD or FILE)
        --source source           Source to be used. Useful for not file-based
                                  images
        --size size               Size in MB. Used for DATABLOCK type or SOURCE
                                  based images.
        --fstype fstype           Type of file system to be built. This can be any
                                  value understood by mkfs unix command.
        --dry                     Just print the template
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
       •   create [file] Creates a new Image Examples:

             - using a template description file:

               oneimage create -d default centOS.tmpl

             - new image "arch" using a path of type centOS:

               oneimage create -d default --name arch --path /tmp/arch.img

             - new persistent image, OS type and qcow2 format:

               oneimage create -d 1 --name ubuntu --path /tmp/ubuntu.qcow2 \
                               --prefix sd --type OS --driver qcow2 \
                               --description "A OS plain installation"

             - a datablock image of 400MB:

               oneimage create -d 1 --name data --type DATABLOCK --size 400 \
                               --fstype ext2
           valid options: datastore, name, description, type, persistent, prefix, target, path, driver, disk_type, source, size, fstype, dry

       •   clone imageid name Creates a new Image from an existing one valid options: datastore

       •   delete range|imageid_list Deletes the given Image

       •   persistent  range|imageid_list  Makes  the given Image persistent. A persistent Image saves
           the changes made to the contents after the VM instance is shutdown (or in real  time  if  a
           shared FS is used). Persistent Images can be used by only one VM instance at a time.

       •   nonpersistent  range|imageid_list  Makes the given Image non persistent. See ´oneimage per‐
           sistent´

       •   update imageid [file] Update the template contents. If a path is not  provided  the  editor
           will be launched to modify the current content. valid options: append

       •   enable range|imageid_list Enables the given Image

       •   chtype range|imageid_list type Changes the Image´s type

       •   disable range|imageid_list Disables the given Image

       •   chgrp range|imageid_list groupid Changes the Image group

       •   chown range|imageid_list userid [groupid] Changes the Image owner and group

       •   chmod range|imageid_list octet Changes the Image permissions

       •   rename imageid name Renames the Image

       •   list  [filterflag]  Lists  Images in the pool valid options: list, delay, filter, csv, xml,
           numeric, describe

       •   show imageid Shows information for the given Image valid options: xml

       •   top [filterflag] Lists Images continuously valid options: list, delay,  filter,  csv,  xml,
           numeric, describe

ARGUMENT FORMATS
       •   file Path to a file

       •   range List of id´s in the form 1,8..15

       •   text String

       •   groupid OpenNebula GROUP name or id

       •   userid OpenNebula USER name or id

       •   imageid OpenNebula IMAGE name or id

       •   imageid_list Comma-separated list of OpenNebula IMAGE names or ids

       •   filterflag  a, all all the known IMAGEs m, mine the IMAGE belonging to the user in ONE_AUTH
           g, group ´mine´ plus the IMAGE belonging to the groups the user is member of uid  IMAGE  of
           the user identified by this uid user IMAGE of the user identified by the username

       •   type Image type: OS, CDROM, DATABLOCK, KERNEL, RAMDISK, CONTEXT

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project (OpenNebula.org), C12G Labs

       Licensed  under  the Apache License, Version 2.0 (the "License"); you may not use this file ex‐
       cept  in  compliance  with  the  License.  You  may  obtain  a   copy   of   the   License   at
       http://www.apache.org/licenses/LICENSE-2.0

                                              March 2015                                   ONEIMAGE(1)
