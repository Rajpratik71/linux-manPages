ONEACL(1)         oneacl(1) -- manages OpenNebula ACLs         ONEACL(1)

NAME
       oneacl - manages OpenNebula ACLs

SYNOPSIS
       oneacl command [args] [options]

OPTIONS
        -x, --xml                 Show the resource in xml format
        --describe                Describe list columns
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        --user name               User name used to connect to OpenNebula
        --password password       Password to authenticate with OpenNebula
        --endpoint endpoint       URL of OpenNebula xmlrpc frontend

COMMANDS
       ·   create user|rulestr [resource] [rights] Adds a new ACL rule

       ·   delete range Deletes an existing ACL rule

       ·   list Lists the ACL rule set valid options: xml, describe

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   aclid_list  Comma-separated  list  of OpenNebula ACL names or
           ids

LICENSE
       OpenNebula 4.12.3 Copyright 2002-2015, OpenNebula Project  (Open‐
       Nebula.org), C12G Labs

       Licensed  under  the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the  License.
       You     may     obtain    a    copy    of    the    License    at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                      ONEACL(1)
