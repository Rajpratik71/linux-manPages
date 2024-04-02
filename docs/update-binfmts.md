UPDATE-BINFMTS(8)                                         Debian System Manager's Manual                                         UPDATE-BINFMTS(8)

NAME
     update-binfmts — maintain registry of executable binary formats

SYNOPSIS
     update-binfmts [options] --install name path spec
     update-binfmts [options] --remove name path
     update-binfmts [options] --import [name]
     update-binfmts [options] --display [name]
     update-binfmts [options] --enable [name]
     update-binfmts [options] --disable [name]
     update-binfmts [options] --find [path]

DESCRIPTION
     Versions 2.1.43 and later of the Linux kernel have contained the binfmt_misc module.  This enables a system administrator to register inter‐
     preters for various binary formats based on a magic number or their file extension, and cause the appropriate interpreter to be invoked when‐
     ever a matching file is executed.  Think of it as a more flexible version of the #! executable interpreter mechanism, or as something which
     can behave a little like "associations" in certain other operating systems (though in GNU/Linux the tendency is to keep this sort of thing
     somewhere else, like your file manager).  update-binfmts manages a persistent database of these interpreters.

     When each package providing a registered interpreter is installed, changed, or removed, update-binfmts is called to update information about
     that interpreter.  update-binfmts is usually called from the postinst or prerm scripts in Debian packages.

OPTIONS
     Exactly one action must be specified; this may be accompanied by any one of the common options.

   COMMON OPTIONS
     --package package-name
           Specifies the name of the current package, to be used by package post-installation and pre-removal scripts.  System administrators
           installing binary formats for local use should probably ignore this option.

           When installing new formats, the --import action should be used instead.

     --admindir directory
           Specifies the administrative directory, when this is to be different from the default of /var/lib/binfmts.

     --importdir directory
           Specifies the directory from which packaged binary formats are imported, when this is to be different from the default of
           /usr/share/binfmts.

     --test
           Don't do anything, just demonstrate what would be done.

     --help
           Display some usage information.

     --version
           Display version information.

   ACTIONS
     --install name path spec
           Install a binary format identified by name with interpreter path into the database.  After registration, this format will be used when
           the kernel tries to execute a file matching spec (see BINARY FORMAT SPECIFICATIONS below).

           --install will attempt to enable this binary format in the kernel as well as adding it to its own database; see --enable below.

           You cannot install a format with any of the names ".", "..", "register", or "status", as these are used by the filesystem or the
           binfmt_misc module.

     --remove name path
           Remove the binary format identified by name with interpreter path from the database.  This will also attempt to disable the binary for‐
           mat in the kernel; see --disable below.

     --import [name]
           Import a packaged format file called name, or import all format files currently on the system if no name is given.  If name is not a
           full path, it is assumed to be a file in the import directory (/usr/share/binfmts by default).  See FORMAT FILES below for the required
           contents of these files.

           For packages, this is preferable to using the --install option, as a format file can be installed without update-binfmts needing to be
           available.

     --display [name]
           Display any information held in the database about the binary format identifier name, or about all known binary formats if no name is
           given.  Also show whether displayed binary formats are enabled or disabled.

     --enable [name]
           Enable binary format name, or all known binary formats if no name is given, in the kernel, thus enabling direct execution of matching
           files.  You must have binfmt_misc compiled into the kernel or loaded as a module for this to work.

     --disable [name]
           Disable binary format name, or all known binary formats if no name is given, in the kernel, thus disabling direct execution of matching
           files.  You must have binfmt_misc compiled into the kernel or loaded as a module for this to work.

     --find [path]
           Print the list of interpreters that will be tried in sequence when attempting to execute path, one per line.  The first one for which
           execvp(3) succeeds will be used.

           Note that if multiple formats match an executable, then the order is in general not defined, and may not be preserved between
           update-binfmts operations, so you should generally try to ensure that this option prints at most one line for any given path.  The
           exception to this is that any format with a userspace detector will be run before any format without a userspace detector.

   BINARY FORMAT SPECIFICATIONS
     --magic byte-sequence
           This matches all files with the magic number byte-sequence.  Hexadecimal escapes may be included in the byte-sequence by preceding them
           with \x, for example ‘\x0a’ for a linefeed.  Remember to protect such escapes with quotes or an additional backslash to prevent their
           interpretation by the shell.

           Also see --offset and --mask.

     --offset offset
           This is the offset of the magic/mask in the file, counted in bytes.  The default is 0.  Only valid with --magic.

     --mask byte-sequence
           This mask will be logically-ANDed with the string to be checked against the magic number given with --magic.  The default is all 0xff,
           i.e. no effect.  Only valid with --magic.

     --extension extension
           This matches all files whose names end in ".extension".  Hexadecimal escapes are not recognized here.  Extension matching is case-sen‐
           sitive.

     --detector path
           If this option is used, a userspace detector program will be used to check whether the file is suitable for this interpreter.  This may
           be used when the binary format is more complex than can be handled by the kernel's format specifications alone.  The program should
           return an exit code of zero if the file is appropriate and non-zero otherwise.

     --credentials yes, --credentials no
           Whether to keep the credentials of the original binary to run the interpreter; this is typically useful to run setuid binaries, but has
           security implications.

     --preserve yes, --preserve no
           Whether to preserve the original argv[0] when running the interpreter, rather than overwriting it with the full path to the binary.

     --fix-binary yes, --fix-binary no
           Whether to open the interpreter binary immediately and always use the opened image.  This allows the interpreter from the host to be
           used regardless of usage in chroots or different mount namespaces.  The default behaviour is no, meaning that the kernel should open
           the interpreter binary lazily when needed.  This option requires Linux 4.8 or newer.

   FORMAT FILES
     A format file is a sequence of options, one per line, corresponding roughly to the options given to an --install command.  Each option con‐
     sists of a key, followed by whitespace, followed by a value.

     The package option should be set to the current package.  The interpreter option should be set to the path to the interpreter that will han‐
     dle this binary format.  The magic, offset, mask, extension, detector, credentials, preserve, and fix-binary options correspond to the com‐
     mand-line options of the same names.

EXIT STATUS
     0     The requested action was successfully performed.

     2     Problems were encountered whilst parsing the command line or performing the action.

EXAMPLES
     This format file can be used with an interpreter capable of handling Java .class files:

         package javawrapper
         interpreter /usr/bin/javawrapper
         magic \xca\xfe\xba\xbe

     This corresponds roughly to the following command:

         update-binfmts --package javawrapper \
             --install javawrapper /usr/bin/javawrapper \
             --magic '\xca\xfe\xba\xbe'

NOTES
     If you're not careful, you can break your system with update-binfmts.  An easy way to do this is to register an ELF binary as a handler for
     ELF, which will almost certainly cause your system to hang immediately; even if it doesn't, you won't be able to run update-binfmts to fix
     it.  In the future update-binfmts may have some checks to prevent this sort of thing happening accidentally, though of course you can still
     manipulate the binfmt_misc kernel module directly.

AUTHOR
     update-binfmts is copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011 Colin Watson <cjwatson@debian.org>.
     See the GNU General Public License version 3 or later for copying conditions.

     You can find the GNU GPL v3 in /usr/share/common-licenses/GPL-3 on any modern Debian system.

     Richard Guenther wrote the binfmt_misc kernel module.

THANKS
     Ian Jackson wrote update-alternatives and dpkg-divert, from which this program borrows heavily.

Debian                                                           January 24, 2011                                                           Debian
