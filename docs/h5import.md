h5import(1)                                                                                General Commands Manual                                                                                h5import(1)



NAME
       h5import - Imports data into an existing or new HDF5 file.

SYNOPSIS
       h5import infile -d dim_list [ -p pathname ] [ -t input_class ] [ -s input_size ] [infile ...]  -o outfile

       h5import infile -dims dim_list [ -path pathname ] [ -type input_class ] [ -size input_size ] [infile ...]  -outfile outfile

       h5import infile -c config_file [infile ...]  -outfile outfile

       h5import -h

       h5import -help

DESCRIPTION
       h5import  converts  data  from  one or more ASCII or binary files, infile, into the same number of HDF5 datasets in the existing or new HDF5 file, outfile. Data conversion is performed in accordance
       with the user-specified type and storage properties specified in in_options.

       The primary objective of h5import is to import floating point or integer data. The utility's design allows for future versions that accept ASCII text files and store the contents as a compact  array
       of one-dimensional strings, but that capability is not implemented in HDF5 Release 1.6.

       Input data and options

       Input data can be provided in one of the follwing forms:

       *      As an ASCII, or plain-text, file containing either floating point or integer data

       *      As a binary file containing either 32-bit or 64-bit native floating point data

       *      As a binary file containing native integer data, signed or unsigned and 8-bit, 16-bit, 32-bit, or 64-bit.

       *      As an ASCII, or plain-text, file containing text data. (This feature is not implemented in HDF5 Release 1.6.)

       Each input file, infile, contains a single n-dimensional array of values of one of the above types expressed in the order of fastest-changing dimensions first.

       Floating  point  data  in an ASCII input file must be expressed in the fixed floating form (e.g., 323.56) h5import is designed to accept scientific notation (e.g., 3.23E+02) in an ASCII, but that is
       not implemented in HDF5 release 1.6.

       Each input file can be associated with options specifying the datatype and storage properties. These options can be specified either as command line arguments or in a configuration file.  Note  that
       exactly one of these approaches must be used with a single input file.

       Command line arguments, best used with simple input files, can be used to specify the class, size, dimensions of the input data and a path identifying the output dataset.

       The  recommended  means of specifying input data options is in a configuration file; this is also the only means of specifying advanced storage features. See further discussion in "The configuration
       file" below.

       The only required option for input data is dimension sizes; defaults are available for all others.

       h5import will accept up to 30 input files in a single call. Other considerations, such as the maximum length of a command line, may impose a more stringent limitation.

       Output data and options:

       The name of the output file is specified following the -o or -output option in outfile. The data from each input file is stored as a separate dataset in this output file. outfile may be an  existing
       file. If it does not yet exist, h5import will create it.

       Output dataset information and storage properties can be specified only by means of a configuration file.

       Dataset path
              If  the groups in the path leading to the dataset do not exist, h5import will create them.  If no group is specified, the dataset will be created as a member of the root group.  If no dataset
              name is specified, the default name is dataset1 for the first input dataset, dataset2 for the second input dataset, dataset3 for the third input dataset, etc.  h5import does not  overwrite  a
              pre-existing  dataset  of the specified or default name. When an existing dataset of a confilcting name is encountered, h5import quits with an error; the current input file and any subsequent
              input files are not processed.

       Output type
              Datatype parameters for output data

       Output data class
              Signed or unsigned integer or floating point

       Output data size
              8-, 16-, 32-, or 64-bit integer 32- or 64-bit floating point

       Output architecture
              IEEE, STD, NATIVE (Default), Other architectures are included in the h5import design but are not implemented in this release.

       Output byte order
              Little- or big-endian.  Relevant only if output architecture is IEEE, UNIX, or STD; fixed for other architectures.

       Dataset layout and storage properties
              Denote how raw data is to be organized on the disk. If none of the following are specified, the default configuration is contiguous layout and with no compression.

       Layout Contiguous (Default),  Chunked

       External storage
              Allows raw data to be stored in a non-HDF5 file or in an external HDF5 file. Requires contiguous layout.

       Compressed
              Sets the type of compression and the level to which the dataset must be compressed. Requires chunked layout.

       Extendible
              Allows the dimensions of the dataset increase over time and/or to be unlimited. Requires chunked layout.

       Compressed and extendible
              Requires chunked layout.

FILES
       A configuration file is specified with the -c config_file option:
              h5import infile -c config_file [infile -

       The configuration file is an ASCII file and must be organized as "Configuration_Keyword Value" pairs, with one pair on each line. For example, the line indicating that the input data class (configu‐
       ration keyword INPUT-CLASS) is floating point in a text file (value TEXTFP) would appear as follows:
              INPUT-CLASS TEXTFP

       A  configuration  file  may have the following keywords each followed by one of the following defined values. One entry for each of the first two keywords, RANK and DIMENSION-SIZES, is required; all
       other keywords are optional.

       RANK rank
              An integer specifying the number of dimensions in the dataset.  Example:   RANK 4   for a 4-dimensional dataset.

       DIMENSION-SIZES dim_sizes
              Sizes of the dataset dimensions. (Required) A string of space-separated integers specifying the sizes of the dimensions in the dataset. The number of sizes in this entry must match the  value
              in the RANK entry. The fastest-changing dimension must be listed first.  Example:   DIMENSION_SIZES 4 3 4 38   for a 38x4x3x4 dataset.

       PATH path
              Path  of  the  output  dataset.   The  full HDF5 pathname identifying the output dataset relative to the root group within the output file. I.e., path is a string consisting of optional group
              names, each followed by a slash, and ending with a dataset name. If the groups in the path do no exist, they will be created. If PATH is not specified, the output dataset is stored as a  mem‐
              ber  of  the  root  group  and  the  default dataset name is dataset1 for the first input dataset, dataset2 for the second input dataset, dataset3 for the third input dataset, etc.  Note that
              h5import does not overwrite a pre-existing dataset of the specified or default name. When an existing dataset of a confilcting name is encountered, h5import quits with an error;  the  current
              input file and any subsequent input files are not processed.  Example: The configuration file entry "PATH grp1/grp2/dataset1" indicates that the output dataset dataset1 will be written in the
              group grp2/ which is in the group grp1/, a member of the root group in the output file.

       INPUT-CLASS {TEXTIN|TEXTUIN|TEXTFP|TEXTFPE|IN|UIN|FP|STR}
              A string denoting the type of input data.
              TEXTIN Input is signed integer data in an ASCII file.
              TEXTUIN Input is unsigned integer data in an ASCII file.
              TEXTFP Input is floating point data in fixed notation (e.g., 325.34) in an ASCII file.
              TEXTFPE Input is floating point data in scientific notation (e.g., 3.2534E+02) in an ASCII file. (Not implemented in this release.)
              IN Input is signed integer data in a binary file.
              UIN Input is unsigned integer data in a binary file.
              FP Input is floating point data in a binary file. (Default)
              STR Input is character data in an ASCII file. With this value, the configuration keywords RANK, DIMENSION-SIZES, OUTPUT-CLASS, OUTPUT-SIZE, OUTPUT-ARCHITECTURE, and OUTPUT-BYTE-ORDER will  be
              ignored. (Not implemented in this release.)

       INPUT-SIZE {8|16|32|64}
              An  integer  denoting  the  size of the input data, in bits.  For signed and unsigned integer data (TEXTIN, TEXTUIN, IN, or UIN) any of 8, 16, 32, or 64 may be used.  The default is 32.   For
              floating point data (TEXTFP, TEXTFPE, or FP), either 32 or 64 may be specified.  The default is 32.

       OUTPUT-CLASS {IN|UIN|FP|STR}
              A string denoting the type of output data.
              IN Output is signed integer data.  (Default if INPUT-CLASS is IN or TEXTIN)
              UIN Output is unsigned integer data. (Default if INPUT-CLASS is UIN or TEXTUIN)
              FP Output is floating point data. (Default if INPUT-CLASS is not specified or is FP, TEXTFP, or TEXTFPE)
              STR Output is character data, to be written as a 1-dimensional array of strings. (Default if INPUT-CLASS is STR) (Not implemented in this release.)

       OUTPUT-SIZE {8|16|32|64}
              An integer denoting the size of the output data, in bits.  For signed and unsigned integer data (IN or UIN), any of the four sizes are valid. The default is the same as INPUT-SIZE,  else  32.
              For floating point data (FP), either 32 or 64 may be specified.  The default is the same as INPUT-SIZE, else 32.

       OUTPUT-ARCHITECTURE {NATIVE|STD|IEEE|INTEL|CRAY|MIPS|ALPHA|UNIX}
              A string denoting the type of output architecture.  See the "Predefined Atomic Types" section in the "HDF5 Datatypes" chapter of the HDF5 User's Guide for a discussion of these architectures.
              INTEL, CRAY, MIPS, ALPHA, and UNIX are not implemented in this release.  (Default: NATIVE)

       OUTPUT-BYTE-ORDER {BE|LE}
              A string denoting the output byte order. This entry is ignored if the OUTPUT-ARCHITECTURE is not specified or if it is not specified as IEEE, UNIX, or STD.
              BE Big-endian. (Default)
              LE Little-endian.

       The following options are disabled by default, making the default storage properties no chunking, no compression, no external storage, and no extensible dimensions.

       CHUNKED-DIMENSION-SIZES chunk_dims
              Dimension sizes of the chunk for chunked output data.  A string of space-separated integers specifying the dimension sizes of the chunk for chunked output data. The number of dimensions  must
              correspond  to  the  value of RANK.  The presence of this field indicates that the output dataset is to be stored in chunked layout; if this configuration field is absent, the dataset will be
              stored in contiguous layout.

       COMPRESSION-TYPE {GZIP}
              Type of compression to be used with chunked storage. Requires that CHUNKED-DIMENSION-SIZES be specified.  GZIP       is gzip compression. Othe compression algorithms are  not  implemented  in
              this release of h5import.

       COMPRESSION-PARAM [1-9]
              Compression level.  Required if COMPRESSION-TYPE is specified.  Gzip compression levels: 1 will result in the fastest compression while 9 will result in the best compression ratio.  (Default:
              6. The default gzip compression level is 6; not all compression methods will have a default level.)

       EXTERNAL-STORAGE external_file
              Name of an external file in which to create the output dataset. Cannot be used with CHUNKED-DIMENSIONS-SIZES, COMPRESSION-TYPE, OR MAXIMUM-DIMENSIONS.  A string  specifying  the  name  of  an
              external file.

       MAXIMUM-DIMENSIONS max_dims
              Maximum sizes of all dimensions. Requires that CHUNKED-DIMENSION-SIZES be specified.  A string of space-separated integers specifying the maximum size of each dimension of the output dataset.
              A value of -1 for any dimension implies unlimited size for that particular dimension.  The number of dimensions must correspond to the value of RANK.

OPTIONS
       -h[elp]
              prints the h5import usage summary

       infile(s)
              Name of the Input file(s).

       -d[ims] dim_list
              Input data dimensions.  dim_list is a string of comma-separated numbers with no spaces describing the dimensions of the input data. For example, a 50 x 100 2-dimensional array would be speci‐
              fied as -dims 50,100.  Required argument: if no configuration file is used, this command-line argument is mandatory.

       -p[athname] pathname
              pathname is a string consisting of one or more strings separated by slashes (/) specifying the path of the dataset in the output file. If the groups in the path do no exist, they will be cre‐
              ated.  Optional argument: if not specified, the default path is dataset1 for the first input dataset, dataset2 for the second input  dataset,  dataset3  for  the  third  input  dataset,  etc.
              h5import  does  not overwrite a pre-existing dataset of the specified or default name. When an existing dataset of a confilcting name is encountered, h5import quits with an error; the current
              input file and any subsequent input files are not processed.

       -t[ype] input_class
              input_class specifies the class of the input data and determines the class of the output data.  Valid values are as defined in the Keyword/Values table in the section "The configuration file"
              above.  Optional argument: if not specified, the default value is FP.

       -s[size] input_size
              input_size  specifies  the  size  in  bits of the input data and determines the size of the output data.  Valid values for signed or unsigned integers are 8, 16, 32, and 64.  Valid values for
              floating point data are 32 and 64.  Optional argument: if not specified, the default value is 32.

       -c config_file
              config_file specifies a configuration file.  This argument replaces all other arguments except infile and -o outfile

       outfile
              Name of the HDF5 output file.

NOTES
       If the -c config_file option is used with an input file, no other argument can be used with that input file. If the -c config_file option is not used with an input data file, the -d  dim_list  argu‐
       ment (or -dims dim_list) must be used and any combination of the remaining options may be used. Any arguments used must appear in exactly the order used in the syntax declarations immediately above.

       Note that while only the -dims argument is required, arguments must used in the order in which they are listed below.

EXAMPLES
       Using command-line arguments:

       This command creates a file out1 containing a single 2x3x4 32-bit integer dataset. Since no pathname is specified, the dataset is stored in out1 as /dataset1.
              h5import infile -dims 2,3,4 -type TEXTIN -size 32 -o out1

       This command creates a file out2 containing a single a 20x50 64-bit floating point dataset. The dataset is stored in out2 as /bin1/dset1.
              h5import infile -dims 20,50 -path bin1/dset1 -type FP -size 64 -o out2

       Sample configuration files: The following configuration file specifies the following:

       o      The input data is a 5x2x4 floating point array in an ASCII file.

       o      The output dataset will be saved in chunked layout, with chunk dimension sizes of 2x2x2.

       o      The output datatype will be 64-bit floating point, little-endian, IEEE.

       o      The output dataset will be stored in outfile at /work/h5/pkamat/First-set.

       o      The maximum dimension sizes of the output dataset will be 8x8x(unlimited).

              PATH work/h5/pkamat/First-set
              INPUT-CLASS TEXTFP
              RANK 3
              DIMENSION-SIZES 5 2 4
              OUTPUT-CLASS FP
              OUTPUT-SIZE 64
              OUTPUT-ARCHITECTURE IEEE
              OUTPUT-BYTE-ORDER LE
              CHUNKED-DIMENSION-SIZES 2 2 2
              MAXIMUM-DIMENSIONS 8 8 -1

       The next configuration file specifies the following:

       o      The input data is a 6x3x5x2x4 integer array in a binary file.

       o      The output dataset will be saved in chunked layout, with chunk dimension sizes of 2x2x2x2x2.

       o      The output datatype will be 32-bit integer in NATIVE format (as the output architecure is not specified).

       o      The output dataset will be compressed using Gzip compression with a compression level of 7.

       o      The output dataset will be stored in outfile at /Second-set.

              PATH Second-set
              INPUT-CLASS IN
              RANK 5
              DIMENSION-SIZES 6 3 5 2 4
              OUTPUT-CLASS IN
              OUTPUT-SIZE 32
              CHUNKED-DIMENSION-SIZES 2 2 2 2 2
              COMPRESSION-TYPE GZIP
              COMPRESSION-PARAM 7

SEE ALSO
       h5dump(1), h5ls(1), h5diff(1), h5repart(1), gif2h5(1), h52gif(1), h5perf(1)




                                                                                                                                                                                                  h5import(1)
