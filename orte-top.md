OMPI-TOP(1)                                                          Open MPI                                                          OMPI-TOP(1)

NAME
       ompi-top, orte-top - Diagnostic to provide process info similar to the popular "top" program.

       NOTE: ompi-top, and orte-top are exact synonyms for each other. Using any of the names will result in exactly identical behavior.

SYNOPSIS
       ompi-top [ options ]

Options
       ompi-top collects and displays process information in a manner similar to that of the popular "top" program.

       -h | --help
                 Display help for this command

       -pid | --pid <value>
                 The  pid of the mpirun whose processes you want information about, or the name of the file (specified as file:filename) that con‐
                 tains that info. Note that the ompi-top command must be executed on the same node as mpirun to use this option.

       -uri | --uri <value>
                 Specify the URI of the mpirun whose processes you want information about, or the name of the file  (specified  as  file:filename)
                 that  contains  that  info.  Note  that  the ompi-top command does not have to be executed on the same node as mpirun to use this
                 option.

       -rank | --rank <value>
                 The rank of the processes to be monitored. This can consist of a single rank, or a  comma-separated  list  of  ranks.  These  can
                 include rank ranges separated by a '-'.  If this option is not provided, or a value of -1 is given, ompi-top will default to dis‐
                 playing information on all ranks.

       -bynode | --bynode
                 Display the results grouped by node, with each node's processes reported in rank order. If this option is not provided,  ompi-top
                 will default to displaying all results in rank order.

       -update-rate | --update-rate <value>
                 The time (in seconds) between updates of the displayed information. If this option is not provided, ompi-top will default to exe‐
                 cuting only once.

       -timestamp | --timestamp
                 Provide an approximate time when each sample was taken. This time is approximate as it only shows the time when the  sample  com‐
                 mand was issued.

       -log-file | --log-file <value>
                 Log the results to the specified file instead of displaying them to stdout.

DESCRIPTION
       ompi-top collects and displays process information in a manner similar to that of the popular "top" program. It doesn't do the fancy screen
       display, but does allow you to monitor available process information (to the limits of the underlying operating system) of processes  irre‐
       spective of their location.

SEE ALSO
1.10.2                                                             Jan 21, 2016                                                        OMPI-TOP(1)
