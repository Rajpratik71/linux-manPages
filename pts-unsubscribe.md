PTS-SUBSCRIBE(1)                                                                         General Commands Manual                                                                         PTS-SUBSCRIBE(1)

NAME
       pts-subscribe - time-limited subscription to the PTS

SYNOPSIS
       pts-subscribe [options] package

       pts-unsubscribe [options] package

DESCRIPTION
       pts-subscribe sends a subscription request for package to the Package Tracking System at pts@qa.debian.org, and cancels the subscription 30 days later.

       If called as pts-unsubscribe, send an unsubscription request for package to the Package Tracking System.

       This utility is useful if a developer has made an NMU and wants to track the package for a limited period of time.

OPTIONS
       --until time, -u time
              When at(1) should cancel the subscription.  time must be specified using at's syntax.  Default is 'now + 30 days'.  This option will probably require quoting!

       --forever
              Don't cancel the subscription automatically.  This can also be specified as --until forever.

       --help, -h
              Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

ENVIRONMENT VARIABLES
       DEBEMAIL, EMAIL
              If  one  of  these is set (with preference give to DEBEMAIL), then this will be used for the subscription address.  If neither is set, then the email will be sent without a specified sub‐
              scription address, and the email's From: line will be used to determine the sender's address.  This will be determined by mail(1).

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command line options can be used to override configuration file set‐
       tings.  Environment variable settings are ignored for this purpose.  The currently recognised variables are:

       PTS_UNTIL
              Setting this is equivalent to giving a --until option.

SEE ALSO
       at(1), information about the Package Tracking System in the Developer's Reference at https://www.debian.org/doc/developers-reference/resources.html#pkg-tracking-system

AUTHOR
       This program was written by Julian Gilbey <jdg@debian.org> based on a public domain prototype by Raphael Hertzog <hertzog@debian.org> and is copyright under the GPL, version 2 or later.

DEBIAN                                                                                       Debian Utilities                                                                            PTS-SUBSCRIBE(1)
