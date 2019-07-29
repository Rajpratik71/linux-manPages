GETELTORITO(1)                                                General Commands Manual                                               GETELTORITO(1)

NAME
       geteltorito - an El Torito boot image extractor

SYNOPSIS
       geteltorito <image|device> [-o outputfile]

DESCRIPTION
       geteltorito  is  a  Perl script which extracts the initial/default El Torito boot image from a CD if one exists. It will not extract any of
       other boot images that are allowed by the El Torito standard.

       The boot image file is written to stdout and all other information (e.g., image type and size) is written to stderr.  To write the image to
       a file instead of stdout, specify the output filename using -o filename.

SEE ALSO
       genisoimage(1), isoinfo(1).

AUTHOR
       geteltorito was written by Rainer Krienke <krienke@uni-koblenz.de>.

       This manual page was written by Eduard Bloch <blade@debian.org> based on README.geteltorito from geteltorito-0.4 package.

                                                                   Mai  6, 2007                                                     GETELTORITO(1)
