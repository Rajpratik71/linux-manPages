ubuntu-upload-permission(1)                                   General Commands Manual                                  ubuntu-upload-permission(1)

NAME
       ubuntu-upload-permission - Query upload rights and (optionally) list the people and teams with upload rights for a package

SYNOPSIS
       ubuntu-upload-permission [options] package

DESCRIPTION
       ubuntu-upload-permission checks if the user has upload permissions for package.  If the --list-uploaders option is provided, all the people
       and teams that do have upload rights for package will be listed.

OPTIONS
       -r RELEASE, --release=RELEASE
              Query permissions in RELEASE.  Default: current development release.

       -a, --list-uploaders
              List all the people and teams who have upload rights for package.

       -t, --list-team-members
              List all the members of every team with rights. (Implies --list-uploaders)

       -h, --help
              Display a help message and exit

EXIT STATUS
       0      You have the necessary upload rights.

       1      You don't have the necessary upload rights.

       2      There was an error.

AUTHORS
       ubuntu-upload-permission and this manpage were written by Stefano Rivera <stefanor@ubuntu.com>.

       Both are released under the terms of the ISC License.

ubuntu-dev-tools                                                   November 2011                                       ubuntu-upload-permission(1)
