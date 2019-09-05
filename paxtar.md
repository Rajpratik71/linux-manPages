PAXTAR(1)                                                   BSD General Commands Manual                                                  PAXTAR(1)

NAME
     paxtar — tape archiver

SYNOPSIS
     paxtar {crtux}[014578AabefHhJjLmNOoPRSpqsvwXZz] [blocking-factor | archive | replstr] [-C directory] [-I file] [file ...]
     paxtar {-crtux} [-014578AaeHhJjLmNOoPpqRSvwXZz] [-b blocking-factor] [-C directory] [-f archive] [-I file] [-M flag] [-s replstr] [file ...]

DESCRIPTION
     The paxtar command creates, adds files to, or extracts files from an archive file in “tar” format.  A tar archive is often stored on a mag‐
     netic tape, but can be stored equally well on a floppy, CD-ROM, or in a regular disk file.

     In the first (legacy) form, all option flags except for -C and -I must be contained within the first argument to paxtar and must not be pre‐
     fixed by a hyphen (‘-’).  Option arguments, if any, are processed as subsequent arguments to paxtar and are processed in the order in which
     their corresponding option flags have been presented on the command line.

     In the second and preferred form, option flags may be given in any order and are immediately followed by their corresponding option argument
     values.

     One of the following flags must be present:

     -c      Create new archive, or overwrite an existing archive, adding the specified files to it.

     -r      Append the named new files to existing archive.  Note that this will only work on media on which an end-of-file mark can be overwrit‐
             ten.

     -t      List contents of archive.  If any files are named on the command line, only those files will be listed.  The file arguments may be
             specified as glob patterns (see glob(3) for more information), in which case paxtar will list all archive members that match each
             pattern.

     -u      Alias for -r.

     -x      Extract files from archive.  If any files are named on the command line, only those files will be extracted from the archive.  The
             file arguments may be specified as glob patterns (see glob(3) for more information), in which case paxtar will extract all archive
             members that match each pattern.

             If more than one copy of a file exists in the archive, later copies will overwrite earlier copies during extraction.  The file mode
             and modification time are preserved if possible.  The file mode is subject to modification by the umask(2).

     In addition to the flags mentioned above, any of the following flags may be used:

     -A      Write Unix Archiver libraries instead of tape archives.

     -a      Guess the compression utility based on the archive filename.  Inability to guess will result in quietly not using any compression.
             This option only exists for semi-compatibility with GNU tar; it is strongly recommended to archive to stdout and pipe into an exter‐
             nal compression utility with appropriate arguments instead:

                   tar -cf - foo | xz -2e >foo.txz

     -b blocking-factor
             Set blocking factor to use for the archive.  paxtar uses 512-byte blocks.  The default is 20, the maximum is 126.  Archives with a
             blocking factor larger than 63 violate the POSIX standard and will not be portable to all systems.

     -C directory
             This is a positional argument which sets the working directory for the following files.  When extracting, files will be extracted
             into the specified directory; when creating, the specified files will be matched from the directory.

     -e      Stop after the first error.

     -f archive
             Filename where the archive is stored.  Defaults to /dev/rst0.

     -H      Follow symlinks given on the command line only.

     -h      Follow symbolic links as if they were normal files or directories.  In extract mode this means that a directory entry in the archive
             will not overwrite an existing symbolic link, but rather what the link ultimately points to.

     -I file
             This is a positional argument which reads the names of files to archive or extract from the given file, one per line.

     -J      Use the xz utility to compress the archive.

     -j      Use the bzip2 utility to compress the archive.

     -L      Synonym for the -h option.

     -M flag
             Configure the archive normaliser.  flag is either a numeric value compatible to strtonum(3) which is directly stored in the flags
             word, or one of the following values, optionally prefixed with “no-” to turn them off:

             inodes  0x0001: Serialise inodes, zero device info.
                     (cpio, sv4cpio, sv4crc)
             links   0x0002: Store content of hard links only once.
                     (cpio, sv4cpio, sv4crc)
             mtime   0x0004: Zero out the file modification time.
                     (ar, cpio, sv4cpio, sv4crc, ustar)
             uidgid  0x0008: Set owner to 0:0 (root:wheel).
                     (ar, cpio, sv4cpio, sv4crc, ustar)
             verb    0x0010: Debug this option.
             debug   0x0020: Debug file header storage.
             lncp    0x0040: Extract hard links by copy if link fails.
             numid   0x0080: Use only numeric uid and gid values.
                     (ustar)
             gslash  0x0100: Append a slash after directory names.
                     (ustar)
             set     0x0003: Keep ownership and mtime intact.
             dist    0x008B: Clean everything except mtime.
             norm    0x008F: Clean everything.
             root    0x0089: Clean owner and device information.

             When creating an archive and verbosely listing output, these normalisation operations are not reflected in the output, because they
             are made only after the output has been shown.

             This option is only implemented for the ar, cpio, sv4cpio, sv4crc, and ustar file format writing routines.

     -m      Do not preserve modification time.

     -N      Same as -M numid.

     -O      If reading, extract files to standard output.
             If writing, write old-style (non-POSIX) archives.

     -o      Don't write directory information that the older (V7) style tar is unable to decode.  This implies the -O flag.

     -P      Do not strip leading slashes (‘/’) from pathnames.  The default is to strip leading slashes.

     -p      Preserve user and group ID as well as file mode regardless of the current umask(2).  The setuid and setgid bits are only preserved if
             the user is the superuser.  Only meaningful in conjunction with the -x flag.

     -q      Select the first archive member that matches each file operand.  No more than one archive member is matched for each file.  When mem‐
             bers of type directory are matched, the file hierarchy rooted at that directory is also matched.

     -R      Write SysVR4 CPIO files instead of tar or POSIX ustar files.  Serialise inode numbers, zero out device information.  The file content
             of hard links is stored only once.

     -S      Write SysVR4 CPIO files with CRC instead of tar or POSIX ustar files.  Serialise inode numbers, zero out device information.  The
             file content of hard links is stored only once.

     -s replstr
             Modify the archive member names according to the substitution expression replstr, using the syntax of the ed(1) utility regular
             expressions.  file arguments may be given to restrict the list of archive members to those specified.

             The format of these regular expressions is

                   /old/new/[gp]

             As in ed(1), old is a basic regular expression (see re_format(7)) and new can contain an ampersand (‘&’), ‘\n’ (where n is a digit)
             back-references, or subexpression matching.  The old string may also contain newline characters.  Any non-null character can be used
             as a delimiter (‘/’ is shown here).  Multiple -s expressions can be specified.  The expressions are applied in the order they are
             specified on the command line, terminating with the first successful substitution.

             The optional trailing g continues to apply the substitution expression to the pathname substring, which starts with the first charac‐
             ter following the end of the last successful substitution.  The first unsuccessful substitution stops the operation of the g option.
             The optional trailing p will cause the final result of a successful substitution to be written to standard error in the following
             format:

                   original-pathname >> new-pathname

             File or archive member names that substitute to the empty string are not selected and will be skipped.

     -v      Verbose operation mode.

     -w      Interactively rename files.  This option causes paxtar to prompt the user for the filename to use when storing or extracting files in
             an archive.

     -X      Do not cross mount points in the file system.

     -Z      Use the compress(1) utility to compress the archive.

     -z      Use the gzip(1) utility to compress the archive.

     The options [-014578] can be used to select one of the compiled-in backup devices, /dev/rstN.

ENVIRONMENT
     TMPDIR      Path in which to store temporary files.

     TAPE        Default tape device to use instead of /dev/rst0.

FILES
     /dev/rst0  default archive name

EXIT STATUS
     The paxtar utility exits with one of the following values:

           0       All files were processed successfully.
           1       An error occurred.

EXAMPLES
     Create an archive on the default tape drive, containing the files named bonvole and sekve:

           $ paxtar c bonvole sekve

     Output a gzip(1) compressed archive containing the files bonvole and sekve to a file called foriru.tar.gz:

           $ paxtar zcf foriru.tar.gz bonvole sekve

     Verbosely create an archive, called backup.tar.gz, of all files matching the shell glob(3) function *.c:

           $ paxtar zcvf backup.tar.gz *.c

     Verbosely list, but do not extract, all files ending in .jpeg from a compressed archive named backup.tar.gz.  Note that the glob pattern has
     been quoted to avoid expansion by the shell:

           $ paxtar tvzf backup.tar.gz '*.jpeg'

     For more detailed examples, see pax(1).

DIAGNOSTICS
     Whenever paxtar cannot create a file or a link when extracting an archive or cannot find a file while writing an archive, or cannot preserve
     the user ID, group ID, file mode, or access and modification times when the -p option is specified, a diagnostic message is written to stan‐
     dard error and a non-zero exit value will be returned, but processing will continue.  In the case where paxtar cannot create a link to a
     file, unless -M lncp is given, paxtar will not create a second copy of the file.

     If the extraction of a file from an archive is prematurely terminated by a signal or error, paxtar may have only partially extracted the file
     the user wanted.  Additionally, the file modes of extracted files and directories may have incorrect file bits, and the modification and
     access times may be wrong.

     If the creation of an archive is prematurely terminated by a signal or error, paxtar may have only partially created the archive, which may
     violate the specific archive format specification.

SEE ALSO
     ar(1), cpio(1), pax(1), paxcpio(1), tar(1), deb(5)

HISTORY
     A tar command first appeared in Version 7 AT&T UNIX.

AUTHORS
     Keith Muller at the University of California, San Diego.

     MirOS extensions by Thorsten Glaser <tg@mirbsd.org>.

CAVEATS
     The flags -AaJjLMNRS are not portable to other implementations of tar where they may have a different meaning or not exist at all.

BUGS
     The pax file format is not yet supported.

MirBSD                                                             July 3, 2014                                                             MirBSD
