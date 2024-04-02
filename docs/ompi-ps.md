OMPI-PS(1)                                                           Open MPI                                                           OMPI-PS(1)

NAME
       ompi-ps, orte-ps - Displays information about the active jobs and processes in Open MPI.

       NOTE: ompi-ps, and orte-ps are exact synonyms for each other. Using any of the names will result in exactly identical behavior.

SYNOPSIS
       ompi-ps [ options ]

Options
       ompi-ps will display information about running job(s) in the current universe.

       -h | --help
                 Display help for this command

       -v | --verbose
                 Enable verbose output for debugging

       --daemons Display daemon job information.

       -j | --jobid
                 Display the state of a specific job in the universe. By default all jobs will be displayed.

       -p | --vpid
                 Display  the  state  of  a  specific vpid (process) in the universe. By default all vpids cooresponding to processes will be dis‐
                 played. Must be used in conjunction with the --jobid option.

       -n | --nodes
                 Display all of the allocated nodes, and their cooresponding states. By default this is disabled.

       -gmca | --gmca <key> <value>
                 Pass global MCA parameters that are applicable to all contexts. <key> is the parameter name; <value> is the parameter value.

       -mca | --mca <key> <value>
                 Send arguments to various MCA modules.

DESCRIPTION
       ompi-ps displays the state of jobs running inside an Open RTE universe.

SEE ALSO
       orterun(1), orte-clean(1)

1.10.2                                                             Jan 21, 2016                                                         OMPI-PS(1)
