h5jam(1)                                                                                   General Commands Manual                                                                                   h5jam(1)



NAME
       h5jam - Add a user block to a HDF5 file

SYNOPSIS
       h5jam -u user_block -i in_file.h5 [-o out_file.h5] [--clobber]

DESCRIPTION
       h5jam  concatenates a user_block file and an HDF5 file to create an HDF5 file with a user block. The user block can be either binary or text. The output file is padded so that the HDF5 header begins
       on byte 512, 1024, etc.. (See the HDF5 File Format.)

       If out_file.h5 is given, a new file is created with the user_block followed by the contents of in_file.h5.  In this case, infile.h5 is unchanged.

       If out_file.h5 is not specified, the user_block is added to in_file.h5.

       If in_file.h5 already has a user block, the contents of user_block will be added to the end of the existing user block, and the file shifted to the next boundary. If --clobber is set,  any  existing
       user block will be overwritten.

EXAMPLE USAGE
       Create new file, newfile.h5, with the text in file mytext.txt as the user block for the HDF5 file file.h5.

            h5jam -u mytext.txt -i file.h5 -o newfile.h5

       Add text in file mytext.txt to front of HDF5 dataset, file.h5.

            h5jam -u mytext.txt -i file.h5

       Overwrite the user block (if any) in file.h5 with the contents of mytext.txt.

            h5jam -u mytext.txt -i file.h5 --clobber

RETURN VALUE
       h5jam returns the size of the output file, or -1 if an error occurs.

CAVEATS
       This tool copies all the data (sequentially) in the file(s) to new offsets. For a large file, this copy will take a long time.

       The most efficient way to create a user block is to create the file with a user block (see H5Pset_user_block), and write the user block data into that space from a program.

       The  user block is completely opaque to the HDF5 library and to the h5jam and h5unjam tools.  The user block is simply read or written as a string of bytes, which could be text or any kind of binary
       data.  It is up to the user to know what the contents of the user block means and how to process it.

       When the user block is extracted, all the data is written to the output, including any padding or unwritten data.

       This tool moves the HDF5 file through byte copies, i.e., it does not read or interpret the HDF5 objects.

SEE ALSO
       h5dump(1), h5ls(1), h5diff(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1), h5unjam(1).



                                                                                                                                                                                                     h5jam(1)
