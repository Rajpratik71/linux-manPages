SETPRIV(1)                                                                                      User Commands                                                                                      SETPRIV(1)



NAME
       setpriv - run a program with different Linux privilege settings

SYNOPSIS
       setpriv [options] program [arguments]

DESCRIPTION
       Sets or queries various Linux privilege settings that are inherited across execve(2).

OPTION
       -d, --dump
              Dumps current privilege state.  Specify more than once to show extra, mostly useless, information.  Incompatible with all other options.

       --no-new-privs
              Sets  the  no_new_privs  bit.   With this bit set, execve(2) will not grant new privileges.  For example, the setuid and setgid bits as well as file capabilities will be disabled.  (Executing
              binaries with these bits set will still work, but they will not gain privilege.  Certain LSMs, especially AppArmor, may result in failures to execute certain programs.) This bit is  inherited
              by child processes and cannot be unset.  See prctl(2) and Documentation/prctl/no_new_privs.txt in the Linux kernel source.

              The no_new_privs bit is supported since Linux 3.5.

       --inh-caps (+|-)cap,... or --bounding-set (+|-)cap,...
              Sets  inheritable  capabilities  or capability bounding set.  See capabilities(7).  The argument is a comma-separated list of +cap and -cap entries, which add or remove an entry respectively.
              +all and -all can be used to add or remove all caps.  The set of capabilities starts out as the current inheritable set for --inh-caps and the current bounding set for --bounding-set.  If you
              drop something from the bounding set without also dropping it from the inheritable set, you are likely to become confused.  Do not do that.

       --list-caps
              Lists all known capabilities.  Must be specified alone.

       --ruid uid, --euid uid, --reuid uid
              Sets the real, effective, or both uids.

              Setting uid or gid does not change capabilities, although the exec call at the end might change capabilities.  This means that, if you are root, you probably want to do something like:

              --reuid=1000 --regid=1000 --caps=-all

       --rgid gid, --egid gid, --regid gid
              Sets the real, effective, or both gids.

              For safety, you must specify one of --keep-groups, --clear-groups, or --groups if you set any primary gid.

       --clear-groups
              Clears supplementary groups.

       --keep-groups
              Preserves supplementary groups.  Only useful in conjunction with --rgid, --egid, or --regid.

       --groups group,...
              Sets supplementary groups.

       --securebits (+|-)securebit,...
              Sets  or clears securebits.  The valid securebits are noroot, noroot_locked, no_setuid_fixup, no_setuid_fixup_locked, and keep_caps_locked.  keep_caps is cleared by execve(2) and is therefore
              not allowed.

       --selinux-label label
              Requests a particular SELinux transition (using a transition on exec, not dyntrans).  This will fail and cause setpriv(1) to abort if SELinux is not in use, and the transition may be  ignored
              or cause execve(2) to fail at SELinux's whim.  (In particular, this is unlikely to work in conjunction with no_new_privs.)  This is similar to runcon(1).

       --apparmor-profile profile
              Requests  a  particular  AppArmor  profile  (using  a  transition on exec).  This will fail and cause setpriv(1) to abort if AppArmor is not in use, and the transition may be ignored or cause
              execve(2) to fail at AppArmor's whim.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help and exit.

NOTES
       If applying any specified option fails, program will not be run and setpriv will return with exit code 127.

       Be careful with this tool -- it may have unexpected security consequences.  For example, setting no_new_privs and then execing a program that is SELinux-confined (as this tool would do) may  prevent
       the SELinux restrictions from taking effect.

SEE ALSO
       prctl(2), capability(7)

AUTHOR
       Andy Lutomirski ⟨luto@amacapital.net⟩

AVAILABILITY
       The setpriv command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                       January 2013                                                                                      SETPRIV(1)
