H5PERF_SERIAL:(1)                                                                               User Commands                                                                               H5PERF_SERIAL:(1)



NAME
       h5perf_serial: - Measures HDF5 serial performance.

DESCRIPTION
       h5perf_serial: Version 1.8.7 usage: h5perf_serial [OPTIONS]

              OPTIONS

       -h     Print an usage message and exit

       -A AL  Which APIs to test [default: all of them]

       -c SL  Selects chunked storage and defines chunks dimensions and sizes [default: Off]

       -e SL  Dimensions and sizes of dataset [default: 100,200]

       -i N   Number of iterations to perform [default: 1]

       -r NL  Dimension access order (see below for description) [default: 1,2]

       -t     Selects extendable dimensions for HDF5 dataset [default: Off]

       -v VFD Selects file driver for HDF5 access [default: sec2]

       -w     Perform write tests, not the read tests [default: Off]

       -x SL  Dimensions and sizes of the transfer buffer [default: 10,20]

       N      - is an integer > 0.

       S      - is a size specifier, an integer > 0 followed by a size indicator:

              K - Kilobyte (1024) M - Megabyte (1048576) G - Gigabyte (1073741824)

              Example: '37M' is 37 megabytes or 38797312 bytes

              AL - is an API list. Valid values are:

              hdf5 - HDF5 posix - POSIX

              Example: -A posix,hdf5

              NL - is list of integers (N) separated by commas.

              Example: 1,2,3

              SL - is list of size specifiers (S) separated by commas.

              Example: 2K,2K,3K

              The example defines an object (dataset, tranfer buffer) with three dimensions. Be aware that as the number of dimensions increases, the the total size of the object increases exponentially.

       VFD    - is an HDF5 file driver specifier. Valid values are:

              sec2, stdio, core, split, multi, family, direct

              Dimension access order:

              Data  access starts at the cardinal origin of the dataset using the transfer buffer. The next access occurs on a dataset region next to the previous one. For a multidimensional dataset, there
              are several directions as to where to proceed. This can be specified in the dimension access order. For example, -r 1,2 states that the tool should traverse dimension 1 first, and then dimen‐
              sion 2.

              Environment variables:

       HDF5_NOCLEANUP
              Do not remove data files if set [default remove]

       HDF5_PREFIX
              Data file prefix

       usage: h5perf_serial [OPTIONS]

              OPTIONS

       -h     Print an usage message and exit

       -A AL  Which APIs to test [default: all of them]

       -c SL  Selects chunked storage and defines chunks dimensions and sizes [default: Off]

       -e SL  Dimensions and sizes of dataset [default: 100,200]

       -i N   Number of iterations to perform [default: 1]

       -r NL  Dimension access order (see below for description) [default: 1,2]

       -t     Selects extendable dimensions for HDF5 dataset [default: Off]

       -v VFD Selects file driver for HDF5 access [default: sec2]

       -w     Perform write tests, not the read tests [default: Off]

       -x SL  Dimensions and sizes of the transfer buffer [default: 10,20]

       N      - is an integer > 0.

       S      - is a size specifier, an integer > 0 followed by a size indicator:

              K - Kilobyte (1024) M - Megabyte (1048576) G - Gigabyte (1073741824)

              Example: '37M' is 37 megabytes or 38797312 bytes

              AL - is an API list. Valid values are:

              hdf5 - HDF5 posix - POSIX

              Example: -A posix,hdf5

              NL - is list of integers (N) separated by commas.

              Example: 1,2,3

              SL - is list of size specifiers (S) separated by commas.

              Example: 2K,2K,3K

              The example defines an object (dataset, tranfer buffer) with three dimensions. Be aware that as the number of dimensions increases, the the total size of the object increases exponentially.

       VFD    - is an HDF5 file driver specifier. Valid values are:

              sec2, stdio, core, split, multi, family, direct

              Dimension access order:

              Data  access starts at the cardinal origin of the dataset using the transfer buffer. The next access occurs on a dataset region next to the previous one. For a multidimensional dataset, there
              are several directions as to where to proceed. This can be specified in the dimension access order. For example, -r 1,2 states that the tool should traverse dimension 1 first, and then dimen‐
              sion 2.

              Environment variables:

       HDF5_NOCLEANUP
              Do not remove data files if set [default remove]

       HDF5_PREFIX
              Data file prefix

SEE ALSO
       The full documentation for h5perf_serial: is maintained as a Texinfo manual.  If the info and h5perf_serial: programs are properly installed at your site, the command

              info h5perf_serial:

       should give you access to the complete manual.



h5perf_serial: Version 1.8.7                                                                     August 2011                                                                                H5PERF_SERIAL:(1)
