RNDC(8)                                                                                             BIND9                                                                                             RNDC(8)



NAME
       rndc - name server control utility

SYNOPSIS
       rndc [-b source-address] [-c config-file] [-k key-file] [-s server] [-p port] [-V] [-y key_id] {command}

DESCRIPTION
       rndc controls the operation of a name server. It supersedes the ndc utility that was provided in old BIND releases. If rndc is invoked with no command line options or arguments, it prints a short
       summary of the supported commands and the available options and their arguments.

       rndc communicates with the name server over a TCP connection, sending commands authenticated with digital signatures. In the current versions of rndc and named, the only supported authentication
       algorithm is HMAC-MD5, which uses a shared secret on each end of the connection. This provides TSIG-style authentication for the command request and the name server's response. All commands sent
       over the channel must be signed by a key_id known to the server.

       rndc reads a configuration file to determine how to contact the name server and decide what algorithm and key it should use.

OPTIONS
       -b source-address
           Use source-address as the source address for the connection to the server. Multiple instances are permitted to allow setting of both the IPv4 and IPv6 source addresses.

       -c config-file
           Use config-file as the configuration file instead of the default, /etc/rndc.conf.

       -k key-file
           Use key-file as the key file instead of the default, /etc/rndc.key. The key in /etc/rndc.key will be used to authenticate commands sent to the server if the config-file does not exist.

       -s server
           server is the name or address of the server which matches a server statement in the configuration file for rndc. If no server is supplied on the command line, the host named by the
           default-server clause in the options statement of the rndc configuration file will be used.

       -p port
           Send commands to TCP port port instead of BIND 9's default control channel port, 953.

       -V
           Enable verbose logging.

       -y key_id
           Use the key key_id from the configuration file.  key_id must be known by named with the same algorithm and secret string in order for control message validation to succeed. If no key_id is
           specified, rndc will first look for a key clause in the server statement of the server being used, or if no server statement is present for that host, then the default-key clause of the options
           statement. Note that the configuration file contains shared secrets which are used to send authenticated control commands to name servers. It should therefore not have general read or write
           access.

COMMANDS
       A list of commands supported by rndc can be seen by running rndc without arguments.

       Currently supported commands are:

       addzone zone [class [view]] configuration
           Add a zone while the server is running. This command requires the allow-new-zones option to be set to yes. The configuration string specified on the command line is the zone configuration text
           that would ordinarily be placed in named.conf.

           The configuration is saved in a file called hash.nzf, where hash is a cryptographic hash generated from the name of the view. When named is restarted, the file will be loaded into the view
           configuration, so that zones that were added can persist after a restart.

           This sample addzone command would add the zone example.com to the default view:

           $rndc addzone example.com '{ type master; file "example.com.db"; };'

           (Note the brackets and semi-colon around the zone configuration text.)

           See also rndc delzone.

       delzone zone [class [view]]
           Delete a zone while the server is running. Only zones that were originally added via rndc addzone can be deleted in this manner.

           See also rndc addzone

       dumpdb [-all|-cache|-zone|-adb|-bad] [view ...]
           Dump the server's caches (default) and/or zones to the dump file for the specified views. If no view is specified, all views are dumped. (See the dump-file option in the BIND 9 Administrator
           Reference Manual.)

       flush
           Flushes the server's cache.

       flushname name [view]
           Flushes the given name from the view's DNS cache and, if applicable, from the view's nameserver address database or bad-server cache.

       flushtree name [view]
           Flushes the given name, and all of its subdomains, from the view's DNS cache. Note that this does not affect he server's address database or bad-server cache.

       freeze [zone [class [view]]]
           Suspend updates to a dynamic zone. If no zone is specified, then all zones are suspended. This allows manual edits to be made to a zone normally updated by dynamic update. It also causes changes
           in the journal file to be synced into the master file. All dynamic update attempts will be refused while the zone is frozen.

           See also rndc thaw.

       halt [-p]
           Stop the server immediately. Recent changes made through dynamic update or IXFR are not saved to the master files, but will be rolled forward from the journal files when the server is restarted.
           If -p is specified named's process id is returned. This allows an external process to determine when named had completed halting.

           See also rndc stop.

       loadkeys zone [class [view]]
           Fetch all DNSSEC keys for the given zone from the key directory. If they are within their publication period, merge them into the zone's DNSKEY RRset. Unlike rndc sign, however, the zone is not
           immediately re-signed by the new keys, but is allowed to incrementally re-sign over time.

           This command requires that the auto-dnssec zone option be set to maintain, and also requires the zone to be configured to allow dynamic DNS. (See "Dynamic Update Policies" in the Administrator
           Reference Manual for more details.)

       notify zone [class [view]]
           Resend NOTIFY messages for the zone.

       notrace
           Sets the server's debugging level to 0.

           See also rndc trace.

       querylog [on|off]
           Enable or disable query logging. (For backward compatibility, this command can also be used without an argument to toggle query logging on and off.)

           Query logging can also be enabled by explicitly directing the queriescategory to a channel in the logging section of named.conf or by specifying querylog yes; in the options section of
           named.conf.

       reconfig
           Reload the configuration file and load new zones, but do not reload existing zone files even if they have changed. This is faster than a full reload when there is a large number of zones because
           it avoids the need to examine the modification times of the zones files.

       recursing
           Dump the list of queries named is currently recursing on, and the list of domains to which iterative queries are currently being sent. (The second list includes the number of fetches currently
           active for the given domain, and how many have been passed or dropped because of the fetches-per-zone option.)

       refresh zone [class [view]]
           Schedule zone maintenance for the given zone.

       reload
           Reload configuration file and zones.

       reload zone [class [view]]
           Reload the given zone.

       retransfer zone [class [view]]
           Retransfer the given slave zone from the master server.

           If the zone is configured to use inline-signing, the signed version of the zone is discarded; after the retransfer of the unsigned version is complete, the signed version will be regenerated
           with all new signatures.

       secroots [view ...]
           Dump the server's security roots to the secroots file for the specified views. If no view is specified, security roots for all views are dumped.

       sign zone [class [view]]
           Fetch all DNSSEC keys for the given zone from the key directory (see the key-directory option in the BIND 9 Administrator Reference Manual). If they are within their publication period, merge
           them into the zone's DNSKEY RRset. If the DNSKEY RRset is changed, then the zone is automatically re-signed with the new key set.

           This command requires that the auto-dnssec zone option be set to allow or maintain, and also requires the zone to be configured to allow dynamic DNS. (See "Dynamic Update Policies" in the
           Administrator Reference Manual for more details.)

           See also rndc loadkeys.

       signing [( -list | -clear keyid/algorithm | -clear all | -nsec3param ( parameters | none ) ) ] zone [class [view]]
           List, edit, or remove the DNSSEC signing state records for the specified zone. The status of ongoing DNSSEC operations (such as signing or generating NSEC3 chains) is stored in the zone in the
           form of DNS resource records of type sig-signing-type.  rndc signing -list converts these records into a human-readable form, indicating which keys are currently signing or have finished signing
           the zone, and which NSEC3 chains are being created or removed.

           rndc signing -clear can remove a single key (specified in the same format that rndc signing -list uses to display it), or all keys. In either case, only completed keys are removed; any record
           indicating that a key has not yet finished signing the zone will be retained.

           rndc signing -nsec3param sets the NSEC3 parameters for a zone. This is the only supported mechanism for using NSEC3 with inline-signing zones. Parameters are specified in the same format as an
           NSEC3PARAM resource record: hash algorithm, flags, iterations, and salt, in that order.

           Currently, the only defined value for hash algorithm is 1, representing SHA-1. The flags may be set to 0 or 1, depending on whether you wish to set the opt-out bit in the NSEC3 chain.
           iterations defines the number of additional times to apply the algorithm when generating an NSEC3 hash. The salt is a string of data expressed in hexadecimal, or a hyphen (`-') if no salt is to
           be used.

           So, for example, to create an NSEC3 chain using the SHA-1 hash algorithm, no opt-out flag, 10 iterations, and a salt value of "FFFF", use: rndc signing -nsec3param 1 0 10 FFFF zone. To set the
           opt-out flag, 15 iterations, and no salt, use: rndc signing -nsec3param 1 1 15 - zone.

           rndc signing -nsec3param none removes an existing NSEC3 chain and replaces it with NSEC.

       stats
           Write server statistics to the statistics file. (See the statistics-file option in the BIND 9 Administrator Reference Manual.)

       status
           Display status of the server. Note that the number of zones includes the internal bind/CH zone and the default ./IN hint zone if there is not an explicit root zone configured.

       stop [-p]
           Stop the server, making sure any recent changes made through dynamic update or IXFR are first saved to the master files of the updated zones. If -p is specified named's process id is returned.
           This allows an external process to determine when named had completed stopping.

           See also rndc halt.

       sync [-clean] [zone [class [view]]]
           Sync changes in the journal file for a dynamic zone to the master file. If the "-clean" option is specified, the journal file is also removed. If no zone is specified, then all zones are synced.

       thaw [zone [class [view]]]
           Enable updates to a frozen dynamic zone. If no zone is specified, then all frozen zones are enabled. This causes the server to reload the zone from disk, and re-enables dynamic updates after the
           load has completed. After a zone is thawed, dynamic updates will no longer be refused. If the zone has changed and the ixfr-from-differences option is in use, then the journal file will be
           updated to reflect changes in the zone. Otherwise, if the zone has changed, any existing journal file will be removed.

           See also rndc freeze.

       trace
           Increment the servers debugging level by one.

       trace level
           Sets the server's debugging level to an explicit value.

           See also rndc notrace.

       tsig-delete keyname [view]
           Delete a given TKEY-negotiated key from the server. (This does not apply to statically configured TSIG keys.)

       tsig-list
           List the names of all TSIG keys currently configured for use by named in each view. The list both statically configured keys and dynamic TKEY-negotiated keys.

       validation ( on | off | check ) [view ...]
           Enable, disable, or check the current status of DNSSEC validation. Note dnssec-enable also needs to be set to yes or auto to be effective. It defaults to enabled.

LIMITATIONS
       There is currently no way to provide the shared secret for a key_id without using the configuration file.

       Several error messages could be clearer.

SEE ALSO
       rndc.conf(5), rndc-confgen(8), named(8), named.conf(5), ndc(8), BIND 9 Administrator Reference Manual.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2004, 2005, 2007, 2013-2015 Internet Systems Consortium, Inc. ("ISC")
       Copyright © 2000, 2001 Internet Software Consortium.



ISC                                                                                               2013-12-04                                                                                          RNDC(8)
