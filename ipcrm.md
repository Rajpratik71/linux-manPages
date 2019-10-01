IPCRM(1)                                                                                        User Commands                                                                                        IPCRM(1)



NAME
       ipcrm - remove a message queue, semaphore set or shared memory id

SYNOPSIS
       ipcrm [options]
       ipcrm {shm|msg|sem} id...

DESCRIPTION
       ipcrm  removes  System  V interprocess communication (IPC) objects and associated data structures from the system.  In order to delete such objects, you must be superuser, or the creator or owner of
       the object.

       System V IPC objects are of three types: shared memory, message queues, and semaphores.  Deletion of a message queue or semaphore object is immediate (regardless of whether any process  still  holds
       an IPC identifier for the object).  A shared memory object is only removed after all currently attached processes have detached (shmdt(2)) the object from their virtual address space.

       Two  syntax  styles  are  supported.   The old Linux historical syntax specifies a three letter keyword indicating which class of object is to be deleted, followed by one or more IPC identifiers for
       objects of this type.

       The SUS-compliant syntax allows the specification of zero or more objects of all three types in a single command line, with objects specified either by key or by identifier. (See below.)  Both  keys
       and identifiers may be specified in decimal, hexadecimal (specified with an initial '0x' or '0X'), or octal (specified with an initial '0').

OPTIONS
       -M, --shmem-key shmkey
              removes the shared memorysegment created with shmkey after the last detach is performed.

       -m, --shmem-id shmid
              removes the shared memory segment identified by shmid after the last detach is performed.

       -Q, --queue-key msgkey
              removes the message queue created with msgkey.

       -q, --queue-id msgid
              removes the message queue identified by msgid.

       -S, --semaphore-key semkey
              removes the semaphore created with semkey.

       -s, --semaphore-id semid
              removes the semaphore identified by semid.

       -a, --all [shm msg sem]
              Remove  all  resources.  When  option  argument  is provided the removal is performed only to for the specified resource types. Warning! Do not use -a if you are unsure how the software using
              resources might react on missing objects. Some programs create these resources at start up and may not have any code to deal unexpected disappearance.

       The details of the removes are described in msgctl(2), shmctl(2), and semctl(2).  The identifiers and keys may be found by using ipcs(1).

NOTES
       In its first Linux implementation, ipcrm used the deprecated syntax shown in the SYNOPSIS.  Functionality present in other *nix implementations of ipcrm has since been added, namely the  ability  to
       delete resources by key (not just identifier), and to respect the same command-line syntax. For backward compatibility the previous syntax is still supported.

SEE ALSO
       ipcs(1), ipcmk(1), msgctl(2), msgget(2), semctl(2), semget(2), shmctl(2), shmdt(2), shmget(2), ftok(3)

AVAILABILITY
       The ipcrm command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2011                                                                                       IPCRM(1)
