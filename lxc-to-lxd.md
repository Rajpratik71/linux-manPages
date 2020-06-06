LXC-TO-LXD(1)                               User Commands                               LXC-TO-LXD(1)

NAME
       lxc-to-lxd - Convert LXC containers to LXD

DESCRIPTION
       usage: lxc-to-lxd [-h] [--dry-run] [--debug] [--all] [--delete]

              [--move-rootfs] [--lxcpath LXCPATH] [--lxdpath LXDPATH] [CONTAINER [CONTAINER ...]]

   positional arguments:
       CONTAINER
              Container to import

   optional arguments:
       -h, --help
              show this help message and exit

       --dry-run
              Dry run mode

       --debug
              Print debugging output

       --all  Import all containers

       --delete
              Delete the source container

       --move-rootfs
              Move the container rootfs rather than copying it

       --lxcpath LXCPATH
              Alternate LXC path

       --lxdpath LXDPATH
              Alternate LXD path

lxc-to-lxd 3.0.3                            November 2018                               LXC-TO-LXD(1)
