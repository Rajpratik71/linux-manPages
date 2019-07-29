keychain(1)                                                    http://www.funtoo.org                                                   keychain(1)

NAME
       keychain - re-use ssh-agent and/or gpg-agent between logins

SYNOPSIS
       keychain [ -hklQqV ] [ --clear --confhost --help --ignore-missing --list --noask --nocolor --nogui --nolock --quick --quiet --version ]
       [ --agents list ] [ --attempts num ] [ --dir dirname ] [ --host name ] [ --lockwait seconds ]
       [ --stop which ] [ --timeout minutes ] [ keys... ]

DESCRIPTION
       keychain is a manager for ssh-agent, typically run from ~/.bash_profile.  It allows your shells and cron jobs to easily share a single ssh-
       agent process.  By default, the ssh-agent started by keychain is long-running and will continue to run, even after you have logged out from
       the system.  If you want to change this behavior, take a look at the --clear and --timeout options, described below.

       When keychain is run, it checks for a running ssh-agent, otherwise it starts one.  It saves the ssh-agent environment variables to
       ~/.keychain/${HOSTNAME}-sh, so that subsequent logins and non-interactive shells such as cron jobs can source the file and make
       passwordless ssh connections.

       In addition, when keychain runs, it verifies that the key files specified on the command-line are known to ssh-agent, otherwise it loads
       them, prompting you for a password if necessary. Typically, private key files are specified by filename only, without path, although it is
       possible to specify an absolute or relative path to the private key file as well. If just a private key filename is used, which is typical
       usage, keychain will look for the specified private key files in ~/.ssh, ~/.ssh2, or with the -c/--confhost option, inspect the
       ~/.ssh/config file and use the IdentityFile option to determine the location of the private key. Private keys can be symlinks to the actual
       private key.

       Keychain expects associated public key files to exist in the same directory as the private key files, with a .pub extension.  If the
       private key is a symlink, the public key can be found alongside the symlink, or in the same directory as the symlink target (This
       capability requires the 'readlink' command to be available on the system.)

       As an additional feature, if a private key has an extension ".ext", keychain will look for privkey.ext.pub first, and if not found, will
       look for privkeyname.pub.

       Keychain also supports gpg-agent in the same ways that ssh-agent is supported.  By default keychain attempts to start ssh-agent only.  You
       can modify this behavior using the --agents option.

       Keychain supports most UNIX-like operating systems, including Cygwin.  It works with Bourne-compatible, csh-compatible and fish shells.

OPTIONS
       --agents list
           Start the agents listed.  By default keychain will start ssh-agent if it is found in your path. The list should be comma-separated, for
           example "gpg,ssh"

       --attempts num
           Try num times to add keys before giving up.  The default is 1.

       --clear
           Delete all of ssh-agent's keys.  Typically this is used in .bash_profile.  The theory behind this is that keychain should assume that
           you are an intruder until proven otherwise.  However, while this option increases security, it still allows your cron jobs to use your
           ssh keys when you're logged out.

       --confhost
           By default, keychain will look for key pairs in the ~/.ssh/ directory.  The --confhost option will inform keychain to look in
           ~/.ssh/config for IdentityFile settings defined for particular hosts, and use these paths to locate keys.

       --confirm
           Keys are subject to interactive confirmation by the SSH_ASKPASS program before being used for authentication.  See the -c option for
           ssh-add(1).

       --absolute
           Any arguments to "--dir" are interpreted to be absolute. The default behavior is to append "/.keychain" to the argument for backwards
           compatibility.

       --dir dirname
           Keychain will use dirname rather than $HOME/.keychain

       --query
           Keychain will print lines in KEY=value format representing the values which are set by the agents.

       --eval
           Keychain will print lines to be evaluated in the shell on stdout.  It respects the SHELL environment variable to determine if Bourne
           shell or C shell output is expected.

       --env filename
           After parsing options, keychain will load additional environment settings from "filename".  By default, if "--env" is not given, then
           keychain will attempt to load from ~/.keychain/[hostname]-env or alternatively ~/.keychain/env.  The purpose of this file is to
           override settings such as PATH, in case ssh is stored in a non-standard place.

       -h --help
           Show help that looks remarkably like this man-page. As of 2.6.10, help is sent to stdout so it can be easily piped to a pager.

       --host name
           Set alternate hostname for creation of pidfiles

       --ignore-missing
           Don't warn if some keys on the command-line can't be found.  This is useful for situations where you have a shared .bash_profile, but
           your keys might not be available on every machine where keychain is run.

       --inherit which
           Attempt to inherit agent variables from the environment.  This can be useful in a variety of circumstances, for example when ssh-agent
           is started by gdm.  The following values are valid for "which":

           local       Inherit when a pid (e.g. SSH_AGENT_PID) is set in the environment.  This disallows inheriting a forwarded agent.

           any         Inherit when a sock (e.g. SSH_AUTH_SOCK) is set in the environment.  This allows inheriting a forwarded agent.

           local-once  Same as "local", but only inherit if keychain isn't already providing an agent.

           any-once    Same as "any", but only inherit if keychain isn't already providing an agent.

           By default, keychain-2.5.0 and later will behave as if "--inherit local-once" is specified.  You should specify "--noinherit" if you
           want the older behavior.

       -l --list
           List signatures of all active SSH keys, and exit, similar to "ssh-add -l".

       --lockwait seconds
           How long to wait for the lock to become available.  Defaults to 5 seconds. Specify a value of zero or more. If the lock cannot be
           acquired within the specified number of seconds, then this keychain process will forcefully acquire the lock.

       --noask
           This option tells keychain do everything it normally does (ensure ssh-agent is running, set up the ~/.keychain/[hostname]-{c}sh files)
           except that it will not prompt you to add any of the keys you specified if they haven't yet been added to ssh-agent.

       --nocolor
           Disable color hilighting for non ANSI-compatible terms.

       --nogui
           Don't honor SSH_ASKPASS, if it is set.  This will cause ssh-add to prompt on the terminal instead of using a graphical program.

       --noinherit
           Don't inherit any agent processes, overriding the default "--inherit local-once"

       --nolock
           Don't attempt to use a lockfile while manipulating files, pids and keys.

       -k --stop which
           Kill currently running agent processes.  The following values are valid for "which":

           all      Kill all agent processes and quit keychain immediately.  Prior to keychain-2.5.0, this was the behavior of the bare "--stop"
                    option.

           others   Kill agent processes other than the one keychain is providing.  Prior to keychain-2.5.0, keychain would do this automatically.
                    The new behavior requires that you specify it explicitly if you want it.

           mine     Kill keychain's agent processes, leaving other agents alone.

       --systemd
           Inject environment variables into the systemd --user session.

       --upstart
           Inject environment variables into the upstart --user session.

       -Q --quick
           If an ssh-agent process is running then use it.  Don't verify the list of keys, other than making sure it's non-empty.  This option
           avoids locking when possible so that multiple terminals can be opened simultaneously without waiting on each other.

       -q --quiet
           Only print messages in case of warning, error or required interactivity. As of version 2.6.10, this also suppresses "Identities added"
           messages for ssh-agent.

       --timeout minutes
           Allows a timeout to be set for identities added to ssh-agent. When this option is used with a keychain invocation that starts ssh-agent
           itself, then keychain uses the appropriate ssh-agent option to set the default timeout for ssh-agent.  The --timeout option also gets
           passed to ssh-add invocations, so any keys added to a running ssh-agent will be individually configured to have the timeout specified,
           overriding any ssh-agent default.

           Most users can simply use the timeout setting they desire and get the result they want -- with all identities having the specified
           timeout, whether added by keychain or not. More advanced users can use one invocation of keychain to set the default timeout, and
           optionally set different timeouts for keys added by using a subsequent invocation of keychain.

       -V --version
           Show version information.

EXAMPLES
       This snippet should work in most shells to load two ssh keys and one gpg key:

           eval `keychain --eval id_rsa id_dsa 0123ABCD`

       For the fish shell, use the following format:

           if status --is-interactive
               keychain --eval --quiet -Q id_rsa | source
           end

       If you have trouble with that in csh:

           setenv SHELL /bin/csh
           eval `keychain --eval id_rsa id_dsa 0123ABCD`

       This is equivalent for Bourne shells (including bash and zsh) but doesn't use keychain's --eval feature:

           keychain id_rsa id_dsa 0123ABCD
           [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
           [ -f $HOME/.keychain/$HOSTNAME-sh ] && \
                   . $HOME/.keychain/$HOSTNAME-sh
           [ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
                   . $HOME/.keychain/$HOSTNAME-sh-gpg

       This is equivalent for C shell (including tcsh):

           keychain id_rsa id_dsa 0123ABCD
           host=`uname -n`
           if (-f $HOME/.keychain/$host-csh) then
                   source $HOME/.keychain/$host-csh
           endif
           if (-f $HOME/.keychain/$host-csh-gpg) then
                   source $HOME/.keychain/$host-csh-gpg
           endif

       To load keychain variables from a script (for example from cron) and abort unless id_dsa is available:

           # Load keychain variables and check for id_dsa
           [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
           . $HOME/.keychain/$HOSTNAME-sh 2>/dev/null
           ssh-add -l 2>/dev/null | grep -q id_dsa || exit 1

SEE ALSO
       ssh-agent(1)

NOTES
       Keychain was created and is currently maintained by Daniel Robbins. If you need to report a bug or request an enhancement, please post to
       the Funtoo Linux bug tracker <http://bugs.funtoo.org>.  For more information about keychain, please visit <http://www.funtoo.org/Keychain>.

2.8.2                                                               2016-05-15                                                         keychain(1)
