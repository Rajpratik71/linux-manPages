OPGPROF(1)                                                                                 General Commands Manual                                                                                 OPGPROF(1)



NAME
       opgprof - produce gprof-format profile data

SYNOPSIS
       opgprof [ options ] [profile specification]

DESCRIPTION
       opgprof outputs gprof-format profile data for a given binary image, from an OProfile session. See oprofile(1) for how to write profile specifications.


OPTIONS
       --help / -? / --usage
              Show help message.

       --version / -v
              Show version.

       --verbose / -V [options]
              Give verbose debugging output.

       --session-dir=dir_path
              Use sample database out of directory dir_path instead of the default location (/var/lib/oprofile).

       --image-path / -p [paths]
              Comma-separated list of additional paths to search for binaries.  This is needed to find modules in kernels 2.6 and upwards.

       --root / -R [path]
              A path to a filesystem to search for additional binaries.

       --threshold / -t [percentage]
              Only output data for symbols that have more than the given percentage of total samples.

       --output-filename / -o [file]
              Output to the given file instead of the default, gmon.out


ENVIRONMENT
       No special environment variables are recognised by opgprof.


FILES
       /var/lib/oprofile/samples/
              The location of the generated sample files.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                                  OPGPROF(1)
