SYSPROF(1)                                                    General Commands Manual                                                   SYSPROF(1)

NAME
       sysprof, sysprof-cli - System-wide Linux Profiler

SYNOPSIS
       sysprof [--version] [ filename ]
       sysprof-cli filename

DESCRIPTION
       sysprof  is a sampling CPU profiler for Linux that uses ftrace to profile the entire system, not just a single application. Sysprof handles
       shared libraries and applications do not need to be recompiled. In fact they don't even have to be restarted.

       sysprof can be used to analyze saved profile data.  filename parameter to sysprof can be used to load  saved  profile  data.  Alternatively
       Profiler->Open menu can be used to open a file.

       sysprof-cli is command-line tool to collect profiling data to filename.

OPTIONS
       --version
              Version. Display the version number.

       AUTHOR
              sysprof was written by Soren Sandmann <sandmann@redhat.com>.

       This manual page was written by Samuel Mimram <smimram@debian.org>, for the Debian project (but may be used by others).

                                                                    2011-06-02                                                          SYSPROF(1)
