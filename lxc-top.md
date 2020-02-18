lxc-top(1)                                                    lxc-top(1)

NAME
       lxc-top - monitor container statistics

SYNOPSIS
       lxc-top [--help] [--delay delay] [--sort sortby] [--reverse]

DESCRIPTION
       lxc-top  displays container statistics. The output is updated ev‐
       ery delay seconds, and is ordered according to the  sortby  value
       given. lxc-top will display as many containers as can fit in your
       terminal. Press 'q' to quit. Press one of the sort key letters to
       sort  by that statistic. Pressing a sort key letter a second time
       reverses the sort order.

OPTIONS
       -d, --delay delay
              Amount of time in seconds to delay between screen updates.
              The default is 3 seconds.

       -s, --sort sortby
              Sort  the  containers by name, cpu use, or memory use. The
              sortby argument should be one of the letters n,c,b,m,k  to
              sort by name, cpu use, block I/O, memory, or kernel memory
              use respectively. The default is 'n'.

       -r, --reverse
              Reverse the default sort order. By default, names sort  in
              ascending alphabetical order and values sort in descending
              amounts (ie. largest value first).

EXAMPLE
       lxc-top --delay 1 --sort m
              Display containers, updating every second, sorted by memo‐
              ry use.

NOTES
       For performance reasons the kernel does not account kernel memory
       use unless a kernel memory limit is set. If a limit is  not  set,
       lxc-top will display kernel memory use as 0. If no containers are
       being accounted, the KMem column will not be displayed.  A  limit
       can be set by specifying

             lxc.cgroup.memory.kmem.limit_in_bytes = number

       in your container configuration file, see lxc.conf(5).

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
       lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-
       wait(1),  lxc-cgroup(1),  lxc-ls(1),  lxc-info(1), lxc-freeze(1),
       lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Dwight Engen <dwight.engen@oracle.com>

                               2018-12-20                     lxc-top(1)
