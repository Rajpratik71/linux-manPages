DDNS-CONFGEN(8)                                                                                     BIND9                                                                                     DDNS-CONFGEN(8)



NAME
       ddns-confgen - ddns key generation tool

SYNOPSIS
       ddns-confgen [-a algorithm] [-h] [-k keyname] [-r randomfile] [-s name | -z zone] [-q] [name]

DESCRIPTION
       ddns-confgen generates a key for use by nsupdate and named. It simplifies configuration of dynamic zones by generating a key and providing the nsupdate and named.conf syntax that will be needed to
       use it, including an example update-policy statement.

       If a domain name is specified on the command line, it will be used in the name of the generated key and in the sample named.conf syntax. For example, ddns-confgen example.com would generate a key
       called "ddns-key.example.com", and sample named.conf command that could be used in the zone definition for "example.com".

       Note that named itself can configure a local DDNS key for use with nsupdate -l.  ddns-confgen is only needed when a more elaborate configuration is required: for instance, if nsupdate is to be used
       from a remote system.

OPTIONS
       -a algorithm
           Specifies the algorithm to use for the TSIG key. Available choices are: hmac-md5, hmac-sha1, hmac-sha224, hmac-sha256, hmac-sha384 and hmac-sha512. The default is hmac-sha256.

       -h
           Prints a short summary of the options and arguments to ddns-confgen.

       -k keyname
           Specifies the key name of the DDNS authentication key. The default is ddns-key when neither the -s nor -z option is specified; otherwise, the default is ddns-key as a separate label followed by
           the argument of the option, e.g., ddns-key.example.com.  The key name must have the format of a valid domain name, consisting of letters, digits, hyphens and periods.

       -q
           Quiet mode: Print only the key, with no explanatory text or usage examples.

       -r randomfile
           Specifies a source of random data for generating the authorization. If the operating system does not provide a /dev/random or equivalent device, the default source of randomness is keyboard
           input.  randomdev specifies the name of a character device or file containing random data to be used instead of the default. The special value keyboard indicates that keyboard input should be
           used.

       -s name
           Single host mode: The example named.conf text shows how to set an update policy for the specified name using the "name" nametype. The default key name is ddns-key.name. Note that the "self"
           nametype cannot be used, since the name to be updated may differ from the key name. This option cannot be used with the -z option.

       -z zone
           zone mode: The example named.conf text shows how to set an update policy for the specified zone using the "zonesub" nametype, allowing updates to all subdomain names within that zone. This
           option cannot be used with the -s option.

SEE ALSO
       nsupdate(1), named.conf(5), named(8), BIND 9 Administrator Reference Manual.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2009, 2014, 2015 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2009-09-18                                                                                  DDNS-CONFGEN(8)
