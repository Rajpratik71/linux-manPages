iowatcher(1)                                                                               General Commands Manual                                                                               iowatcher(1)



NAME
       iowatcher - Create visualizations from blktrace results


SYNOPSIS
       iowatcher OPTIONS...


DESCRIPTION
       iowatcher  graphs  the results of a blktrace run.  It can graph the result of an existing blktrace, start a new blktrace, or start a new blktrace and a benchmark run.  It can then create an image or
       movie of the IO from a given trace.  iowatcher can produce either SVG files or movies in mp4 format (with ffmpeg) or ogg format (with png2theora).


OPTIONS
       --help Print a brief usage summary.

       -d, --device <device>
              Controls which device you are tracing.  You can only trace one device at a time for now.  It is sent directly to blktrace, and only needed when you are making a new trace.

       -D, --blktrace-destination <destination>
              Destination for blktrace.

       -p, --prog <program>
              Program to run while blktrace is run.

       -K, --keep-movie-svgs
              Keep the SVG files generated for movie mode.

       -t, --trace <file|directory>
              Controls the name of the blktrace file.  iowatcher uses a dump from blkparse, so -t tries to guess the name of the corresponding per CPU blktrace data files if the dump file  doesn't  already
              exist.  If you want more than one trace in a given graph, you can specify -t more than once.  If a directory is specified, iowatcher will use the name of the directory as the base name of the
              dump file and all trace files found inside the directory will be processed.

       -l, --label <label>
              Sets a label in the graph for a trace file.  The labels are added in the same order the trace files are added.

       -m, --movie [spindle|rect]
              Create a movie.  The file format depends on the extension used in the -o filename.* option.  If you specify an .ogv or .ogg extension, the result will be Ogg Theora video,  if  png2theora  is
              available.   If  you  use  an  .mp4  extension,  the  result  will  be  an  mp4 video if ffmpeg is available.  You can use any other extension, but the end result will be an mp4.  You can use
              --movie=spindle or --movie=rect, which changes the style of the IO mapping.

       -T, --title <title>
              Set a title to be placed at the top of the graph.

       -o, --output <file>
              Output filename (default: trace.svg).

       -r, --rolling <seconds>
              Control the duration for the rolling average.  iowatcher tries to smooth out bumpy graphs by averaging the current second with seconds from the past.  Larger numbers  here  give  you  flatter
              graphs.

       -h, --height <height>
              Set the height of each graph

       -w, --width <width>
              Set the width of each graph

       -c, --columns <columns>
              Numbers of columns in graph output

       -x, --xzoom <min:max>
              Limit processed time range to min:max

       -y, --yzoom <min:max>
              Limit processed sectors to min:max

       -a, --io-plot-action <action>
              Plot given action (one of Q,D,C) in IO graph

       -P, --per-process-io
              Distinguish between processes in IO graph

       -O, --only-graph <graph>
              Add a single graph to the output (see GRAPHS).  By default all the graphs are included, but with -O you get only the graphs you ask for.  -O may be used more than once.

       -N, --no-graph <type>
              Remove a single graph from the output (see GRAPHS).  This may also be used more than once.

GRAPHS
       Choices for -O and -N are:
          io, tput, latency, queue_depth, iops, cpu-sys, cpu-io, cpu-irq, cpu-user, cpu-soft


EXAMPLES
       Generate graph from the existing trace.dump:

              iowatcher -t trace.dump -o trace.svg

       Skip the IO graph:

              iowatcher -t trace.dump -o trace.svg -N io

       Only graph tput and latency:

              iowatcher -t trace.dump -o trace.svg -O tput -O latency

       Generate a graph from two runs, and label them:

              iowatcher -t ext4.dump -t xfs.dump -l Ext4 -l XFS -o trace.svg

       Run a fio benchmark and store the trace in trace.dump, add a title to the top, use /dev/sda for blktrace:

              iowatcher -d /dev/sda -t trace.dump -T 'Fio Benchmark' -p 'fio some_job_file'

       Make a movie from an existing trace:

              iowatcher -t trace --movie -o trace.mp4




                                                                                                                                                                                                 iowatcher(1)
