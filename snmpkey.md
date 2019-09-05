SNMPKEY(1p)                                             User Contributed Perl Documentation                                            SNMPKEY(1p)

NAME
       snmpkey - Create SNMPv3 security keys for the Net::SNMP module

USAGE
       The "snmpkey" utility generates security keys based on a password and an authoritativeEngineID passed on the command line.  This key can
       then be used by the Net::SNMP module instead of the plain text password when creating SNMPv3 objects.

          snmpkey <authProto> <password> <authEngineID> [<privProto> [<password>]]

DESCRIPTION
       The User-based Security Model used by SNMPv3 defines an algorithm which "localizes" a plain text password to a specific
       authoritativeEngineID using a one-way hash.  This resulting key is used by the SNMP application instead of the plain text password for
       security reasons.

       The Net::SNMP module allows the user to either provide a plain text password or a localized key to the object constructor when configuring
       authentication or privacy.  The "snmpkey" utility can be used to generate the key to be used by the -authkey or -privkey named arguments
       when they are passed to the Net::SNMP "session()" constructor.

REQUIRED ARGUMENTS
       The "snmpkey" utility requires at least three command line arguments.  The first argument defines which hash algorithm to use when creating
       the authKey.  Either HMAC-MD5-96 or HMAC-SHA-96 can be specified with the string 'md5' or 'sha' respectively.  This choice must match the
       algorithm passed to the -authprotocol argument when creating the Net::SNMP object.  The second argument is the plain text password that is
       to be localized to create the authKey.  The third required argument is the authoritativeEngineID of the remote SNMP engine associated with
       the Net::SNMP argument -hostname.  The authoritativeEngineID is to be entered as a hexadecimal string 10 to 64 characters (5 to 32 octets)
       long and can be prefixed with an optional "0x".

       The last two arguments are optional and can be used to determine how the privKey will be generated.  By default, the fourth argument
       assumes a value of 'des' corresponding to the default privacy protocol defined in the User-based Security Model.  The Net::SNMP module
       supports CBC-3DES-EDE and CFB128-AES-128 as alternatives to the default protocol CBC-DES.  These protocols can be chosen by specifying the
       string '3des' or 'aes' respectively.  This choice must match the protocol passed to the -privprotocol argument when creating the Net::SNMP
       object.  The last argument can be used to specify the plain text password that is to be localized to create the privKey.  If this argument
       is not specified, the authKey password is used.

AUTHOR
       David M. Town <dtown@cpan.org>

LICENSE AND COPYRIGHT
       Copyright (c) 2001-2009 David M. Town.  All rights reserved.

       This program is free software; you may redistribute it and/or modify it under the same terms as the Perl 5 programming language system
       itself.

SEE ALSO
       Net::SNMP

perl v5.12.4                                                        2011-10-17                                                         SNMPKEY(1p)
