IPCMK(1)                                                                                        User Commands                                                                                        IPCMK(1)



NAME
       ipcmk - create various ipc resources

SYNOPSIS
       ipcmk <resource options> [additional options]

DESCRIPTION
       ipcmk allows you to create shared memory segments, message queues or semaphore arrays.

RESOURCE OPTIONS
       Resources may be specified as follows:

       -M, --shmem [size]
              Shared memory segment of size bytes.

       -S, --semaphore [number]
              Semaphore array with number of elements.

       -Q, --queue
              Message queue.

ADDITIONAL OPTIONS
       -p, --mode [mode]
              Permission for the resource. Default is 0644.

       -h, --help
              Display a short help message and exit.

       -V, --version
              Output version information and exit.

SEE ALSO
       ipcrm(1), ipcs(1)

AUTHOR
       Hayden A. James ⟨hayden.james@gmail.com⟩

AVAILABILITY
       The ipcmk command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2011                                                                                       IPCMK(1)
