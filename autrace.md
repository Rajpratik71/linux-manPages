AUTRACE:(8)                                               System Administration Utilities                                              AUTRACE:(8)

NAME
       autrace - a program similar to strace

SYNOPSIS
       autrace program [-r] [program-args]...

DESCRIPTION
       autrace is a program that will add the audit rules to trace a process similar to strace. It will then execute the program passing arguments
       to it. The resulting audit information will be in the audit logs if the audit daemon is running or syslog. This command deletes  all  audit
       rules  prior  to  executing the target program and after executing it. As a safety precaution, it will not run unless all rules are deleted
       with auditctl prior to use.

OPTIONS
       -r     Limit syscalls collected to ones needed for analyzing resource usage. This could help people doing threat modeling. This saves space
              in logs.

EXAMPLES
       The following illustrates a typical session:

       autrace /bin/ls /tmp
       ausearch --start recent -p 2442 -i

       and for resource usage mode:

       autrace -r /bin/ls
       ausearch --start recent -p 2450 --raw | aureport --file --summary
       ausearch --start recent -p 2450 --raw | aureport --host --summary

SEE ALSO
       ausearch(8), auditctl(8).

AUTHOR
       Steve Grubb

Red Hat                                                              Jan 2007                                                          AUTRACE:(8)
