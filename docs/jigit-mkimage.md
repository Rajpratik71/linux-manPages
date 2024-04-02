MKIMAGE(1)                                                    General Commands Manual                                                   MKIMAGE(1)

NAME
       mkimage - Create an ISO image from jigdo files

SYNOPSIS
       mkimage -j igdo -t emplate [options]...

       mkimage -t emplate -z [options]...

       mkimage -f d5-list -t emplate -M issing-list [options]...

DESCRIPTION
       mkimage  knows  how  to  parse a jigdo template file, commonly used when creating Debian CDs and DVDs. It can be used to actually convert a
       template file and associated files into an ISO image (hence the name mkimage), or with some command line  options  it  will  output  useful
       information about the template file instead.

       -t template file
              The jigdo .template file is the most important thing that mkimage needs, and must be specified for all operations.

       -j jigdo file
              The  jigdo  .jigdo  file  will normally acompany the .template file. To rebuild the image you must specify at least one of the jigdo
              file and an MD5 file (-f).

       -f MD5 file
              A file listing files available locally and their MD5 sums, in the same format as used by genisoimage:

         MD5sum   File size  Path
         32 chars 12 chars   to end of line

       The MD5sum must be written in standard hexadecimal notation, the file size must list the size of the file in bytes, and the path must  list
       the absolute path to the file. For example:

       00006dcd58ff0756c36d2efae21be376         14736  /mirror/debian/file1
       000635c69b254a1be8badcec3a8d05c1        211822  /mirror/debian/file2
       00083436a3899a09633fc1026ef1e66e         22762  /mirror/debian/file3

       To rebuild an image you must specify at least one of the MD5 file and a jigdo file (-j).

       -m item=path
              Used  in conjunction with a jigdo file; specify where mkimage should look on the local filesystem to find the files it needs to make
              an image. (e.g. "Debian=/mirror/debian").

       -M missing file
              If you're not sure if you have all the files needs to create an image, specify both the jigdo file and an MD5 file  along  with  the
              template  file  and  -M  <file>. mkimage will check to see that all the files are available instead of building the image. Any files
              that are missing will be listed in the file specified here. See jigit for usage examples.

       -v     Make mkimage more verbose. Additional -v arguments will make it more verbose again. Default level is 0 (almost no  output).  1  will
              print progress in % while the image is being created; 2 will list every file and data block that is appended to the image.

       -l logfile
              mkimage will normally write to stderr when it reports progress. Specify a logfile (or /dev/null) if you want it elsewhere.

       -O     Skip  checking the validity of specified jigdo files. mkimage will normally check for the "JigsawDownload" header as a sanity check,
              but some very old jigdo files produced by Debian pre-dated the addition of this header.

       -o outfile
              mkimage will normally write the ISO image to stdout, ready for piping into cdrecord or to iso-image.pl. Specify an  output  filename
              if you want it written to disk instead.

       -q     mkimage  will  normally check the MD5 sum of every file it reads and writes, and will fail if it finds any mismatches. Specify -q to
              tell it not to. This will normally run more quickly, but can leave you with a broken image so is  POTENTIALLY  DANGEROUS.  Use  with
              care!

       -s start offset
              Rather  than  start at the beginning of the image, skip to the specified offset and start output there. Probably only useful in iso-
              image.pl when resuming a download. Specifying a non-zero offset also implies -q, as it's difficult to check MD5 sums when you're not
              checking the whole image.  -e end offset Rather than end at the end of the image, stop at the specified offset. Probably only useful
              in iso-image.pl when resuming a download. Specifying an end offset also implies -q, as it's difficult to check MD5 sums when  you're
              not checking the whole image.

       -z     Simply parse the template file and print the size of the image that would be generated, in bytes. Only needs the template file to be
              specified, any other arguments will ignored.

EXAMPLES
       mkimage -f MD5 -j test.jigdo -t test.template -M missing
              Read in the files MD5, test.jigdo and test.template and check if all the needed files are available. If any are missing,  list  them
              in missing.

       mkimage -z -t test.template
              Find out how big the ISO image would be from expanding test.template.

       mkimage -v -f MD5 -t test.template -o test.iso
              Build  the  iso  image  in  test.iso,  using  files  listed in MD5 to fill in what's needed by the template file test.template. Show
              progress as the image is built.

SEE ALSO
       jigdo-file(1), jigit(1), jigsum(1) and jigdump(1).

COPYRIGHT
       Copyright 2004 Steve McIntyre (steve@einval.com)

       mkimage may be copied under the terms and conditions of version 2 of the GNU General Public License, as  published  by  the  Free  Software
       Foundation (Cambridge, MA, USA).

AUTHOR
       Written by Steve McIntyre (steve@einval.com)

Jigit jigdo tools                                                 September 2004                                                        MKIMAGE(1)
