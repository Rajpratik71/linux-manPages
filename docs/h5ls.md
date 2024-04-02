h5ls(1)                                                                                    General Commands Manual                                                                                    h5ls(1)



NAME
       h5ls - Prints information about a file or dataset.

SYNOPSIS
       h5ls [OPTIONS] file [OBJECTS...]

DESCRIPTION
       h5ls prints selected information about file objects in the specified format.

OPTIONS
       -h     or -?  or --help Print a usage message and exit.

       -a     or --address Print addresses for raw data.

       -d     or --data Print the values of datasets.

       -e     or --errors Show all HDF5 error reporting.

       -f     or --full Print full path names instead of base names.

       -g     or --group Show information about a group, not its contents.

       -l     or --label Label members of compound datasets.

       -r     or --recursive List all groups recursively, avoiding cycles.

       -s     or --string Print 1-bytes integer datasets as ASCII.

       -S     or --simple Use a machine-readable output format.

       -wN    or --width=N Set the number of columns of output.

       -v     or --verbose Generate more verbose output.

       -V     or --version Print version number and exit.

       -x     or --hexdump Show raw data in hexadecimal format.

       file   The file name may include a printf(3C) integer format such as %%05d to open a file family.

       objects
              Each  object consists of an HDF5 file name optionally followed by a slash and an object name within the file (if no object is specified within the file then the contents of the root group are
              displayed). The file name may include a printf(3C) integer format such as "%05d" to open a file family.

SEE ALSO
       h5dump(1), h5diff(1), h5repart(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1)



                                                                                                                                                                                                      h5ls(1)
