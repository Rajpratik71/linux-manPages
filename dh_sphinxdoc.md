DH_SPHINXDOC(1)                                                      Debhelper                                                     DH_SPHINXDOC(1)

NAME
       dh_sphinxdoc - helps with packaging Sphinx-generated documentation

SYNOPSIS
       dh_sphinxdoc [debhelper options] [-Xitem] [directory...]

DESCRIPTION
       dh_sphinxdoc is a debhelper program that prepares Sphinx-generated documentation for inclusion in a Debian package. More specifically:

       ·   It checks if all the files referenced by searchindex.js exist.

       ·   It replaces known *.js files with symlinks to /usr/share/javascript/sphinxdoc/ and generates ${sphinxdoc:Depends} substitution
           variable.

       ·   If the Sphinx RTD theme is used, it replaces known files from this theme with symlinks to /usr/share/sphinx_rtd_theme/, and adds
           sphinx-rtd-theme-common to ${sphinxdoc:Depends}.

       ·   It provides a ${sphinxdoc:Built-Using} substitution variable, for tracking files which could not be symlinked. Examples of such files
           are *.js and *.css files that are generated from corresponding *.js_t and *.css_t templates, and can vary depending on the used theme
           options (for instance, basic.css file is generated from basic.css_t and is included in almost every Sphinx-generated documentation).
           Currently, this variable will contain sphinx and, if the default theme is used, alabaster, with their versions (other themes are not
           supported).

       ·   It removes the .doctrees directory.

       ·   It removes the .buildinfo file.

       ·   It removes the websupport.js file.

       Note that dh_sphinxdoc does not build the documentation, it only performs the above operations when the documentation is already installed
       into the package build path. To build the docs, please use sphinx-build(1) command or python3 -m sphinx syntax.

       You can pass --with sphinxdoc to dh(1) to make it automatically call dh_sphinxdoc after dh_installdocs.

OPTIONS
       directory
           By default, dh_sphinxdoc scans your package looking for directories looking like they contain Sphinx-generated documentation. However,
           if you explicitly provide one or more directories, only they will be processed. If documentation is not found at directory, an error is
           raised.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being symlinked, removed or checked for existence.

BUGS
       Symlinking translations.js and non-English searchtools.js is not supported.

SEE ALSO
       debhelper(7), dh(1).

       This program is meant to be used together with debhelper.

AUTHOR
       Jakub Wilk <jwilk@debian.org>

                                                                    2018-02-11                                                     DH_SPHINXDOC(1)
