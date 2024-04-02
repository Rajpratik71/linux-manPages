AUGMATCH(1)                                     Augeas                                    AUGMATCH(1)

NAME
       augmatch - inspect and match contents of configuration files

SYNOPSIS
       augmatch [OPTIONS] FILE

DESCRIPTION
       augmatch prints the tree that Augeas generates by parsing a configuration file, or only those
       parts of the tree that match a certain path expression. Parsing is controlled by lenses, many
       of which ship with Augeas. augmatch to select the correct lens for a given file automatically
       unless one is specified with the --lens option.

OPTIONS
       -a, --all
           Print all tree nodes, even ones without an associated value. Without this flag, augmatch
           omits these nodes from the output as they are usually uninteresting.

       -e, --exact
           Only print the parts of the tree that exactly match the expression provided with --match
           and not any of the descendants of matching nodes.

       -I, --include=DIR
           Add DIR to the module loadpath. Can be given multiple times. The directories set here are
           searched before any directories specified in the AUGEAS_LENS_LIB environment variable, and
           before the default directories /usr/share/augeas/lenses and /usr/share/augeas/lenses/dist.

       -l, --lens=LENS
           Use LENS for the given file; without this option, augmatch tries to guess the lens for the
           file based on the file's name and path which only works for files in standard locations.

       -L, --print-lens
           Print the name of the lens that will be used with the given file and exit.

       -m, --match=EXPR
           Only print the parts of the tree that match the path expression EXPR. All nodes that match
           EXPR and their descendants will be printed. Use --exact to print only matching nodes but
           no descendants.

       -r, --root=ROOT
           Use directory ROOT as the root of the filesystem. Takes precedence over a root set with
           the AUGEAS_ROOT environment variable.

       -S, --nostdinc
           Do not search any of the default directories for lenses. When this option is set, only
           directories specified explicitly with -I or specified in AUGEAS_LENS_LIB will be searched
           for modules.

       -o, --only-value
           Print only the value and not the label or the path of nodes.

ENVIRONMENT VARIABLES
       AUGEAS_ROOT
           The file system root, defaults to '/'. Can be overridden with the -r command line option

       AUGEAS_LENS_LIB
           Colon separated list of directories with lenses. Directories specified here are searched
           after any directories set with the -I command line option, but before the default
           directories /usr/share/augeas/lenses and /usr/share/augeas/lenses/dist

EXAMPLES
         # print the tree for /etc/exports
         augmatch /etc/exports

         # show only the entry for a specific mount
         augmatch -m 'dir["/home"]' /etc/exports

         # show all the clients to which we are exporting /home
         augmatch -eom 'dir["/home"]/client' /etc/exports

FILES
       Lenses and schema definitions in /usr/share/augeas/lenses and /usr/share/augeas/lenses/dist

AUTHOR
       David Lutterkort <lutter@watzmann.net>

COPYRIGHT AND LICENSE
       Copyright 2007-2018 David Lutterkort

       Augeas (and augmatch) are distributed under the GNU Lesser General Public License (LGPL)

SEE ALSO
       Augeas project homepage <http://www.augeas.net/>

Augeas 1.9.0                                  2018-01-04                                  AUGMATCH(1)
