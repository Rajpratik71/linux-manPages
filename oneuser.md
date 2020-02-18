ONEUSER(1)       oneuser(1) -- manages OpenNebula users       ONEUSER(1)

NAME
       oneuser - manages OpenNebula users

SYNOPSIS
       oneuser command [args] [options]

OPTIONS
        -r, --read-file           Read password from file
        --sha1                    The password will be hashed using the sha1
                                  algorithm
        --ssh                     SSH Auth system
        --x509                    x509 Auth system for x509 certificates
        -k, --key path_to_private_key_pem Path to the Private Key of the User
        -c, --cert path_to_user_cert_pem Path to the Certificate of the User
        --driver driver           Driver to autehnticate this user
        -a, --append              Append new attributes to the current template
        --x509_proxy              x509 Auth system based on x509 proxy certificates
        --proxy path_to_user_proxy_pem Path to the user proxy certificate
        --time x                  Token duration in seconds, defaults to 36000 (10
                                  h). To reset the token set time to 0.To generate
                                  a non-expiring token use -1 (not valid for ssh
                                  and x509 tokens).
        --force                   Force one_auth file rewrite
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
       ·   create  username  [password]  Creates  a  new  User Examples:
           oneuser create my_user my_password oneuser create my_user  -r
           /tmp/mypass  oneuser  create  my_user --ssh --key /tmp/id_rsa
           oneuser create my_user --ssh -r /tmp/public_key oneuser  cre‐
           ate  my_user  --x509  --cert  /tmp/my_cert.pem valid options:
           read_file, sha1, ssh, x509, key, cert, driver

       ·   update userid [file] Update the template contents. If a  path
           is  not  provided  the  editor will be launched to modify the
           current content. valid options: append

       ·   quota userid [file] Set the quota limits for the user.  If  a
           path  is  not  provided the editor will be launched to modify
           the current quotas.

       ·   batchquota range|userid_list [file] Sets the quota limits  in
           batch for various users. If a path is not provided the editor
           will be launched to create new quotas.

       ·   defaultquota [file] Sets the default  quota  limits  for  the
           users.  If a path is not provided the editor will be launched
           to modify the current default quotas.

       ·   umask range|userid_list [mask] Changes the umask used to cre‐
           ate  the  default  permissions.  In a similar way to the Unix
           umask command, the expected value  is  a  three-digit  base-8
           number.  Each  digit  is a mask that disables permissions for
           the owner, group and other, respectively.

           If mask is not given, or if it is an empty string, the umask will
           be unset

       ·   login username Creates the login  token  for  authentication.
           The  token  can  be  used  together  with  any authentication
           driver. The token will be stored in $HOME/.one/one_auth,  and
           can  be  used  subsequently to authenticate with oned through
           API, CLI or Sunstone.

           Example, request a valid token for a generic driver (e.g. core auth, LDAP...):
             oneuser login my_user --time 3600

           Example, generate and set a token for SSH based authentication:
             oneuser login my_user --ssh --key /tmp/id_rsa --time 72000

           Example, same using X509 certificates:
             oneuser login my_user --x509 --cert /tmp/my_cert.pem
                                   --key /tmp/my_key.pk --time 72000

           Example, now with a X509 proxy certificate
             oneuser login my_user --x509_proxy --proxy /tmp/my_cert.pem
                                   --time 72000
           valid options: ssh, x509, x509_proxy, key, cert, proxy, time, force

       ·   key DEPRECATED, use login to generate auth files.

           Shows a public key from a private SSH key. Use it as password
           for the SSH authentication mechanism.
           valid options: key

       ·   delete range|userid_list Deletes the given User

       ·   passwd userid [password] Changes the  given  User´s  password
           valid options: read_file, sha1, ssh, x509, key, cert, driver

       ·   chgrp  range|userid_list  groupid  Changes the User´s primary
           group

       ·   addgroup range|userid_list groupid Adds the User  to  a  sec‐
           ondary group

       ·   delgroup  range|userid_list  groupid  Removes the User from a
           secondary group

       ·   chauth userid  [auth]  [password]  Changes  the  User´s  auth
           driver  and  its password (optional) Examples: oneuser chauth
           my_user core oneuser chauth my_user core new_password oneuser
           chauth  my_user  core  -r  /tmp/mypass oneuser chauth my_user
           --ssh --key /home/oneadmin/.ssh/id_rsa oneuser chauth my_user
           --ssh -r /tmp/public_key oneuser chauth my_user --x509 --cert
           /tmp/my_cert.pem valid options: read_file, sha1,  ssh,  x509,
           key, cert, driver

       ·   list Lists Users in the pool valid options: list, delay, fil‐
           ter, csv, xml, numeric, describe

       ·   show [userid] Shows information  for  the  given  User  valid
           options: xml

       ·   encode  username  [password] Encodes user and password to use
           it with ldap

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

       ·   groupid OpenNebula GROUP name or id

       ·   userid OpenNebula USER name or id

       ·   userid_list Comma-separated list of OpenNebula USER names  or
           ids

       ·   password User password

LICENSE
       OpenNebula  4.12.3 Copyright 2002-2015, OpenNebula Project (Open‐
       Nebula.org), C12G Labs

       Licensed under the Apache License, Version 2.0  (the  "License");
       you  may not use this file except in compliance with the License.
       You    may    obtain    a    copy    of    the     License     at
       http://www.apache.org/licenses/LICENSE-2.0

                               March 2015                     ONEUSER(1)
