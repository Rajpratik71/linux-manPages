ldns-signzone(1)                                                                           General Commands Manual                                                                           ldns-signzone(1)



NAME
       ldns-signzone - sign a zonefile with DNSSEC data

SYNOPSIS
       ldns-signzone [ OPTIONS ] ZONEFILE KEY [KEY [KEY] ...  ]


DESCRIPTION
       ldns-signzone is used to generate a DNSSEC signed zone. When run it will create a new zonefile that contains RRSIG and NSEC resource records, as specified in RFC 4033, RFC 4034 and RFC 4035.

       Keys  must  be  specified  by  their  base  name  (i.e.  without .private). If the DNSKEY that belongs to the key in the .private file is not present in the zone, it will be read from the file <base
       name>.key. If that file does not exist, the DNSKEY value will be generated from the private key.

       Multiple keys can be specified, Key Signing Keys are used as such when they are either already present in the zone, or specified in a .key file, and have the KSK bit set.


OPTIONS
       -b     Augments the zone and the RR's with extra comment texts for a more readable layout, easier to debug. DS records will have a bubblebabble version of the data in the comment text, NSEC3 records
              will have the original NSEC3 in the comment text.

              Without this option, only DNSKEY RR's will have their Key Tag annotated in the comment text.


       -d     Normally, if the DNSKEY RR for a key that is used to sign the zone is not found in the zone file, it will be read from .key, or derived from the private key (in that order). This option turns
              that feature off, so that only the signatures are added to the zone.


       -e date
              Set expiration date of the signatures to this date, the format can be YYYYMMDD[hhmmss], or a timestamp.


       -f file
              Use this file to store the signed zone in (default <originalfile>.signed)


       -i date
              Set inception date of the signatures to this date, the format can be YYYYMMDD[hhmmss], or a timestamp.


       -o origin
              Use this as the origin of the zone


       -v     Print the version and exit


       -A     Sign the DNSKEY record with all keys.  By default it is signed with a minimal number of keys, to keep the response size for the DNSKEY query small, and only the SEP keys that are  passed  are
              used.  If there are no SEP keys, the DNSKEY RRset is signed with the non-SEP keys.  This option turns off the default and all keys are used to sign the DNSKEY RRset.


       -E name
              Use the EVP cryptographic engine with the given name for signing. This can have some extra options; see ENGINE OPTIONS for more information.


       -k id,int
              Use the key with the given id as the signing key for algorithm int as a Zone signing key. This option is used when you use an OpenSSL engine, see ENGINE OPTIONS for more information.


       -K id,int

              Use the key with the given id as the signing key for algorithm int as a Key signing key. This options is used when you use an OpenSSL engine, see ENGINE OPTIONS for more information.


       -n     Use NSEC3 instead of NSEC.


       If you use NSEC3, you can specify the following extra options:


       -a algorithm
              Algorithm used to create the hashed NSEC3 owner names


       -p     Opt-out. All NSEC3 records in the zone will have the Opt-out flag set. After signing, you can add insecure delegations to the signed zone.


       -s string
              Salt


       -t number
              Number of hash iterations


ENGINE OPTIONS
       You  can  modify  the  possible  engines, if supported, by setting an OpenSSL configuration file. This is done through the environment variable OPENSSL_CONF. If you use -E with a non-existent engine
       name, ldns-signzone will print a list of engines supported by your configuration.

       The key options (-k and -K) work as follows; you specify a key id, and a DNSSEC algorithm number (for instance, 5 for RSASHA1). The key id can be any of the following:

           <id>
           <slot>:<id>
           id_<id>
           slot_<slot>-id_<id>
           label_<label>
           slot_<slot>-label_<label>

       Where '<id>' is the PKCS #11 key identifier in hexadecimal notation, '<label>' is the PKCS #11 human-readable label, and '<slot>' is the slot number where the token is present.

       If not already present, a DNSKEY RR is generated from the key data, and added to the zone.


EXAMPLES
       ldns-signzone nlnetlabs.nl Knlnetlabs.nl.+005+12273
              Sign the zone in the file 'nlnetlabs.nl' with the key in the files 'Knlnetlabs.nl.+005+12273.private'. If the  DNSKEY  is  not  present  in  the  zone,  use  the  key  in  the  file  'Knlnet‐
              labs.nl.+005+12273.key'. If that is not present, generate one with default values from 'Knlnetlabs.nl.+005+12273.private'.



AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005-2008 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 30 May 2005                                                                                 ldns-signzone(1)
