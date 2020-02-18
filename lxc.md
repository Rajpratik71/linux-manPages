LXC(1)                        User Commands                       LXC(1)

NAME
       lxc - The container hypervisor - client

SYNOPSIS
       lxc <command> [options]

DESCRIPTION
       This is the LXD command line client.

       All  of LXD's features can be driven through the various commands
       below.  For help with any of those, simply call them with --help.

   Commands:
       config Change container or server configuration options

       copy   Copy containers within or in between LXD instances

       delete Delete containers and snapshots

       exec   Execute commands in containers

       file   Manage files in containers

       image  Manipulate container images

       info   Show container or server information

       launch Create and start containers from images

       list   List the existing containers

       move   Move containers within or in between LXD instances

       profile
              Manage container configuration profiles

       publish
              Publish containers as images

       remote Manage the list of remote LXD servers

       restart
              Restart containers

       restore
              Restore containers from snapshots

       snapshot
              Create container snapshots

       start  Start containers

       stop   Stop containers

       version
              Print the version number of this client tool

OPTIONS
       --all  Print less common commands

       --debug
              Print debug information

       --verbose
              Print verbose information

       --version
              Show client version

ENVIRONMENT
       LXD_CONF
              Path to an alternate client configuration directory

       LXD_DIR
              Path to an alternate server directory

lxc 2.0.11                    December 2017                       LXC(1)
