UBUNTU-ADVANTAGE(1)                                                                                                                                                                UBUNTU-ADVANTAGE(1)

NAME
       ubuntu-advantage - Enable or disable Ubuntu Advantage offerings from Canonical.

SYNOPSIS
       ubuntu-advantage <command> [parameters]

       ua     <command> [parameters]

DESCRIPTION
       This tool is used to enable or disable specific Ubuntu Advantage offerings from Canonical. The available modules and their commands are described below.  It must be run with root privileges.

       status Show the status of Ubuntu Advantage offerings.

       version
              Show version.

ESM (Extended Security Maintenance)
       Ubuntu Extended Security Maintenance archive. See https://ubuntu.com/esm for more information.

       enable-esm token
              Enable the ESM repository. The token argument must be in the form "user:password".

       disable-esm
              Disable the ESM repository.

FIPS (Canonical FIPS 140-2 certified modules)
       Install, Configure, and Enable FIPS 140-2 certified modules.

       enable-fips token
              Enable  the  FIPS  PPA  repository, install the FIPS modules, configure the bootloader and enable fips on the system. After successfully executing the ubuntu-advantage script to enable
              fips, the system MUST be rebooted to complete the enablement process. Failing to reboot will result in the system not being fips enabled.  The  token  argument  must  be  in  the  form
              "user:password".

              The following FIPS certified modules will be installed and put in fips mode; openssh-server, openssh-client, strongswan, openssl, and the kernel cryptoapi.

       disable-fips
              It's currently not possible to disable FIPS after it has been enabled.

       enable-fips-updates token [-y]
              Updating the FIPS modules will take the system out of FIPS compliance as the updated modules are not FIPS certified. The option enables the FIPS-UPDATES PPA repository and installs the
              updated FIPS modules. If the system is installing FIPS modules for the first time, it configures FIPS on the system. After successfully executing the ubuntu-advantage script to  update
              FIPS  modules,  the  system  MUST  be rebooted if FIPS kernel was upgraded in the upgrade process. Failing to reboot will result in the system not running the updated FIPS kernel.  The
              token argument must be in the form "user:password".  The -y argument is optional to bypass the user prompt while installing updates.

              The following FIPS modules will be updated and put in FIPS mode - openssh-server, openssh-client, strongswan, openssl, and the kernel cryptoapi.

Livepatch (Canonical Livepatch Service)
       Managed live kernel patching. For more information, visit https://www.ubuntu.com/server/livepatch

       enable-livepatch <token>
              Enable the Livepatch service. The token can be obtained by visiting https://ubuntu.com/livepatch

       disable-livepatch [-r]
              Disable the Livepatch service. If the -r option is given, the canonical-livepatch snap will be removed after the sevice is disabled.

EXIT STATUS
       0      Command succeded

       1      Invalid command or option

       2      Current user is not root

       3      Invalid or missing token when enabling a service

       4      The requested service is not supported on the current Ubuntu release

       5      Current kernel is too old to support Snaps (required for the Livepatch service)

       6      The requested service is already enabled

       7      The requested service is not supported on the current architecture

       8      The requested service is already disabled

       If apt commands run by the tool fail, the exit status from apt is returned.

                                                                                             28 April 2017                                                                         UBUNTU-ADVANTAGE(1)
