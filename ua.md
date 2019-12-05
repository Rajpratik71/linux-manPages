UBUNTU-ADVANTAGE(1)                                                                                                                                 Ubuntu Advantage                                                                                                                                UBUNTU-ADVANTAGE(1)

NAME
       ubuntu-advantage - Manage Ubuntu Advantage services from Canonical

SYNOPSIS
       ua <command> [<args>]
       ubuntu-advantage <command> [<args>]

DESCRIPTION
       Ubuntu Advantage is a collection of services offered by Canonical to Ubuntu users. The Ubuntu Advantage command line tool is used to attach a system to an Ubuntu Advantage contract to then enable and disable services from Canonical. The available commands and services are described in more detail below.

COMMANDS
       attach [--no-auto-enable] [token]
              Connect an Ubuntu Advantage support contract to this machine.

              The optional token parameter can be obtained from https://auth.contracts.canonical.com/. When no token is provided, users are prompted for their Ubuntu SSO login credentials to https://login.ubuntu.com, which will enable an individual contract on the system.

              The optional --no-auto-enable flag will disable the automatic enablement of recommended entitlements which usually happens immediately after a successful attach.

       detach Remove the Ubuntu Advantage support contract from this machine. This also disables all enabled services that can be.

       disable [cc-eal|cis-audit|esm|fips|fips-updates|livepatch]
              Disable this machine's access to an Ubuntu Advantage support services.

       enable [cc-eal|cis-audit|esm|fips|fips-updates|livepatch]
              Activate and configure this machine's access to an Ubuntu Advantage services.

       refresh
              Refresh contract and service details from Canonical.

       status [--format=table|json]
              Report current status of Ubuntu Advantage services on system.

              This shows whether this machine is attached to an Ubuntu Advantage support contract. When attached, the report includes the specific support contract details including contract name, expiry dates, and the status of each service on this system.

              Each service status line has three columns:

              name: name of the service

              availability: whether the contract entitles use of this service. Possible values are: none or entitled

              status: whether the service is activated on this machine.  Possible values are: active, inactive, or n/a

       version
              Show version of the Ubuntu Advantage package.

CONFIGURATION
       By default, Ubuntu Advantage client configuration options are read from /etc/ubuntu-advantage/uaclient.conf.

       The following configuration options are available:

       sso_auth_url
              The SSO authentication service URL

       contract_url
              The ubuntu advantage contract server URL

       data_dir
              Where Ubuntu Advantage client stores its data files

       log_level
              The logging level used when writing to log_file

       log_file
              The log file for the Ubuntu Advantage client

       Additionally, any configuration option can be overridden in the environment by setting an environment variable prefaced by UA_<option_name>. Both uppercase and lowercase environment variables are allowed.

       For example, the following overrides the log_level found in uaclient.conf:

         UA_LOG_LEVEL=info ua attach

SERVICES
       Common Criteria EAL2 Provisioning (cc-eal)
              Enables and install the Common Criteria artifacts.

              The artifacts include a configure script, a tarball with additional packages, and post install scripts. The artifacts will be installed in /usr/lib/common-criteria directory and the README and configuration guide are available in /usr/share/doc/ubuntu-commoncriteria directory.

       CIS Audit (cis-audit)
              Enables and installs the CIS Audit artifacts.

       Extended Security Maintenance (esm)
              Extended Security Maintenance ensures the ongoing security and integrity of Ubuntu Long-term support (LTS) systems through Ubuntu Advantage for Infrastructure.

              See https://ubuntu.com/esm for more information.

       FIPS 140-2 certified modules (fips)
              Install, configure, and enable FIPS 140-2 certified modules.

              After successfully enabling FIPS, the system MUST be rebooted. Failing to reboot will result in the system not running the updated FIPS kernel.

              Disabling FIPS is not currently supported.

       FIPS 140-2 certified modules with updates (fips-updates)
              Install, configure, and enable FIPS 140-2 certified modules with updates. Enabling FIPS with updates will take the system out of FIPS compliance as the updated modules are not FIPS certified.

              After successfully enabling FIPS with updates, the system MUST be rebooted. Failing to reboot will result in the system not running the updated FIPS kernel.

              Disabling FIPS with updates is not currently supported.

       Livepatch Service (livepatch)
              Automatically apply critical kernel patches without rebooting. Reduces downtime, keeping your Ubuntu LTS systems secure and compliant.

              See https://ubuntu.com/livepatch for more information.

COPYRIGHT
       Copyright (C) 2019 Canonical Ltd.

Canonical Ltd.                                                                                                                                       29 March 2019                                                                                                                                  UBUNTU-ADVANTAGE(1)
