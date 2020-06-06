NETREPORT(1)                                                                               General Commands Manual                                                                               NETREPORT(1)



NAME
       netreport - request notification of network interface changes

SYNOPSIS
       netreport [-r]

DESCRIPTION
       netreport tells the network management scripts to send a SIGIO signal to the process which called netreport when any network interface status changes occur.

OPTIONS
       -r     Remove the current request (if any) for the calling process.

NOTES
       If  a  program does not call netreport with the -r option before it exits, and another process is created with the same PID before any changes take place in interface status, it is possible that the
       new process will receive a spurious SIGIO.



RH                                                                                              Red Hat, Inc.                                                                                    NETREPORT(1)
