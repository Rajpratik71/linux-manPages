OPARCHIVE(1)                                                                               General Commands Manual                                                                               OPARCHIVE(1)



NAME
       oparchive - produce archive of oprofile data for offline analysis

SYNOPSIS
       oparchive [ options ] [profile specification] -o [directory]

DESCRIPTION
       oparchive  generates  a directory populated with executable, debug, and oprofile sample files. This directory can be move to another machine via tar and analyzed without further use of the data col‐
       lection machine. See oprofile(1) for how to write profile specifications.


OPTIONS
       --help / -? / --usage
              Show help message.

       --version / -v
              Show version.

       --verbose / -V [options]
              Give verbose debugging output.

       --session-dir=dir_path
              Use sample database from the specified directory dir_path instead of the default locations. If --session-dir is not specified, then oparchive will search for  samples  in  <current_dir>/opro‐
              file_data first. If that directory does not exist, the standard session-dir of /var/lib/oprofile is used.

       --image-path / -p [paths]
              Comma-separated list of additional paths to search for binaries.  This is needed to find modules in kernels 2.6 and upwards.

       --root / -R [path]
              A path to a filesystem to search for additional binaries.

       --output-directory / -o [directory]
              Output to the given directory. There is no default. This must be specified.

       --exclude-dependent / -x
              Do not include application-specific images for libraries, kernel modules and the kernel. This option only makes sense if the profile session used --separate.

       --list-files / -l
              Only list the files that would be archived, don't copy them.


ENVIRONMENT
       No special environment variables are recognised by oparchive.


FILES
       <current_dir>/oprofile_data/samples
              Or
       /var/lib/oprofile/samples/

              The location of the generated sample files.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                                OPARCHIVE(1)
