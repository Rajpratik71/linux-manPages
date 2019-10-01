h5repart(1)                                                                                General Commands Manual                                                                                h5repart(1)



NAME
       h5repart - Repartitions a file or family of files.

SYNOPSIS
       h5repart [-v] [-V] [-[b|m]N[g|m|k]] source_file dest_file

DESCRIPTION
       h5repart splits a single file into a family of files, joins a family of files into a single file, or copies one family of files to another while changing the size of the family members. h5repart can
       also be used to copy a single file to a single file with holes.

       Sizes associated with the -b and -m options may be suffixed with g for gigabytes, m for megabytes, or k for kilobytes.

       File family names include an integer printf format such as %d.

OPTIONS
       -v     Produce verbose output.

       -V     Print a version number and exit.

       -bN    The I/O block size, defaults to 1kB

       -mN    The destination member size or 1GB

       source_file
              The name of the source file

       dest_file
              The name of the destination files

SEE ALSO
       h5dump(1), h5ls(1), h5diff(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1)



                                                                                                                                                                                                  h5repart(1)
