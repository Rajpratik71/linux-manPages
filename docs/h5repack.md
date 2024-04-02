h5repack(1)                                                                                General Commands Manual                                                                                h5repack(1)



NAME
       h5repack - Copy an HDF5 file to a new file with or without compression/chunking

SYNOPSIS
       h5repack -i file1 -o file2 [-h] [-v] [-f ´filter´] [-l ´layout´] [-m number] [-e file]

DESCRIPTION
       h5repack is a command line tool that applies HDF5 filters to a input file file1, saving the output in a new file, file2.

       ´filter´ is a string with the format      <list of objects> : <name of filter> = <filter parameters>.

       <list of objects> is a comma separated list of object names meaning apply compression only to those objects. If no object names are specified, the filter is applied to all objects.

       <name of filter> can be:
           GZIP, to apply the HDF5 GZIP filter (GZIP compression)
           SZIP, to apply the HDF5 SZIP filter (SZIP compression)
           SHUF, to apply the HDF5 shuffle filter
           FLET, to apply the HDF5 checksum filter
           NONE, to remove the filter

       <filter parameters> contains the optional compression information:
           SHUF (no parameter)
           FLET (no parameter)
           GZIP=<deflation level> from 1-9
           SZIP=<pixels per block,coding> (pixels per block is a even number in 2-32 and coding method is 'EC' or 'NN')

       ´layout´ is a string with the format
           <list of objects> : <layout type>

       <list of objects> is a comma separated list of object names, meaning that layout information is supplied for those objects. If no object names are specified, the layout is applied to all objects.

       <layout type> can be:
           CHUNK, to apply chunking layout
           COMPA, to apply compact layout
           CONTI, to apply continuous layout

       <layout parameters> is present for the chunk case only it is the chunk size of each dimension: <dim_1 x dim_2 x ... dim_n>

OPTIONS
       file1,file2
              The input and output HDF5 files

       -h     Print a help message

       -f filter
              Filter type

       -l layout
              Layout type

       -v     Verbose mode. Print output (list of objects in the file, filters and layout applied).

       -e file
              File with the -f and -l options (only filter and layout flags)

       -d delta
              Print  only  differences that are greater than the limit delta.  delta must be a positive number. The comparison criterion is whether the absolute value of the difference of two corresponding
              values is greater than delta (e.g., |a-b| > delta, where a is a value in file1 and b is a value in file2).

       -m number
              Do not apply the filter to objects which size in bytes is smaller than number. If no size is specified a minimum of 1024 bytes is assumed.

EXAMPLES
       Apply GZIP compression to all objects in file1 and save the output in file2:

            h5repack -i file1 -o file2 -f GZIP=1 -v

       Apply SZIP compression only to object ´dset1´:

            h5repack -i file1 -o file2 -f dset1:SZIP=8,NN -v

       Apply a chunked layout to objects ´dset1´ and ´dset2´:

            h5repack -i file1 -o file2 -l dset1,dset2:CHUNK=20x10 -v

SEE ALSO
       h5dump(1), h5ls(1), h5diff(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1), h5repart(1).



                                                                                                                                                                                                  h5repack(1)
