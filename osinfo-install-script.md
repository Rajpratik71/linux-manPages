OSINFO-INSTALL-SCRIPT.C(1)              Virtualization Support              OSINFO-INSTALL-SCRIPT.C(1)

NAME
       osinfo-install-script - generate a script for automated installation

SYNOPSIS
       osinfo-install-script [OPTIONS...] MEDIA-FILE|OS-ID

DESCRIPTION
       Generate a script suitable for performing an automated installation of "MEDIA_FILE" or "OS-ID".
       "MEDIA_FILE" should be a path to an installer or live media (typically an ISO file). "OS-ID"
       should be a URI identifying the operating system, or its short ID.

       By default a script will be generated for a "JEOS" style install.

OPTIONS
       --profile=NAME
               Choose the installation script profile. Defaults to "jeos", but can also be "desktop",
               or a site specific profile name

       --installation-source=NAME
               Set the installation source to be used with the installation script. Defaults to
               "media", but can also be "network".

       --config=key=value
               Set the configuration parameter "key" to "value".

       --config-file=config-file
               Set the configurations parameters according to the config-file passed.

               Note that use of --config-file is strongly recommended if the user or admin passwords
               need to be set. Providing passwords directly using --config= is insecure as the
               password is visible to all processes and users on the same host.

CONFIGURATION KEYS
       The following configuration keys are available

       "hardware-arch"
               The hardware architecture

       "l10n-timezone"
               The local timezone

       "l10n-keyboard"
               The local keyboard layout

       "l10n-language"
               The local language

       "admin-password"
               The administrator password This option has been deprecated, use --config-file for
               setting the admin password.

       "user-password"
               The user password This option has been deprecated, use --config-file for setting the
               user password.

       "user-login"
               The user login name

       "user-realname"
               The user real name

       "user-autologin"
               Whether to automatically login the user

       "user-admin"
               Whether to give the user administrative privileges

       "reg-product-key"
               The software registration key

       "reg-login"
               The software registration user login

       "reg-password"
               The software registration user password

CONFIGURATION FILE FORMAT
       The configuration file must consist in a file which contains a `install-script` group and,
       under this group, "key"="value" pairs, as shown below:

       [install-script] l10n-timezone=GMT l10n-keyboard=uk l10n-language=en_GB admin-password=123456
       user-login=berrange user-password=123456 user-realname="Daniel P Berrange"

EXAMPLE USAGE
       The following usages generates a Fedora 16 kickstart script

         # osinfo-install-script \
                --profile jeos \
                --config-file /path/to/config/file \
                fedora16

         # osinfo-install-script \
                --profile jeos \
                --config l10n-timezone=GMT \
                --config l10n-keyboard=uk \
                --config l10n-language=en_GB \
                --config admin-password=123456 \
                --config user-login=berrange \
                --config user-password=123456 \
                --config user-realname="Daniel P Berrange" \
                fedora16

EXIT STATUS
       The exit status will be 0 if an install script is generated, or 1 on error

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2012 Red Hat, Inc.

LICENSE
       "osinfo-install-script" is distributed under the termsof the GNU LGPL v2 license. This is free
       software; see the source for copying conditions.  There is NO warranty; not even for
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

libosinfo-1.6.0                               2019-07-28                    OSINFO-INSTALL-SCRIPT.C(1)
