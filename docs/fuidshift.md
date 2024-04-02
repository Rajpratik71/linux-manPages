FUIDSHIFT(1)                                User Commands                                FUIDSHIFT(1)

NAME
       fuidshift - uid/gid shifter

DESCRIPTION
   Description:
              UID/GID shifter

              This tool lets you remap a filesystem tree, switching it from one set of UID/GID ranges
              to another.

              This is mostly useful when retrieving a wrongly shifted filesystem tree from  a  backup
              or  broken  system  and  having  to  remap  everything either to the host UID/GID range
              (uid/gid 0 is root) or to an existing container's range.

              A range is represented as  <u|b|g>:<first_container_id>:<first_host_id>:<size>.   Where
              "u" means shift uid, "g" means shift gid and "b" means shift uid and gid.

   Usage:
              fuidshift <directory> <range> [<range>...] [flags]

EXAMPLES
              fuidshift my-dir/ b:0:100000:65536 u:10000:1000:1

   Flags:
       -h, --help
              Print help

       -r, --reverse
              Perform a reverse mapping

       -t, --test
              Test mode (no change to files)

       --version
              Print version number

fuidshift 3.0.3                             November 2018                                FUIDSHIFT(1)
