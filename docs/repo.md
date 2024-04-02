repo(1)                            tool for getting Android source                            repo(1)

NAME
       repo - tool for getting Android source

SYNOPSIS
       repo [ command ] [ options  ]

DESCRIPTION
       repo  is  a  repository management tool that we built on top of Git. repo unifies the many Git
       repositories when necessary, does the uploads to our revision control  system,  and  automates
       parts  of  the Android development workflow. repo is not meant to replace Git, only to make it
       easier to work with Git in the context of Android. The repo command is  an  executable  Python
       script  that  you can put anywhere in your path. In working with the Android source files, you
       will use repo for across-network operations. For example, with a single repo command  you  can
       download files from multiple repositories into your local working directory.

       The complete list of recognized repo commands are:

       abandon
              Permanently abandon a development branch

       branch View current topic branches

       branches
              View current topic branches

       checkout
              Checkout a branch for development

       cherry-pick
              Cherry-pick a change.

       diff   Show changes between commit and working tree

       diffmanifests
              Manifest diff utility

       download
              Download and checkout a change

       forall Run a shell command in each project

       gitc-delete
              Delete a GITC Client.

       gitc-init
              Initialize a GITC Client.

       grep   Print lines matching a pattern

       help   Display detailed help on a command

       info   Get info on the manifest branch, current branch or unmerged branches

       init   Initialize repo in the current directory

       list   List projects and their associated directories

       manifest
              Manifest inspection utility

       overview
              Display overview of unmerged project branches

       prune  Prune (delete) already merged topics

       rebase Rebase local branches on upstream branch

       selfupdate
              Update repo to the latest version

       smartsync
              Update working tree to the latest known good revision

       stage  Stage file(s) for commit

       start  Start a new branch for development

       status Show the working tree status

       sync   Update working tree to the latest revision

       upload Upload changes for code review

       version
              Display the version of repo

       See repo help [ command ] for more information on a specific command.

More documentation
       There is more documentation on these websites:

       https://source.android.com/source/using-repo.html  https://source.android.com/source/download‐
       ing.html https://source.android.com/source/developing.html

SEE ALSO
       git(1)

AUTHOR
       The Android Open Source Project, 2008-2015

.1                                           26 Dec 2015                                      repo(1)
