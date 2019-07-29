DH_STRIP_NONDETERMINISM(1p)                             User Contributed Perl Documentation                            DH_STRIP_NONDETERMINISM(1p)

NAME
       dh_strip_nondeterminism - strip uninteresting, nondeterministic information from files

SYNOPSIS
       dh_strip_nondeterminism [debhelper options] [-Xitem]

DESCRIPTION
       dh_strip_nondeterminism is a debhelper program that is responsible for stripping uninteresting, nondeterministic information, such as
       timestamps, from compiled files so that the build is reproducible.

       This program examines your package build directories and works out what to strip on its own. It uses file(1) and filenames to figure out
       what files should have nondeterminism stripped from them.  In general it seems to make very good guesses, and will do the right thing in
       almost all cases.

OPTIONS
       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being stripped. You may use this option multiple times to build up a
           list of things to exclude.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHORS
       Andrew Ayer <agwa@andrewayer.name> Chris Lamb <lamby@debian.org>

perl v5.22.1                                                        2018-03-30                                         DH_STRIP_NONDETERMINISM(1p)
