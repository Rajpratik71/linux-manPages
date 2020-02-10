INSTALL-DOCS(8)                                                                                   Debian                                                                                  INSTALL-DOCS(8)

NAME
       install-docs - manage online Debian documentation

SYNOPSIS
        install-docs [options] -i,--install | -r,--remove | -c,--check file [ file ... ]

        install-docs [options] -I,--install-all | -C,--install-changed | -R,--remove-all

        install-docs [options] -s,--status docid [ docid ... ]

        install-docs [options] --dump-db dbname

        install-docs -h,--help | -V,--version

DESCRIPTION
       install-docs is a tool allow Debian package maintainers to register documentation to various documentation systems.  It currently supports dhelp,  dwww, doc-central, and scrollkeeper browsers.

       This manual page provides a quick synopsis of install-docs usage.  Full documentation can be found in the documentation, including a description of the control file syntax and grammar.

OPTIONS
       -v, --verbose
           Operate verbosely.

       -d, --debug
           Print some debugging information.

       --no-update-menus
           Inhibit running dwww-build-menu(8), dhelp_parse(8), and scrollkeeper-update(8).

       --rootdir dir
           Set the root directory to dir instead of `/'. Useful and valid only with the --check action.

ACTIONS
       Below is list of possible actions install-docs could handle. There can be only one action option passed to install-docs, moreover the action with its arguments must be the last option passed.

       Each file argument should be the full path for the doc-base control file (i.e.  `/usr/share/doc-base/some_file' or `/etc/doc-base/documents/some_file'), and each docid should be the document
       identifier (Document identifiers are set in the `Document' field of the control file, and usually correspond to the package name.)

       If file or docid equals `-' (the minus sign), the list of arguments is read from the standard input (each file name or document id in separate line).

       -i file [file ...],  --install file [file ...]
           Install the documentation described by the control file file.

       -r file [file ...],  --remove file [file ...]
           Remove the documentation identified by the control file file.

       -c file [file ...],  --check file [file ...]
           Check the control file file and display number of possible problems found.  Use with --verbose to get the actual locations of errors and warnings.  If --rootdir was also given, its argument
           will be prepended to names of the files given if the `Files' and `Index' fields of the file.

       -R,  --remove-all
           De-register all registered documents.

       -I, --install-all
           (Re)register all documents from /usr/share/doc-base and /etc/doc-base/documents.

       -C, --install-changed
           Compare contents of /usr/share/doc-base and /etc/doc-base/documents directories with registered documents database and de-register any files that are missing and (re)register only changed or
           new files.

       -s docid [docid ...], --status docid [docid ...]
           Display the status of the document identifier docid.

       -L docid [docid ...], --listfiles docid [docid ...]
           Deprecated option. Does nothing.

       --dump-db dbname
           Dumps contents of internal databases, for debugging purposes. dbname can be either files.db or status.db.

       -h, --help
           Show a short help message.

       -V, --version
           Display version information.

COMPATIBILITY ISSUES
       The following features were added in version 0.8.4, please make sure to add proper `Conflicts' or `Depends' lines if you would like to use them in your package's scripts:

       ·   support for passing more than one argument to the -i and -r actions,

       ·   reading arguments from the standard input,

       ·   -I,--install-all, -R, ---remove-all, -c, --check actions,

       ·   -d, --debug, -h, --help options.

       The -C, --install-changed, --dump-db, -V, --version options were added in 0.8.12.

FILES
       /usr/share/doc-base/
           The location of doc-base control files provided by various packages.

       /etc/doc-base/documents/
           The location of doc-base control files provided by local administrator.

       /var/lib/doc-base/info/documents/
           The location of registered control files.

       /var/lib/doc-base/info/status.db
           Statuses of registered documents.

       /var/lib/doc-base/info/files.db
           Timestamps and documents ids of registered doc-base files.

       /var/lib/doc-base/omf/
           The location of generated scrollkeeper OMF files.  Note: /usr/share/omf/doc-base should be a symbolic link pointing to the directory.

BUGS
       See <http://bugs.debian.org/doc-base>.

SEE ALSO
       dhelp(1), doccentral(1), dwww(7), scrollkeeper(7), Debian doc-base Manual /usr/share/doc/doc-base/doc-base.html/index.html

AUTHOR
       This program was originally written by Christian Schwarz <schwarz@debian.org>, for the Debian GNU/Linux system, and the next maintainer was Adam Di Carlo <aph@debian.org>.  Robert Luberda
       <robert@debian.org> is currently maintaining and extending it.

       This software was meant to be for the benefit of the entire Debian user and developer community.  If you are interested in being involved with this software, please join the mailing list
       <debian-doc@lists.debian.org>.

doc-base v0.10.7                                                                             27 January 2016                                                                              INSTALL-DOCS(8)
