USAGE:(1)                     User Commands                    USAGE:(1)

NAME
       Usage: - uid/gid shifter

SYNOPSIS
       fuidshift directory [-t] [-r] <range1> [<range2> ...]

DESCRIPTION
       -t implies test mode.
              No file ownerships will be changed.

       -r means reverse, that is shift the uids out of the container.

              A           range          is          [u|b|g]:<first_con‐
              tainer_id:first_host_id:range>.  where u means shift uids,
              g  means  shift  gids,  b  means shift both.  For example:
              debian/tmp/usr/bin/fuidshift  directory   b:0:100000:65536
              u:10000:1000:1

       -t implies test mode.
              No file ownerships will be changed.

       -r means reverse, that is shift the uids out of the container.

              A           range          is          [u|b|g]:<first_con‐
              tainer_id:first_host_id:range>.  where u means shift uids,
              g  means  shift  gids,  b  means shift both.  For example:
              debian/tmp/usr/bin/fuidshift  directory   b:0:100000:65536
              u:10000:1000:1

Usage: debian/tmp/usr/bin/fuidDecemberr2017ry [-t] [-r] <range1USAGE:(1)2> ...]
