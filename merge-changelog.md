merge-changelog(1)                                            General Commands Manual                                           merge-changelog(1)

NAME
       merge-changelog - merges two changelogs with a common base

SYNOPSIS
       merge-changelog <left changelog> <right changelog>

DESCRIPTION
       merge-changelog  takes  two changelogs that once shared a common source, merges them back together, and prints the merged result to stdout.
       This is useful if you need to manually merge a ubuntu package with a new Debian release of the package.

AUTHORS
       merge-changelog was written by Scott James Remnant <scott@ubuntu.com> and Bryce Harrington <bryce@ubuntu.com>. This manpage was written  by
       Ryan Kavanagh <ryanakca@kubuntu.org>.

       Both are released under the GNU General Public License, version 3.

ubuntu-dev-tools                                                 February 15, 2010                                              merge-changelog(1)
