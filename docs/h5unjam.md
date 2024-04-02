h5unjam(1)                                                                                 General Commands Manual                                                                                 h5unjam(1)



NAME
       h5unjam - Extract the user block from a HDF5 file

SYNOPSIS
       h5unjam -i in_file.h5 [-u user_block | --delete] [-o out_file.h5]

DESCRIPTION
       h5unjam splits an HDF5 file, writing the user block to a file or stdout and the HDF5 file to an HDF5 file with a header at byte 0 (i.e., with no user block).

       If out_file.h5 is given, a new file is created with the in_file.h5 without the user block. In this case, infile.h5 is unchanged.

       If out_file.h5 is not specified, the user_block is removed and in_file.h5 is rewritten, starting at byte 0.

       If  user_block is set, the user block will be written to user_block.  If user_block is not set, the user block (if any) will be written to stdout. If --delete is selected, the user block will not be
       not written.

EXAMPLE USAGE
       For an HDF5 file, with_ub.h5, with a user block, extract the user block to user_block.txt and the HDF5 file to wo_ub.h5.

            h5unjam -i with_ub.h5 -u user_block.txt -i wo_ub.h5

RETURN VALUE
       h5unjam returns the size of the output file, or -1 if an error occurs.

CAVEATS
       This tool copies all the data (sequentially) in the file(s) to new offsets. For a large file, this copy will take a long time.

       The most efficient way to create a user block is to create the file with a user block (see H5Pset_user_block), and write the user block data into that space from a program.

       The user block is completely opaque to the HDF5 library and to the h5jam and h5unjam tools.  The user block is simply read or written as a string of bytes, which could be text or any kind of  binary
       data.  It is up to the user to know what the contents of the user block means and how to process it.

       When the user block is extracted, all the data is written to the output, including any padding or unwritten data.

       This tool moves the HDF5 file through byte copies, i.e., it does not read or interpret the HDF5 objects.

SEE ALSO
       h5dump(1), h5ls(1), h5diff(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1), h5jam(1).



                                                                                                                                                                                                   h5unjam(1)
