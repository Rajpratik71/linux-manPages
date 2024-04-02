RECOVERMOV(1)                                                                                                                        RECOVERMOV(1)

NAME
       recovermov - recover movies from a filesystem image

SYNOPSIS
       recovermov [options] device

DESCRIPTION
       Recovermov  tries  to identify mov movies from a filesystem image.  To achieve this goal, it scans the filesystem image and looks for a mov
       structure at blocks starting at 512 bytes boundaries.

       recovermov stores the recovered movies into the current directory.  If you want it to store them elsewhere, just go to  the  directory  you
       want recovermov to save the movies into (using the cd command at the shell prompt) and start recovermov from there, or use the -o option.

       Note that device is not necessarily a physical device.  It may also be a file containing a copy of the faulty device in order to reduce the
       actual processing time and the stress imposed to an already defective hardware.  dd(1) or ddrescue(1) may be used to create such a  working
       copy.

OPTIONS
       -h     Display an help message.

       -b blocksize
              Set  the  size  of  blocks in bytes.  On most file systems, setting it to 512 (the default) will work fine as any large file will be
              stored on 512 bytes boundaries.  Setting it to 1 maximize the chances of finding very small files if the filesystems aggregates them
              (UFS for example) at the expense of a much longer running time.

       -i integerindex
              Set the initial index value for image numbering (default: 0).

       -n basename
              Basename to use to create the salvaged files.  Default is video_.

       -o directory
              Change the working directory before restoring files.  Use this option to restore files into a directory with enough space instead of
              the current directory.

       -V     Display program version and exit.

       All the sizes may be suffixed by a k, m, g, or t letter to indicate KiB, MiB, GiB, or TiB.  For example, 6m correspond to  6  MiB  (6291456
       bytes).

EXAMPLES
       Recover as many movies as possible from the memory card located in /dev/sdc:

              recovermov /dev/sdc

       Recover  as  many  movies  as  possible from a crashed ReiserFS file system (which does not necessarily store files at block boundaries) in
       /dev/hdb1:

              recovermov -b 1 /dev/hdb1

COPYRIGHT
       Copyright (c) 2010-2013 Jan Funke <jan.funke@inf.tu-dresden.de>.  This is free software; see the source for copying conditions.   There  is
       NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       recoverjpeg(1)

AUTHORS
       Jan Funke <jan.funke@inf.tu-dresden.de>.

Recovermov User Manuals                                         September 22, 2015                                                   RECOVERMOV(1)
