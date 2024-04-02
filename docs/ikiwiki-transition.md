ikiwiki-transition(1)                                         General Commands Manual                                        ikiwiki-transition(1)

NAME
       ikiwiki-transition - transition ikiwiki pages to new syntaxes, etc

SYNOPSIS
       ikiwiki-transition type ...

DESCRIPTION
       ikiwiki-transition  aids  in  converting  wiki  pages  when there's a major change in ikiwiki syntax. It also handles other transitions not
       involving wiki pages.

prefix_directives your.setup
       The prefix_directives mode converts all pages from the old preprocessor directive syntax, requiring a space, to the new syntax, prefixed by
       '!'.

       Preprocessor directives which already use the new syntax will remain unchanged.

       Note  that  if a page contains wiki links with spaces, which some older versions of ikiwiki accepted, the prefix_directives transition will
       treat these as preprocessor directives and convert them.

setupformat your.setup
       The setupformat mode converts a setup file from using a single wrappers block to using cgi_wrapper, git_wrapper, etc.

       Note that all comments and any unusual stuff like perl code in the setup file will be lost, as it is entirely rewritten by the transition.

aggregateinternal your.setup
       The aggregateinternal mode moves pages aggregated by the aggregate plugin so that the aggregateinternal option can be enabled.

moveprefs your.setup
       Moves values that used to be admin preferences into the setup file.

       Note that all comments and any unusual stuff like perl code in the setup file will be lost, as it is entirely rewritten by the move.

indexdb your.setup|srcdir
       The indexdb mode handles converting a plain text .ikiwiki/index file to a binary .ikiwiki/indexdb. You do not normally  need  to  run  iki‐
       wiki-transition indexdb; ikiwiki will automatically run it as necessary.

hashpassword your.setup|srcdir
       The  hashpassword  mode  forces  any  plaintext  passwords  stored  in  the  .ikiwiki/userdb file to be replaced with password hashes. (The
       Authen::Passphrase perl module is needed to do this.)

       If this is not done explicitly, a user's plaintext password will be automatically converted to a hash when a user logs  in  for  the  first
       time after upgrade to ikiwiki 2.48.

deduplinks your.setup
       In the past, bugs in ikiwiki have allowed duplicate link information to be stored in its indexdb. This mode removes such duplicate informa‐
       tion, which may speed up wikis afflicted by it. Note that rebuilding the wiki will have the same effect.

AUTHOR
       Josh Triplett <josh@freedesktop.org>, Joey Hess <joey@ikiwiki.info>

                                                                                                                             ikiwiki-transition(1)
