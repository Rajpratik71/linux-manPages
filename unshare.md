UNSHARE(1)                                                                                    User Commands                                                                                    UNSHARE(1)

NAME
       unshare - run program with some namespaces unshared from parent

SYNOPSIS
       unshare [options] program [arguments]

DESCRIPTION
       Unshares the indicated namespaces from the parent process and then executes the specified program.

       The  namespaces can optionally be persisted by bind mounting /proc/[pid]/ns/[type] files to a filesystem path and entered with nsenter(1) even after program terminates.  Once a persistent names‐
       pace is no longer needed it can be unpersisted with umount(8).  See EXAMPLES section for more details.

       The namespaces to be unshared are indicated via options.  Unshareable namespaces are:

       mount namespace
              Mounting and unmounting filesystems will not affect the rest of the system (CLONE_NEWNS flag), except for filesystems which are explicitly marked as shared (with mount --make-shared;  see
              /proc/self/mountinfo or findmnt -o+PROPAGATION for the shared flags).

              unshare since util-linux version 2.27 automatically sets propagation to private in the new mount namespace to make sure that the new namespace is really unshared. This feature is possible
              to disable by option --propagation unchanged.  Note that private is the kernel default.

       UTS namespace
              Setting hostname or domainname will not affect the rest of the system.  (CLONE_NEWUTS flag)

       IPC namespace
              The process will have an independent namespace for System V message queues, semaphore sets and shared memory segments.  (CLONE_NEWIPC flag)

       network namespace
              The process will have independent IPv4 and IPv6 stacks, IP routing tables, firewall rules, the /proc/net and /sys/class/net directory trees, sockets, etc.  (CLONE_NEWNET flag)

       pid namespace
              Children will have a distinct set of PID to process mappings from their parent.  (CLONE_NEWPID flag)

       user namespace
              The process will have a distinct set of UIDs, GIDs and capabilities.  (CLONE_NEWUSER flag)

       See clone(2) for the exact semantics of the flags.

OPTIONS
       -i, --ipc[=file]
              Unshare the IPC namespace. If file is specified then persistent namespace is created by bind mount.

       -m, --mount[=file]
              Unshare the mount namespace. If file is specified then persistent namespace is created by bind mount.

       -n, --net[=file]
              Unshare the network namespace. If file is specified then persistent namespace is created by bind mount.

       -p, --pid[=file]
              Unshare the pid namespace. If file is specified then persistent namespace is created by bind mount. See also the --fork and --mount-proc options.

       -u, --uts[=file]
              Unshare the UTS namespace. If file is specified then persistent namespace is created by bind mount.

       -U, --user[=file]
              Unshare the user namespace. If file is specified then persistent namespace is created by bind mount.

       -f, --fork
              Fork the specified program as a child process of unshare rather than running it directly.  This is useful when creating a new pid namespace.

       --mount-proc[=mountpoint]
              Just before running the program, mount the proc filesystem at mountpoint (default is /proc).  This is useful when creating a new pid namespace.  It  also  implies  creating  a  new  mount
              namespace since the /proc mount would otherwise mess up existing programs on the system.  The new proc filesystem is explicitly mounted as private (by MS_PRIVATE|MS_REC).

       -r, --map-root-user
              Run  the  program  only after the current effective user and group IDs have been mapped to the superuser UID and GID in the newly created user namespace.  This makes it possible to conve‐
              niently gain capabilities needed to manage various aspects of the newly created namespaces (such as configuring interfaces in the network namespace or mounting filesystems  in  the  mount
              namespace)  even  when  run  unprivileged.  As a mere convenience feature, it does not support more sophisticated use cases, such as mapping multiple ranges of UIDs and GIDs.  This option
              implies --setgroups=deny.

       --propagation private|shared|slave|unchanged
              Recursively sets mount propagation flag in the new mount namespace. The default is to set the propagation to private, this feature is  possible  to  disable  by  unchanged  argument.  The
              options is silently ignored when mount namespace (--mount) is not requested.

       --setgroups allow|deny
              Allow or deny setgroups(2) syscall in user namespaces.

              setgroups(2) is only callable with CAP_SETGID and CAP_SETGID in a user namespace (since Linux 3.19) does not give you permission to call setgroups(2) until after GID map has been set. The
              GID map is writable by root when setgroups(2) is enabled and GID map becomes writable by unprivileged processes when setgroups(2) is permanently disabled.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXAMPLES
       # unshare --fork --pid --mount-proc readlink /proc/self
       1
              Establish a PID namespace, ensure we're PID 1 in it against newly mounted procfs instance.

       $ unshare --map-root-user --user sh -c whoami
       root
              Establish a user namespace as an unprivileged user with a root user within it.

       # touch /root/uts-ns
       # unshare --uts=/root/uts-ns hostanme FOO
       # nsenter --uts=/root/uts-ns hostname
       FOO
       # umount /root/uts-ns
              Establish a persistent UTS namespace, modify hostname. The namespace maybe later entered by nsenter. The namespace is destroyed by umount the bind reference.

SEE ALSO
       unshare(2), clone(2), mount(8)

AUTHORS
       Mikhail Gusarov ⟨dottedmag@dottedmag.net⟩
       Karel Zak ⟨kzak@redhat.com⟩

AVAILABILITY
       The unshare command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                      July 2014                                                                                      UNSHARE(1)
