LXD-BENCHMARK(1)                            User Commands                            LXD-BENCHMARK(1)

NAME
       lxd-benchmark - The container lightervisor - benchmark

DESCRIPTION
   Description:
              Benchmark performance of LXD

              This tool lets you benchmark various actions on a local LXD daemon.

              It  can  be  used just to check how fast a given LXD host is, to compare performance on
              different servers or for performance tracking when doing changes to the LXD codebase.

              A CSV report can be produced to be consumed by graphing software.

   Usage:
              lxd-benchmark [command]

EXAMPLES
              # Spawn 20 Ubuntu containers in batches of 4 lxd-benchmark launch --count 20 --parallel
              4

              # Create 50 Alpine containers in batches of 10 lxd-benchmark init --count 50 --parallel
              10 images:alpine/edge

              # Delete all test containers using dynamic batch size lxd-benchmark delete

   Available Commands:
       delete Delete containers

       help   Help about any command

       init   Create containers

       launch Create and start containers

       start  Start containers

       stop   Stop containers

   Flags:
       -h, --help
              Print help

       -P, --parallel
              Number of threads to use (default -1)

       --report-file
              Path to the CSV report file

       --report-label
              Label for the new entry in the report [default=ACTION]

       --version
              Print version number

       Use "lxd-benchmark [command] --help" for more information about a command.

lxd-benchmark 3.0.3                         November 2018                            LXD-BENCHMARK(1)
