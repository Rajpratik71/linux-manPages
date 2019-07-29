SETPRIV(1)                                                                                      User Commands                                                                                      SETPRIV(1)



NAME
       setpriv - run a program with different Linux privilege settings

SYNOPSIS
       setpriv [options] program [arguments]

DESCRIPTION
       Sets or queries various Linux privilege settings that are inherited across execve(2).

       The difference between the commands setpriv and su (or runuser) is that setpriv does not use open PAM session and does not ask for password.  It's simple non-set-user-ID wrapper around execve system
       call.

OPTION
       --clear-groups
              Clear supplementary groups.

       -d, --dump
              Dump current privilege state.  Can be specified more than once to show extra, mostly useless, information.  Incompatible with all other options.

       --groups group...
              Set supplementary groups.  The argument is a comma-separated list.

       --inh-caps (+|-)cap...  or  --bounding-set (+|-)cap...
              Set the inheritable capabilities or the capability bounding set.  See capabilities(7).  The argument is a comma-separated list of +cap and -cap entries, which add or remove an  entry  respec-
              tively.   +all  and  -all  can  be  used to add or remove all caps.  The set of capabilities starts out as the current inheritable set for --inh-caps and the current bounding set for --bound-
              ing-set.  If you drop something from the bounding set without also dropping it from the inheritable set, you are likely to become confused.  Do not do that.

       --keep-groups
              Preserve supplementary groups.  Only useful in conjunction with --rgid, --egid, or --regid.

       --list-caps
              List all known capabilities.  This option must be specified alone.

       --no-new-privs
              Set the no_new_privs bit.  With this bit set, execve(2) will not grant new privileges.  For example, the set-user-ID and set-group-ID bits as well  as  file  capabilities  will  be  disabled.
              (Executing  binaries with these bits set will still work, but they will not gain privileges.  Certain LSMs, especially AppArmor, may result in failures to execute certain programs.)  This bit
              is inherited by child processes and cannot be unset.  See prctl(2) and Documentation/prctl/no_new_privs.txt in the Linux kernel source.

              The no_new_privs bit is supported since Linux 3.5.

       --rgid gid, --egid gid, --regid gid
              Set the real, effective, or both GIDs.  The gid argument can be given as textual group name.

              For safety, you must specify one of --clear-groups, --groups, or --keep-groups if you set any primary gid.

       --ruid uid, --euid uid, --reuid uid
              Set the real, effective, or both UIDs.  The uid argument can be given as textual login name.

              Setting a uid or gid does not change capabilities, although the exec call at the end might change capabilities.  This means that, if you are root, you probably want to do something like:

                      setpriv --reuid=1000 --regid=1000 --caps=-all

       --securebits (+|-)securebit...
              Set or clear securebits.  The argument is a comma-separated list.  The valid securebits are noroot, noroot_locked, no_setuid_fixup, no_setuid_fixup_locked, and keep_caps_locked.  keep_caps is
              cleared by execve(2) and is therefore not allowed.

       --selinux-label label
              Request  a  particular SELinux transition (using a transition on exec, not dyntrans).  This will fail and cause setpriv(1) to abort if SELinux is not in use, and the transition may be ignored
              or cause execve(2) to fail at SELinux's whim.  (In particular, this is unlikely to work in conjunction with no_new_privs.)  This is similar to runcon(1).

       --apparmor-profile profile
              Request a particular AppArmor profile (using a transition on exec).  This will fail and cause setpriv(1) to abort if AppArmor is not in use,  and  the  transition  may  be  ignored  or  cause
              execve(2) to fail at AppArmor's whim.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

NOTES
       If applying any specified option fails, program will not be run and setpriv will return with exit code 127.

       Be  careful with this tool -- it may have unexpected security consequences.  For example, setting no_new_privs and then execing a program that is SELinux-confined (as this tool would do) may prevent
       the SELinux restrictions from taking effect.

SEE ALSO
       runuser(1), su(1), prctl(2), capabilities(7)

AUTHOR
       Andy Lutomirski ⟨luto@amacapital.net⟩

AVAILABILITY
       The setpriv command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        July 2014                                                                                        SETPRIV(1)
