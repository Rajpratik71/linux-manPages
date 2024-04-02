OSINFO-DETECT.C(1)                                            Virtualization Support                                            OSINFO-DETECT.C(1)

NAME
       osinfo-detect - Detect the operating system on installable media or trees

SYNOPSIS
       osinfo-detect [OPTIONS...] PATH|URI

DESCRIPTION
       Examine the "PATH" or "URI" to determine what (if any) operating system it is for, and whether it is installable or is a Live image.  By
       default "PATH" or "URI" will be interpreted as pointing to ISO media. To request examination of an install tree instead, the option
       "--type=tree" should be given.

       The output information is formatted for humans; to obtain machine readable output, the option "--format=env" should be given to produce
       shell-like key/value pairs.

OPTIONS
       --format=plain|env
               Switch between human readable output (plain, the default) or machine readable output (env).

       --type=media|tree
               Switch between looking for CD/DVD ISO media (media, the default) or install trees (tree)

EXIT STATUS
       The exit status will be 0 if an operating system was detected, or 1 if none was found.

AUTHORS
       Zeeshan Ali (Khattak) <zeeshanak@gnome.org>, Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2011-2012 Red Hat, Inc.

LICENSE
       "osinfo-detect" is distributed under the termsof the GNU LGPL v2 license. This is free software; see the source for copying conditions.
       There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

libosinfo-0.3.1                                                     2016-07-15                                                  OSINFO-DETECT.C(1)
