GBP(1)                   git-buildpackage Manual                  GBP(1)

NAME
       gbp - Maintain Debian packages in Git

SYNOPSIS
       gbp { --help | --version | --list-cmds | command [ args ... ] }

DESCRIPTION
       gbp is used to maintain Debian source packages in the Git version
       control system.

OPTIONS
       --help Print help

       --version
              Print the programs version

       --list-cmds
              List all available commands

GBP COMMANDS
       These are the possible commands. For possible arguments to  these
       commands, please see the corresponding man pages.

       buildpackage
              Build source and binary packages from a Git repository

       import-orig
              Import a new upstream version into a Git repository

       import-dsc
              Import a Debian source package into a Git repository

       import-dscs
              Import  several  Debian source packages into a Git reposi‐
              tory, sorted by version number

       dch    Generate the debian/changelog from  Git commit history

       pq     Manage debian/patches using Git rebase

       pull   Update a Git repository from a remote

       clone  Clone a Git repository from a remote and set up the neces‐
              sary branch tracking.

       create-remote-repo
              Create a remote Git repository

CONFIGURATION FILES
       Several  gbp.conf  files are parsed to set defaults for the above
       command-line arguments. See the gbp.conf(5)> manpage for details.

SEE ALSO
       gbp-buildpackage(1)>,  gbp-import-dsc(1)>,   gbp-import-dscs(1)>,
       gbp-import-orig(1)>,  gbp-dch(1)>, gbp-pq(1)>, gbp-create-remote-
       repo(1)>,    gbp-pull(1)>,    gbp-clone(1)>,     git-pbuilder(1),
       gbp.conf(5)>, debuild(1), git(1), pristine-tar(1), The Git-Build‐
       package  Manual  <URL:file:///usr/share/doc/git-buildpackage/man‐
       ual-html/index.html>

AUTHOR
       Guido Guenther <agx@sigxcpu.org>

                             07 August 2016                       GBP(1)
