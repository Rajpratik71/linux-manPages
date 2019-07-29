DEALLOCVT(1)                                                                            General Commands Manual                                                                           DEALLOCVT(1)

NAME
       deallocvt - deallocate unused virtual consoles

SYNOPSIS
       deallocvt [N ...]

DESCRIPTION
       The  command deallocvt deallocates kernel memory and data structures for all unused virtual consoles.  If one or more arguments N ...  are given, only the corresponding consoles /dev/ttyN are
       deallocated.

       A virtual console is unused if it is not the foreground console, and no process has it open for reading or writing, and no text has been selected on its screen.

SEE ALSO
       chvt(1), openvt(1)

                                                                                              17 Mar 1997                                                                                 DEALLOCVT(1)
