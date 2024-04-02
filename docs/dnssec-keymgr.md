DNSSEC-KEYMGR(8)                                                                                    BIND9                                                                                    DNSSEC-KEYMGR(8)



NAME
       dnssec-keymgr - Ensures correct DNSKEY coverage for a zone based on a defined policy

SYNOPSIS
       dnssec-keymgr [-K directory] [-c file] [-f] [-k] [-q] [-v] [-z] [-g path] [-r path] [-s path] [zone...]

DESCRIPTION
       dnssec-keymgr is a high level Python wrapper to facilitate the key rollover process for zones handled by BIND. It uses the BIND commands for manipulating DNSSEC key metadata: dnssec-keygen and
       dnssec-settime.

       DNSSEC policy can be read from a configuration file (default /etc/dnssec-policy.conf), from which the key parameters, publication and rollover schedule, and desired coverage duration for any given
       zone can be determined. This file may be used to define individual DNSSEC policies on a per-zone basis, or to set a default policy used for all zones.

       When dnssec-keymgr runs, it examines the DNSSEC keys for one or more zones, comparing their timing metadata against the policies for those zones. If key settings do not conform to the DNSSEC policy
       (for example, because the policy has been changed), they are automatically corrected.

       A zone policy can specify a duration for which we want to ensure the key correctness (coverage). It can also specify a rollover period (roll-period). If policy indicates that a key should roll over
       before the coverage period ends, then a successor key will automatically be created and added to the end of the key series.

       If zones are specified on the command line, dnssec-keymgr will examine only those zones. If a specified zone does not already have keys in place, then keys will be generated for it according to
       policy.

       If zones are not specified on the command line, then dnssec-keymgr will search the key directory (either the current working directory or the directory set by the -K option), and check the keys for
       all the zones represented in the directory.

       It is expected that this tool will be run automatically and unattended (for example, by cron).

OPTIONS
       -c file
           If -c is specified, then the DNSSEC policy is read from file. (If not specified, then the policy is read from /etc/dnssec-policy.conf; if that file doesn't exist, a built-in global default
           policy is used.)

       -f
           Force: allow updating of key events even if they are already in the past. This is not recommended for use with zones in which keys have already been published. However, if a set of keys has been
           generated all of which have publication and activation dates in the past, but the keys have not been published in a zone as yet, then this option can be used to clean them up and turn them into
           a proper series of keys with appropriate rollover intervals.

       -g keygen-path
           Specifies a path to a dnssec-keygen binary. Used for testing. See also the -s option.

       -h
           Print the dnssec-keymgr help summary and exit.

       -K directory
           Sets the directory in which keys can be found. Defaults to the current working directory.

       -k
           Only apply policies to KSK keys. See also the -z option.

       -q
           Quiet: suppress printing of dnssec-keygen and dnssec-settime.

       -r randomdev
           Specifies a path to a file containing random data. This is passed to the dnssec-keygen binary using its -r option.

       -s settime-path
           Specifies a path to a dnssec-settime binary. Used for testing. See also the -g option.

       -v
           Print the dnssec-keymgr version and exit.

       -z
           Only apply policies to ZSK keys. See also the -k option.

POLICY CONFIGURATION
       The dnssec-policy.conf file can specify three kinds of policies:

       ·   Policy classes (policy name { ... };) can be inherited by zone policies or other policy classes; these can be used to create sets of different security profiles. For example, a policy class
           normal might specify 1024-bit key sizes, but a class extra might specify 2048 bits instead; extra would be used for zones that had unusually high security needs.

       ·   Algorithm policies: (algorithm-policy algorithm { ... }; ) override default per-algorithm settings. For example, by default, RSASHA256 keys use 2048-bit key sizes for both KSK and ZSK. This can
           be modified using algorithm-policy, and the new key sizes would then be used for any key of type RSASHA256.

       ·   Zone policies: (zone name { ... }; ) set policy for a single zone by name. A zone policy can inherit a policy class by including a policy option. Zone names beginning with digits (i.e., 0-9)
           must be quoted.

       Options that can be specified in policies:

       algorithm
           The key algorithm. If no policy is defined, the default is RSASHA256.

       coverage
           The length of time to ensure that keys will be correct; no action will be taken to create new keys to be activated after this time. This can be represented as a number of seconds, or as a
           duration using human-readable units (examples: "1y" or "6 months"). A default value for this option can be set in algorithm policies as well as in policy classes or zone policies. If no policy
           is configured, the default is six months.

       directory
           Specifies the directory in which keys should be stored.

       key-size
           Specifies the number of bits to use in creating keys. Takes two arguments: keytype (eihter "zsk" or "ksk") and size. A default value for this option can be set in algorithm policies as well as
           in policy classes or zone policies. If no policy is configured, the default is 1024 bits for DSA keys and 2048 for RSA.

       keyttl
           The key TTL. If no policy is defined, the default is one hour.

       post-publish
           How long after inactivation a key should be deleted from the zone. Note: If roll-period is not set, this value is ignored. Takes two arguments: keytype (eihter "zsk" or "ksk") and a duration. A
           default value for this option can be set in algorithm policies as well as in policy classes or zone policies. The default is one month.

       pre-publish
           How long before activation a key should be published. Note: If roll-period is not set, this value is ignored. Takes two arguments: keytype (either "zsk" or "ksk") and a duration. A default value
           for this option can be set in algorithm policies as well as in policy classes or zone policies. The default is one month.

       roll-period
           How frequently keys should be rolled over. Takes two arguments: keytype (eihter "zsk" or "ksk") and a duration. A default value for this option can be set in algorithm policies as well as in
           policy classes or zone policies. If no policy is configured, the default is one year for ZSK's. KSK's do not roll over by default.

       standby
           Not yet implemented.

REMAINING WORK
       ·   Enable scheduling of KSK rollovers using the -P sync and -D sync options to dnssec-keygen and dnssec-settime. Check the parent zone (as in dnssec-checkds) to determine when it's safe for the key
           to roll.

       ·   Allow configuration of standby keys and use of the REVOKE bit, for keys that use RFC 5011 semantics.

SEE ALSO
       dnssec-coverage(8), dnssec-keygen(8), dnssec-settime(8), dnssec-checkds(8)

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2016-2018 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2016-06-03                                                                                 DNSSEC-KEYMGR(8)
