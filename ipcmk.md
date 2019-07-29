IPCMK(1)                        User Commands                        IPCMK(1)

NAME
       ipcmk - make various IPC resources

SYNOPSIS
       ipcmk [options]

DESCRIPTION
       ipcmk allows you to create shared memory segments, message queues, and
       semaphore arrays.

OPTIONS
       Resources can be specified with these options:

       -M, --shmem size
              Create a shared memory segment of size bytes.  The  size  argu‐
              ment  may  be  followed  by  the  multiplicative  suffixes  KiB
              (=1024), MiB (=1024*1024), and so on for GiB, etc. (the "iB" is
              optional,  e.g., "K" has the same meaning as "KiB") or the suf‐
              fixes KB (=1000), MB (=1000*1000), and so on for GB, etc.

       -Q, --queue
              Create a message queue.

       -S, --semaphore number
              Create a semaphore array with number of elements.

       Other options are:

       -p, --mode mode
              Access permissions for the resource.  Default is 0644.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

SEE ALSO
       ipcrm(1), ipcs(1)

AUTHOR
       Hayden A. James ⟨hayden.james@gmail.com⟩

AVAILABILITY
       The ipcmk command is part of the util-linux package and  is  available
       from   Linux  Kernel  Archive  ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                        July 2014                          IPCMK(1)
