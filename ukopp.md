UKOPP(1)                                                          Ukopp man page                                                          UKOPP(1)

NAME
          Ukopp - copy files to USB stick or other disk or disk-like device

SYNOPSIS
          ukopp [ -nogui ] [ -job | -run ] jobfile

DESCRIPTION
          Ukopp is a graphical menu-driven program operating in its own
          window. Ukopp copies the files and directories specified in the
          job file to disk or disk-like media (e.g. USB stick).

OVERVIEW
          Ukopp works incrementally: only files that are not already identical
          on the target media are copied (new and modified files or files newly
          added to the backup job). Files/directories to include or exclude can
          be selected from the file system hierarchy, using a GUI navigator.
          Specifications are saved in a job file which can be re-edited and/or
          executed. Ukopp can be run in batch mode using the -nogui option.
          Ukopp can optionally keep old file versions instead of replacing them
          with updated versions. The retention time and/or the number of old
          versions to keep can be specified for each selected file or directory.
          File owners and permissions are retained even if the copy media has a
          Microsoft file system.

          Summary of functionality:
          - Copy files incrementally with optional file version retention.
          - Three media verification modes: full, incremental, compare.
          - Report disk:backup differences in detail or summary form.
          - Select and restore files from backup media or use drag and drop.

OPTIONS
          Command line options:
          [ -job ] jobfile           open job file for editing
          [ -nogui ] -run jobfile    execute a job file

SEE ALSO
          The online user manual is available using the menu Help > contents.
          This manual explains Ukopp operation in great detail.

AUTHORS
          Written by Michael Cornelison <kornelix@posteo.de>

Linux                                                               2010-10-01                                                            UKOPP(1)
