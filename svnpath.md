SVNPATH(1)                                                                                                                                                                                     SVNPATH(1)

NAME
       svnpath - output svn url with support for tags and branches

SYNOPSIS
       svnpath

       svnpath tags

       svnpath branches

       svnpath trunk

DESCRIPTION
       svnpath is intended to be run in a Subversion working copy.

       In its simplest usage, svnpath with no parameters outputs the svn url for the repository associated with the working copy.

       If a parameter is given, svnpath attempts to instead output the url that would be used for the tags, branches, or trunk. This will only work if it's run in the top-level directory that is
       subject to tagging or branching.

       For example, if you want to tag what's checked into Subversion as version 1.0, you could use a command like this:

         svn cp $(svnpath) $(svnpath tags)/1.0

       That's much easier than using svn info to look up the repository url and manually modifying it to derive the url to use for the tag, and typing in something like this:

         svn cp svn+ssh://my.server.example/svn/project/trunk svn+ssh://my.server.example/svn/project/tags/1.0

       svnpath uses a simple heuristic to convert between the trunk, tags, and branches paths. It replaces the first occurrence of trunk, tags, or branches with the name of what you're looking for.
       This will work ok for most typical Subversion repository layouts.

       If you have an atypical layout and it does not work, you can add a ~/.svnpath file. This file is perl code, which can modify the path in $url.  For example, the author uses this file:

        #!/usr/bin/perl
        # svnpath personal override file

        # For d-i I sometimes work from a full d-i tree branch. Remove that from
        # the path to get regular tags or branches directories.
        $url=~s!d-i/(rc|beta)[0-9]+/!!;
        $url=~s!d-i/sarge/!!;
        1

LICENSE
       GPL version 2 or later

AUTHOR
       Joey Hess <joey@kitenet.net>

Debian Utilities                                                                                2016-03-23                                                                                     SVNPATH(1)
