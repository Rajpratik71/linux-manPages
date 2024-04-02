GITG(1)                                                                                 General Commands Manual                                                                                GITG(1)

NAME
       gitg - Git repository viewer

SYNOPSIS
       gitg [options] [repository] [<refspec>]

DESCRIPTION
       gitg is a graphical user interface for git. It aims at being a small, fast and convenient tool to visualize the history of git repositories.  Besides visualization, gitg also provides several
       utilities to manage your repository and commit your work.

OPTIONS
       -c,--commit Open gitg in commit view

       -?,--help Show the help message

       [repository] Load the repository at repository in gitg.  If unspecified, gitg will try to open the repository at the current working directory

       [<refspec>] Populate the history view of gitg using the specified <refspec> which has the same format as used with git log (Example: gitg --left-right HEAD..FETCH_HEAD)

AUTHORS
       Jesse van den Kieboom  <jesse@icecrew.nl>

                                                                                              22 Jun 2008                                                                                      GITG(1)
