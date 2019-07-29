LSIPC(1)                        User Commands                        LSIPC(1)

NAME
       lsipc  -  show information on IPC facilities currently employed in the
       system

SYNOPSIS
       lsipc [options]

DESCRIPTION
       lsipc shows information on the inter-process communication  facilities
       for which the calling process has read access.

OPTIONS
       -i, --id id
              Show  full  details on just the one resource element identified
              by id.  This option needs to be combined with one of the  three
              resource options: -m, -q or -s.  It is possible to override the
              default output format for this option with the  --list,  --raw,
              --json or --export option.

       -g, --global
              Show  system-wide  usage  and  limits  of  IPC resources.  This
              option may be combined with one of the three resource  options:
              -m,  -q  or  -s.   The default is to show information about all
              resources.

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

   Output formatting
       -c, --creator
              Show creator and owner.

       -e, --export
              Output data in the format of NAME=VALUE.

       -J, --json
              Use the JSON output format.

       -l, --list
              Use the list output format.  This is the default,  except  when
              --id is used.

       -n, --newline
              Display each piece of information on a separate line.

       --noheadings
              Do not print a header line.

       --notruncate
              Don't truncate output.

       -o, --output list
              Specify  which  output  columns  to print.  Use --help to get a
              list of all supported columns.

       -b, --bytes
              Print size in bytes rather than in human readable format.

       -r, --raw
              Raw output (no columnation).

       -t, --time
              Write time information.  The time of the last control operation
              that  changed  the  access  permissions for all facilities, the
              time of the last msgsnd(2) and msgrcv(2) operations on  message
              queues,  the  time of the last shmat(2) and shmdt(2) operations
              on shared memory, and the time of the last  semop(2)  operation
              on semaphores.

       --time-format type
              Display  dates  in  short,  full or iso format.  The default is
              short, this time format is designed to be space  efficient  and
              human readable.

       -P, --numeric-perms
              Print numeric permissions in PERMS column.

EXIT STATUS
       0      if OK,

       1      if incorrect arguments specified,

       2      if a serious error occurs.

SEE ALSO
       ipcmk(1),   ipcrm(1),   msgrcv(2),   msgsnd(2),  semget(2),  semop(2),
       shmat(2), shmdt(2), shmget(2)

HISTORY
       The lsipc utility is inspired by the ipcs utility.

AUTHORS
       Ondrej Oprala ⟨ooprala@redhat.com⟩
       Karel Zak ⟨kzak@redhat.com⟩

AVAILABILITY
       The lsipc command is part of the util-linux package and  is  available
       from   Linux  Kernel  Archive  ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                      November 2015                        LSIPC(1)
