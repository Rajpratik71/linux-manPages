GEANY(1)                                                                                                                                  GEANY(1)

NAME
       Geany — a small and lightweight IDE

SYNOPSIS
       geany [option]  [+number]  [files ...]

DESCRIPTION
       Geany is a small and fast editor with basic features of an integrated development environment.

       Some  of  its features: syntax highlighting, code completion, code folding, symbol/tag lists and many supported filetypes like C(++), Java,
       PHP, HTML, DocBook, Perl and more.

       Homepage: http://www.geany.org/

OPTIONS
           files ...
                 A space-separated list of filenames. Absolute and relative filenames can be used. Geany also recognises line and column  informa‐
                 tion  when  appended  to  the filename with colons, e.g.  "geany foo.bar:10:5" will open the file foo.bar and place the cursor in
                 line 10 at column 5.

                 Projects can also be opened but a project file (*.geany) must be the first non-option argument.  All additionally given files are
                 ignored.

           +number
                 Set  initial  line  number for the first opened file (same as --line, do not put a space between the + sign and the number). E.g.
                 "geany +7 foo.bar" will open the file foo.bar and place the cursor in line 7.

           --column
                 Set initial column number for the first opened file (useful in conjunction with --line).

       -c, --config
                 Use an alternate configuration directory. Default configuration directory is ~/.config/geany/ and there  resides  geany.conf  and
                 some template files.

           --ft-names
                 Print a list of Geany's internal filetype names (useful snippets configuration).

       -g, --generate-tags
                 Generate a global tags file (see documentation).

       -P, --no-preprocessing
                 Don't preprocess C/C++ files when generating tags.

       -i, --new-instance
                 Don't  open  files  in  a  running instance, force opening a new instance.  Only available if Geany was compiled with support for
                 Sockets.

       -l, --line
                 Set initial line number for the first opened file.

           --list-documents
                 Return a list of open documents in a running Geany instance.  This can be used to read the currently opened  documents  in  Geany
                 from  an  external  script or tool. The returned list is separated by newlines (LF) and consists of the full, UTF-8 encoded file‐
                 names of the documents.  Only available if Geany was compiled with support for Sockets.

       -m, --no-msgwin
                 Don't show the message window. Use this option if you don't need compiler messages or VTE support.

       -n, --no-ctags
                 Don't load symbol completion and call tip data. Use this option, if you don't want to use them.  For more information please  see
                 documentation.

       -p, --no-plugins
                 Don't load plugin support.

           --print-prefix
                 Print  installation  prefix,  the  data directory, the lib directory and the locale directory (in this order) to stdout, each per
                 line. This is mainly intended for plugin authors to detect installation paths.

       -r, --read-only
                 Open all files given on the command line in read-only mode. This only applies to files opened explicitly from the  command  line,
                 so files from previous sessions or project files are unaffected.

       -s, --no-session
                 Don't load the previous session's files.

       -t, --no-terminal
                 Don't  load  terminal support. Use this option, if you don't want to load the virtual terminal emulator widget at startup. If you
                 don't have libvte.so.4 installed, then terminal-support is automatically disabled. Only available if Geany was compiled with sup‐
                 port for VTE.

           --socket-file
                 Use this socket filename for communication with a running Geany instance

           --vte-lib
                 Specify  explicitly  the  path including filename or only the filename to the VTE library, e.g.  /usr/lib/libvte.so or libvte.so.
                 This option is only needed, when the autodetection doesn't work. Only available if Geany was compiled with support for VTE.

       -v, --verbose
                 Be verbose (print useful status messages).

       -V, --version
                 Show version information and exit.

       -?, --help
                 Show help information and exit.

       Geany supports all generic GTK options, a list is available on the help screen.

AUTHOR
       This manual page was written by the Geany developer team. Permission is granted to copy, distribute and/or modify this document  under  the
       terms of the GNU General Public License, Version 2.

       The complete text of the GNU General Public License can be found in /usr/share/geany/GPL-2.

geany 1.27                                                        March 13, 2016                                                          GEANY(1)
