EXIFGREP(1)                                                   General Commands Manual                                                  EXIFGREP(1)

NAME
       exifgrep - select and reformat the output of exifprobe

SYNOPSIS
       exifgrep [options] [egrep_options] egrep_pattern [NOT egrep-pattern] filename(s)

DESCRIPTION
       Exifgrep is a shell script which applies egrep(1) to the output of exifprobe -L, permitting easy selection and minor reformatting of output
       items.

       exifprobe is small, fast, and utterly sycophantic in its desire to report everything it finds in an image.  exifgrep  applies  the  regular
       expression matching capabilities of egrep to the output barrage to extract only wanted information.

       exifgrep  also performs a mild form of selection on the output fields of exifprobe -L.  Many items reported by exifprobe are represented in
       the image file by a number which compactly represents a defined value.

       E.g. exifprobe -L may report

       TIFF.Ifd1.ResolutionUnit              = 2 = 'pixels per inch'

       where the value “2” must be interpreted to mean that resolution values (TIFF.IFd1.Xresolution and  IFF.IFd1.YResolution)  are  recorded  in
       pixels  per inch, rather than, say, pixels per centimeter.  exifprobe reports both fields; exifprobe may also report interpreted values for
       items which are recorded in unfamiliar units, such as

       JPEG.APP1.Ifd0.Exif.FNumber           = 5.6 APEX = 'f7.0'

       In all such cases, exifgrep reports (by default) only the "human readable" field:

       TIFF.Ifd1.ResolutionUnit = 'pixels per inch'
       JPEG.APP1.Ifd0.Exif.FNumber = 'f7.0'

       unless the "-num" option is given to select the numerical value.

       In addition, a `variable' format may be selected ("-var") which eliminates whitespace, providing a format  which  typical  shells  may  use
       directly to set variables for further processing.  E.g.

       TIFF.Ifd1.ResolutionUnit='pixels per inch'
       JPEG.APP1.Ifd0.Exif.FNumber='f7.0'

OPTIONS
       -r        file arguments may be directories, which will be searched via find for all image types recognized by exifprobe.

       -n        force  exifprobe  to  print  a  filename  for each line of its output, which exifgrep will turn into a comment at the end of each
                 matching line.

       -t        force exifprobe to print tag numbers for all itemes that have them, so that matches may be made on hex or decimal tag numbers.

       -c        turn on color output from exifprobe

       -h        print a usage message (help)

       -var      report in "variable" format, which may be directly `sourced' by any Bourne-compatible shell (except that most shells will  insist
                 that the dots must be replaced, e.g. by underscores).

       -export   report in "variable" format, but with a Bourne-compatible export command

       -num      report numerical values rather than interpreted strings, for fields which have both.

       NOTE: the -var and -export options are obsolescent; they are retained for compatibility with earlier versions of exifprobe.  A post-proces‐
       sor such as reformat.sh may be more effective for the current version if shell-compatible output is desired.

       Any option not recognized by the script will be passed on to egrep.

       The first non-option argument will be used as the pattern passed to egrep.  This may be followed by the keyword NOT and an expression  rep‐
       resenting  matches to be rejected.  This pattern will be passed to egrep -v.  Only one argument of each type may be given, and the "accept"
       expression (if given) must appear before the "reject" expression.

       All remaining arguments are interpreted as image filenames.

SEE ALSO
       exifprobe(1)

AUTHOR
       Duane H. Hesser
       dhh@virtual-cafe.com

                                                                       LOCAL                                                           EXIFGREP(1)
