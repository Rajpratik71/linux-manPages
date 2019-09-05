METADATA(1)                                                        User Commands                                                       METADATA(1)

NAME
       MAT - Metadata Anonymisation Toolkit

SYNOPSIS
       mat [options] files

       mat-gui

DESCRIPTION
       The  Metadata  Anonymisation Toolkit is a lib (with a CLI and a GUI) created to anonymise file's metadata. In essence, metadata answer who,
       what, when, where, why, and how about every face of the data that are being documented. They can be a risk for privacy.

OPTIONS
       -h, --help
              show this help message and exit

       -a, --add2archive
              Add to outputed archive non-supported filetypes

       -b, --backup
              Keep a backup copy

       -c, --check
              Check if a file is free of harmful metadatas

       -d, --display
              List all the harmful meta of a file without removing them

       -l, --list
              List all supported fileformat

       -L, --low-pdf-quality
              Reduced the produced PDF size and quality

       -v, --version
              Display version and exit

EXAMPLES
       mat --display mydocument.pdf
              Display the mydocument.pdf's harmful metadata

       mat --check *.jpg
              Check all the jpg images from the current folder

NOTES
       MAT only process metadata, it does not handle file data.  Blame yourself if you are traced back because of the data of your files.  MAT  is
       not  perfect:  In  most of the cases, a forensic expert with a lot of time can trace back your document.  If you want absolute privacy, use
       plain-text.

AUTHOR
       Julien (jvoisin) Voisin <julien.voisin@dustri.org>

BUGS
       MAT does not handle watermaking/tattoos for now.  The --low-pdf-quality option may produce heavier PDF for very small  files.   You  should
       only use it for big files.

SEE ALSO
       exiftool(1)

Metadata Anonymisation Toolkit                                     January 2013                                                        METADATA(1)
