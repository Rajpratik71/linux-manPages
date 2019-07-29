IPCS(1)                                                            User Commands                                                           IPCS(1)

NAME
       ipcs - show information on IPC facilities

SYNOPSIS
       ipcs [options]

DESCRIPTION
       ipcs  shows  information  on the inter-process communication facilities for which the calling process has read access.  By default it shows
       information about all three resources: shared memory segments, message queues, and semaphore arrays.

OPTIONS
       -i, --id id
              Show full details on just the one resource element identified by id.  This option needs  to  be  combined  with  one  of  the  three
              resource options: -m, -q or -s.

       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.

   Resource options
       -m, --shmems
              Write information about active shared memory segments.

       -q, --queues
              Write information about active message queues.

       -s, --semaphores
              Write information about active semaphore sets.

       -a, --all
              Write information about all three resources (default).

   Output formats
       Of these options only one takes effect: the last one specified.

       -c, --creator
              Show creator and owner.

       -l, --limits
              Show resource limits.

       -p, --pid
              Show PIDs of creator and last operator.

       -t, --time
              Write  time information.  The time of the last control operation that changed the access permissions for all facilities, the time of
              the last msgsnd(2) and msgrcv(2) operations on message queues, the time of the last shmat(2) and shmdt(2) operations on shared  mem‐
              ory, and the time of the last semop(2) operation on semaphores.

       -u, --summary
              Show status summary.

   Representation
       These affect only the -l (--limits) option.

       -b, --bytes
              Print sizes in bytes.

       --human
              Print sizes in human-readable format.

SEE ALSO
       ipcmk(1), ipcrm(1), msgrcv(2), msgsnd(2), semget(2), semop(2), shmat(2), shmdt(2), shmget(2)

CONFORMING TO
       The  Linux  ipcs  utility  is  not  fully compatible to the POSIX ipcs utility.  The Linux version does not support the POSIX -a, -b and -o
       options, but does support the -l and -u options not defined by POSIX.  A portable application shall not use the -a,  -b,  -o,  -l,  and  -u
       options.

AUTHOR
       Krishna Balasubramanian ⟨balasub@cis.ohio-state.edu⟩

AVAILABILITY
       The ipcs command is part of the util-linux package and is available from Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils/util-
       linux/⟩.

util-linux                                                           July 2014                                                             IPCS(1)
