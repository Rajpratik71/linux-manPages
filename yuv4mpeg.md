yuv4mpeg(5)                                                     MJPEG Tools Manual                                                     yuv4mpeg(5)

NAME
       YUV4MPEG2 - video stream format used by pipe-based MJPEGtools

DESCRIPTION
       Many  of  the  MJPEGtools  communicate  via  pipes and act as filters (or sources or sinks).  The format of video data used in the pipes is
       referred to as "YUV4MPEG", or, more precisely, "YUV4MPEG2".  (The format was extended and codified during v1.5.x of the tools.)

       The basic structure is a stream header followed by an unlimited number of frames.  Each frame itself consists of a header followed by video
       data.  The headers are vaguely human-readable ASCII, but the video data is simple byte-size binary.

       The MJPEGtools distribution has a C library (libmjpegutils) which contains functions for manipulating YUV4MPEG2 streams.  We recommend that
       you use this library rather than writing your own code if possible.  See the header file "yuv4mpeg.h" for a description of these functions.

       Design Goals:

       o      Easy to parse both via C or sh.

       o      Extensible; easy to add new parameters while maintaining backwards compatibility.

       o      Simple upgrade from original "YUV4MPEG" format.

       Drawbacks:

       o      Frame headers do not have constant size, so streams are not seekable.

GRAMMAR
       The precise description of the the YUV4MPEG2 stream format is as follows:

       STREAM consists of

       -  one STREAM-HEADER

       -  unlimited number of FRAMEs

       STREAM-HEADER consists of

       -  magic string "YUV4MPEG2"

       -  unlimited number of TAGGED-FIELDs, each preceeded by a ' ' (single space) separator

       -  single '\n' line terminator

       FRAME consists of

       -  one FRAME-HEADER

       -  "length" octets of planar YCbCr 4:2:0 image data (If the stream is interlaced, then the two  fields  per  frame  are  interleaved,  with
          proper spatial ordering.)

       FRAME-HEADER consists of

       -  magic string "FRAME"

       -  unlimited number of TAGGED-FIELDs, each preceeded by a ' ' (single space) separator

       -  single '\n' line terminator

       TAGGED-FIELD consists of

       -  single ASCII character tag

       -  VALUE (which does not contain whitespace)

       VALUE consists of

       -  RATIO, or

       -  integer (base 10 ASCII representation), or

       -  single ascii character, or

       -  string (multiple ASCII characters)

       RATIO consists of

       -  numerator (base 10 ASCII integer)

       -  ':' (a colon)

       -  denominator (base 10 ASCII integer)

       Header tags fall into three categories:  optional, required and has-default.  Optional tags are completely optional and may be omitted from
       a header.  Required tags must be present in a header.  Has-Default tags have a default value which is implied if the tag  is  not  present.
       Independent of these categories, some tags allow an "unknown" value and some do not.

       The supported tags for the STREAM-HEADER:

              W[integer] - frame width in pixels, must be > 0 (required)

              H[integer] - frame height in pixels, must be > 0 (required)

              C[string] - chroma subsampling, image data format (has default)
                      420jpeg  - 4:2:0 with JPEG/MPEG-1 siting (default)
                      420mpeg2 - 4:2:0 with MPEG-2 siting
                      420paldv - 4:2:0 with PAL-DV siting
                      411      - 4:1:1, cosited
                      422      - 4:2:2, cosited
                      444      - 4:4:4 (no subsampling)
                      444alpha - 4:4:4 with an alpha channel
                      mono     - luma (Y') plane only

              I[char] - interlacing specification:  (has default)
                      ? - unknown (default)
                      p - progressive/none
                      t - top-field-first
                      b - bottom-field-first
                      m - mixed-mode: refer to 'I' tag in frame header

              F[ratio] - frame-rate (has default of 0:0 == unknown)

              A[ratio] - sample aspect ratio (has default of 0:0 == unknown)

              X[string] - 'metadata' (optional; unparsed, but passed around)

       The currently supported tags for the FRAME-HEADER:

              I[string] - framing  and  sampling  (required if-and-only-if Im is present in stream header).  Value is a string of three characters
                     "xyz" which have the following meanings:
                      x: frame presentation
                         t - top-field-first
                         T - top-field-first and repeat
                         b - bottom-field-first
                         B - bottom-field-first and repeat
                         1 - single progressive frame
                         2 - double progressive frame (repeat)
                         3 - triple progressive frame (repeat)
                      y: frame temporal sampling
                         p - progressive (fields sampled at same time)
                         i - interlaced (fields sampled at different times)
                      z: frame chroma-subsampling
                         p - progressive (subsampling over whole frame)
                         i - interlaced (each field subsampled independently)
                         ? - unknown (allowed only for non-4:2:0 subsampling)

              X[string] - 'metadata' (optional; unparsed, but passed around)

       Note that a filter application must faithfully forward all "X" tags from input pipe to output pipe (unless it uses one of  those  tags,  of
       course).  The supplied library will do this automatically if the functions y4m_copy_stream_info() and y4m_copy_frame_info() are used appro‐
       priately.

NOTES ON IMAGE DATA
       All image data is in the CCIR-601 Y'CbCr colorspace, presented plane-by-plane in row-major order.  Each sample within  each  plane  is  one
       octet (8-bits) in size.  When all planes are present, they are transmitted in the order Y', Cb, Cr, potentially followed by an alpha/trans‐
       parency mask plane (for the 444alpha chroma format).  The alpha channel data is follows the same range as the Y' luma channel:  full trans‐
       parency is at 16 and full opacity is at 235.

       All Y' and alpha planes consist of (height X width) octets.  The size of the chroma planes depends on the subsampling mode:

       -  4:4:4 - (height X width) octets

       -  4:2:2 - (height X width) / 2 octets

       -  4:1:1 - (height X width) / 4 octets

       -  4:2:0 - (height X width) / 4 octets

NOTES ON FRAMING
       (More to come here.)

SEE ALSO
       mjpegtools(1), yuv4mpeg.h

AUTHOR
       This manual page Copyright 2004 Matthew J. Marjanovic.

MJPEG Tools Team                                                 25 November 2002                                                      yuv4mpeg(5)
