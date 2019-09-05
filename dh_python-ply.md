DH_PYTHON-PLY(1)                                        User Contributed Perl Documentation                                       DH_PYTHON-PLY(1)

NAME
       dh_python-ply - generate versioned dependencies on python-ply

SYNOPSIS
       dh_python-ply [--dependency-field dependencyfield] [debhelper options] file...

DESCRIPTION
       dh_python-ply is a debhelper program that is responsible for generating the python-ply:Depends substitutions and adding them to substvars
       files.

       The program will look only at Python modules that are explicitly provided as its arguments, and will use this information to generate a
       strict versioned dependency on python-ply.

OPTIONS
       --dependency-field dependencyfield
           Use python-ply:dependencyfield substitution variable instead of python-ply:Depends.

SEE ALSO
       debhelper(7)

       This program is not a part of debhelper, but it is meant to be used together with it.

AUTHOR
       Jakub Wilk <jwilk@debian.org>

perl v5.20.2                                                        2014-10-16                                                    DH_PYTHON-PLY(1)
