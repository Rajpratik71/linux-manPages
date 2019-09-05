ikiwiki-makerepo(1)                                           General Commands Manual                                          ikiwiki-makerepo(1)

NAME
       ikiwiki-makerepo - check an ikiwiki srcdir into revision control

SYNOPSIS
       ikiwiki-makerepo git|svn|monotone|darcs|cvs srcdir repo

       ikiwiki-makerepo bzr|mercurial srcdir

DESCRIPTION
       ikiwiki-makerepo  injects  an  existing  srcdir  directory, containing sources for an ikiwiki wiki, into revision control. It is rarely run
       directly; consider using ikiwiki --setup /etc/ikiwiki/wiki.setup instead to set up a wiki.

       For git, the repo is created as a bare git repository, and the srcdir is made into a clone of it. (monotone and darcs are similar.)

       For svn and cvs, the repo is the centralized repository, and the srcdir is a checkout of it.

       For mercurial and bzr, the srcdir is the only repository set up.

       For darcs, the master repo's apply hook will be preconfigured to call a ikiwiki wrapper.

       Note that for monotone, you are assumed to already have run "mtn genkey" to generate a key.

EXAMPLE
       ikiwiki-makerepo git /srv/web/wiki /srv/git/wiki.git/

       This creates a bare repository /srv/git/wiki.git/, and sets up /srv/web/wiki to be a clone of it, committing any files that  already  exist
       in that directory.

AUTHOR
       Joey Hess <joey@ikiwiki.info>

                                                                                                                               ikiwiki-makerepo(1)
