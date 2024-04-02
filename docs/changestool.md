CHANGESTOOL(1)                                                       REPREPRO                                                       CHANGESTOOL(1)

NAME
       changestool - verify, dump, modify, create or fix Debian .changes files

SYNOPSIS
       changestool --help

       changestool [ options ] .changes-filename command [ per-command-arguments ]

DESCRIPTION
       changestool  is  a  little  program  to operate on Debian .changes files, as they are produced by dpkg-genchanges(1) and used to feed built
       Debian packages into Debian repository managers like reprepro(1) or dak.

EXAMPLES
       changestool bloat.changes setdistribution local
       will modify the Distribution: header inside bloat.changes to say local instead of what was there before.

       changestool reprepro_1.2.0-1.local_sparc.changes includeallsources
       will modify the given file to also list .orig.tar.gz it does not list because you forgot to build it with dpkg-buildpackage -sa.

       changestool blafasel_1.0_abacus.changes updatechecksums
       will update the md5sums to those of the files referenced by this file.  (So one can do quick'n'dirty corrections to them  before  uploading
       to your private package repository)

       changestool --create test.changes add bla_1-1.dsc bla_1-1_abacus.deb
       will  add  the specified files (format detected by filename, use adddeb or adddsc if you know it).  If the file test.changes does not exist
       yet, a minimal one will be generated. Though that might be too minimal for most direct uses.

GLOBAL OPTIONS
       Options can be specified before the command. Each affects a different subset of commands and is ignored by other commands.

       -h --help
              Displays a short list of options and commands with description.

       -o --outputdir dir
              Not yet implemented.

       -s --searchpath path
              A colon-separated list of directories to search for files if they are not found in the directory of the .changes file.

       --create
              Flag for the commands starting with add to create the .changes file if it does not yet exists.

       --create-with-all-fields
              Flag for the commands starting with add to create the .changes file if it does not yet exists.  Unlike --create, this  creates  more
              fields to make things like dupload happier.  Currently that creates fake Urgency and Changes fields.

       --unlzma command
              External uncompressor used to uncompress lzma files to look into .diff.lzma, .tar.lzma or .tar.lzma within .debs.

       --unxz command
              External uncompressor used to uncompress xz files to look into .diff.xz, .tar.xz or .tar.xz within .debs.

       --lunzip command
              External uncompressor used to uncompress lzip files to look into .diff.lz, .tar.lz or .tar.lz within .debs.

       --bunzip2 command
              External uncompressor used to uncompress bz2 when compiled without libbz2.

COMMANDS
       verify Check for inconsistencies in the specified .changes file and the files referenced by it.

       updatechecksums [ filename ]
              Update  the  checksum (md5sum and size) information within the specified .changes file and all .dsc files referenced by it.  Without
              arguments, all files will be updated.  To only update specific files, give their filename (without path) as arguments.

       setdistribution [ distributions ]
              Change the Distribution: header to list the remaining arguments.

       includeallsources [ filename ]
              List all files referenced by .dsc files mentioned in the .changes file in said file.  Without arguments, all missing files  will  be
              included.  To only include specific files, give their filename (without path) as arguments.

              Take  a  look  at the description of -si, -sa and -sd in the manpage of dpkg-genchanges/dpkg-buildpackage how to avoid to have to do
              this at all.

              Note that while reprepro will just ignore files listed in a .changes file when it already has  the  file  with  the  same  size  and
              md5sum, dak might choke in that case.

       adddeb filenames
              Add  the  .deb and .udeb files specified by their filenames to the .changes file.  Filenames without a slash will be searched in the
              current directory, the directory the changes file resides in and in the directories specified by the --searchpath.

       adddsc filenames
              Add the .dsc files specified by their filenames to the .changes file.  Filenames without a slash will be searched in the the current
              directory, in the directory the changes file resides in and in the directories specified by the --searchpath.

       addrawfile filenames
              Add  the  files specified by their filenames to the .changes file.  Filenames without a slash will be searched in the current direc‐
              tory, in the directory the changes file resides in and in the directories specified by the --searchpath.

       add filenames
              Behave like adddsc for filenames ending in .dsc, like adddeb for filenames ending in .deb or .udeb,  and  like  addrawfile  for  all
              other filenames

       dumbremove filenames
              Remove  the specified files from the .changes file.  No other fields (Architectures, Binaries, ...) are updated and no related files
              is removed.  Just the given files (which must be specified without any /) are no longer listen in the .changes  file  (and  only  no
              longer in the changes file).

SEE ALSO
       reprepro(1), dpkg-genchanges(1), dpkg-buildpackage(1), md5sum(1).

REPORTING BUGS
       Report bugs or wishlist requests the Debian BTS (e.g. by using reportbug reperepro) or directly to <brlink@debian.org>.

COPYRIGHT
       Copyright © 2006-2009 Bernhard R. Link
       This  is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

reprepro                                                            2010-03-19                                                      CHANGESTOOL(1)
