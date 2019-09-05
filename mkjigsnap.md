MKJIGSNAP(8)                                                  System Manager's Manual                                                 MKJIGSNAP(8)

NAME
       mkjigsnap - Create a snapshot tree on a jigdo server

SYNOPSIS
       mkjigsnap [OPTIONS] <-d snapshot_dir> <-j jigdo_file> <-k keyword> <-m mirror> <-n CD_name> <-o output_directory> <-t template_file>
       mkjigsnap [OPTIONS] <-b backref_file> <-d snapshot_dir> <-m mirror> <-J jigdo_list> <-j jigdo_file> <-k keyword>

DESCRIPTION
       mkjigsnap creates snapshot directories for use by other jigdo tools. It can be run in two distinct modes:

   Jigit / single-jigdo mode
       To build a jigit .conf file for a single jigdo file: add the "-n" option with a CD name on the command line and only specify a single jigdo
       to work with using "-j".

       Required arguments for this mode:

       -d snapshot_dir
              Specify the output directory name to be used for the snapshot tree (e.g. 20041011, rc1). In single-jigdo mode this will be  relative
              to the output directory.

       -j jigdo_file
              Specify the location of the jigdo file to be used.

       -m mirror
              Specify  the location of the mirror containing all the files needed. This must be on the same filesystem as the output directory, as
              hard links will be used to create the snapshot efficiently.

       -n CD_name
              Specify the output name of the CD for jigit (e.g. warty, sarge-i386-1).

       -o output_directory
              Specify the output location for the jigdo, template, conf and snapshot. This must be on the same filesystem as the mirror,  as  hard
              links will be used to create the snapshot efficiently.

       -t template_file
              Specify the location of the template file to be used.

   Multi-jigdo mode
       To  build  a snapshot tree for (potentially multiple) jigdo files: do not specify the "-n" option, and list as many jigdo files as desired,
       either on the command line using multiple "-j <jigdo>" options or (better) via a file listing them with the "-J" option.

       Required arguments for this mode:

       -d snapshot_dir
              Specify the output directory name to be used for the snapshot tree (e.g. 20041011, rc1).

       -J jigdo_list
              Specify the location of a file listing the jigdo files to be used. May be  repeated  multiple  times  for  multiple  list  files  if
              desired.

       -j jigdo_file
              Specify  the  location of the jigdo file to be used. May be repeated multiple times for multiple jigdo files, but it's better to use
              the "-J" option to point at a file containing a list of jigdo files instead.

       -k keyword
              Specify the "keywords" which are used in the jigdo files (e.g. Debian, Non-US, Ubuntu).

       -m mirror
              Specify the location of the mirror containing all the files needed. This must be on the same filesystem as the  snapshot  directory,
              as hard links will be used to create the snapshot efficiently.

   Options
       Optional arguments for both modes:

       -b backref_file
              If  using  a  fail_log,  also  keep  track of which jigdo files correspond to each missing file, and output the details in the back‐
              ref_file.

       -f fail_log
              If any files are required by the specific jigdo files but are not available in the mirror, list them in the output file fail_log for
              reference.

       -i ignore_list
              If  any  files  are  required  by the specific jigdo files but are not available in the mirror, list them in the ignore_list file to
              supress errors about them.

EXAMPLES
       mkjigsnap -o /tmp/mjs-test -n mjs-test -m /tmp/mirror -j
              ~/jigdo/update/debian-update-3.0r2.01-i386.jigdo -t  ~/jigdo/update/debian-update-3.0r2.01-i386.template  -k  Debian  -k  Non-US  -d
              20041017

              This  command  is  an  example of single-jigdo mode, used for Ubuntu jigit generation. It creates a single jigit conf file using the
              supplied jigdo/template file pair, looking for jigdo references to files in the "Debian" and "Non-US" areas. Output the  files  into
              /tmp/mjs-test  and  call  them  "mjs-test.<ext>", creating a snapshot of the needed files in /tmp/mjs-test/20041017 by linking files
              from /tmp/mirror as needed.

       mkjigsnap -m /org/ftp/debian -J ~/jigdo.list -k Debian
              -d /org/jigdo-area/snapshot/Debian -f ~/mkjigsnap-failed.log -i ~/mkjigsnap-ignore.list

              This command is an example of multi-jigdo mode, as run to keep http://us.cdimage.debian.org/cdimage/snapshot/ up to date. This reads
              in  all  the  jigdo  files  listed  in  ~/jigdo.list, building a list of all the files referenced in the "Debian" area. It will then
              attempt to build a snapshot tree of all those files under /org/jigdo-area/snapshot/Debian by linking from /org/ftp/debian. Any files
              that  are  missing  will be listed into the output "missing" file ~/mkjigsnap-failed.log for later checking, UNLESS they are already
              listed in the "ignore" file ~/mkjigsnap-ignore.list.

SEE ALSO
       jigdo-file(1), jigit(1), jigdump(1) and mkimage(1).

COPYRIGHT
       Copyright 2004 - 2014 Steve McIntyre (steve@einval.com)

       mkjigsnap may be copied under the terms and conditions of version 2 of the GNU General Public License, as published by  the  Free  Software
       Foundation (Cambridge, MA, USA).

AUTHOR
       Written by Steve McIntyre (steve@einval.com)

Jigit jigdo tools                                                 September 2004                                                      MKJIGSNAP(8)
