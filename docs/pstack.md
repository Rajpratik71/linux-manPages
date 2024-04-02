GSTACK(1)                                                                                 Linux Programmer's Manual                                                                                 GSTACK(1)



NAME
       gstack - print a stack trace of a running process


SYNOPSIS
       gstack pid


DESCRIPTION
       gstack  attaches  to  the  active  process  named  by  the pid on the command line, and prints out an execution stack trace.  If ELF symbols exist in the binary (usually the case unless you have run
       strip(1)), then symbolic addresses are printed as well.

       If the process is part of a thread group, then gstack will print out a stack trace for each of the threads in the group.


SEE ALSO
       nm(1), ptrace(2), gdb(1)


AUTHORS
       Ross Thompson <ross@whatsis.com>

       Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>



Red Hat Linux                                                                                    Feb 15 2008                                                                                        GSTACK(1)
