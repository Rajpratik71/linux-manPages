SETUP-NSSSYSINIT(1)                                                                       Network Security Services                                                                       SETUP-NSSSYSINIT(1)



NAME
       setup-nsssysinit - Query or enable the nss-sysinit module

SYNOPSIS
       setup-nsssysinit [on] [off] [status]

DESCRIPTION
       setup-nsssysinit is a shell script to query the status of the nss-sysinit module and when run with root priviledge it can enable or disable it.

       Turns on or off the nss-sysinit module db by editing the global PKCS #11 configuration file. Displays the status. This script can be invoked by the user as super user. It is invoked at nss-sysinit
       post install time with argument on.

OPTIONS
       on
           Turn on nss-sysinit.

       off
           Turn on nss-sysinit.

       status
           returns whether nss-syinit is enabled or not.

EXAMPLES
       The following example will query for the status of nss-sysinit:

                   /usr/bin/setup-nsssysinit status


       The following example, when run as superuser, will turn on nss-sysinit:

                   /usr/bin/setup-nsssysinit on



FILES
       /usr/bin/setup-nsssysinit

SEE ALSO
       pkg-config(1)

AUTHORS
       The nss libraries were written and maintained by developers with Netscape, Red Hat, Sun, Oracle, Mozilla, and Google.

       Authors: Elio Maldonado <emaldona@redhat.com>.

LICENSE
       Licensed under the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.



nss 3.44.0                                                                                       Nov 13 2013                                                                              SETUP-NSSSYSINIT(1)
