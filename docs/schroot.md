SCHROOT(1)                                                         Debian sbuild                                                        SCHROOT(1)

NAME
       schroot - securely enter a chroot environment

SYNOPSIS
       schroot  [-h|--help  |  -V|--version    |  -l|--list  |  -i|--info   | --config | --location  | --automatic-session  | -b|--begin-session |
       --recover-session  | -r|--run-session | -e|--end-session] [-f|--force] [-n session-name|--session-name=session-name] [-d directory|--direc‐
       tory=directory]   [-u   user|--user=user]   [-p|--preserve-environment]   [-s   shell|--shell=shell]   [-q|--quiet   |   -v|--verbose]  [-c
       chroot|--chroot=chroot  | [--all | --all-chroots | --all-source-chroots | --all-sessions] [--exclude-aliases]] [-o|--option=key=value] [--]
       [COMMAND [ ARG1 [ ARG2 [ ARGn]]]]

DESCRIPTION
       schroot  allows  the  user  to  run  a command or a login shell in a chroot environment.  If no command is specified, a login shell will be
       started in the user's current working directory inside the chroot.

       The command is a program, plus as many optional arguments as required.  Each argument may be separately quoted.

       The directory the command or login shell is run in depends upon the context.  See --directory option below for a complete description.

       All chroot usage will be logged in the system logs.  Under some circumstances, the user may be required to authenticate themselves; see the
       section “Authentication”, below.

       If no chroot is specified, the chroot name or alias ‘default’ will be used as a fallback.  This is equivalent to “--chroot=default”.

OVERVIEW
       There  is  often  a need to run programs in a virtualised environment rather than on the host system directly.  Unlike other virtualisation
       systems such as kvm or Xen, schroot does not virtualise the entire system; it only virtualises  the  filesystem,  and  some  parts  of  the
       filesystem  may  still  be  shared  with  the host.  It is therefore fast, lightweight and flexible.  However, it does not virtualise other
       aspects of the system, such as shared memory, networking, devices etc., and so may be less secure than other systems,  depending  upon  its
       intended use.  Some examples of existing uses for schroot include:

       ·      Running  an untrusted program in a sandbox, so that it can't interfere with files on the host system; this may also be used to limit
              the damage a compromised service can inflict upon the host

       ·      Using a defined or clean environment, to guarantee the reproducibility and integrity of a given task

       ·      Using different versions of an operating system, or even different operating systems altogether, e.g. different GNU/Linux  distribu‐
              tions

       ·      Running 32-bit programs using a 32-bit chroot on a 64-bit host system

       ·      Automatic  building of Debian packages using sbuild(1), which builds each package in a pristine chroot snapshot when using LVM snap‐
              shots or unions

       ·      Supporting multiple system images in a cluster setup, where modifying the base image is time-consuming  and/or  supporting  all  the
              required  configurations  needed by users is difficult: different chroots can support all the different configurations required, and
              cluster users may be given access to the chroots they need (which can include root access for trusted users to  maintain  their  own
              images)

       A  chroot  may  be used directly as root by running chroot(8), but normal users are not able to use this command.  schroot allows access to
       chroots for normal users using the same mechanism, but with several additional features.  While schroot uses a directory as a  chroot  just
       like  chroot(8),  it  does not require this to be a regular directory in the filesystem.  While this is the default, the chroot can also be
       created from a file, a filesystem, including LVM and Btrfs snapshots and loopback mounts, or composed of a unionfs  overlay.   Being  user-
       extensible, the scope for creating chroots from different sources is limited only by your imagination.  schroot performs permissions check‐
       ing and allows additional automated setup of the chroot environment, such as mounting additional filesystems and other configuration tasks.
       This  automated  setup  is  done  through the action of setup scripts which may be customised and extended to perform any actions required.
       Typical actions include mounting the user's home directory, setting up networking and system databases,  and  even  starting  up  services.
       These  are  again entirely customisable by the admin.  The setup scripts are run for all types of chroot, with the exception of the ‘plain’
       type, the simplest chroot type, offering no automated setup features at all.  The configuration of schroot is covered  in  more  detail  in
       schroot.conf(5).

OPTIONS
       schroot accepts the following options:

   Actions
       -h, --help
              Show help summary.

       -V, --version
              Print version information.

       -l, --list
              List all available chroots.

       -i, --info
              Print detailed information about the specified chroots.

       --config
              Print  configuration of the specified chroots.  This is useful for testing that the configuration in use is the same as the configu‐
              ration file.  Any comments in the original file will be missing.

       --location
              Print location (path) of the specified chroots.  Note that chroot types which can only be used within a  session  will  not  have  a
              location until they are active.

   General options
       -q, --quiet
              Print only essential messages.

       -v, --verbose
              Print all messages.

   Chroot selection
       -c, --chroot=chroot
              Specify  a  chroot  or active session to use.  This option may be used multiple times to specify more than one chroot, in which case
              its effect is similar to --all.  The chroot name may be prefixed with a namespace; see the section “Chroot Namespaces”, below.

       -a, --all
              Select all chroots, source chroots and active sessions.  When a command has been specified, the command will be run in all  chroots,
              source  chroots  and  active  sessions.   If --info has been used, display information about all chroots.  This option does not make
              sense to use with a login  shell  (run  when  no  command  has  been  specified).   This  option  is  equivalent  to  “--all-chroots
              --all-source-chroots --all-sessions”.

       --all-chroots
              Select all chroots.  Identical to --all, except that source chroots and active sessions are not considered.

       --all-sessions
              Select all active sessions.  Identical to --all, except that chroots and source chroots are not considered.

       --all-source-chroots
              Select all source chroots.  Identical to --all, except that chroots and sessions are not considered.

       --exclude-aliases
              Do not select aliases in addition to chroots.  This ensures that only real chroots are selected, and are only listed once.

   Chroot environment
       -d, --directory=directory
              Change  to  directory inside the chroot before running the command or login shell.  If directory is not available, schroot will exit
              with an error status.

              The default behaviour is as follows (all directory paths are inside the chroot).  A login shell is run in the current working direc‐
              tory.   If  this  is  not  available, it will try $HOME (when --preserve-environment is used), then the user's home directory, and /
              inside the chroot in turn.  A command is always run in the current working directory inside the chroot.  If none of the  directories
              are available, schroot will exit with an error status.

       -u, --user=user
              Run  as  a  different user.  The default is to run as the current user.  If required, the user may be required to authenticate them‐
              selves with a password.  For further information, see the section “Authentication”, below.

       -p, --preserve-environment
              Preserve the user's environment inside the chroot environment.  The default is to use a clean environment; this  option  copies  the
              entire  user environment and sets it in the session.  The environment variables allowed are subject to certain restrictions; see the
              section “Environment”, below.

       -s, --shell=shell
              Use shell as the login shell.  When running a login shell a number of potential shells will be considered, in this order:  the  com‐
              mand  in the SHELL environment variable (if --preserve-environment is used, or preserve-environment is enabled), the user's shell in
              the ‘passwd’ database, /bin/bash and finally /bin/sh.  This option overrides this list, and will  use  the  shell  specified.   This
              option also overrides the shell configuration key, if set.

       -o, --option=key=value
              Set an option.  The value of selected configuration keys in schroot.conf may be modified using this option.  The key must be present
              in the user-modifiable-keys configuration key in schroot.conf, or additionally  the  user-modifiable-keys  key  if  running  as  (or
              switching  to) the root user.  The key and value set here will be set in the environment of the setup scripts, and may hence be used
              to customise the chroot on a per-session basis.

   Session actions
       --automatic-session
              Begin, run and end a session automatically.  This is the default action, so does not require specifying in normal operation.

       -b, --begin-session
              Begin a session.  A unique session identifier (session ID) is returned on standard output.  The session ID is required  to  use  the
              other session options.  Note that the session identifier may be specified with the --session-name option.

       --recover-session
              Recover  an  existing  session.  If an existing session has become unavailable, for example becoming unmounted due to a reboot, this
              option will make the session available for use again, for example by remounting it.  The session ID is specified with  the  --chroot
              option.

       -r, --run-session
              Run an existing session.  The session ID is specified with the --chroot option.

       -e, --end-session
              End an existing session.  The session ID is specified with the --chroot option.

   Session options
       -n, --session-name=session-name
              Name a session.  The specified session-name replaces the default session name containing an automatically-generated session ID.  The
              session name must not contain a namespace qualifier, since sessions are always created within the ‘session:’ namespace.  The session
              name is also subject to the chroot naming restrictions documented in schroot.conf(5).

       -f, --force
              Force  a  session  operation,  even  if  it would otherwise fail.  This may be used to forcibly end a session, even if it has active
              users.  This does not guarantee that the session will be ended cleanly; filesystems may not be unmounted, for example.

   Separator
       --     End of options.  Used to indicate the end of the schroot options; any following options will be passed to  the  command  being  run,
              rather than to schroot.

AUTHENTICATION
       If  the  user  is  not  an  allowed user, or a member of the allowed groups (or if changing to root, the allowed root users or allowed root
       groups) for the specified chroot(s), permission will be immediately denied.  If switching users, and  the  user  running  the  command  has
       access, the user will be required to authenticate themselves using the credentials of the user being switched to.

       On  systems  supporting Pluggable Authentication Modules (PAM), schroot will use PAM for authentication and authorisation of users.  If and
       when required, schroot will prompt for a password.  If PAM is not available, all authentication will automatically fail (user switching  is
       not supported without PAM).

       Note that when PAM is in use, the root user is not granted any special privileges by default in the program.  However, the default PAM con‐
       figuration permits root to log in without a password (pam_rootok.so), but this may be disabled to prevent root from accessing  any  chroots
       except  if  specifically permitted.  In such a situation, root must be added to the allowed users or groups as for any other user or group.
       If PAM is not available, the root user will be permitted to access all chroots, even when not explicitly granted access.

CHROOT NAMESPACES
   Namespace basics
       There are three different types of chroot: regular chroots, source chroots and session chroots.  These different types of chroot are  sepa‐
       rated into different namespaces.  A namespace is a prefix to a chroot name.  Currently there are three namespaces: ‘chroot:’, ‘source:’ and
       ‘session:’.  Use --list --all to list all available chroots in all namespaces.  Because ‘:’ is used as the separator between namespace  and
       chroot names, it is not permitted to use this character in chroot names.

       Depending upon the action you request schroot to take, it may look for the chroot in one of the three namespaces, or a particular namespace
       may be specified.  For example, a chroot named “sid” is actually named “chroot:sid” if the namespace is included, but the namespace may  be
       omitted for most actions.

   Source chroots
       Some  chroot  types,  for  example LVM snapshots and Btrfs snapshots, provide session-managed copy-on-write snapshots of the chroot.  These
       also provide a source chroot to allow easy access to the filesystem used as a source for snapshotting.  These are regular chroots as  well,
       just  with the snapshotting disabled.  For a chroot named “sid-snapshot” (i.e. with a fully qualified name of “chroot:sid-snapshot”), there
       will also be a corresponding source chroot named “source:sid-snapshot”.  Earlier  versions  of  schroot  provided  source  chroots  with  a
       ‘-source’  suffix.   These are also provided for compatibility.  In this example, this would be called “chroot:sid-snapshot-source”.  These
       compatibility names will be dropped in a future version, so programs and scripts should  switch  to  using  the  namespace-qualified  names
       rather than the old suffix.

   Session chroots
       All  sessions  created  with  --begin-session are placed within the ‘session:’ namespace.  A session named with --session-name may have any
       name, even the same name as the chroot it was created from, providing that it is unique within this namespace.  This was not  permitted  in
       previous versions of schroot which did not have namespaces.

   Actions and default namespaces
       All  actions  use  ‘chroot:’ as the default namespace, with some session actions being the exception.  --run-session, --recover-session and
       --end-session use ‘session:’ as the default namespace instead, since these actions work on session chroots.  The upshot is that the  names‐
       pace  is  usually  never  required  except  when you need to work with a chroot in a namespace other than the default, such as when using a
       source chroot.  To make chroot selection unambiguous, it is always possible to use the full name including the  namespace,  even  when  not
       strictly required.

PERFORMANCE
       Performance  on some filesystems, for example Btrfs, is bad when running dpkg due to the amount of fsync operations performed.  This may be
       mitigated by installing the eatmydata package and then adding eatmydata to the command-prefix configuration key, which disables  all  fsync
       operations.   Note  that  this should only be done in snapshot chroots where data loss is not an issue.  This is useful when using a chroot
       for package building, for example.

DIRECTORY FALLBACKS
       schroot will select an appropriate directory to use within the chroot based upon whether an interactive login shell will be used, or a com‐
       mand  invoked,  and  additionally  if the --directory option is used.  In the case of running commands directly, or explicitly specifying a
       directory, only one directory will be used for safety and consistency, while for a login shell several possibilities  may  be  tried.   The
       following  subsections list the fallback sequence for each case.  CWD is the current working directory, DIR is the directory specified with
       --directory.

   Login shell
       ┌────────────────────┬──────────────────────────────────────────┐
       │Transition          │                                          │
       │(Host → Chroot)     │ Comment                                  │
       ├────────────────────┼──────────────────────────────────────────┤
       │CWD → CWD           │ Normal behaviour (if --directory is  not │
       │                    │ used)                                    │
       │CWD → $HOME         │ If   CWD   is   nonexistent  and  --pre‐ │
       │                    │ serve-environment is used                │
       │CWD → passwd pw_dir │ If  CWD  is   nonexistent   (or   --pre‐ │
       │                    │ serve-environment  is  used and no $HOME │
       │                    │ exists)                                  │
       │CWD → /             │ None of the above exist                  │
       │FAIL                │ If / is nonexistent                      │
       └────────────────────┴──────────────────────────────────────────┘
   Command
       ┌────────────────┬──────────────────────────────────────────┐
       │Transition      │                                          │
       │(Host → Chroot) │ Comment                                  │
       ├────────────────┼──────────────────────────────────────────┤
       │CWD → CWD       │ Normal behaviour (if --directory is  not │
       │                │ used)                                    │
       │FAIL            │ If CWD is nonexistent                    │
       └────────────────┴──────────────────────────────────────────┘
       No fallbacks should exist under any circumstances.

   --directory used
       ┌────────────────┬──────────────────────────────────────────┐
       │Transition      │                                          │
       │(Host → Chroot) │ Comment                                  │
       ├────────────────┼──────────────────────────────────────────┤
       │CWD → DIR       │ Normal behaviour                         │
       │FAIL            │ If DIR is nonexistent                    │
       └────────────────┴──────────────────────────────────────────┘
       No fallbacks should exist under any circumstances.

   Debugging
       Note that --debug=notice will show the internal fallback list computed for the session.

EXAMPLES
   List available chroots
       % schroot -l↵
       chroot:default
       chroot:etch
       chroot:sid
       chroot:testing
       chroot:unstable

   Get information about a chroot
       % schroot -i -c sid↵
         ——— Chroot ———
         Name                   sid
         Description            Debian sid (unstable)
         Type                   plain
         Priority               3
         Users                  rleigh
         Groups                 sbuild
         Root Users
         Root Groups            sbuild
         Aliases                unstable unstable-sbuild unstable-p
       owerpc-sbuild
         Environment Filter     ^(BASH_ENV|CDPATH|ENV|HOSTALIASES|I\
       FS|KRB5_CONFIG|KRBCONFDIR|KRBTKFILE|KRB_CONF|LD_.*|LOCALDOMA\
       IN|NLSPATH|PATH_LOCALE|RES_OPTIONS|TERMINFO|TERMINFO_DIRS|TE\
       RMPATH)$
         Run Setup Scripts      true
         Script Configuration   script-defaults
         Session Managed        true
         Personality            linux32
         Location               /srv/chroot/sid

       Use --all or -c multiple times to use all or multiple chroots, respectively.

   Running commands in a chroot
       % schroot -c sid /bin/ls↵
       [sid chroot] Running command: “/bin/ls”
       CVS          sbuild-chroot.c   sbuild-session.h  schroot.conf.5
       Makefile     sbuild-chroot.h   schroot.1         schroot.conf.5.in
       Makefile.am  sbuild-config.c   schroot.1.in
       Makefile.in  sbuild-config.h   schroot.c
       pam          sbuild-session.c  schroot.conf
       % schroot -c sid -- ls -1 | head -n 5↵
       [sid chroot] Running command: “ls -1”
       ABOUT-NLS
       AUTHORS
       COPYING
       ChangeLog
       INSTALL

       Use  --  to  allow options beginning with ‘-’ or ‘--’ in the command to run in the chroot.  This prevents them being interpreted as options
       for schroot itself.  Note that the top line was echoed to standard error, and the remaining lines to standard output.  This is intentional,
       so that program output from commands run in the chroot may be piped and redirected as required; the data will be the same as if the command
       was run directly on the host system.

   Switching users
       % schroot -c sid -u root↵
       Password:
       [sid chroot] (rleigh→root) Running login shell: “/bin/bash”
       #

       If the user ‘rleigh’ was in root-users in /etc/schroot/schroot.conf, or one of the groups he belonged to was in root-groups, they would  be
       granted root access without authentication, but the PAM authorisation step is still applied.

   Sessions
       A  chroot  may  be  needed to run more than one command.  In particular, where the chroot is created on the fly from an LVM LV or a file on
       disc, there is a need to make the chroot persistent while a given task (or set of tasks) is performed.  Sessions exist  for  this  purpose.
       For simple chroot types such as ‘plain’ and ‘directory’, sessions may be created but are not strictly necessary.

       Let's start by looking at a session-capable chroot:

       % schroot -i -c sid-snap↵
         ——— Chroot ———
         Name                   sid-snap
         Description            Debian sid snapshot
         Type                   lvm-snapshot
         Priority               3
         Users                  maks rleigh
         Groups                 sbuild
         Root Users
         Root Groups            root sbuild
         Aliases
         Environment Filter     ^(BASH_ENV|CDPATH|ENV|HOSTALIASES|I\
       FS|KRB5_CONFIG|KRBCONFDIR|KRBTKFILE|KRB_CONF|LD_.*|LOCALDOMA\
       IN|NLSPATH|PATH_LOCALE|RES_OPTIONS|TERMINFO|TERMINFO_DIRS|TE\
       RMPATH)$
         Run Setup Scripts      true
         Script Configuration   script-defaults
         Session Managed        true
         Personality            linux
         Device                 /dev/hda_vg/sid_chroot
         Mount Options          -o atime,async,user_xattr
         Source Users
         Source Groups          root rleigh
         Source Root Users
         Source Root Groups     root rleigh
         LVM Snapshot Options   --size 2G -c 128

       Note  that the Session Managed option is set to ‘true’.  This is a requirement in order to use session management, and is supported by most
       chroot types.  Next, we will create a new session:

       % schroot -b -c sid-snap↵
       sid-snap-46195b04-0893-49bf-beb8-0d4ccc899f0f

       The session ID of the newly-created session is returned on standard output.  It is common to store it like this:

       % SESSION=$(schroot -b -c sid-snap)↵
       % echo $SESSION↵
       sid-snap-46195b04-0893-49bf-beb8-0d4ccc899f0f

       The session may be used just like any normal chroot.  This is what the session looks like:

       % schroot -i -c sid-snap-46195b04-0893-49bf-beb8-0d4ccc899f0f↵
         ——— Session ———
         Name                   sid-snap-46195b04-0893-49bf-beb8-0d\
       4ccc899f0f
         Description            Debian sid snapshot
         Type                   lvm-snapshot
         Priority               3
         Users                  maks rleigh
         Groups                 sbuild
         Root Users
         Root Groups            root sbuild
         Aliases
         Environment Filter     ^(BASH_ENV|CDPATH|ENV|HOSTALIASES|I\
       FS|KRB5_CONFIG|KRBCONFDIR|KRBTKFILE|KRB_CONF|LD_.*|LOCALDOMA\
       IN|NLSPATH|PATH_LOCALE|RES_OPTIONS|TERMINFO|TERMINFO_DIRS|TE\
       RMPATH)$
         Run Setup Scripts      true
         Script Configuration   script-defaults
         Session Managed        true
         Personality            linux
         Mount Location         /var/lib/schroot/mount/sid-snap-461\
       95b04-0893-49bf-beb8-0d4ccc899f0f
         Path                   /var/lib/schroot/mount/sid-snap-461\
       95b04-0893-49bf-beb8-0d4ccc899f0f
         Mount Device           /dev/hda_vg/sid-snap-46195b04-0893-\
       49bf-beb8-0d4ccc899f0f
         Device                 /dev/hda_vg/sid_chroot
         Mount Options          -o atime,async,user_xattr
         Source Users
         Source Groups          root rleigh
         Source Root Users
         Source Root Groups     root rleigh
         LVM Snapshot Device    /dev/hda_vg/sid-snap-46195b04-0893-\
       49bf-beb8-0d4ccc899f0f
         LVM Snapshot Options   --size 2G -c 128

       Now the session has been created, commands may be run in it:

       % schroot -r -c sid-snap-46195b04-0893-49bf-beb8-0d4ccc899f0f -- \
         uname -sr↵
       I: [sid-snap-46195b04-0893-49bf-beb8-0d4ccc899f0f chroot] Running \
       command: “uname -sr”
       Linux 2.6.18-3-powerpc
       % schroot -r -c $SESSION -- uname -sr↵
       I: [sid-snap-fe170af9-d9be-4800-b1bd-de275858b938 chroot] Running \
       command: “uname -sr”
       Linux 2.6.18-3-powerpc

       When all the commands to run in the session have been performed, the session may be ended:

       % schroot -e -c sid-snap-46195b04-0893-49bf-beb8-0d4ccc899f0f↵
       % schroot -e -c $SESSION↵

       Finally, the session names can be long and unwieldy.  A name may be specified instead of using the automatically generated session ID:

       % schroot -b -c sid-snap -n my-session-name↵
       my-session-name

TROUBLESHOOTING
       If something is not working, and it's not clear from the error messages what is wrong, try using the --debug=level option to turn on debug‐
       ging messages.  This gives a great deal more information.  Valid debug levels are ‘none’, and ‘notice’, ‘info’, ‘warning’ and ‘critical’ in
       order of increasing severity.  The lower the severity level, the more output.

       If you are still having trouble, the developers may be contacted on the mailing list:
       Debian buildd-tools Developers
       <buildd-tools-devel@lists.alioth.debian.org>

BUGS
       On the mips and mipsel architectures, Linux kernels up to and including at least version 2.6.17 have broken personality(2)  support,  which
       results  in  a failure to set the personality.  This will be seen as an “Operation not permitted” (EPERM) error.  To work around this prob‐
       lem, set personality to ‘undefined’, or upgrade to a more recent kernel.

ENVIRONMENT
       By default, the environment is not preserved, and the following environment variables are defined: HOME, LOGNAME, PATH, SHELL,  TERM  (pre‐
       served  if already defined), and USER.  The environment variables SCHROOT_COMMAND, SCHROOT_USER, SCHROOT_GROUP, SCHROOT_UID and SCHROOT_GID
       are set inside the chroot specifying the command being run, the user name, group name, user ID and group ID,  respectively.   Additionally,
       the  environment  variables SCHROOT_SESSION_ID, SCHROOT_CHROOT_NAME and SCHROOT_ALIAS_NAME specify the session ID, the original chroot name
       prior to session creation, and the alias used to originally identify the selected chroot, respectively.

       The following, potentially dangerous, environment variables are removed for safety by default: BASH_ENV,  CDPATH,  ENV,  HOSTALIASES,  IFS,
       KRB5_CONFIG, KRBCONFDIR, KRBTKFILE, KRB_CONF, LD_.*, LOCALDOMAIN, NLSPATH, PATH_LOCALE, RES_OPTIONS, TERMINFO, TERMINFO_DIRS, and TERMPATH.
       If desired, the environment-filter configuration key will allow the exclusion  list  to  the  modified;  see  schroot.conf(5)  for  further
       details.

FILES
   Configuration files
       /etc/schroot/schroot.conf
              The system-wide chroot definition file.  This file must be owned by the root user, and not be writable by other.

       /etc/schroot/chroot.d
              Additional  chroot  definitions  may  be  placed  in  files  under  this directory.  They are treated in exactly that same manner as
              /etc/schroot/schroot.conf.  Each file may contain one or more chroot definitions.  Note that the files in this directory follow  the
              same naming rules as run-parts(8) when run with the --lsbsysinit option.

       /etc/schroot/setup.d
              The system-wide chroot setup script directories.  See schroot-setup(5).

       /etc/pam.d/schroot
              PAM configuration.

   System directories
       /usr/lib/x86_64-linux-gnu/schroot
              Directory containing helper programs used by setup scripts.

   Session directories
       Each directory contains a directory or file with the name of each session.  Not all chroot types make use of all the following directories.

       /var/lib/schroot/session
              Directory containing the session configuration for each active session.

       /var/lib/schroot/mount
              Directory used to mount the filesystems used by each active session.

       /var/lib/schroot/union/underlay
              Directory used for filesystem union source (underlay).

       /var/lib/schroot/union/overlay
              Directory used for filesystem union writeable overlay.

       /var/lib/schroot/unpack
              Directory used for unpacking file chroots.

AUTHORS
       Roger Leigh.

COPYRIGHT
       Copyright © 2005-2012  Roger Leigh <rleigh@debian.org>

       schroot  is  free  software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the
       Free Software Foundation, either version 3 of the License, or (at your option) any later version.

SEE ALSO
       dchroot(1), sbuild(1), chroot(2), run-parts(8), schroot-setup(5), schroot-faq(7), schroot.conf(5).

Version 1.6.10                                                      05 May 2014                                                         SCHROOT(1)
