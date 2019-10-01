IPCS(1)                                                                                         User Commands                                                                                         IPCS(1)



NAME
       ipcs - provide information on IPC facilities

SYNOPSIS
       ipcs [resource-option] [output-format]
       ipcs [resource-option] -i id

DESCRIPTION
       ipcs provides information on the inter-process communication facilities for which the calling process has read access.

OPTIONS
       -i, --id id
              Print details only on the resource identified by id.

       -h, --help
              Display a help text and exit.

       -V, --version
              Display version information and exit.

   Resource options
       -q, --queues
              Write information about active message queues.

       -m, --shmems
              Write information about active shared memory segments.

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
              Write  time  information.   The  time  of  the  last control operation that changed the access permissions for all facilities, the time of the last msgsnd() and msgrcv() operations on message
              queues, the time of the last shmat() and shmdt() operations on shared memory, and the time of the last semop() operation on semaphores.

       -u, --summary
              Show status summary.

   Representation
       These affect only the -l (--limits) option.

       -b, --bytes
              Print sizes in bytes.

       --human
              Print sizes in human-readable format.

SEE ALSO
       ipcrm(1), ipcmk(1), msgrcv(2), msgsnd(2), semget(2), semop(2), shmat(2), shmdt(2), shmget(2)

CONFORMING TO
       The Linux ipcs utility is not fully compatible to the POSIX ipcs utility.  The Linux version does not support the POSIX -a, -b and -o options, but does support the -l and -u options not  defined  by
       POSIX.  A portable application shall not use the -a, -b, -o, -l, and -u options.

AUTHOR
       Krishna Balasubramanian ⟨balasub@cis.ohio-state.edu⟩

AVAILABILITY
       The ipcs command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                       January 2013                                                                                         IPCS(1)
