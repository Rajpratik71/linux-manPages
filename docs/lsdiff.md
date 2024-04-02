LSDIFF(1)                                                                                      Man pages                                                                                     LSDIFF(1)

NAME
       lsdiff - show which files are modified by a patch

SYNOPSIS
       lsdiff [[-n] | [--line-number]] [[-p n] | [--strip-match=n]] [--strip=n] [--addprefix=PREFIX] [[-s] | [--status]] [[-E] | [--empty-files-as-removed]] [[-i PATTERN] | [--include=PATTERN]]
              [[-x PATTERN] | [--exclude=PATTERN]] [[-z] | [--decompress]] [[-# RANGE] | [--hunks=RANGE]] [--lines=RANGE] [[-FRANGE] | [--files=RANGE]] [[-H] | [--with-filename]] [[-h] |
              [--no-filename]] [[-v] | [--verbose]...] [file...]

       lsdiff {[--help] | [--version] | [--filter ...] | [--grep ...]}

DESCRIPTION
       List the files modified by a patch.

       You can use both unified and context format diffs with this program.

OPTIONS
       -n, --line-number
           Display the line number that each patch begins at. If verbose output is requested (using -nv), each hunk of each patch is listed as well.

           For each file that is modified, a line is generated containing the line number of the beginning of the patch, followed by a Tab character, followed by the name of the file that is
           modified. If -v is given once, following each of these lines will be one line for each hunk, consisting of a Tab character, the line number that the hunk begins at, another Tab character,
           the string “Hunk #”, and the hunk number (starting at 1).

           If the -v is given twice in conjunction with -n (i.e.  -nvv), the format is slightly different: hunk-level descriptive text is shown after each hunk number, and the --number-files option
           is enabled.

       -N, --number-files
           File numbers are listed, beginning at 1, before each filename.

       -# RANGE, --hunks=RANGE
           Only list hunks within the specified RANGE. Hunks are numbered from 1, and the range is a comma-separated list of numbers or “first-last” spans, optionially preceeded by a modifier 'x'
           which inverts the entire range; either the first or the last in the span may be omitted to indicate no limit in that direction.

       --lines=RANGE
           Only list hunks that contain lines from the original file that lie within the specified RANGE. Lines are numbered from 1, and the range is a comma-separated list of numbers or
           “first-last” spans, optionially preceeded by a modifier 'x' which inverts the entire range; either the first or the last in the span may be omitted to indicate no limit in that direction.

       -F=RANGE, --files=RANGE
           Only list files indicated by the specified RANGE. Files are numbered from 1 in the order they appear in the patch input, and the range is a comma-separated list of numbers or “first-last”
           spans, optionially preceeded by a modifier 'x' which inverts the entire range; either the first or the last in the span may be omitted to indicate no limit in that direction.

       -p n, --strip-match=n
           When matching, ignore the first n components of the pathname.

       --strip=n
           Remove the first n components of the pathname before displaying it.

       --addprefix=PREFIX
           Prefix the pathname with PREFIX before displaying it.

       -s, --status
           Show file additions, modifications and removals. A file addition is indicated by a “+”, a removal by a “-”, and a modification by a “!”.

       -E, --empty-files-as-removed
           Treat empty files as absent for the purpose of displaying file additions, modifications and removals.

       -i PATTERN, --include=PATTERN
           Include only files matching PATTERN.

       -x PATTERN, --exclude=PATTERN
           Exclude files matching PATTERN.

       -z, --decompress
           Decompress files with extensions .gz and .bz2.

       -H, --with-filename
           Print the name of the patch file containing each patch.

       -h, --no-filename
           Suppress the name of the patch file containing each patch.

       -v, --verbose
           Verbose output.

       --help
           Display a short usage message.

       --version
           Display the version number of lsdiff.

       --filter
           Behave like filterdiff(1) instead.

       --grep
           Behave like grepdiff(1) instead.

SEE ALSO
       filterdiff(1), grepdiff(1)

EXAMPLES
       To sort the order of touched files in a patch, you can use:

           lsdiff patch | sort -u | \
             xargs -rn1 filterdiff patch -i

       To show only added files in a patch:

           lsdiff -s patch | grep '^+' | \
             cut -c2- | xargs -rn1 filterdiff patch -i

       To show the headers of all file hunks:

           lsdiff -n patch | (while read n file
             do sed -ne "$n,$(($n+1))p" patch
           done)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                    23 Jan 2009                                                                                    LSDIFF(1)
