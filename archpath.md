ARCHPATH(1)                                                                              General Commands Manual                                                                              ARCHPATH(1)

NAME
       archpath - output arch (tla/Bazaar) archive names, with support for branches

SYNOPSIS
       archpath
       archpath branch
       archpath branch--version

DESCRIPTION
       archpath is intended to be run in an arch (tla or Bazaar) working copy.

       In its simplest usage, archpath with no parameters outputs the package name (archive/category--branch--version) associated with the working copy.

       If  a parameter is given, it may either be a branch--version, in which case archpath will output a corresponding package name in the current archive and category, or a plain branch name (without
       ‘--"), in which case archpath will output a corresponding package name in the current archive and category and with the same version as the current working copy.

       This is useful for branching.  For example, if you're using Bazaar and you want to create a branch for a new feature, you might use a command like this:

              baz branch $(archpath) $(archpath new-feature)

       Or if you want to tag your current code onto a ‘releases’ branch as version 1.0, you might use a command like this:

              baz branch $(archpath) $(archpath releases--1.0)

       That's much easier than using ‘baz tree-version’ to look up the package name and manually modifying the result.

AUTHOR
       archpath was written by Colin Watson <cjwatson@debian.org>.  Like archpath, this manual page is released under the GNU General Public License, version 2 or later.

DEBIAN                                                                                       Debian Utilities                                                                                 ARCHPATH(1)
