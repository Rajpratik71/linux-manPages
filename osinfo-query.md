OSINFO-QUERY.C(1)                                             Virtualization Support                                             OSINFO-QUERY.C(1)

NAME
       osinfo-query - Query information in the database

SYNOPSIS
       osinfo-query [OPTIONS...] TYPE [CONDITION-1 [CONDITION-2 ...]]

DESCRIPTION
       The "osinfo-query" command allows extraction of information from the database. TYPE can be one of "os", "platform", "device", or
       "deployment". With no conditions specified, all entities of the given type will be listed.

         # List all operating systems
         $ osinfo-query os
          Short ID             | Name       ...
         ----------------------+-----------
          centos-6.0           | CentOS 6.0 ...
          centos-6.1           | CentOS 6.1 ...
          ...

       Conditions allow filtering based on specific properties of an entity.  For example, to filter only distros from the Fedora Project, use

         # List all operating systems
         $ osinfo-query os vendor="Fedora Project"
          Short ID             | Name          ...
         ----------------------+--------------
          fedora1              | Fedora Core 1 ...
          fedora2              | Fedora Core 2 ...
          ...

       The set of fields which are printed can be controlled using the "--fields" command line argument:

         # List all operating systems
         $ osinfo-query --fields=short-id,version os vendor="Fedora Project"
          Short ID             | Version
         ----------------------+----------
          fedora1              | 1
          fedora2              | 2
          ...

OPTIONS
       -s PROPERTY, --sort-key PROPERTY
               Set the data sorting key. Defaults sorting the first column

       -f PROPERTY1,PROPERTY2,..., --fields PROPERTY1,PROPERTY2,...
               Set the visibility of properties in output

PROPERTY NAMES
   OS
       Valid property names for the "os" type are:

       short-id
           The short OS identifier

       name
           The long OS name

       version
           The OS version string

       family
           The OS kernel family

       vendor
           The OS vendor

       release-date
           The OS release date

       eol-date
           The OS end-of-life date

       codename
           The OS code name

       id  The OS identifier

   PLATFORM
       Valid property names for the "platform" type are:

       short-id
           The short platform identifier

       name
           The long platform name

       version
           The platform version string

       vendor
           The platform vendor

       release-date
           The platform release date

       eol-date
           The platform end-of-life date

       codename
           The platform code name

       id  The platform identifier

   DEVICE
       Valid property names for the "device" type are:

       name
           The device name

       product
           The device product name

       product-id
           The device product ID string

       vendor
           The device vendor name

       vendor-id
           The device vendor ID string

       class
           The device type class

       bus The device bus type

       id  The device identifier

   DEPLOYMENT
       Valid property names for the "deployment" type are:

       id  The deployment identifier

EXIT STATUS
       The exit status will be 0 if matching entries were found, or 1 if not matches were found

SEE ALSO
       "osinfo-db-validate(1)", "osinfo-detect(1)"

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2012, 2014 Red Hat, Inc.

LICENSE
       "osinfo-query" is distributed under the termsof the GNU LGPL v2+ license. This is free software; see the source for copying conditions.
       There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

libosinfo-0.3.1                                                     2016-07-15                                                   OSINFO-QUERY.C(1)
