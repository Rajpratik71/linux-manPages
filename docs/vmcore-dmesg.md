VMCORE-DMESG(8)                                                                            System Manager's Manual                                                                            VMCORE-DMESG(8)



NAME
       vmcore-dmesg - This is just a placeholder until real man page has been written

SYNOPSIS
       vmcore-dmesg  vmcore

DESCRIPTION
       vmcore-dmesg  extracts  the  dmesg from a vmcore and write it to standard out.  vmcore-dmesg works against either /proc/vmcore in a crash dump capture context or a copy of /proc/vmcore that has been
       saved for later analysis.  A single build of vmcore-dmesg should work against any linux vmcore written created on any architecture.


SEE ALSO
       kexec(8)

AUTHOR
       vmcore-dmesg was written by Eric Biederman.



                                                                                                 Sep 7, 2010                                                                                  VMCORE-DMESG(8)
