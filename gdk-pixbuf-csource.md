GDK-PIXBUF-CSOURCE(1)                        User Commands                       GDK-PIXBUF-CSOURCE(1)

NAME
       gdk-pixbuf-csource - C code generation utility for GdkPixbuf images

SYNOPSIS
       gdk-pixbuf-csource [OPTION...] [IMAGE]

       gdk-pixbuf-csource [OPTION...] --build-list [[NAME] [IMAGE]...]

DESCRIPTION
       gdk-pixbuf-csource is a small utility that generates C code containing images, useful for
       compiling images directly into programs.

       gdk-pixbuf-csource either takes as input one image file name to generate code for, or, using
       the --build-list option, a list of (name, image) pairs to generate code for a list of images
       into named variables.

OPTIONS
       --stream
           Generate pixbuf data stream (a single string containing a serialized GdkPixdata structure
           in network byte order).

       --struct
           Generate GdkPixdata structure (needs the GdkPixdata structure definition from
           gdk-pixdata.h).

       --macros
           Generate *_ROWSTRIDE, *_WIDTH, *_HEIGHT, *_BYTES_PER_PIXEL and *_RLE_PIXEL_DATA or
           *_PIXEL_DATA macro definitions for the image.

       --rle
           Enables run-length encoding for the generated pixel data (default).

       --raw
           Disables run-length encoding for the generated pixel data.

       --extern
           Generate extern symbols.

       --static
           Generate static symbols (default).

       --decoder
           Provide a *_RUN_LENGTH_DECODE(image_buf, rle_data, size, bpp) macro definition to decode
           run-length encoded image data.

       --name=identifier
           Specifies the identifier name (prefix) for the generated variables or macros (useful only
           if --build-list was not specified).

       --build-list
           Enables (name, image) pair parsing mode.

       -h, --help
           Print brief help and exit.

       -v, --version
           Print version and exit.

       --g-fatal-warnings
           Make warnings fatal (causes the program to abort).

SEE ALSO
       The GdkPixbuf documentation, shipped with the Gtk+ distribution, available from www.gtk.org[1].

BUGS
       The runlength encoder gets out of sync with the pixel boundaries, since it includes the
       rowstride padding in the encoded stream. Furthermore, it generates pixbufs with suboptimal
       rowstride in some cases.

NOTES
        1. www.gtk.org
           http://www.gtk.org

gdk-pixbuf                                                                       GDK-PIXBUF-CSOURCE(1)
