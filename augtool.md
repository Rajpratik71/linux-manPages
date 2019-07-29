AUGTOOL(1)                                                                                          Augeas                                                                                         AUGTOOL(1)



NAME
       augtool - inspect and modify configuration files

SYNOPSIS
       augtool [OPTIONS] [COMMAND]

DESCRIPTION
       Augeas is a configuration editing tool. It parses configuration files in their native formats and transforms them into a tree. Configuration changes are made by manipulating this tree and saving it
       back into native config files.

       augtool provides a command line interface to the generated tree. COMMAND can be a single command as described under "COMMANDS". When called with no COMMAND, it reads commands from standard input
       until an end-of-file is encountered.

OPTIONS
       -c, --typecheck
           Typecheck lenses. This can be very slow, and is therefore not done by default, but is highly recommended during development.

       -b, --backup
           When files are changed, preserve the originals in a file with extension '.augsave'

       -n, --new
           Save changes in files with extension '.augnew', do not modify the original files

       -r, --root=ROOT
           Use directory ROOT as the root of the filesystem. Takes precedence over a root set with the AUGEAS_ROOT environment variable.

       -I, --include=DIR
           Add DIR to the module loadpath. Can be given multiple times. The directories set here are searched before any directories specified in the AUGEAS_LENS_LIB environment variable, and before the
           default directories /usr/share/augeas/lenses and /usr/share/augeas/lenses/dist.

       -t, --transform=XFM
           Add a file transform; uses the 'transform' command syntax, e.g. "-t 'Fstab incl /etc/fstab.bak'".

       -f, --file=FILE
           Read commands from FILE.

       -i, --interactive
           Read commands from the terminal. When combined with -f or redirection of stdin, drop into an interactive session after executing the commands from the file.

       -e, --echo
           When reading commands from a file via stdin, echo the commands before printing their output.

       -s, --autosave
           Automatically save all changes at the end of the session.

       -S, --nostdinc
           Do not search any of the default directories for modules. When this option is set, only directories specified explicitly with -I or specified in AUGEAS_LENS_LIB will be searched for modules.

       -L, --noload
           Do not load any files on startup. This is generally used to fine-tune which files to load by modifying the entries in "/augeas/load" and then issuing a "load" command.

       -A, --noautoload
           Do not load any lens modules, and therefore no files, on startup. This creates no entries under "/augeas/load" whatsoever; to read any files, they need to be set up manually and loading must be
           initiated with a "load" command. Using this option gives the fastest startup.

       --version
           Print version information and exit. The version is also in the tree under "/augeas/version".

COMMANDS
       In interactive mode, commands and paths can be completed by pressing "TAB".

       The paths accepted as arguments by commands use a small subset of XPath path expressions. A path expression consists of a number of segments, separated by "/". In each segment, the character "*" can
       be used to match every node regardless of its label. Sibling nodes with identical labels can be distinguished by appending "[N]" to their label to match the N-th sibling with such a label. The last
       sibling with a specific label can be reached as "[last()]". See "EXAMPLES" for some examples of this.

       quit
           Exit the program

       ls <PATH>
           List the direct children of PATH

       match <PATTERN> [<VALUE>]
           Find all paths that match PATTERN. If VALUE is given, only the matching paths whose value equals VALUE are printed

       rm <PATH>
           Delete PATH and all its children from the tree

       mv <SRC> <DST>
           Move node SRC to DST. SRC must match exactly one node in the tree.  DST must either match exactly one node in the tree, or may not exist yet. If DST exists already, it and all its descendants
           are deleted. If DST does not exist yet, it and all its missing ancestors are created.

       set <PATH> <VALUE>
           Associate VALUE with PATH. If PATH is not in the tree yet, it and all its ancestors will be created.

       clear <PATH>
           Set the value for PATH to NULL. If PATH is not in the tree yet, it and all its ancestors will be created.

       setm <BASE> <SUB> <VALUE>
           Set multiple nodes in one operation.  Find or create a node matching SUB by interpreting SUB as a path expression relative to each node matching BASE. If SUB is '.', the nodes matching BASE will
           be modified.

       get <PATH>
           Print the value associated with PATH

       print [<PATH>]
           Print entries in the tree. If PATH is given, printing starts there, otherwise the whole tree is printed

       dump-xml [<PATH>] [<FILENAME>]
           Print entries in the tree as XML. If PATH is given, printing starts there, otherwise the whole tree is printed. If FILENAME is given, the XML is saved to the given file.

       ins <LABEL> <WHERE> <PATH>
           Insert a new node with label LABEL right before or after PATH into the tree. WHERE must be either 'before' or 'after'.

       save
           Save all pending changes to disk. Unless either the -b or -n command line options are given, files are changed in place.

       load
           Load files according to the transforms in "/augeas/load".

       defvar <NAME> <EXPR>
           Define the variable NAME to the result of evaluating EXPR. The variable can be used in path expressions as $NAME. Note that EXPR is evaluated when the variable is defined, not when it is used.

       defnode <NAME> <EXPR> [<VALUE>]
           Define the variable NAME to the result of evaluating EXPR, which must be a nodeset. If no node matching EXPR exists yet, one is created and NAME will refer to it. If VALUE is given, this is the
           same as 'set EXPR VALUE'; if VALUE is not given, the node is created as if with 'clear EXPR' would and NAME refers to that node.

       span <PATH>
           Print the name of the file from which the node PATH was generated, as well as information about the positions in the file corresponding to the label, the value, and the entire node. PATH must
           match exactly one node.

           You need to run 'set /augeas/span enable' prior to loading files to enable recording of span information. It is disabled by default.

       help
           Print this help text

ENVIRONMENT VARIABLES
       AUGEAS_ROOT
           The file system root, defaults to '/'. Can be overridden with the -r command line option

       AUGEAS_LENS_LIB
           Colon separated list of directories with lenses. Directories specified here are searched after any directories set with the -I command line option, but before the default directories
           /usr/share/augeas/lenses and /usr/share/augeas/lenses/dist

DIAGNOSTICS
       Normally, exit status is 0. If one or more commands fail, the exit status is set to a non-zero value.

       Note though that failure to load some of the files specified by transforms in "/augeas/load" is not considered a failure. If it is important to know that all files were loaded, you need to issue a
       "match /augeas//error" after loading to find out details about what files could not be loaded and why.

EXAMPLES
         # command line mode
         augtool print /files/etc/hosts/

         # interactive mode
         augtool
         augtool> help
         augtool> print /files/etc/hosts/

         # Print the third entry from the second AcceptEnv line
         augtool print '/files/etc/ssh/sshd_config/AcceptEnv[2]/3'

         # Find the entry in inittab with action 'initdefault'
         augtool> match /files/etc/inittab/*/action initdefault

         # Print the last alias for each entry in /etc/hosts
         augtool> print /files/etc/hosts/*/alias[last()]

FILES
       Lenses and schema definitions in /usr/share/augeas/lenses and /usr/share/augeas/lenses/dist

AUTHOR
         David Lutterkort <dlutter@redhat.com>

COPYRIGHT AND LICENSE
       Copyright 2007-2012 Red Hat Inc.

       Augeas (and augtool) are distributed under the GNU Lesser General Public License (LGPL)

SEE ALSO
       Augeas project homepage <http://www.augeas.net/>

       augparse



Augeas 1.0.0                                                                                      2013-05-17                                                                                       AUGTOOL(1)
