CRIU-NS(1)                                                          CRIU Manual                                                         CRIU-NS(1)

NAME
       criu-ns - run criu in different namespaces

SYNOPSIS
       criu-ns dump -t PID [<options>]

       criu-ns pre-dump -t PID [<options>]

       criu-ns restore [<options>]

       criu-ns check [<options>]

DESCRIPTION
       The criu-ns command executes criu in a new PID and mount namespace. The purpose of this wrapper script is to enable restoring a process
       tree that might require a specific PID that is already used on the system; so called "PID mismatch" problem.

SEE ALSO
       nsenter(1) namespaces(7) criu(8)

AUTHOR
       The CRIU team

criu                                                                2022-06-27                                                          CRIU-NS(1)
