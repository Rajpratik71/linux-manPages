IPTABLES-SAVE(8)                                                                              iptables 1.6.0                                                                             IPTABLES-SAVE(8)

NAME
       iptables-save — dump iptables rules to stdout

       ip6tables-save — dump iptables rules to stdout

SYNOPSIS
       iptables-save [-M modprobe] [-c] [-t table]

       ip6tables-save [-M modprobe] [-c] [-t table]

DESCRIPTION
       iptables-save and ip6tables-save are used to dump the contents of IP or IPv6 Table in easily parseable format to STDOUT. Use I/O-redirection provided by your shell to write to a file.

       -M, --modprobe modprobe_program
              Specify the path to the modprobe program. By default, iptables-save will inspect /proc/sys/kernel/modprobe to determine the executable's path.

       -c, --counters
              include the current values of all packet and byte counters in the output

       -t, --table tablename
              restrict output to only one table. If not specified, output includes all available tables.

BUGS
       None known as of iptables-1.2.1 release

AUTHORS
       Harald Welte <laforge@gnumonks.org>
       Rusty Russell <rusty@rustcorp.com.au>
       Andras Kis-Szabo <kisza@sch.bme.hu> contributed ip6tables-save.

SEE ALSO
       iptables-apply(8),iptables-restore(8), iptables(8)

       The iptables-HOWTO, which details more iptables usage, the NAT-HOWTO, which details NAT, and the netfilter-hacking-HOWTO which details the internals.

iptables 1.6.0                                                                                                                                                                           IPTABLES-SAVE(8)
