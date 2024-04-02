OPIMPORT(1)                                                                                General Commands Manual                                                                                OPIMPORT(1)



NAME
       opimport - converts sample database files

SYNOPSIS
       opimport [ options ] input_file

DESCRIPTION
       opimport converts sample database files from a foreign binary format (abi) to the native format.


OPTIONS
       --abi / -a
              Input abi file description location.

       --force / -f
              Force conversion even if the input and output abi are identical.

       --output / -o filename
              Specify the output filename. If the output file already exists it is not overwritten but data are accumulated in. Sample filename are informative for post profile tools and must be kept iden‐
              tical, in other word the pathname from the first path component containing a '{' must be kept as it in the output filename.

       --help / -? / --usage
              Show help message.

       --verbose / -V
              Give verbose debugging output.

       --version / -v
              Show version.


ENVIRONMENT
       No special environment variables are recognised by opimport


FILES
       /var/lib/oprofile/abi
              The abi file description of the sample database files


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                                 OPIMPORT(1)
