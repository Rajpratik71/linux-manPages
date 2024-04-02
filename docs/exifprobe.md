EXIFPROBE(1)                                                  General Commands Manual                                                 EXIFPROBE(1)

NAME
       exifprobe - probe and report structure and metadata content of camera image files

SYNOPSIS
       exifprobe [options] filename(s)

DESCRIPTION
       Exifprobe  reads  image files produced by digital cameras (including several so-called "raw" file formats) and reports the structure of the
       files and the auxiliary data and metadata contained within them. In addition to TIFF, JPEG, and EXIF, the program understands several  for‐
       mats which may contain "raw" camera data, including MRW, CIFF/CRW, JP2/JPEG2000, RAF, and X3F, as well as most most TIFF-derived "raw" for‐
       mats, including DNG, ORF, CR2, NEF, K25/KDC/DCR, and PEF. Other TIFF or JPEG-derived formats (which  begin  with  a  TIFF  header  or  JPEG
       marker) should also be readable.  The program attempts to display ALL information in the image file, in a manner which mimics the structure
       of the file as closely as possible.

       Where possible, output is not limited to “known” data items.  I.e. for tagged file formats, unknown tags will be identified by  tag  number
       and type, and values shown without interpretation. Proprietary, untagged or fixed format files do not permit this, but unknown or undefined
       data can usually be dumped in a hex/ascii format for examination, so long as the file structure is understood. The program will report  the
       contents  of  any  properly  structured  TIFF IFD or CIFF directory encountered, even when entry tags are not recognized.  Recognized TIFF,
       TIFF/EP, DNG, and CIFF tags are expanded, including EXIF2.2 sections and camera MakerNotes which are found to be in TIFF IFD format.   TIFF
       and/or  JPEG sections found in MRW, RAF or JP2 files will be reported, along with the “native” sections of those formats. JP2 boxes will be
       reported whether known or unknown, and expanded if known.  Unknown boxes cannot be expanded, since JP2 is not tagged below the box (or sub-
       box) level.

       An  effort  is made to identify all sub-images (in any image format) contained in multi-image files; the location, size, and format of such
       images is reported, and a hex/ascii dump of the image data may be requested. Image data is not processed, but the  program  will  recognize
       and report all standard JPEG and JPEG2000 markers (including JPEG APPn markers) and will expand APP0 (JFIF/JFXX) and APP1 (EXIF) sections.

       Since the program does not attempt to display images or modify the contents of files, it can often recover from and report failures or warn
       about structural oddities which would confuse a display or image edit program.

       There are a wide variety of output formats, selectable in detail by the “lower case” options described in the OPTIONS section below.  These
       options  select  which  items to print, and within narrow confines, how and where to print them.  A large number of combinations of options
       exist, and some of those combinations may not be sensible.  In order to avoid the need for constant creativity or invention, three “prefab‐
       ricated” output formats are provided, selected by the upper case option letters.

       The  structural  (-S)  output  format (default) provides a description of the image file which mimics as closely as possible the layout and
       structure of the data in the image file, including file offsets of headers, section and segment markers, fully described  TIFF  IFDs,  CIFF
       directories,  or  JP2 boxes, and the location of actual image and/or thumbnail data.  The contents of each section are indented relative to
       the beginning of the section, and ”offset” values for TIFF IFDs and CIFF directories are reported at the offsets where they are found (usu‐
       ally  following  the  entry list for TIFF, or in the HEAP for CIFF).  The peculiar “reverse” structures of CIFF and X3F formats are handled
       sensibly.

       The report format (-R) shows the “logical” structure of the image file, but eliminates addresses, offsets,  IFD  value  types  and  counts,
       etc., and prints “offset” directory values inline, while otherwise preserving the primary structure of the data.

       The  list  format  (-L)  omits  all  structural data. It writes only “tag” values from TIFF, Exif, and MakerNote IFDs, CIFF or other format
       directories or JP2 boxes, including section and image offsets and sizes.  Identifiable values from non-tagged formats are written in a sim‐
       ilar manner.  This format may be useful for extracting information for photo galleries.

       The structural format is default.  This format provides maximum information about the contents of an image file, and may reveal information
       (sometimes important) which other formats (or image info programs) may hide.

       In all formats, the filename, file type, file size, an image summary, and a summary file format will be displayed (even when all other out‐
       put  is  disabled by option). The image summary includes a summary report, for each subimage found, giving the image type, compression type
       (if any), pixel size, data length, file offset where found, and section of the file which includes or references the image.  In some cases,
       short remarks may be included for images mentioned but not found, etc. The summary concludes with the number of images found, and number of
       images not found (if any). The summary is followed by a listing of format sections found (TIFF/JPEG/EXIF, etc.) and a type  identifier  for
       TIFF-derived types (e.g. CR2) where possible.

       An environment variable may be set to a list of options to customize the default output behavior (see below).

   MakerNotes
       Camera-generated  images which contain EXIF sections may also contain sections introduced by a MakerNote tag, which may contain information
       about camera or firmware settings used to produce the image.  The structure and contents of MakerNote sections is not mandated by the  Exif
       specification,  but  many  camera  MakerNotes are written in TIFF IFD format, possibly offset following an ID string or new TIFF header (or
       both), and sometimes with inventive handling of “offsets”.  Exifprobe currently understands and  automatically  detects  such  schemes  and
       prints  the  contents  of the IFD (and the ID string, if present).  This detection is not dependent upon make or model of camera.  Make and
       Model information will usually be available from the first TIFF IFD in the file; this information may be used to  interpret  the  MakerNote
       information  for  “known”  cameras; otherwise, tag numbers, sizes, types, and raw values from the IFD will be shown (if permitted by option
       settings).

       Some camera makes are known to use more than one version of MakerNote, depending upon model.  If  an  unknown  model  from  that  maker  is
       encountered,  the note will be briefly examined and a noteversion assigned automatically if possible.  If that fails, the note will be dis‐
       played without interpretation.

       MakerNotes which are not in a recognizable IFD format will be reported (start and end offsets) in structural (-S) and report (-R) formats ,
       and  the  beginning  of  the note section hex/ascii dumped.  The remainder of the note may be dumped, in whole or in part, by the -M option
       (see below).

       In list (-L) format, the starting file offset and length supplied by the MakerNote tag will be reported,  and  three  “pseudo”  tags  which
       report the offset (MakerNote.Offset), size (MakerNote.Length) and scheme (MakerNote.Scheme) will appear.

   JPEG APPn
       In  JPEG  interchange  format files, APP0 (JFIF,JFXX) and APP1 (Exif) segments will be fully decoded, and the “printable” portions of APP12
       sections will be displayed. APP3 (Meta) sections will be expanded and the contained TIFF IFD will be displayed, although little interpreta‐
       tion  is  done.  Other APP markers will be reported, and the sections may be hex/ascii dumped in whole or in part using the -A option. APP1
       sections not marked as Exif will be treated as unknown.

   ANSI Color
       The program (by default) emits ANSI color escape sequences to highlight Exif, MakerNote , and Interoperability  sub-sections.   Errors  and
       warnings  are  highlighted  in  red.  These sequences are effective, of course, only for terminals or terminal emulators (e.g. xterm) which
       respond to ANSI color escape sequences.  If a pager is used to display the output when these sequences are present, a “raw” option  to  the
       pager may be required (e.g. less -R).  The use of these sequences may be toggled by the -c option.  LIST mode turns color sequences off.

       The program may be compiled without support for color sequences.

OUTPUT FORMATS
       In  all  formats,  and  regardless  of option setting, the first three lines of output for each file processed are the filename, image type
       (TIFF, CIFF, JP2, etc.), and the file size.  If the type (taken from the file header) specifies a data byte order, the byte order  will  be
       indicated  with  the  type  as  `II' (Intel byte order) or `MM' (Motorola byte order).  The image summary and summary format will always be
       printed at the end.

   Structural Format
       Structural format output begins with a display of the file header.  The header is followed by lines of the form
              <IFD0>
                  ...
              </IFD0>
              <APP0>
                  ...
              </APP0>
              <DIRECTORY>
                  ...
              </DIRECTORY>
       etc.  to indicate the beginning and end of each “section” of the file.  Actual section names will, of course, depend upon the  file  format
       and/or  the tags encountered.  Only the TIFF IFD format is described here; other formats are similar, except that JP2 box names are printed
       inside square (rather than angle) brackets, and MRW section names inside curly braces.

       Within sections, directory entries, subdirectories, the contents of known APP sections, JPEG segment markers, etc. are  printed.   Non-jpeg
       image data sections will be shown with a few lines of hex/ascii dump of the beginning of the data.

       Each  line  of  output  is preceded by a file offset given in hex and decimal.  File offsets are preceded by the character `@', except that
       section end markers are preceded by `-' and the character `>' may be used to mark sections which are located outside the IFD in which  they
       are  declared.   If  that section includes a subsection which is similarly afflicted, the '>' is replaced by '+' in the subsection.  In JP2
       files, the '@' is replaced by '=', for no particular reason.

       JPEG and JPEG2000 segment markers are written with the marker name, and the decoded values of any information associated with the marker.

       TIFF information is written in a manner which reflects the structure of the IFD, with all values interpreted according  to  the  applicable
       specification  where  possible.  All IFD fields are reported.  The following fields will appear on each line (in the order given, following
       the file offset):

       ·      Tag number in hex and decimal representations, enclosed in brackets.

       ·      Tag name (where known); names for unknown tags are created as a hex representation of the tag number prefixed by the string 'TAG_'.

       ·      The TIFF type number, name, and byte count for the associated value, enclosed in square brackets.

       ·      The “value/offset” for the entry.  If the value fits in the four bytes of the entry, the value is printed directly.

              If the value for the entry did not fit in the four bytes of the entry, then the value found is an offset to the actual  location  of
              the data; that offset is printed preceded by an '@' symbol.  The actual value will be printed later, at the file offset where it was
              found (except in some non-conforming MakerNote IFDs).  If the value requires interpretation (e.g. TIFF Orientation) it  is  followed
              by an '=' sign and the interpretation, enclosed in double quotes (e.g. “0,0 top left”).

       The  list  of entries will be followed by a line giving the offset to the next IFD (often 0) which is always found at the end of a TIFF IFD
       entry list.

       If there were offset entries found in the list above, the TIFF (and Exif) specification requires that they will  be  located  next  in  the
       file,  immediately  following  the  dirctory entries.  This stricture is frequently ignored in MakerNotes and TIFF-derived formats.  A line
       reporting the beginning of these offset values will be printed immediately after the next IFD offset, followed by one line for each  offset
       entry, with the tag name repeated, followed by the actual value, followed by its interpretation (if any).

       Multiple  values  in  entries  are printed on a single line, but large lists will be elided, with just the first two or three values shown,
       followed by an ellipsis, followed by the last value, the number of values, and the offset of the last value in the list.   The  full  value
       list may be printed using the -eA option.

       In  structural  format,  ascii strings in the entry are printed for the entire length given in the IFD entry, including nulls and non-ascii
       values (if present), which are printed in `backslashed' octal notation.  The -ea option may be used to force ascii  values  to  be  printed
       only up to the first null.  This option is often necessary for CIFF format files, and is enabled by default in “list” mode.

       Entries  are indented slightly from the start identifier for the IFD, and subsegments (e.g. an Exif IFD, SubIFD, or MakerNote) will be fur‐
       ther indented in order to indicate the structure of the file.

       The resulting output displays the contents of the IFD much as it appears in the file (see the TIFF or EXIF specifications for  descriptions
       of the IFD format).

       Finally,  the  start and end of actual image data for the primary image (and possibly thumbnail or reduced-resolution image) is reported at
       the end.  For JPEG images, this usually includes display of the JPEG segment markers within the image.  Binary format image  data  will  be
       shown with a brief hex/ascii dump of the beginning of the data, between start and end markers.

       Note  that  values preceded by `@' are always offsets from the beginning of the file to the actual value.  IFD offsets are usually recorded
       in the file as offsets relative to the beginning of the TIFF header (which is offset from the beginning of the file in JPEG APP1 files) but
       are  adjusted by exifprobe to show offset from the beginning of the file.  If it is important to see the recorded value, the -er option may
       be used to print the recorded value in parentheses, following the adjusted file offset.

   Report Format
       The report format (-R) displays all sections and segments of the image file, including start and end of sections, but  eliminates  much  of
       the  “cruft”  of  the  structural format by eliminating address/offset information and much of the `internal' information from the TIFF IFD
       (tag number, type and count).  Offset values are printed inline with the tag name.  The output is indented to show the logical structure of
       the image file, but is much less difficult to view than the structural format.

   List format
       The list format (-L) suppresses structural information, writing only content in the format tagname = value or tagname = value = “what value
       means”. For non-tagged file formats, the tagname will be replaced by a fixed identifier for the item. In LIST format, “long”  tagnames  are
       used, which include the names of all parent sections of the section in which the data is found.  Long tagnames can be toggled off, although
       this is unwise if the file contains multiple image sections.

       The “value” of tags or items which represent an offset to a subsection or image are printed in list format as “@offset:length”.

       The List format is used by the auxiliary script exifgrep, which permits selective extraction of information e.g. for photo  galleries,  and
       output in (almost) “shell variable” format.

   Custom Formats
       The  -Z  option  “zeroes”  all  option flags (except the longnames modifier), after which the lower-case options may be used to set desired
       options.  The lower-case options are `toggles', which may also be used to turn off items in the pre-defined formats.

       As an example, the command:

           exifprobe -Z -et somefile.tif

       may be used to list just the TIFF and Exif tags, without values (or anything else) in “long name” format.

            exifprobe -eNnT somefile.tif

       will print in structural format, suppressing output of hex and decimal tag numbers, and tag type and count.

       The “zero-level” output still reports the file data and image summary as described above.

OPTIONS
       The environment variable EXIFPROBE_OPTIONS may be set to any valid option string, which will be evaluated before command line options. E.g.

       export EXIFPROBE_OPTIONS='-L -c'

       will make list format the default output format, and re-enable the color sequences turned off by -L.

       Options are evaluated from left to right, so -Z should be given first, while -D (decimal only) or -X (hex only) should be given last.

       -S        Structure mode: (default) almost everything; offset values not inline

       -R        Report mode: like structural, but only tagnames and decimal values, indented, inline

       -L        List mode: print only tags and values (including interpreted values); no section info; no color

       -Z        turn off (zero) all optional output. Prints only filename, filetype, filesize, image summary, and file format.

       -c        toggle use of ANSI color control sequences to emphasize EXIF sections.  (default 'on' except list mode, unless compiled  with  no
                 color support)

       -a        toggle printing of addresses (file offsets) in hex and decimal

       -I        three-way toggle indent (after address -> before -> none)

       -o        toggle “inline” print of offset IFD values

       -p[items] toggle print identifiers for:

                 s   - sections (IFDs, APPn)

                 g   - segments (JPEG segments)

                 a   - JPEG APP0...APPn entries

                 l   - long names (dot-separated list of parent sections preceding item name)

                 e   - entries. Includes tag names, numbers, types, values.

                 m   - print MakerNote scheme description

                 M   - watch debug of MakerNote scheme detection

       -e[items] toggle print IFD entry items:

                 t   - tagname

                 n   - tag number in decimal

                 N   - tag number in hex

                 T   - entry type and count

                 v   - value in decimal

                 V   - value in hex

                 o   - file offset to value in decimal

                 O   - file offset to value in hex

                 r   - relative (unadjusted) offset in decimal

                 R   -  also print “raw” values where normal values are computed (e.g. rational values, or some MakerNote values where APEX values
                     must be computed from a raw value).

                 A   - print ALL elements of multiple-value tags

                 a   - ascii "ignore length" (stop at first null)

       -D        limit all enabled numerical values to decimal only (addresses, tag numbers, offsets, values)

       -X        limit all enabled numerical values to hex only (addresses, tag numbers, offsets, values)

       -U[len|a] dump len (or all) bytes of UNDEFINED data found in TIFF IFDS in hex/ascii form (but only if the structure  of  the  data  is  not
                 known)

       -M[len|a] dump len (or all) bytes of unrecognized MakerNotes in hex/ascii form (but only if the structure of the data is not known)

       -A[len|a] dump len (or all) bytes of unrecognized JPEG APP segments in hex/ascii form (but only if the structure of the data is not known)

       -B[len|a] dump len (or all) bytes of binary image data or failed JPEG image data

       -C[make]+[model]
                 print a list of camera makes/models matching make or model as substrings.  `+' by itself prints everything

       -O start_offset
                 start processing at file offset start_offset

       -n        print filename at beginning of each line of output (useful when grepping multiple files in LIST mode)

       -N noteversion
                 force use of note version noteversion when interpreting MakerNotes.  Useful only if you know what you're doing.

       -m make   Force the makernote code to interpret the note according to the make given, rather than that contained in the file.

       -l model  force the makernote code to interpret the note according to the model given, rather than that contained in the file.

       -t        This  option  has effect only if set in EXIFPROBE_OPTIONS.  If set when command line options are processed, color  will be be off
                 by default if the output is not to a tty.  Any command line option which toggles or sets color (e.g. “-R”) will turn  color  back
                 on.

       -u        Print  “raw”  Unicode  data.  Normally 16 bit data is printed as though the high byte is zero (which is often the case).  Writing
                 the nulls would annoy most ascii terminal devices, so the default is more hospitable.  The -u option forces printing of the  full
                 value.

       -h        print a help message

       -V        print program version and copyright

SEE ALSO
       exifgrep(1)
       The TIFF6 specification:
        https://partners.adobe.com/asn/developer/PDFS/TN/TIFF6.pdf
       The Exif 2.2 specification:
        http://tsc.jeita.or.jp/avs/data/cp3451.pdf
       The JFIF specification:
        http://www.w3.org/Graphics/JPEG/jfif3.pdf
       The TIFF/EP specification:
        http://www.map.tu.chiba-u.ac.jp/IEC/100/TA2/recdoc/N4378.pdf
       The CIFF specification
        http://xyrion.org/ciff/CIFFspecV1R04.pdf
       The X3F public specification
        http://www.sd9.org.uk/X3F_Format.pdf
       The JPEG2000 public draft (outdated)
        http://www.jpeg.org/public/fcd15444-1.pdf

DIAGNOSTICS
       Most diagnostics are printed “inline” to stdout, in red if color is enabled, and the program attempts to proceed.

BUGS
       Interpretation  of MakerNote data for specific cameras is incomplete and probably always will be.  The X3F specification is incomplete, and
       the final JPEG2000/JP2 specification is not freely available; support for these formats is therefore not complete, and may not be  entirely
       accurate.

       The RAF file format support is preliminary (there is no published specification).

       Floating point values read from the file are expected to be in IEEE format (or at least, native format); i.e. no conversions are attempted.

       ANSI color sequence support should use termcap/terminfo facilities; it does not.

AUTHOR
       Duane H. Hesser
       dhh@virtual-cafe.com

                                                                       LOCAL                                                          EXIFPROBE(1)
