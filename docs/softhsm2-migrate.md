SOFTHSM2-MIGRATE(1)                                                                        General Commands Manual                                                                        SOFTHSM2-MIGRATE(1)



NAME
       softhsm2-migrate - SoftHSM v1 migration tool

SYNOPSIS
       softhsm2-migrate --db path --slot number [--pin PIN --no-public-key]

DESCRIPTION
       softhsm2-migrate is a tool that can migrate SoftHSM v1 databases to PKCS#11.  The default HSM is SoftHSM v2, but can be used with other PKCS#11 libraries by using the option --module

OPTIONS
       --db path
              The SoftHSM v1 database that is going to be migrated.  The location of the token database can be found in the configuration file for SoftHSM v1.

       --help, -h
              Show the help information.

       --module path
              Use another PKCS#11 library than SoftHSM.

       --no-public-key
              Do not migrate the public key.

       --pin PIN
              The PIN for the normal user.

       --slot number
              The database will be migrated to this slot.

       --version, -v
              Show the version info.

EXAMPLE
       A token database can be migrated with the following command:

              softhsm2-migrate --db /home/user/token.db --slot 1

AUTHORS
       Written by Rickard Bellgrim, Francis Dupont, René Post, and Roland van Rijswijk.

SEE ALSO
       softhsm2-keyconv(1), softhsm2-util(1), softhsm2.conf(5)



SoftHSM                                                                                         20 March 2014                                                                             SOFTHSM2-MIGRATE(1)
