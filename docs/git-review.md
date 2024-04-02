GIT-REVIEW(1)                         BSD General Commands Manual                        GIT-REVIEW(1)

NAME
     git-review — Submit changes to Gerrit for review

SYNOPSIS
     git-review [-r remote] [-uv] -d change [branch]
     git-review [-r remote] [-uv] -x change [branch]
     git-review [-r remote] [-uv] -N change [branch]
     git-review [-r remote] [-uv] -X change [branch]
     git-review [-r remote] [-uv] -m change-ps-range [branch]
     git-review [-r remote] [-fnuv] -s [branch]
     git-review [-fnuvDRT] [-r remote] [-t topic] [--reviewers reviewer ...] [branch]
     git-review -l
     git-review --version

DESCRIPTION
     git-review automates and streamlines some of the tasks involved with submitting local changes to
     a Gerrit server for review. It is designed to make it easier to comprehend Gerrit, especially for
     users that have recently switched to Git from another version control system.

     change can be changeNumber as obtained using --list option, or it can be
     changeNumber,patchsetNumber for fetching exact patchset from the change.  In that case local
     branch name will have a -patch[patchsetNumber] suffix.

     The following options are available:

     -c, --compatible
             Push changes to refs compatible with Gerrit of versions before 2.3.

     -d change, --download=change
             Download change from Gerrit into a local branch. The branch will be named after the patch
             author and the name of a topic.  If the local branch already exists, it will attempt to
             update with the latest patchset for this change.

     -x change, --cherrypick=change
             Apply change from Gerrit and commit into the current local branch ("cherry pick").  No
             additional branch is created.

             This makes it possible to review a change without creating a local branch for it. On the
             other hand, be aware: if you are not careful, this can easily result in additional patch
             sets for dependent changes. Also, if the current branch is different enough, the change
             may not apply at all or produce merge conflicts that need to be resolved by hand.

     -N change, --cherrypickonly=change
             Apply change from Gerrit into the current working directory, add it to the staging area
             ("git index"), but do not commit it.

             This makes it possible to review a change without creating a local commit for it. Useful
             if you want to merge several commits into one that will be submitted for review.

             If the current branch is different enough, the change may not apply at all or produce
             merge conflicts that need to be resolved by hand.

     -X change, --cherrypickindicate=change
             Apply change from Gerrit and commit into the current local branch ("cherry pick"), indi‐
             cating which commit this change was cherry-picked from.

             This makes it possible to re-review a change for a different branch without creating a
             local branch for it.

             If the current branch is different enough, the change may not apply at all or produce
             merge conflicts that need to be resolved by hand.

     -i, --new-changeid
             Force the git-review to generate a new Change-Id, even if one already exists in the
             changelog.

     -m change-ps-range, --compare=change-ps-range
             Download the specified  patchsets for change from Gerrit, rebase both on master and dis‐
             play differences (git-diff).

             change-ps-range can be specified as changeNumber,oldPatchSetNumber[-newPatchSetNumber]

             oldPatchSetNumber is mandatory, and if newPatchSetNumber is not specified, the latest
             patchset will be used.

             This makes it possible to easily compare what has changed from last time you reviewed the
             proposed change.

             If the master branch is different enough, the rebase can produce merge conflicts.  If
             that happens rebasing will be aborted and diff displayed for not-rebased branches.  You
             can also use --no-rebase (-R) to always skip rebasing.

     -f, --finish
             Close down the local branch and switch back to the target branch on successful submis‐
             sion.

     -F, --force-rebase
             Force a rebase before doing anything else, even if not otherwise needed.

     -n, --dry-run
             Don't actually perform any commands that have direct effects. Print them instead.

     -r remote, --remote=remote
             Git remote to use for Gerrit.

     -s, --setup
             Just run the repo setup commands but don't submit anything.

     -t topic, --topic=topic
             Sets the target topic for this change on the Gerrit server.  If not specified, a bug num‐
             ber from the commit summary will be used. Alternatively, the local branch name will be
             used if different from remote branch.

     -T, --no-topic
             Submit review without topic.

     --reviewers reviewer ...
             Subscribe one or more reviewers to the uploaded patch sets.  Reviewers should be identi‐
             fiable by Gerrit (usually use their Gerrit username or email address).

     -u, --update
             Skip cached local copies and force updates from network resources.

     -l, --list
             List the available reviews on the Gerrit server for this project.

     -y, --yes
             Indicate that you do, in fact, understand if you are submitting more than one patch.

     -v, --verbose
             Turns on more verbose output.

     -D, --draft
             Submit review as a draft. Requires Gerrit 2.3 or newer.

     -R, --no-rebase
             Do not automatically perform a rebase before submitting the change to Gerrit.

             When submitting a change for review, you will usually want it to be based on the tip of
             upstream branch in order to avoid possible conflicts. When amending a change and rebasing
             the new patchset, the Gerrit web interface will show a difference between the two patch‐
             sets which contains all commits in between. This may confuse many reviewers that would
             expect to see a much simpler difference.

             Also can be used for --compare to skip automatic rebase of fetched reviews.

     --color always|never|auto
             Enable or disable a color output. Default is "auto".

     --no-color
             Same thing as --color=never.

     --no-custom-script
             Do not run scripts, installed as hooks/{action}-review, where action is one of "pre",
             "draft", or "post".

     --track
             Choose the branch to submit the change against (and, if rebasing, to rebase against) from
             the branch being tracked (if a branch is being tracked), and set the tracking branch when
             downloading a change to point to the remote and branch against which patches should be
             submitted.  See gitreview.track configuration.

     --no-track
             Ignore any branch being tracked by the current branch, overriding gitreview.track.  This
             option is implied by providing a specific branch name on the command line.

     --use-pushurl
             Use the pushurl option for the origin remote rather than conventional separate Gerrit re‐
             motes.

     --version
             Print the version number and exit.

CONFIGURATION
     This utility can be configured by adding entries to Git configuration.

     The following configuration keys are supported:

     gitreview.username
             Default username used to access the repository. If not specified in the Git configura‐
             tion, Git remote or .gitreview file, the user will be prompted to specify the username.

             Example entry in the .gitconfig file:

                   [gitreview]
                   username=mygerrituser

     gitreview.scheme
             This setting determines the default scheme (ssh/http/https) of gerrit remote

     gitreview.host
             This setting determines the default hostname of gerrit remote

     gitreview.port
             This setting determines the default port of gerrit remote

     gitreview.project
             This setting determines the default name of gerrit git repo

     gitreview.remote
             This setting determines the default name to use for gerrit remote

     gitreview.branch
             This setting determines the default branch

     gitreview.track
             Determines whether to prefer the currently-tracked branch (if any) and the branch against
             which the changeset was submitted to Gerrit (if there is exactly one such branch) to the
             defaultremote and defaultbranch for submitting and rebasing against.  If the local topic
             branch is tracking a remote branch, the remote and branch that the local topic branch is
             tracking should be used for submit and rebase operations, rather than the defaultremote
             and defaultbranch.

             When downloading a patch, creates the local branch to track the appropriate remote and
             branch in order to choose that branch by default when submitting modifications to that
             changeset.

             A value of 'true' or 'false' should be specified.

             true    Do prefer the currently-tracked branch (if any) - equivalent to setting --track
                     when submitting changes.

             false   Ignore tracking branches - equivalent to setting --no-track (the default) or pro‐
                     viding an explicit branch name when submitting changes. This is the default value
                     unless overridden by .gitreview file, and is implied by providing a specific
                     branch name on the command line.

     gitreview.usepushurl
             This setting determines whether to use a separate Git remote for the Gerrit connection,
             or to set 'pushurl' on the remote 'origin'.

             A value of 'true' or 'false' should be specified.

             false   Do not use 'pushurl' and instead use a separate remote.

             true    Use 'pushurl' for interacting with Gerrit.

     gitreview.rebase
             This setting determines whether changes submitted will be rebased to the newest state of
             the branch.

             A value of 'true' or 'false' should be specified.

             false   Do not rebase changes on submit - equivalent to setting -R when submitting
                     changes.

             true    Do rebase changes on submit. This is the default value unless overridden by
                     .gitreview file.

             This setting takes precedence over repository-specific configuration in the .gitreview
             file.

     color.review
             Whether to use ANSI escape sequences to add color to the output displayed by this com‐
             mand. Default value is determined by color.ui.

             auto or true
                     If you want output to use color when written to the terminal (default with Git
                     1.8.4 and newer).

             always  If you want all output to use color

             never or false
                     If you wish not to use color for any output. (default with Git older than 1.8.4)

     git-review will query git credential system for Gerrit user/password when authentication failed
     over http(s). Unlike git, git-review does not persist Gerrit user/password in git credential sys‐
     tem for security purposes and git credential system configuration stays under user responsibil‐
     ity.

FILES
     To use git-review with your project, it is recommended that you create a file at the root of the
     repository named .gitreview and place information about your Gerrit installation in it.  The for‐
     mat is similar to the Windows .ini file format:

           [gerrit]
           host=hostname
           port=TCP port number of gerrit
           project=project name
           defaultbranch=branch to work on

     It is also possible to specify optional default name for the Git remote using the defaultremote
     configuration parameter.

     Setting defaultrebase to zero will make git-review not to rebase changes by default (same as the
     -R command line option)

           [gerrit]
           scheme=ssh
           host=review.example.com
           port=29418
           project=department/project.git
           defaultbranch=master
           defaultremote=review
           defaultrebase=0
           track=0

     When the same option is provided through FILES and CONFIGURATION, the CONFIGURATION value wins.

DIAGNOSTICS
     Normally, exit status is 0 if executed successfully.  Exit status 1 indicates general error,
     sometimes more specific error codes are available:

     2    Gerrit commit-msg hook could not be successfully installed.

     3    Could not parse malformed argument value or user input.

     32   Cannot fetch list of open changesets from Gerrit.

     33   Cannot parse list of open changesets received from Gerrit.

     34   Cannot query information about changesets.

     35   Cannot fetch information about the changeset to be downloaded.

     36   Changeset not found.

     37   Particular patchset cannot be fetched from the remote git repository.

     38   Specified patchset number not found in the changeset.

     39   Invalid patchsets for comparison.

     40   Connection to Gerrit was closed.

     64   Cannot checkout downloaded patchset into the new branch.

     65   Cannot checkout downloaded patchset into existing branch.

     66   Cannot hard reset working directory and git index after download.

     67   Cannot switch to some other branch when trying to finish the current branch.

     68   Cannot delete current branch.

     69   Requested patchset cannot be fully applied to the current branch.  This exit status will be
          returned when there are merge conflicts with the current branch.  Possible reasons include
          an attempt to apply patchset from the different branch or code.  This exit status will also
          be returned if the patchset is already applied to the current branch.

     70   Cannot determine top level Git directory or .git subdirectory path.

     101  Unauthorized (401) http request done by git-review.

     104  Not Found (404) http request done by git-review.

     Exit status larger than 31 indicates problem with communication with Gerrit or remote Git reposi‐
     tory, exit status larger than 63 means there was a problem with a local repository or a working
     copy.

     Exit status larger than or equal to 128 means internal error in running the "git" command.

EXAMPLES
     To fetch a remote change number 3004:

           $ git-review -d 3004
           Downloading refs/changes/04/3004/1 from gerrit into
           review/someone/topic_name
           Switched to branch 'review/someone/topic_name
           $ git branch
             master
           * review/author/topic_name

     Gerrit looks up both name of the author and the topic name from Gerrit to name a local branch.
     This facilitates easier identification of changes.

     To fetch a remote patchset number 5 from change number 3004:

           $ git-review -d 3004,5
           Downloading refs/changes/04/3004/5 from gerrit into
           review/someone/topic_name-patch5
           Switched to branch 'review/someone/topic_name-patch5
           $ git branch
             master
           * review/author/topic_name-patch5

     To send a change for review and delete local branch afterwards:

           $ git-review -f
           remote: Resolving deltas:   0% (0/8)
           To ssh://username@review.example.com/department/project.git
            * [new branch]      HEAD -> refs/for/master/topic_name
           Switched to branch 'master'
           Deleted branch 'review/someone/topic_name'
           $ git branch
           * master

     An example .gitreview configuration file for a project department/project hosted on
     review.example.com port 29418 in the branch master :

           [gerrit]
           host=review.example.com
           port=29418
           project=department/project.git
           defaultbranch=master

BUGS
     Bug reports can be submitted to https://launchpad.net/git-review

AUTHORS
     git-review is maintained by OpenStack, LLC

     This manpage has been enhanced by:
     Antoine Musso <hashar@free.fr>
     Marcin Cieslak <saper@saper.info>
     Pavel Sedlák <psedlak@redhat.com>

                                            June 12th, 2015
