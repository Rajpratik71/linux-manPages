pngcrush(1)                             General Commands Manual                            pngcrush(1)

NAME
       pngcrush — optimizes (or modifies) PNG (Portable Network Graphics) files.

SYNOPSIS
       pngcrush [options]  [infile.png]  [outfile.png]

       pngcrush -e ext [options]  [file1.png]  [file2.png] ...

       pngcrush -d dir [options]  [file1.png]  [file2.png] ...

DESCRIPTION
       pngcrush is an optimizer for PNG (Portable Network Graphics) files.  Its main purpose is to re‐
       duce the size of the file's IDAT chunk (or stream).  pngcrush can also  be  used  to  modify  a
       PNG's  ancillary chunks (example: transparency information or textual comments). Some familiar‐
       ity with the PNG (pronounced 'ping') format may be helpful to users of pngcrush.  pngcrush  has
       reasonable  defaults  so  running  with  no  options  may produce smaller files.  This document
       briefly describes the PNG format where necessary to understand pngcrush.  For complete documen‐
       tation, see :

                 http://www.libpng.org/pub/png/.

       The  actual  pixel data of a PNG is contained in one or many IDAT chunks. To make an IDAT chunk
       PNG encoders take the raw pixel data, filter it with one of 5 different  filters  (See  Section
       "Filter  Types"  ) then compress it.  pngcrush reduces the size of PNG files by choosing a dif‐
       ferent filter or compression methods from those used in the input file.  pngcrush tries  multi‐
       ple  filter/compression  methods  and  compares the size of the resulting IDAT chunk.  The fil‐
       ter/compression method with the smallest IDAT chunk is chosen for the output file.  The  filter
       and  compression levels pngcrush tries are controlled by command line options.  All of the fil‐
       ter methods and compression levels are lossless; they will not reduce image quality.

       In addition to reducing the size of a PNG file, pngcrush can modify ancillary chunks.    Ancil‐
       lary chunks are optional information including transparency (tRNS), gamma (gAMMA), standard RGB
       color space conformance (sRGB) or textual information (iTXt, tEXt or zTXt).  See the associated
       command line options for details on manipulating these chunks.

OPTIONS
       -already size
                 If  file has an IDAT chunk greater than the integer size, it will be considered to be
                 already crushed and will not be processed further.

       -bit_depth n
                 Force output bit depth to n. See Section "Color Types" for bit depth restrictions.

       -bkgd r g b
                 Specify the default background color for the image.  Some PNG viewers will  use  this
                 background  when displaying the image. Background is specified by r, g and b integers
                 between 0 and (2^bitdepth)-1. For output color type 0 and 4 (gray, see section "Color
                 Types" ) the green index is used as the gray level of the background.

       -brute    Use  brute  force, try 114 different filter/compression methods [11-124]. This option
                 is very time-consuming and generally not worthwhile. You can restrict this option  to
                 certain  filter types, compression levels, or strategies by following it with -f fil‐
                 ter,  -l level, or -z strategy. For example:

                           pngcrush -brute -f 0 infile.png

                 Will try only methods that use filter type 0.

       -c type   Set the output image color type to type, one of [0, 2, 4, or 6] (see  section  "Color
                 Types" ).  Future versions of pngcrush will also allow color type 3, if there are 256
                 or fewer colors present in the input file.  Color types 4 and 6 are  padded  with  an
                 opaque alpha channel if the input file does not have alpha information. You can use 0
                 or 4 to convert color to grayscale. Use 0 or 2 to delete an unwanted  alpha  channel.
                 Default is to use same color type as the input file.

       -d dir    Specify a directory for all output files. All output files will have the same name as
                 their respective input files.

       -dou      Double the images gamma.  This is used for fixing gamma in PhotoShop 5.0c5.02  files.
                 It  has been claimed that the PS5 bug is actually more complex than that, in some un‐
                 specified way.

       -e ext    Specify a new extension ext for all output files.

       -exit     Forces pngcrush to call exit() rather than return() when it is finished.  It  is  un‐
                 clear to this writer why this option exists.

       -f filter Specify  filter (see section "Filter Types" ) to use with the method specified in the
                 preceding -m or -brute option.  Valid filter types are [0-4] : use specified  filter,
                 [5]: use adaptive filtering.

       -fix      Fix otherwise fatal conditions such as bad CRCs. The CRC (Cyclic Redundancy Check) is
                 present in every chunk and can alert the decoder of corrupt data.

       -force    Write a new output file even if larger than input. Otherwise the input file  will  be
                 copied to output if it is smaller than any generated file and no chunk additions, re‐
                 movals, or changes were requested.

       -g gamma  Value to insert in gAMA chunk, only if the input file has no gAMA chunk.  To  replace
                 an  existing  gAMA  chunk, use the -replace_gamma option.  Some decoders will use the
                 gAMA chunk to more accurately display the image. gamma relates the  output  intensity
                 to  the input samples (input_sample = light_out GAMMA).  gamma can be any integer be‐
                 tween 0 and 2 32 and is interpreted as GAMMA*100000. For example,  if  you  wanted  a
                 GAMMA of 1/2.2, you would enter 45455 for gamma.

       -h        Display help and legal notices.

       -itxt b|a keyword text
                 Insert  an  (uncompressed) iTXt chunk. b|a indicates whether chunk should be inserted
                 before or after the IDAT chunk, (see Section "Text Chunks" ).

       -keep chunk_name
                 keep named chunk chunk_name even if the PNG  datastream  becomes  invalid.  Currently
                 only dSIG is recognized as an acceptable value.

       -l level  zlib compression level to use on the filtered IDAT chunk with the method specified by
                 the preceding -m or -brute option. zlib compression levels are integers between 0 and
                 9.  0 = no compression, 1 = fastest compression, and 9 = best compression.

       -loco     Make the file more compressible by performing a lossless, reversible, color transfor‐
                 mation. The resulting file is a MNG format file, not a PNG, and should be  given  the
                 .mng  file extension. The loco option has no effect on grayscale or indexed-color PNG
                 files.

       -m method pngcrush method [0-200] to try (0 means try all of 1-10). Can be repeated as in -m  1
                 -m 4 -m 7. This can be useful if you run out of memory when pngcrush tries methods 2,
                 3, 5, 6, 8, 9, or 10 which use filtering and are memory intensive.  Method 1, 4,  and
                 7  use  no  filtering; methods 11 and up use specified filter, compression level, and
                 strategy.

       -max maximum_IDAT_size
                 Set the maximum idat size to be used when creating the compression buffer.[1  through
                 524288]

       -mng      write a new MNG, do not crush embedded PNGs.

       -n        Do not do compression or write output file. This is useful in conjunction with the -v
                 option to get info, or to test decode speed.

       -p        This option tells pngcrush to pause and wait for  [enter]  key  whenever  the  screen
                 fills.

       -plte_len n
                 Truncates  the  PLTE.  The PLTE chunk contains from 1 to 256 palette entries. Be sure
                 not to truncate it to less than the greatest index present in IDAT.

       -q        quiet, the opposite of verbose.

       -rem chunkname
                 Name of an ancillary chunk or optional PLTE to be  removed.  Be  careful  with  this.
                 Please  don't  use  this  feature  to remove transparency, gamma, copyright, or other
                 valuable information.  To remove several different chunks,  repeat:  -rem  tEXt  -rem
                 pHYs.   Known chunks (those in the PNG spec or extensions document) can be named with
                 all lower-case letters, so -rem bkgd is equivalent to -rem bKGD.  But note: -rem text
                 removes  all  forms  of text chunks; Exact case is required to remove unknown chunks.
                 To do surgery with a chain-saw, -rem alla removes all known ancillary  chunks  except
                 for tRNS, and -rem allb removes all but tRNS and gAMA.

       -replace_gamma gamma
                 Force  a specified gamma in the output file even if gAMA is present in the input. See
                 the -g for more information.

       -res dpi  Write a pHYs chunk with a resolution of dpi.  The pHYs chunk  indicates  the  desired
                 pixel size.

       -save     Force  writing of unknown chunks.  If the input image has chunks that are not part of
                 the PNG specification, they should not be discarded.

       -srgb n   Set value of rendering intent for sRGB chunk to n where n is between 0 and 3. The ap‐
                 propriate rendering intent depends on how the image will be used:

                           0  - Perceptual: when good adaptation to the output device gamut at the ex‐
                           pense of colorimetric accuracy is desired, example: photographs.

                           1 - Relative colorimetric: images requiring color appearance matching (rel‐
                           ative to the output device white point), example: logos.

                           2:  Saturation: preservation of saturation at the expense of hue and light‐
                           ness is preferred, example: charts and graphs.

                           3: Absolute colorimetric: images requiring preservation  of  absolute  col‐
                           orimetry, example: proofs (previews of images destined for a different out‐
                           put device).

       -text [b|a] keyword text
                 Insert a tEXt chunk. [b|a] indicates whether chunk should be inserted before or after
                 the IDAT chunk, (see Section "Text Chunks" ).

       -newtimestamp
                 Reset file modification time to newer time stamp. This is the default.

       -oldtimestamp
                 Retain  input file modification time stamp. The default is -newtimestamp which is the
                 opposite of this option.

       -trns index red green blue gray
                 Insert a tRNS (transparency) chunk, if no tRNS chunk found in file.   You  must  give
                 all five parameters regardless of the color type, scaled to the output bit depth. See
                 the PNG documentation for details.

       -trns_array n trns[0] trns[1] ... trns[n-1]
                 Insert a tRNS (transparency) chunk, if no tRNS chunk found in file. See the PNG docu‐
                 mentation for details.

       -v        Display more detailed information. Repeat the option (use "-v -v") for even more.

       -w size   Specify  size in kbytes (or bytes in the case of 512) of the sliding compression win‐
                 dow where size is one of [32, 16, 8, 4, 2, 1, or 512]. It's best to use  the  default
                 (32) unless you run out of memory.  The program will use a smaller window anyway when
                 the uncompressed file is smaller than 16k.

       -z strategy
                 Specify the zlib compression strategy [0, 1, or 2] to be used on  the  filtered  IDAT
                 chunk for the method of the preceding -m.  The zlib strategy parameter tunes the com‐
                 pression algorithm and is one of:

                    •  0 : default, most compression is aimed towards string matching

                    •  1 : some string matching, some Huffman coding

                    •  2 : use only Huffman coding

       -zitxt [b|a] keyword text
                 Insert a zTXt chunk. [b|a] indicates whether chunk should be inserted before or after
                 the IDAT chunk, (see Section "Text Chunks" ).

       -ztxt [b|a] keyword text
                 zTXt chunk to insert (see -text).

Color Types
       The  PNG  specification  provides for five color types.  The color type determines how the IDAT
       chunk will be interpreted by the decoder.  Choosing a color type appropriate for the color  in‐
       formation in an image can in principle reduce the size. However, certain combinations of -c and
       -bit_depth require color counting which is currently disabled. In such cases no reduction  will
       take  place.  Following  are  the  PNG color types followed by their supported bit depths (Note
       pngcrush does not support changing a file to color type 3 from another color type.):

          •  0 : grayscale without alpha channel (1,2,4,8,16)

          •  2 : true color without alpha channel (8,16)

          •  3 : indexed color (1,2,4,8)

          •  4 : grayscale with alpha channel (8,16)

          •  6 : true color with alpha channel (8,16)

       An alpha channel represents transparency on a per pixel basis. An alpha value of zero  is  com‐
       pletely transparent. An alpha channel of 2 bitdepth-1 is completely opaque.

Filter Types
       The  IDAT chunk can optionally be filtered before compression.  These filters can make the IDAT
       chunk more compressible without losing any data and result in a smaller PNG file.   These  fil‐
       ters  are applied to the bytes of the IDAT chunk, not the pixels. Following is a brief descrip‐
       tion of the filters, see the PNG specification for details:

          •  0 : no filter

          •  1 : 'sub' transmits the difference between each byte and the value of  the  corresponding
             byte of the prior pixel.

          •  2  :  'up'  transmits the difference between each byte and the value of the corresponding
             byte of the pixel above this pixel

          •  3 : 'average' transmits the difference between each byte and the average of the bytes de‐
             scribed in filters 1 and 2

          •  4  :  'paeth' computes a simple linear function of the corresponding byte in three neigh‐
             boring pixels (paeth_predictor = left + above - upper left), then transmits  the  differ‐
             ence  between  the  byte  in  question  and  the neighboring byte closest to the value of
             paeth_predictor.

Text Chunks
       Textual information pertaining to an image can be conveyed with the tEXt, iTXt and zTXt chunks.
       All  text chunks consist of a keyword followed by a string.  The following keywords are defined
       in the PNG specification: (you may invent keywords for other purposes):

                 Title: Short title or caption for image

                 Author: Name of image's creator

                 Description: Longer description of image

                 Copyright: Copyright notice

                 Creation Time: Time of original image creation

                 Software: Software used to create the image

                 Disclaimer: Legal disclaimer

                 Warning: Warning of nature of content

                 Source: Device used to create the image

                 Comment: Miscellaneous comment.

       A tEXt chunk stores text in the ISO/IEC 8859-1 (Latin-1) character set.  zTXt chunks  also  use
       the  Latin-1  character  set,  but  the  text is compressed.  This can be useful for large text
       chunks.  iTXt chunks consist of text in the UTF-8 of the Unicode character set.

       keyword must be at least 1 character and less than 80 characters.  text must be less than  2048
       characters  when using pngcrush  For  now,  you can only add ten tEXt, iTXt, or zTXt chunks per
       pngcrush run.

SEE ALSO
       png(5), libpng(3), zlib(3).

AUTHOR
       This manual page was written by David Whedon dwhedon@gordian.com for the Debian GNU/Linux  sys‐
       tem  (but may be used by others).  Much of the information was gleaned from "PNG (Portable Net‐
       work Graphics) Specification, Version 1.2"

                                                                                           pngcrush(1)
