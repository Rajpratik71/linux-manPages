STG(1)                                                             StGit Manual                                                             STG(1)

NAME
       stg - Manage stacks of patches using the Git content tracker

SYNOPSIS
       stg [--version | --help]
       stg [--help <command> | <command> --help]
       stg <command> [COMMAND OPTIONS] [ARGS]

DESCRIPTION
       StGit (Stacked Git) is an application that provides a convenient way to maintain a patch stack on top of a Git branch:

       ·   The topmost (most recent) commits of a branch are given names. Such a named commit is called a patch.

       ·   After making changes to the worktree, you can incorporate the changes into an existing patch; this is called refreshing. You may
           refresh any patch, not just the topmost one.

       ·   You can pop a patch: temporarily putting it aside, so that the patch below it becomes the topmost patch. Later you may push it onto the
           stack again. Pushing and popping can be used to reorder patches.

       ·   You can easily rebase your patch stack on top of any other Git commit. (The base of a patch stack is the most recent Git commit that is
           not an StGit patch.) For example, if you started making patches on top of someone else’s branch, and that person publishes an updated
           branch, you can take all your patches and apply them on top of the updated branch.

       ·   As you would expect, changing what is below a patch can cause that patch to no longer apply cleanly — this can occur when you reorder
           patches, rebase patches, or refresh a non-topmost patch. StGit uses Git’s rename-aware three-way merge capability to automatically fix
           up what it can; if it still fails, it lets you manually resolve the conflict just like you would resolve a merge conflict in Git.

       ·   The patch stack is just some extra metadata attached to regular Git commits, so you can continue to use most Git tools along with
           StGit.

   Typical uses
       Tracking branch
           Tracking changes from a remote branch, while maintaining local modifications against that branch, possibly with the intent of sending
           some patches upstream. You can modify your patch stack as much as you want, and when your patches are finally accepted upstream, the
           permanent recorded Git history will contain just the final sequence of patches, and not the messy sequence of edits that produced them.

           Commands of interest in this workflow are e.g. rebase and mail.

       Development branch
           Even if you have no "upstream" to send patches to, you can use StGit as a convenient way to modify the recent history of a Git branch.
           For example, instead of first committing change A, then change B, and then A2 to fix A because it wasn’t quite right, you could
           incorporate the fix directly into A. This way of working results in a much more readable Git history than if you had immortalized every
           misstep you made on your way to the right solution.

           Commands of interest in this workflow are e.g. uncommit, which can be used to move the patch stack base downwards — i.e., turn Git
           commits into StGit patches after the fact — and commit, its inverse.
       For more information, see the tutorial[1].

   Specifying patches
       Many StGit commands take references to StGit patches as arguments. Patches in the stack are identified with short names, each of which must
       be unique in the stack.

       Patches in the current branch are simply referred to by their name. Some commands allow you to specify a patch in another branch of the
       repository; this is done by prefixing the patch name with the branch name and a colon (e.g. otherbranch:thatpatch).

   Specifying commits
       Some StGit commands take Git commits as arguments. StGit accepts all commit expressions that Git does; and in addition, a patch name
       (optionally prefixed by a branch name and a colon) is allowed in this context. The usual Git modifiers ^ and ~ are also allowed; e.g.,
       abranch:apatch~2 is the grandparent of the commit that is the patch apatch on branch abranch.

       Instead of a patch name, you can say {base} to refer to the stack base (the commit just below the bottommost patch); so, abranch:{base} is
       the base of the stack in branch abranch.

       If you need to pass a given StGit reference to a Git command, stg-id(1) will convert it to a Git commit id for you.

OPTIONS
       The following generic option flags are available. Additional options are available for (and documented with) the different subcommands.

       --version
           Prints the StGit version, as well as version of other components used, such as Git and Python.

       --help
           Prints the synopsis and a list of all subcommands. If an StGit subcommand is given, prints the synposis for that subcommand.

STGIT COMMANDS
       We divide StGit commands in thematic groups, according to the primary type of object they create or change.

       Here is a short description of each command. A more detailed description is available in individual command manpages. Those manpages are
       named stg-<command>(1).

   Repository commands
       stg-clone(1)
           Make a local clone of a remote repository

       stg-id(1)
           Print the git hash value of a StGit reference

   Stack (branch) commands
       stg-branch(1)
           Branch operations: switch, list, create, rename, delete, ...

       stg-clean(1)
           Delete the empty patches in the series

       stg-commit(1)
           Permanently store the applied patches into the stack base

       stg-float(1)
           Push patches to the top, even if applied

       stg-goto(1)
           Push or pop patches to the given one

       stg-hide(1)
           Hide a patch in the series

       stg-init(1)
           Initialise the current branch for use with StGIT

       stg-log(1)
           Display the patch changelog

       stg-next(1)
           Print the name of the next patch

       stg-patches(1)
           Show the applied patches modifying a file

       stg-pop(1)
           Pop one or more patches from the stack

       stg-prev(1)
           Print the name of the previous patch

       stg-publish(1)
           Push the stack changes to a merge-friendly branch

       stg-pull(1)
           Pull changes from a remote repository

       stg-push(1)
           Push one or more patches onto the stack

       stg-rebase(1)
           Move the stack base to another point in history

       stg-redo(1)
           Undo the last undo operation

       stg-repair(1)
           Fix StGit metadata if branch was modified with git commands

       stg-reset(1)
           Reset the patch stack to an earlier state

       stg-series(1)
           Print the patch series

       stg-sink(1)
           Send patches deeper down the stack

       stg-squash(1)
           Squash two or more patches into one

       stg-top(1)
           Print the name of the top patch

       stg-uncommit(1)
           Turn regular git commits into StGit patches

       stg-undo(1)
           Undo the last operation

       stg-unhide(1)
           Unhide a hidden patch

   Patch commands
       stg-delete(1)
           Delete patches

       stg-edit(1)
           Edit a patch description or diff

       stg-export(1)
           Export patches to a directory

       stg-files(1)
           Show the files modified by a patch (or the current patch)

       stg-fold(1)
           Integrate a GNU diff patch into the current patch

       stg-import(1)
           Import a GNU diff file as a new patch

       stg-mail(1)
           Send a patch or series of patches by e-mail

       stg-new(1)
           Create a new, empty patch

       stg-pick(1)
           Import a patch from a different branch or a commit object

       stg-refresh(1)
           Generate a new commit for the current patch

       stg-rename(1)
           Rename a patch

       stg-show(1)
           Show the commit corresponding to a patch

       stg-sync(1)
           Synchronise patches with a branch or a series

   Index/worktree commands
       stg-diff(1)
           Show the tree diff

CONFIGURATION MECHANISM
       StGit uses the same configuration mechanism as Git. See git(7) for more details.

TEMPLATES
       A number of StGit commands make use of template files to provide useful default texts to be edited by the user. These <name>.tmpl template
       files are searched in the following directories:

        1. $GITDIR/ (in practice, the .git/ directory in your repository)

        2. $HOME/.stgit/templates/

        3. /usr/share/stgit/templates/

NOTES
        1. the tutorial
           [set $man.base.url.for.relative.links]/tutorial.html

StGit                                                               03/27/2014                                                              STG(1)
