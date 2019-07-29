LSSU(1)                                                       General Commands Manual                                                      LSSU(1)

NAME
       lssu - list usage state of NILFS2 segments

SYNOPSIS
       lssu [options] [device]

DESCRIPTION
       lssu is a utility for displaying usage state of NILFS2 segments in device, where a segment is contiguous lump of disk blocks and an alloca‐
       tion unit of NILFS2 disk space.  When device is omitted, /proc/mounts is examined to find a NILFS2 file system.

       This command will fail if the device has no active mounts of a NILFS2 file system.

OPTIONS
       -a, --all
              Do not hide clean segments.

       -h, --help
              Display help message and exit.

       -i index, --index=index
              Skip index segments at start of input.

       -l, --latest-usage
              Print usage status of the moment.

       -n lines, --lines=lines
              List only lines input segments.

       -p period, --protection-period=period
              Specify protection period.  This option is used when printing usage status of the moment (with -l option) to test if each  block  in
              segments is protected and is not reclaimable.  Optionally, the period parameter may be suffixed by one of the following units desig‐
              nators: ´s´, ´m´, ´h´, ´d´,´w´,´M´, or ´Y´, for seconds, minutes, hours, days, weeks, months, or years, respectively.

       -V, --version
              Display version and exit.

FIELD DESCRIPTION
       Every line of the lssu output consists of the following fields:

       SEGNUM Segment number.

       DATE   Creation date.

       TIME   Creation time.

       STAT   State of the segment.  It consists of the following flags:

              a      The segment is active, meaning that it is recently created and cannot be reclaimed by the garbage collector.

              d      The segment is dirty, meaning that it is in use.

              e      The segment is erroneous, meaning that it has once caused an I/O error.  NILFS2 avoids  allocating  the  segments  with  this
                     flag.

              p (optional)
                     The  segment  is  protected,  meaning that garbage collection for the segment is prevented for some reason, for instance, the
                     protection period is not elapsed from its last modified time, the segment is pinned by the file system, or  it  is  erroneous
                     and unreclaimable, etc.  This flag is displayed when -l option is specified.

       NBLOCKS
              Number of in-use blocks of the segment.

       NLIVEBLOCKS (optional)
              Number and ratio of in-use blocks of the moment.  This field is displayed when -l option is specified.

AUTHOR
       Koji Sato

AVAILABILITY
       lssu is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), dumpseg(8).

nilfs-utils version 2.2                                              Apr 2014                                                              LSSU(1)
