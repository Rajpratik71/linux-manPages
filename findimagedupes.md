FINDIMAGEDUPES(1p)                                      User Contributed Perl Documentation                                     FINDIMAGEDUPES(1p)

NAME
       findimagedupes - Finds visually similar or duplicate images

SYNOPSIS
       findimagedupes [option ...] [--] [ - | [file ...] ]

          Options:
             -f, --fingerprints=FILE    -c, --collection=FILE
             -M, --merge=FILE           -p, --program=PROGRAM
             -P, --prune                -s, --script=FILE
             -a, --add                  -i, --include=TEXT
             -r, --rescan               -I, --include-file=FILE
             -n, --no-compare
                                        -q, --quiet
             -t, --threshold=AMOUNT     -v, --verbosity=LIST

             -0, --null                 -h, --help
             -R, --recurse                  --man

       With no options, compares the specified files and does not use nor update any fingerprint database.

       Directories of images may be specified instead of individual files; Sub-directories of these are not searched unless --recurse is used.

OPTIONS
       -0, --null
               If a file "-" is given, a list of files is read from stdin.

               Without -0, the list is specified one file per line, such as produced by find(1) with its "-print" option.

               With -0, the list is expected to be null-delimited, such as produced by find(1) with its "-print0" option.

       -a, --add
               Only look for duplicates of files specified on the commandline.

               Matches are also sought in any fingerprint databases specified.

       -c, --collection=FILE
               Create GQView collection FILE.gqv of duplicates.

               The program attempts to produce well-formed collections.  In particular, it will print a warning and exclude any file whose name
               contains newline or doublequote. (In this situation, gqview(1) seems to create a .gqv collection file that it silently fails to
               read back in properly.)

       -d, --debug=OPTS
               Enable debugging output. Options OPTS are subject to change.  See the program source for details.

       -f, --fingerprints=FILE
               Use FILE as fingerprint database.

               May be abbreviated as --fp or --db.

               This option may be given multiple times when --merge is used.  (Note: FILE could contain commas, so multiple databases may not be
               specified as a single comma-delimited list.)

       -h, --help
               Print usage and option sections of this manual.

       -i, --include=TEXT
               TEXT is Bourne-shell code to customise --script.

               It is executed after any code included using --include-file.

               May be given multiple times. Code will be concatenated.

       -I, --include-file=FILE
               FILE is a file containing Bourne-shell code to customise --script.

               It is executed before any code included using --include.

       --man   Display the full documentation, using default pager.

       --merge=FILE
               Takes any databases specified with --fingerprints and merges them into a new database called FILE.  Conflicting fingerprints for an
               image will cause one of two actions to occur:

               1.  If the image does not exist, then the entry is elided.

               2.  If the image does exist, then the old information is ignored and a new fingerprint is generated from scratch.

               By default, image existence is not checked unless there is a conflict.  To force removal of defunct data, use --prune as well.

               A list of image files is not required if this option is used.  However, if a list is provided, fingerprint data for the files will
               be copied or (re)generated as appropriate.

               When --merge is used, the original fingerprint databases are not modified, even if --prune is used.

               See also: --rescan

       -n, --no-compare
               Don't look for duplicates.

       -p, --program=PROGRAM
               Launch PROGRAM (in foreground) to view each set of dupes.

               PROGRAM must be the full path to an existing executable file.  For more flexibility, see the --include and --include-file options.

               See also: --script

       --prune Remove fingerprint data for images that do not exist any more.  Has no effect unless --fingerprints or --merge is also used.

               Databases specified by --fingerprints are only modified if --merge is not used.

       -q, --quiet
               This option may be given multiple times.

               Usually, progress, warning and error messages are printed on stderr.  If this option is given, warnings are not displayed.  If it
               is given twice or more, errors are not displayed either.

               Information requested with --verbosity is still displayed.

       -R, --recurse
               Use --recurse to search recursively for images inside subdirectories. For historical reasons, the default is to not do so.  To
               avoid looping, symbolic links to directories are never followed.

       -r, --rescan
               (Re)generate all fingerprints, not just any that are unknown.

               If used with --add, only the fingerprints of files specified on the commandline are (re)generated.

               Implies --prune.

       -s, --script=FILE
               When used with --program, PROGRAM is not launched immediately.  Instead sh(1)-style commands are saved to FILE.  This script may be
               edited (if desired) and then executed manually.

               When used without --program, two skeletal shell functions are generated: "VIEW" simply echo(1)s its arguments; the empty function
               "END" runs after files-processing is finished.

               To display to terminal (or feed into a pipe), use "-" as FILE.

               If --script is not given, the script is still created in memory and is executed immediately. So, with the default VIEW and END
               functions, lines containing sets of duplicates are displayed. See: EXAMPLES

               See also: --include, --include-file

       -t, --threshold=AMOUNT
               Use AMOUNT as threshold of similarity.  Append "%" to give a percentage or "b" for bits.  For backwards compatibility, a number
               with no unit is treated as a percentage. Percentage is the minimum required for a match; bits is the maximum that may differ:
               bits=floor(2.56(100-percent))

               A fractional part may be given but it is only accurate to 100/256 (0.390625) for percentage and it is meaningless for "bits".
               Default is "90%" ("25b") if not specified.

       -v, --verbosity=LIST
               Enable display of informational messages to stdout, where LIST is a comma-delimited list of:

               md5     Display the checksum for each file, as per md5sum(1).

               fingerprint | fp
                       Display the base64-encoded fingerprint of each file.

               Alternatively, --verbosity may be given multiple times, and accumulates.  Note that this may not be sensible. For example, to be
               useful, md5 output probably should not be merged with fingerprint data.

DESCRIPTION
       findimagedupes compares a list of files for visual similarity.

       To calculate an image fingerprint:
         1) Read image.
         2) Resample to 160x160 to standardize size.
         3) Grayscale by reducing saturation.
         4) Blur a lot to get rid of noise.
         5) Normalize to spread out intensity as much as possible.
         6) Equalize to make image as contrasty as possible.
         7) Resample again down to 16x16.
         8) Reduce to 1bpp.
         9) The fingerprint is this raw image data.

       To compare two images for similarity:
         1) Take fingerprint pairs and xor them.
         2) Compute the percentage of 1 bits in the result.
         3) If percentage exceeds threshold, declare files to be similar.

RETURN VALUE
       0   Success.

       1   Usage information was requested (--help or --man), or there were warnings.

       2   Invalid options or arguments were provided.

       3   Runtime error.

       Any other return values indicate an internal error of some sort.

DIAGNOSTICS
       To be written.

EXAMPLES
       findimagedupes -R -- .
           Look for and compare images in all subdirectories of the current directory.

       find -type f . -print0 | findimagedupes -0 -- -
           Same as above.

       findimagedupes -i 'echo "# sort: manual"' -i 'VIEW(){ for f in "$@";do echo \"file://$f\";done }' -- *.jpg > dupes.gqv
           Use script hooks to produce collection-style output suitable for use with gthumb(1).

FILES
       To be written.

BUGS
       There is a memory leak somewhere.

       Killing the programme may corrupt the fingerprint database(s).

       Changing version of GraphicsMagick invalidates fingerprint databases.

NOTES
       Directory recursion is deliberately not implemented: Composing a file-list and using it with "-" is a more flexible approach.

       Repetitions are culled before comparisons take place, so a commandline like "findimagedupes a.jpg a.jpg" will not produce a match.

       The program needs a lot of memory. Probably not an issue, unless your machine has less than 128MB of free RAM and you try to compare more
       than a hundred-thousand files at once (and the program will run quite slowly with that many files anyway---about eight hours initially to
       generate fingerprints and another ten minutes to do the actual comparing).

SEE ALSO
       find(1), md5sum(1)

       gqview - GTK based multiformat image viewer

       gthumb - an image viewer and browser for GNOME

AUTHOR
       Jonathan H N Chin <code@jhnc.org>

COPYRIGHT AND LICENSE
        Copyright 2006-2008 by Jonathan H N Chin <code@jhnc.org>.

        This program is free software; you may redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation; either version 3 of the License, or
        (at your option) any later version.

        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.

        You should have received a copy of the GNU General Public License
        along with this program; if not, write to the Free Software
        Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

HISTORY
       This code has been written from scratch. However it owes its existence to findimagedupes by Rob Kudla and uses the same duplicate-detection
       algorithm.

POD ERRORS
       Hey! The above document had some coding errors, which are explained below:

       Around line 876:
           Expected text after =item, not a number

       Around line 881:
           Expected text after =item, not a number

       Around line 885:
           Expected text after =item, not a number

perl v5.22.1                                                        2015-12-18                                                  FINDIMAGEDUPES(1p)
