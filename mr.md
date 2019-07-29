MR(1)                                                                   mr                                                                   MR(1)

NAME
       mr - a tool to manage all your version control repos

SYNOPSIS
       mr [options] checkout

       mr [options] update

       mr [options] status

       mr [options] clean [-f]

       mr [options] commit [-m "message"]

       mr [options] record [-m "message"]

       mr [options] fetch

       mr [options] push

       mr [options] diff

       mr [options] log

       mr [options] grep pattern

       mr [options] run command [param ...]

       mr [options] bootstrap src [directory]

       mr [options] register [repository]

       mr [options] config section ["setting=[value]" ...]

       mr [options] action [params ...]

       mr [options] [online|offline]

       mr [options] remember action [params ...]

DESCRIPTION
       mr is a tool to manage all your version control repos. It can checkout, update, or perform other actions on a set of repositories as if
       they were one combined repository. It supports any combination of Subversion, git, cvs, mercurial, bzr, darcs, fossil and veracity
       repositories, and support for other version control systems can easily be added.

       mr cds into and operates on all registered repositories at or below your working directory. Or, if you are in a subdirectory of a
       repository that contains no other registered repositories, it will stay in that directory, and work on only that repository,

       mr is configured by .mrconfig files, which list the repositories. It starts by reading the .mrconfig file in your home directory, and this
       can in turn chain load .mrconfig files from repositories. It also automatically looks for a .mrconfig file in the current directory, or in
       one of its parent directories.

       These predefined commands should be fairly familiar to users of any version control system:

       checkout (or co)
           Checks out any repositories that are not already checked out.

       update
           Updates each repository from its configured remote repository.

           If a repository isn't checked out yet, it will first check it out.

       status
           Displays a status report for each repository, showing what uncommitted changes are present in the repository. For distributed version
           control systems, also shows unpushed local branches.

       clean
           Print ignored files, untracked files and other cruft in the working directory.

           The optional -f parameter allows removing the files as well as printing them.

       commit (or ci)
           Commits changes to each repository. (By default, changes are pushed to the remote repository too, when using distributed systems like
           git. If you don't like this default, you can change it in your .mrconfig, or use record instead.)

           The optional -m parameter allows specifying a commit message.

       record
           Records changes to the local repository, but does not push them to the remote repository. Only supported for distributed version
           control systems.

           The optional -m parameter allows specifying a commit message.

       fetch
           Fetches from each repository's remote repository, but does not update the working copy. Only supported for some distributed version
           control systems.

       push
           Pushes committed local changes to the remote repository. A no-op for centralized version control systems.

       diff
           Show a diff of uncommitted changes.

       log Show the commit log.

       grep pattern
           Searches for a pattern in each repository using the grep subcommand. Uses ack or ack-grep on VCS that do not have their own.  Ignores
           the return value from grep subcommands so that you can use "mr -m grep foo" and not get output in non-matching repositories.

       run command [param ...]
           Runs the specified command in each repository.

       These commands are also available:

       bootstrap src [directory]
           Causes mr to retrieve the source "src" and use it as a .mrconfig file to checkout the repositories listed in it, into the specified
           directory.

           mr understands several types of sources:

           URL for curl
               "src" may be an URL understood by curl.

           copy via ssh
               To use scp to download, the "src" may have the form "ssh://[user@]host:file".

           local file
               You can retrieve the config file by other means and pass its path as "src".

           standard input
               If source "src" consists in a single dash "-", config file is read from standard input.

           The directory will be created if it does not exist. If no directory is specified, the current directory will be used.

           As a special case, if source "src" includes a repository named ".", that is checked out into the top of the specified directory.

       list (or ls)
           List the repositories that mr will act on.

       register
           Register an existing repository in a mrconfig file. By default, the repository in the current directory is registered, or you can
           specify a directory to register.

           The mrconfig file that is modified is chosen by either the -c option, or by looking for the closest known one at or in a parent of the
           current directory.

       config
           Adds, modifies, removes, or prints a value from a mrconfig file. The next parameter is the name of the section the value is in. To add
           or modify values, use one or more instances of "setting=value". Use "setting=" to remove a setting. Use just "setting" to get the value
           of a that setting.

           For example, to add (or edit) a repository in src/foo:

             mr config src/foo checkout="svn co svn://example.com/foo/trunk foo"

           To show the command that mr uses to update the repository in src/foo:

             mr config src/foo update

           To see the built-in library of shell functions contained in mr:

             mr config DEFAULT lib

           The mrconfig file that is used is chosen by either the -c option, or by looking for the closest known one at or in a parent of the
           current directory.

       offline
           Advises mr that it is in offline mode. Any commands that fail in offline mode will be remembered, and retried when mr is told it's
           online.

       online
           Advices mr that it is in online mode again. Commands that failed while in offline mode will be re-run.

       remember
           Remember a command, to be run later when mr re-enters online mode. This implicitly puts mr into offline mode. The command can be any
           regular mr command. This is useful when you know that a command will fail due to being offline, and so don't want to run it right now
           at all, but just remember to run it when you go back online.

       help
           Displays this help.

       Actions can be abbreviated to any unambiguous substring, so "mr st" is equivalent to "mr status", and "mr up" is equivalent to "mr update"

       Additional parameters can be passed to most commands, and are passed on unchanged to the underlying version control system. This is mostly
       useful if the repositories mr will act on all use the same version control system.

OPTIONS
       -d directory
       --directory directory
           Specifies the topmost directory that mr should work in. The default is the current working directory.

       -c mrconfig
       --config mrconfig
           Use the specified mrconfig file. The default is to use both ~/.mrconfig as well as look for a .mrconfig file in the current directory,
           or in one of its parent directories.

       -f
       --force
           Force mr to act on repositories that would normally be skipped due to their configuration.

       --force-env
           Force mr to execute even though potentially dangerous environment variables are set.

       -v
       --verbose
           Be verbose.

       -m
       --minimal
           Minimise output. If a command fails or there is any output then the usual output will be shown.

       -q
       --quiet
           Be quiet. This suppresses mr's usual output, as well as any output from commands that are run (including stderr output). If a command
           fails, the output will be shown.

       -k
       --insecure
           Accept untrusted SSL certificates when bootstrapping.

       -s
       --stats
           Expand the statistics line displayed at the end to include information about exactly which repositories failed and were skipped, if
           any.

       -i
       --interactive
           Interactive mode. If a repository fails to be processed, a subshell will be started which you can use to resolve or investigate the
           problem. Exit the subshell to continue the mr run.

       -n [number]
       --no-recurse [number]
           If no number if specified, just operate on the repository for the current directory, do not recurse into deeper repositories.

           If a number is specified, will recurse into repositories at most that many subdirectories deep. For example, with -n 2 it would recurse
           into ./src/foo, but not ./src/packages/bar.

       -j [number]
       --jobs [number]
           Run the specified number of jobs in parallel, or an unlimited number of jobs with no number specified. This can greatly speed up
           operations such as updates.  It is not recommended for interactive operations.

           Note that running more than 10 jobs at a time is likely to run afoul of ssh connection limits. Running between 3 and 5 jobs at a time
           will yield a good speedup in updates without loading the machine too much.

       --cache
           Saves the command output and return values to files in the ~/.mrcache/ directory tree after executing each command.

           Ignored when being run from subdirs of a repo unless --top is enabled.

           This is used by the "cache-mr-status.sh" shell extension.

       --cached
           For repos where the cache is populated, prints the cached output instead of executing the commands. For repos with an unpopulated
           cache, executes the commands and stores output into the cache.

           Ignored when being run from subdirs of a repo unless --top is enabled.

           This is most useful when the "cache-mr-status.sh" shell extension is enabled.

       --uncache
           For repos where the cache is populated, remove the cached output before executing any commands.

           This may be useful to users of the "cache-mr-status.sh" shell extension.

       --top
           When being run from subdirs of a repo, change directory to the top of the repo before running any commands.

           This is used by the "cache-mr-status.sh" shell extension.

       -t
       --trust-all
           Trust all mrconfig files even if they are not listed in ~/.mrtrust.  Use with caution.

       -p
       --path
           This obsolete flag is ignored.

MRCONFIG FILES
       Here is an example .mrconfig file:

         [src]
         checkout = svn checkout svn://svn.example.com/src/trunk src
         chain = true

         [src/linux-2.6]
         checkout = git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git &&
               cd linux-2.6 &&
               git checkout -b mybranch origin/master

       The .mrconfig file uses a variant of the INI file format. Lines starting with "#" are comments. Values can be continued to the following
       line by indenting the line with whitespace.

       The "DEFAULT" section allows setting default values for the sections that come after it.

       The "ALIAS" section allows adding aliases for actions. Each setting is an alias, and its value is the action to use.

       All other sections add repositories. The section header specifies the directory where the repository is located. This is relative to the
       directory that contains the mrconfig file, but you can also choose to use absolute paths. (Note that you can use environment variables in
       section names; they will be passed through the shell for expansion. For example, "[$HOSTNAME]", or "[${HOSTNAME}foo]").

       Within a section, each setting defines a shell command to run to handle a given action. mr contains default handlers for "update",
       "status", "commit", and other standard actions.

       Normally you only need to specify what to do for "checkout". Here you specify the command to run in order to create a checkout of the
       repository.  The command will be run in the parent directory, and must create the repository's directory. So use "git clone", "svn
       checkout", "bzr branch" or "bzr checkout" (for a bound branch), etc.

       Note that these shell commands are run in a "set -e" shell environment, where any additional parameters you pass are available in $@. All
       commands other than "checkout" are run inside the repository, though not necessarily at the top of it.

       The "MR_REPO" environment variable is set to the path to the top of the repository. (For the "register" action, "MR_REPO" is instead set to
       the basename of the directory that should be created when checking the repository out.)

       The "MR_CONFIG" environment variable is set to the .mrconfig file that defines the repo being acted on, or, if the repo is not yet in a
       config file, the .mrconfig file that should be modified to register the repo.

       The "MR_ACTION" environment variable is set to the command being run (update, checkout, etc).

       A few settings have special meanings:

       skip
           If "skip" is set and its command returns true, then mr will skip acting on that repository. The command is passed the action name in
           $1.

           Here are two examples. The first skips the repo unless mr is run by joey. The second uses the hours_since function (included in mr's
           built-in library) to skip updating the repo unless it's been at least 12 hours since the last update.

             [mystuff]
             checkout = ...
             skip = test `whoami` != joey

             [linux]
             checkout = ...
             skip = [ "$1" = update ] && ! hours_since "$1" 12

           Another way to use skip is for a lazy checkout. This makes mr skip operating on a repo unless it already exists. To enable the repo,
           you have to explicitly check it out (using "mr --force -d foo checkout").

             [foo]
             checkout = ...
             skip = lazy

       order
           The "order" setting can be used to override the default ordering of repositories. The default order value is 10. Use smaller values to
           make repositories be processed earlier, and larger values to make repositories be processed later.

           Note that if a repository is located in a subdirectory of another repository, ordering it to be processed earlier is not recommended.

       chain
           If "chain" is set and its command returns true, then mr will try to load a .mrconfig file from the root of the repository.

       include
           If "include" is set, its command is ran, and should output additional mrconfig file content. The content is included as if it were part
           of the including file.

           Unlike everything else, "include" does not need to be placed within a section.

           mr ships several libraries that can be included to add support for additional version control type things (unison, git-svn, git-fake-
           bare, git-subtree). To include them all, you could use:

             include = cat /usr/share/mr/*

           See the individual files for details.

       deleted
           If "deleted" is set and its command returns true, then mr will treat the repository as deleted. It won't ever actually delete the
           repository, but it will warn if it sees the repository's directory.  This is useful when one mrconfig file is shared among multiple
           machines, to keep track of and remember to delete old repositories.

       lib The "lib" setting can contain some shell code that will be run before each command, this can be a useful way to define shell functions
           for other commands to use.

           Unlike most other settings, this can be specified multiple times, in which case the chunks of shell code are accumulatively
           concatenated together.

       fixups
           If "fixups" is set, its command is run whenever a repository is checked out, or updated. This provides an easy way to do things like
           permissions fixups, or other tweaks to the repository content, whenever the repository is changed.

       jobs
           If "jobs" is set, run the specified number of jobs in parallel.  This can greatly speed up operations such as updates.

           Note that running more than 10 jobs at a time is likely to run afoul of ssh connection limits. Running between 3 and 5 jobs at a time
           will yield a good speedup in updates without loading the machine too much.

       VCS_action
           When looking for a command to run for a given action, mr first looks for a setting with the same name as the action. If that is not
           found, it looks for a setting named "VCS_action" (substituting in the name of the version control system and the action). If that is
           not found, it looks for a setting named "action_default" (substituting in the name of the action).

           Internally, mr has settings for "git_update", "svn_update", etc. To change the action that is performed for a given version control
           system, you can override these VCS specific actions. To add a new version control system, you can just add VCS specific actions for it.

       pre_ and post_
           If "pre_action" is set, its command is run before mr performs the specified action. Similarly, "post_action" commands are run after mr
           successfully performs the specified action. For example, "pre_commit" is run before committing; "post_update" is run after updating.

       _prepend
           Any setting can be suffixed with "_prepend", to prepend an additional value to the existing value of the setting. A line ending is
           added between the additional value and the existing value. In this way, actions can be constructed accumulatively.

           This is useful for applying modifier commands such as nice, ionice or nocache.  To apply modifier commands, ensure you end this suffix
           with a shell line continuation character (the backslash "\" in most shells) so that the line ending added by this suffix is ignored.

       _append
           Any setting can be suffixed with "_append", to append an additional value to the existing value of the setting. Line endings are added
           at the end of the existing value and after the additional value. In this way, actions can be constructed accumulatively.

       _default
           Any setting can be suffixed with "_default", to set the value for the setting when a VCS-specific setting cannot be found. This is
           mostly for making actions do nothing for most VCS actions by setting action_default to "true" and then setting the action for each VCS
           that has the action.

           This is used by the mr "upgrade" extension.

       VCS_test
           The name of the version control system is itself determined by running each defined "VCS_test" action, until one succeeds.

UNTRUSTED MRCONFIG FILES
       Since mrconfig files can contain arbitrary shell commands, they can do anything. This flexibility is good, but it also allows a malicious
       mrconfig file to delete your whole home directory. Such a file might be contained inside a repository that your main ~/.mrconfig checks
       out. To avoid worries about evil commands in a mrconfig file, mr defaults to reading all mrconfig files other than the main ~/.mrconfig in
       untrusted mode. In untrusted mode, mrconfig files are limited to running only known safe commands (like "git clone") in a carefully checked
       manner.

       To configure mr to trust other mrconfig files, list them in ~/.mrtrust.  One mrconfig file should be listed per line. Either the full
       pathname should be listed, or the pathname can start with ~/ to specify a file relative to your home directory.

OFFLINE LOG FILE
       The ~/.mrlog file contains commands that mr has remembered to run later, due to being offline. You can delete or edit this file to remove
       commands, or even to add other commands for 'mr online' to run. If the file is present, mr assumes it is in offline mode.

EXTENSIONS
       mr can be extended to support things such as unison and git-svn. Some files providing such extensions are available in /usr/share/mr/.
       Some files providing mr shell extensions are in /usr/share/mr.sh/.  See the documentation in the files for details about using them.

EXIT STATUS
       mr returns nonzero if a command failed in any of the repositories.

AUTHOR
       Copyright 2007-2011 Joey Hess <joey@kitenet.net>

       Licensed under the GNU GPL version 2 or higher.

       <https://myrepos.branchable.com/>

perl v5.22.1                                                        2018-08-18                                                               MR(1)
