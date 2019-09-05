MASS-BUG(1)                                                                                                                            MASS-BUG(1)

NAME
       mass-bug - mass-file a bug report against a list of packages

SYNOPSIS
       mass-bug [options] --subject="bug subject" template package-list

DESCRIPTION
       mass-bug assists in filing a mass bug report in the Debian BTS on a set of packages. For each package in the package-list file (which
       should list one package per line together with an optional version number separated from the package name by an underscore), it fills out
       the template, adds BTS pseudo-headers, and either displays or sends the bug report.

       Warning: Some care has been taken to avoid unpleasant and common mistakes, but this is still a power tool that can generate massive amounts
       of bug report mails. Use it with care, and read the documentation in the Developer's Reference about mass filing of bug reports first.

TEMPLATE
       The template file is the body of the message that will be sent for each bug report, excluding the BTS pseudo-headers. In the template,
       #PACKAGE# is replaced with the name of the package. If a version was specified for the package, #VERSION# will be replaced by that version.

       The components of the version number may be specified using #EPOCH#, #UPSTREAM_VERSION# and #REVISION#. #EPOCH# includes the trailing colon
       and #REVISION# the leading dash so that #EPOCH#UPSTREAM_VERSION##REVISION# is always the same as #VERSION#.

       Note that text in the template will be automatically word-wrapped to 70 columns, up to the start of a signature (indicated by '-- ' at the
       start of a line on its own). This is another reason to avoid including BTS pseudo-headers in your template.

OPTIONS
       mass-bug examines the devscripts configuration files as described below.  Command line options override the configuration file settings,
       though.

       --severity=(wishlist|minor|normal|important|serious|grave|critical)
           Specify the severity with which bugs should be filed. Default is normal.

       --display
           Fill out the templates for each package and display them all for verification. This is the default behavior.

       --send
           Actually send the bug reports.

       --subject="bug subject"
           Specify the subject of the bug report. The subject will be automatically prefixed with the name of the package that the bug is filed
           against.

       --tags
           Set the BTS pseudo-header for tags.

       --user
           Set the BTS pseudo-header for a usertags' user.

       --usertags
           Set the BTS pseudo-header for usertags.

       --source
           Specify that package names refer to source packages rather than binary packages.

       --sendmail=SENDMAILCMD
           Specify the sendmail command.  The command will be split on white space and will not be passed to a shell.  Default is
           /usr/sbin/sendmail.

       --no-wrap
           Do not wrap the template to lines of 70 characters.

       --no-conf, --noconf
           Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --help
           Provide a usage message.

       --version
           Display version information.

ENVIRONMENT
       DEBEMAIL and EMAIL can be set in the environment to control the email address that the bugs are sent from.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables.
       Command line options can be used to override configuration file settings.  Environment variable settings are ignored for this purpose.  The
       currently recognised variables are:

       BTS_SENDMAIL_COMMAND
           If this is set, specifies a sendmail command to use instead of /usr/sbin/sendmail.  Same as the --sendmail command line option.

COPYRIGHT
       This program is Copyright (C) 2006 by Joey Hess <joeyh@debian.org>.

       It is licensed under the terms of the GPL, either version 2 of the License, or (at your option) any later version.

AUTHOR
       Joey Hess <joeyh@debian.org>

Debian Utilities                                                    2016-03-23                                                         MASS-BUG(1)
