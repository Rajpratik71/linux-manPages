exif(1)                                                  command line front-end to libexif                                                 exif(1)

NAME
       exif - shows EXIF information in JPEG files

SYNOPSIS
       exif [ OPTION ] [ file... ]

DESCRIPTION
       exif is a small command-line utility to show and change EXIF information in JPEG files.

       Most  digital  cameras produce EXIF files, which are JPEG files with extra tags that contain information about the image. The exif command-
       line utility allows you to read EXIF information from and write EXIF information to those files.  exif internally uses the libexif library.

       Each input file given on the command line is acted upon in turn, using all the options given. Execution will be aborted immediately if  one
       file is not readable or does not contain EXIF tags.

       As  EXIF  tags  are read, any unknown ones are discarded and known ones are automatically converted into the correct format, if they aren't
       already.  Corrupted MakerNote tags are also removed, but no format changes are made.

OPTIONS
       -v, --version
              Display the exif version number.

       -i, --ids
              Show ID numbers instead of tag names.

       -t, --tag=TAG
              Select only this TAG.  TAG is the tag title, the short tag name, or the tag number (hexadecimal numbers are prefixed with 0x),  from
              the IFD specified with --ifd.  The tag title is dependent on the current locale, whereas name and number are locale-independent.

       --ifd=IFD
              Select a tag or tags from this IFD.  Valid IFDs are "0", "1", "EXIF", "GPS", and "Interoperability".  Defaults to "0".

       -l, --list-tags
              List  all known EXIF tags and IFDs.  A JPEG image must be provided, and those tags which appear in the file are shown with an aster‐
              isk in the corresponding position in the list.

       -|, --show-mnote
              Show the contents of the MakerNote tag.  The contents of this tag are nonstandard (and often undocumented) and may therefore not  be
              recognized, or if they are recognized they may not necessarily be interpreted correctly.

       --remove
              Remove the tag or (if no tag is specified) the entire IFD.

       -s, --show-description
              Show description of tag.  The --tag option must also be given.

       -e, --extract-thumbnail
              Extract the thumbnail, writing the thumbnail image to the file specified with --output.

       -r, --remove-thumbnail
              Remove the thumbnail from the image, writing the new image to the file specified with --output.

       -n, --insert-thumbnail=FILE
              Insert FILE as thumbnail.  No attempt is made to ensure that the contents of FILE are in a valid thumbnail format.

       --no-fixup
              Do  not  attempt  to  fix EXIF specification violations when reading tags.  When used in conjunction with --create-exif, this option
              inhibits the creation of the mandatory tags.  exif will otherwise remove illegal or unknown tags,  add  some  mandatory  tags  using
              default values, and change the data type of some tags to match that required by the specification.

       -o, --output=FILE
              Write  output  image to FILE.  If this option is not given and an image file must be written, the name used is the same as the input
              file with the suffix ".modified.jpeg".

       --set-value=VALUE
              Set the data for the tag specified with --tag and --ifd to VALUE.  Compound values consisting of multiple components  are  separated
              with spaces.

       -c, --create-exif
              Create  EXIF  data if it does not exist. Mandatory tags are created with default values unless the --no-fixup option is given.  This
              option can be used instead of specifying an input file name in most cases, to operate on the default values of the mandatory set  of
              EXIF tags.  In this case, the --output option has no effect and no file is written.

       -m, --machine-readable
              Produce  output  in  a machine-readable (tab-delimited) format.  The --xml-output and --machine-readable options are mutually exclu‐
              sive.

       -w, --width=N
              Set the maximum width of the output to N characters (default 80). This does not apply to some output formats (e.g. XML).

       -x, --xml-output
              Produce output in an XML format (when possible).  The --xml-output and --machine-readable options are mutually exclusive.  Note that
              the XML schema changes with the locale, and it sometimes produces invalid XML. This option is not recommended.

       -d, --debug
              Show  debugging  messages. Also, when processing a file that contains corrupted data, this option causes exif to attempt to continue
              processing. Normally, corrupted data causes an abort.

   Help options
       -?, --help
              Show help message.

       --usage
              Display brief usage message.

EXAMPLES
       Display all recognized EXIF tags in an image and the tag contents, with bad tags fixed:

              exif image.jpg

       Display a table listing all known EXIF tags and whether each one exists in the given image:

              exif --list-tags --no-fixup image.jpg

       Display details on all XResolution tags found in the given image:

              exif --tag=XResolution --no-fixup image.jpg

       Display the raw contents of the "Model" tag in the given image (with a newline character appended):

              exif --ifd=0 --tag=Model --machine-readable image.jpg

       Extract the thumbnail into the file thumbnail.jpg:

              exif --extract-thumbnail --output=thumbnail.jpg image.jpg

       Display a list of the numeric values of only the EXIF tags in the thumbnail IFD (IFD 1) and the tag values:

              exif --ids --ifd=1 --no-fixup image.jpg

       Display the meaning of tag 0x9209 in the "EXIF" IFD according to the EXIF specification:

              exif --show-description --ifd=EXIF --tag=0x9209

       Add an Orientation tag with value "bottom - left" to an existing image, leaving the existing tags untouched:

              exif --output=new.jpg --ifd=0 --tag=0x0112 --set-value=4 --no-fixup image.jpg

       Add a YCbCr Sub-Sampling tag with value 2,1 (a.k.a YCbCr 4:2:2) to an existing image and fix the existing tags, if necessary:

              exif --output=new.jpg --tag=YCbCrSubSampling --ifd=0 --set-value='2 1' image.jpg

       Display a table with all known EXIF tags, highlighting mandatory ones:

              exif -cl

AUTHOR
       exif was written by Lutz Mueller <lutz@users.sourceforge.net> and numerous contributors.  This man page is  Copyright  ©  2002-2012  Thomas
       Pircher, Dan Fandrich and others.

SEE ALSO
       http://www.sourceforge.net/projects/libexif

exif 0.6.21                                                         2012-06-27                                                             exif(1)
