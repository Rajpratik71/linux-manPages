SRP_DAEMON(1)                                                                                   USER COMMANDS                                                                                   SRP_DAEMON(1)



NAME
       srp_daemon - Discovers SRP targets in an InfiniBand Fabric


SYNOPSIS
       srp_daemon [-vVcaeon] [-d umad-device | -i infiniband-device [-p port-num] | -j dev:port] [-t timeout(ms)] [-r retries] [-R rescan-time] [-f rules-file]



DESCRIPTION
       Discovers and connects to InfiniBand SCSI RDMA Protocol (SRP) targets in an IB fabric.

       Each  srp_daemon  instance operates on one local port. Upon boot it performs a full rescan of the fabric and then waits for an srp_daemon event. An srp_daemon event can be a join of a new machine to
       the fabric, a change in the capabilities of a machine, an SA change, or an expiration of a predefined timeout.

       When a new machine joins the fabric, srp_daemon checks if it is an SRP target. When there is a change of capabilities, srp_daemon checks if the machine has turned into an SRP target. When  there  is
       an SA change or a timeout expiration, srp_daemon performs a full rescan of the fabric.

       For  each  target  srp_daemon finds, it checks if it should connect to this target according to its rules (the default rules file is /etc/srp_daemon.conf) and if it is already connected to the local
       port. If it should connect to this target and if it is not connected yet, srp_daemon can either print the target details or connect to it.


OPTIONS
       -v     Print more verbose output

       -V     Print even more verbose output (debug mode)

       -i infiniband-device
              Work on infiniband-device. This option should not be used with -d nor with -j.

       -p port-num
              Work on port port-num (default 1). This option must be used with -i and should not be used with -d nor with -j.

       -j dev:port
              Work on port number port of InfiniBand device dev. This option should not be used with -d, -i nor with -p.

       -d umad-device
              Use device file umad-device (default /dev/infiniband/umad0) This option should not be used with -i, -p nor with -j.

       -c     Generate output suitable for piping directly to a /sys/class/infiniband_srp/srp-<device>-<port>/add_target file.

       -a     Prints all the targets in the fabric, not only targets that are not connected through the local port. This is the same behavior as that of ibsrpdm.

       -e     Execute the connection command, i.e., make the connection to the target.

       -o     Perform only one rescan and exit just like ibsrpdm.

       -R rescan-time
              Force a complete rescan every rescan-time seconds. If -R is not specified, no timeout rescans will be performed.

       -T retry-timeout
              Retries to connect to existing target after retry-timeout seconds. If -R is not specified, uses 5 Seconds timeout. if retry-timeout is 0, will not try  to  reconnect.  The  reason  srp_daemon
              retries to connect to the target is because there may be a rare scnerio in which srp_daemon will try to connect to add a target when the target is about to be removed, but is not removed yet.

       -f rules-file
              Decide  to  which  targets  to  connect according to the rules in rules-file.  If -f is not specified, uses the default rules file /etc/srp_daemon.conf.  Each line in the rules-file is a rule
              which can be either an allow connection or a disallow connection according to the first character in the line (a or d accordingly). The rest of the line is values for id_ext, ioc_guid,  dgid,
              service_id. Please take a look at the example section for an example of the file. srp_daemon decide whether to allow or disallow each target according  to first rule that match the target. If
              no rule matches the target, the target is allowed and will be connected. In an allow rule it is possible to set  attributes  for  the  connection  to  the  target.  Supported  attributes  are
              max_cmd_per_lun and max_sect.

       -t timeout
              Use timeout of timeout msec for MAD responses (default: 5 sec).

       -r retries
              Perform retries retries on each send to MAD (default: 3 retries).

       -n     New format - use also initiator_ext in the connection command.

       --systemd
              Enable systemd integration.


FILES
       /etc/srp_daemon.conf  -  Default rules configuration file that indicates to which targets to connect. Can be overridden using the -f rules-file option.  Each line in this file is a rule which can be
       either an allow connection or a disallow connection according to the first character in the line (a or d accordingly). The rest of the line is values for id_ext, ioc_guid, dgid,  service_id.  Please
       take  a look at the example section for an example of the file. srp_daemon decide whether to allow or disallow each target according  to first rule that match the target. If no rule matches the tar‐
       get, the target is allowed and will be connected. In an allow rule it is possible to set attributes for the connection to the target. Supported attributes are max_cmd_per_lun and max_sect.


EXAMPLES
       srp_daemon -e -i mthca0 -p 1 -R 60 (Connects to the targets accessible through port 1 of mthca0. Performs a complete rescan every minute)

       srp_daemon -o -c -a          (Prints the connection commands for the targets in the fabric and exits - similar to ibsrpdm)

       srp_daemon -e -f rules.txt        (Connects to the targets allowed in the rules file rules.txt)

       An example for a rules configuration file (such as /etc/srp_daemon.conf)
       ------------------------------------------------------------------------
       # Rules file example
       # This is a comment
       # disallow the following dgid
       d       dgid=fe800000000000000002c90200402bd5
       # allow target with the following ioc_guid
       a       ioc_guid=00a0b80200402bd7
       # allow target with the following id_ext and ioc_guid. And setting max_cmd_per_lun to 31.
       a       id_ext=200500A0B81146A1,ioc_guid=00a0b80200402bef,max_cmd_per_lun=31
       # disallow all the rest
       d



SEE ALSO
       ibsrpdm(1)


AUTHORS
       Roland Dreier
              <rolandd@cisco.com>

       Ishai Rabinovitz
              <ishai@mellanox.co.il>



OpenFabrics                                                                                   September 5, 2006                                                                                 SRP_DAEMON(1)
