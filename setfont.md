SETFONT(8)                  International Support                  SETFONT(8)

NAME
       setfont - load EGA/VGA console screen font

SYNOPSIS
       setfont  [-O  font+umap.orig]  [-o  font.orig]  [-om  cmap.orig]  [-ou
       umap.orig] [-N] [font.new ...]  [-m cmap] [-u umap] [-C console] [-hH]
       [-v] [-V]

DESCRIPTION
       The  setfont  command reads a font from the file font.new and loads it
       into the EGA/VGA character generator, and optionally outputs the  pre‐
       vious  font.   It  can also load various mapping tables and output the
       previous versions.

       If no args are given (or only the option -N for some number N), then a
       default  (8xN) font is loaded (see below).  One may give several small
       fonts, all containing a Unicode table, and setfont will  combine  them
       and load the union.  Typical use:

       setfont
              Load a default font.

       setfont drdos8x16
              Load a given font (here the 448-glyph drdos font).

       setfont cybercafe -u cybercafe
              Load  a given font that does not have a Unicode map and provide
              one explicitly.

       setfont LatArCyrHeb-19 -m 8859-2
              Load a given font (here  a  512-glyph  font  combining  several
              character  sets) and indicate that one's local character set is
              ISO 8859-2.

       Note: if a font has more than 256 glyphs, only 8 out of 16 colors  can
       be  used simultaneously. It can make console perception worse (loss of
       intensity and even some colors).

FONT FORMATS
       The standard Linux font format is the  PSF  font.   It  has  a  header
       describing  font properties like character size, followed by the glyph
       bitmaps, optionally followed by a Unicode  mapping  table  giving  the
       Unicode  value  for each glyph.  Several other (obsolete) font formats
       are recognized.  If the input file has code page format (probably with
       suffix  .cp),  containing  three  fonts  with sizes e.g. 8x8, 8x14 and
       8x16, then one of the options -8 or -14 or -16 must be used to  select
       one.   Raw font files are binary files of size 256*N bytes, containing
       bit images for each of 256 characters, one byte per scan line,  and  N
       bytes per character (0 < N <= 32).  Most fonts have a width of 8 bits,
       but with the framebuffer device (fb) other widths can be used.

FONT HEIGHT
       The program setfont has no built-in knowledge of VGA video modes,  but
       just  asks the kernel to load the character ROM of the video card with
       certain bitmaps. However, since Linux 1.3.1 the  kernel  knows  enough
       about  EGA/VGA  video  modes  to select a different line distance. The
       default character height will be the number N inferred from  the  font
       or  specified  by  option.  However,  the user can specify a different
       character height H using the -h option.

CONSOLE MAPS
       Several mappings are involved in the path from user program output  to
       console display. If the console is in utf8 mode (see unicode_start(1))
       then the kernel expects that user program output  is  coded  as  UTF-8
       (see  utf-8(7)),  and  converts  that to Unicode (ucs2).  Otherwise, a
       translation table is used from the 8-bit program output to 16-bit Uni‐
       code values. Such a translation table is called a Unicode console map.
       There are four of them: three built into the kernel, the  fourth  set‐
       table  using  the  -m  option  of setfont.  An escape sequence chooses
       between these four tables; after loading a cmap, setfont  will  output
       the escape sequence Esc ( K that makes it the active translation.

       Suitable  arguments  for the -m option are for example 8859-1, 8859-2,
       ..., 8859-15, cp437, ..., cp1250.

       Given the Unicode value of the symbol  to  be  displayed,  the  kernel
       finds  the  right  glyph in the font using the Unicode mapping info of
       the font and displays it.

       Old fonts do not have Unicode mapping info, and  in  order  to  handle
       them  there are direct-to-font maps (also loaded using -m) that give a
       correspondence between user bytes and font positions.  The most common
       correspondence  is  the one given in the file trivial (where user byte
       values are used directly as font  positions).   Other  correspondences
       are  sometimes  preferable  since  the  PC video hardware expects line
       drawing characters in certain font positions.

       Giving a -m none argument inhibits the loading  and  activation  of  a
       mapping  table.  The previous console map can be saved to a file using
       the -om file option.  These options of setfont render mapscrn(8) obso‐
       lete. (However, it may be useful to read that man page.)

UNICODE FONT MAPS
       The  correspondence  between the glyphs in the font and Unicode values
       is described by a Unicode mapping table.  Many fonts  have  a  Unicode
       mapping  table included in the font file, and an explicit table can be
       indicated using the -u option. The program setfont will  load  such  a
       Unicode  mapping table, unless a -u none argument is given. The previ‐
       ous Unicode mapping table will be saved as part of the saved font file
       when  the  -O option is used. It can be saved to a separate file using
       the -ou file option.  These options of  setfont  render  loadunimap(8)
       obsolete.

       The  Unicode  mapping  table  should assign some glyph to the `missing
       character' value U+fffd, otherwise missing characters are  not  trans‐
       lated, giving a usually very confusing result.

       Usually  no  mapping  table  is needed, and a Unicode mapping table is
       already contained in the font (sometimes  this  is  indicated  by  the
       .psfu  extension), so that most users need not worry about the precise
       meaning and functioning of these mapping tables.

       One may add a Unicode  mapping  table  to  a  psf  font  using  psfad‐
       dtable(1).

OPTIONS
       -h H   Override font height.

       -m file
              Load console map or Unicode console map from file.

       -o file
              Save previous font in file.

       -O file
              Save previous font and Unicode map in file.

       -om file
              Store console map in file.

       -ou file
              Save previous Unicode map in file.

       -u file
              Load Unicode table describing the font from file.

       -C console
              Set  the font for the indicated console. (May require root per‐
              missions.)

       -v     Be verbose.

       -V     Print version and exit.

NOTE
       PC video hardware allows one to use  the  "intensity"  bit  either  to
       indicate  brightness, or to address 512 (instead of 256) glyphs in the
       font. So, if the font has more than 256 glyphs, the  console  will  be
       reduced to 8 (instead of 16) colors.

FILES
       /usr/share/consolefonts     is    the    default    font    directory.
       /usr/share/unimaps  is  the  default  directory  for   Unicode   maps.
       /usr/share/consoletrans  is the default directory for screen mappings.
       The default font is a file default (or default8xN if the -N option was
       given for some number N) perhaps with suitable extension (like .psf).

SEE ALSO
       psfaddtable(1), unicode_start(1), loadunimap(8), utf-8(7), mapscrn(8)

                                 11 Feb 2001                       SETFONT(8)
