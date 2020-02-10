UBUNTU-ADVANTAGE(1)                                                                                                                                                                   UBUNTU-ADVANTAGE(1)

NAME
       ubuntu-advantage - Enable or disable Ubuntu Advantage offerings from Canonical.

SYNOPSIS
       ubuntu-advantage <command> [parameters]

DESCRIPTION
       This tool is used to enable or disable specific Ubuntu Advantage offerings from Canonical. The available modules and their commands are described below.  It must be run with root privileges.

       status Show the status of Ubuntu Advantage offerings.

ESM (Extended Security Maintenance)
       Ubuntu Extended Security Maintenance archive. See https://ubuntu.com/esm for more information.

       enable-esm token
              Enable the ESM repository. The token argument must be in the form "user:password".

       disable-esm
              Disable the ESM repository.

Livepatch (Canonical Livepatch Service)
       Managed live kernel patching. For more information, visit https://www.ubuntu.com/server/livepatch

       enable-livepatch <token>
              Enable the Livepatch service. The token can be obtained by visiting https://ubuntu.com/livepatch

       disable-livepatch [-r]
              Disable the Livepatch service. If the -r option is given, the canonical-livepatch snap will be removed after the sevice is disabled.

FIPS (Canonical FIPS 140-2 certified modules)
       Install, Configure, and Enable FIPS 140-2 certified modules.

       enable-fips token
              Enable  the FIPS PPA repository, install the FIPS modules, configure the bootloader and enable fips on the system. After successfully executing the ubuntu-advantage script to enable fips,
              the system MUST be rebooted to complete the enablement process. Failing to reboot will result in the system not being fips enabled.  The token argument must be  in  the  form  "user:pass‐
              word".

              The following FIPS certified modules will be installed and put in fips mode; openssh-server, openssh-client, strongswan, openssl, and the kernel cryptoapi.

EXIT STATUS
       0      Command succeded

       1      Invalid command or option

       2      Current user is not root

       3      Invalid or missing token when enabling a service

       4      The requested service not supported on the current Ubuntu release

       5      Current kernel is too old to support Snaps (required for the Livepatch service)

       6      It was determined that FIPS has already been installed.

       If apt commands run by the tool fail, the exit status from apt is returned.

                                                                                              28 April 2017                                                                           UBUNTU-ADVANTAGE(1)
