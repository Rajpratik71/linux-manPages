IPTABLES-RESTORE(8)                                               iptables 1.6.0                                               IPTABLES-RESTORE(8)

NAME
       iptables-restore — Restore IP Tables

       ip6tables-restore — Restore IPv6 Tables

SYNOPSIS
       iptables-restore [-chntv] [-M modprobe] [-T name] [file]

       ip6tables-restore [-chntv] [-M modprobe] [-T name] [file]

DESCRIPTION
       iptables-restore  and ip6tables-restore are used to restore IP and IPv6 Tables from data specified on STDIN or in file. Use I/O redirection
       provided by your shell to read from a file or specify file as an argument.

       -c, --counters
              restore the values of all packet and byte counters

       -h, --help
              Print a short option summary.

       -n, --noflush
              don't flush the previous contents of the table. If not specified, both commands flush (delete) all previous contents of the  respec‐
              tive table.

       -t, --test
              Only parse and construct the ruleset, but do not commit it.

       -v, --verbose
              Print additional debug info during ruleset processing.

       -M, --modprobe modprobe_program
              Specify  the path to the modprobe program. By default, iptables-restore will inspect /proc/sys/kernel/modprobe to determine the exe‐
              cutable's path.

       -T, --table name
              Restore only the named table even if the input stream contains other ones.

BUGS
       None known as of iptables-1.2.1 release

AUTHORS
       Harald Welte <laforge@gnumonks.org> wrote iptables-restore based on code from Rusty Russell.
       Andras Kis-Szabo <kisza@sch.bme.hu> contributed ip6tables-restore.

SEE ALSO
       iptables-apply(8),iptables-save(8), iptables(8)

       The iptables-HOWTO, which details more iptables usage, the NAT-HOWTO, which details NAT, and the netfilter-hacking-HOWTO which details  the
       internals.

iptables 1.6.0                                                                                                                 IPTABLES-RESTORE(8)
