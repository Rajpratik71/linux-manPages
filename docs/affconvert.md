affconvert(1)                                        convert files between RAW and AFF formats                                       affconvert(1)

NAME
       affconvert - convert files between RAW and AFF formats

SYNOPSIS
       affconvert [options] file1 [... files]

DESCRIPTION
       Convert  files  from RAW to AFF, AFF to RAW and AFF to AFF (recompressing/uncompressing). WARNING: the source file must have 'raw' or 'aff'
       as extension in name.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF is an open and extensible file format to store disk images and associated metadata. It is useful  in  several  scenaries,  as  computer
       forensics investigations.

OPTIONS
       General options:

              -q     Quiet mode. Don't ask questions, don't print status.

              -V     Just print the version number and exit.

       AFF output options:

              -a<ext>
                     Use 'ext' for aff files (default is aff; afd for AFD files).

              -L     Use the LZMA compression algorithm (better but slower).

              -Mn[kmg]
                     Set maximum size of output file. Suffix with k, m or g. Use with -o.

              -O<dir>
                     Use 'dir' as the output directory. Example: -Otest. Note that you need create the directory.

              -o<dir>.afd
                     Output to 'dir'.afd (can only convert one at a time). Consider AFF if file ends using .aff. Otherwise assumes raw. The direc‐
                     tory must have .afd as extension in name.

              -s<n>  Set the image_pagesize as 'n' (default 16777216).

              -x     Don't compress the AFF file.

              -X<n>  Set compression to 'n'; default is 7.

       Raw output options:

              -e<ext>
                     Use 'ext' for the raw files (default is raw). Implies in -r.

              -r     Generate raw output.

       Dangerous input options:

              -y     Always answer yes/no questions 'yes.'

              -Z     Do not automatically probe for gzip/bzip2 compression.

              -z     ZAP (delete) the output file if it already exists.

EXAMPLES
       Convert file1.raw to file1.aff:

           $ affconvert file1.raw

       Convert file1.aff to file1.raw:

           $ affconvert -r file1.aff

       Batch convert files:

           $ affconvert file1.raw file2.raw file3.raw

           $ affconvert -r file1.aff file2.aff file3.aff

       Split an AFF file into 4GB chunks for archiving to DVD:

           $ affconvert -M4g -odvd.afd  bigfile.aff

SEE ALSO
       affcat(1), affcompare(1), affcopy(1), affcrypto(1), affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsegment(1), affsign(1),  affs‐
       tats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFCONVERT 3.7.4                                                     Oct 2014                                                        affconvert(1)
