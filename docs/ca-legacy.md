CA-LEGACY(8)                                                                                                                                                                                     CA-LEGACY(8)



NAME
       ca-legacy - Manage the system configuration for legacy CA certificates

SYNOPSIS
       ca-legacy [COMMAND]

DESCRIPTION
       ca-legacy(8) is used to include or exclude a set of legacy Certificate Authority (CA) certificates in the system’s list of trusted CA certificates.

       The list of CA certificates and trust flags included in the ca-certificates package are based on the decisions made by Mozilla.org according to the Mozilla CA policy.

       Occasionally, removal or distrust decisions made by Mozilla.org might be incompatible with the requirements or limitations of some applications that also use the CA certificates list in the Linux
       environment.

       The ca-certificates package might keep some CA certificates included and trusted by default, as long as it is seen necessary by the maintainers, despite the fact that they have been removed by
       Mozilla. These certificates are called legacy CA certificates.

       The general requirements to keep legacy CA certificates included and trusted might change over time, for example if functional limitations of software packages have been resolved. Future versions of
       the ca-certificates package might reduce the set of legacy CA certificates that are included and trusted by default.

       The ca-legacy(8) command can be used to override the default behaviour.

       The mechanisms to individually trust or distrust CA certificates as described in update-ca-trust(8) still apply.

COMMANDS
       check
           The current configuration will be shown.

       default
           Configure the system to use the default configuration, as recommended by the package maintainers.

       disable
           Configure the system to explicitly disable legacy CA certificates. Using this configuration, the system will use the set of included and trusted CA certificates as released by Mozilla.

       install
           The configuration file will be read and the system configuration will be set accordingly. This command is executed automatically during upgrades of the ca-certificates package.

FILES
       /etc/pki/ca-trust/ca-legacy.conf
           A configuration file that will be used and modified by the ca-legacy command. The contents of the configuration file will be read on package upgrades.

AUTHOR
       Written by Kai Engert.



ca-legacy                                                                                         05/16/2018                                                                                     CA-LEGACY(8)
