A2PING(1)                                                                              Peter Szabo                                                                              A2PING(1)

NAME
  a2ping.pl  --  convert  between  PS,  EPS  and PDF and other page description
  formats

SYNOPSIS
  Z<> B<a2ping.pl> [B<-->]B<help>
   B<a2ping.pl> [B<-->]B<doc>
   B<a2ping.pl> [I<options>] <I<inputfile>> [[I<outformat>:] I<outputfile>]

DESCRIPTION
  B<a2ping> is a UNIX command line utility written in Perl that  converts  many
  raster  image  and  vector  graphics  formats  to  EPS  or PDF and other page
  description formats. Accepted input file formats are: PS  (PostScript),  EPS,
  PDF,  PNG,  JPEG,  TIFF,  PNM,  BMP, GIF, LBM, XPM, PCX, TGA. Accepted output
  formats are: EPS, PCL5, PDF, PDF1, PBM, PGM, PPM,  PS,  markedEPS,  markedPS,
  PNG,  XWD, BMP, TIFF, JPEG, GIF, XPM.  B<a2ping> delegates the low-level work
  to Ghostscript (GS), B<pdftops> and B<sam2p>. B<a2ping> fixes  many  glitches
  during  the EPS to EPS conversion, so its output is often more compatible and
  better embeddable than its input.   Without  the  C<--below>  option,  it  is
  guarenteed  to  start at the 0,0 coordinate. C<--below>, C<--hires> and C<-v>
  are recommended options.  The page size is set exactly corresponding  to  the
  BoundingBox.   This  means that when Ghostscript renders it, the result needs
  no cropping, and the PDF MediaBox is correct.  If the  bounding  box  is  not
  right,  of  course, you have problems. If you feed crap in, you get crap. But
  you can supply the B<--bboxfrom=compute-gs> option to make GS  recompute  the
  bounding box.  The name of the input file doesn't matter -- B<a2ping> detects
  the file format based on the first few bytes of the file.  The  name  of  the
  output  file  matters  if I<outformat> is missing from the command line: then
  the extension of the output file determines the FileFormat (I<outformat>).

EXTERNAL PROGRAMS
  The internal file format of B<a2ping.pl> is PS/EPS. Everything read is  first
  converted to PS or EPS, then processed by B<a2ping.pl>, then converted to the
  output format.  To analyse the bounding box and other properties  of  non-EPS
  PS  files  (and EPS files with option B<--bboxfrom> other than B<=guess>), GS
  is used. Converting PS to EPS involves this analysis.  To write PDF files, GS
  is  used.   To  read  PDF files, B<pdftops> from the B<xpdf> package is used.
  Sampled input formats are PNG, JPEG, TIFF, PNM, BMP, GIF, LBM, XPM,  PCX  and
  TGA.  To  read  sampled input formats, B<sam2p> is used. B<sam2p> is a raster
  image converter written in C++ by the author of B<a2ping.pl>.   Extra  output
  formats  are  PNG,  XWD,  BMP, TIFF, JPEG, GIF and XPM. To write extra output
  formats, B<sam2p> and GS are used.  PNM output formats are PGM, PGM and  PPM.
  To write PNM output formats, GS is used.

OPTIONS
   General Options
  -h, --help
    Show a summary of the usage
  --doc
    Show the man page
  -v, --(no)verbose
    Show progress and debug messages (default: no)

   Options for the Bounding box
  --(no)hires
      Use HiResBoundingBox in the input file, if present (default: yes)
  --(no)exact
      Use ExactBoundingBox in the input file, if present (default: no)
  --(no)keepoldmediabox
      keep only old, [0 0]-based MediaBox in PDF (default: no)
  --bboxfrom=adsc|compute-gs|guess|pagesize
      Method for determining the BoundingBox  (default: guess)
  --(no)below
      Allow page content below and left of the origin (default: no)

   Options for graphics and fonts
  --(no)compress
      use compression                   (default: best)
  --(no)antialias
      render  shades  at  outlines.   Possible  values:  (=I<scale3yes>  =I<no>
      =I<yes>)  (default: scale3no)
  --(no)lossy
      allow lossy image filters (EPS->PDF) (default: yes)
  --papersize=unchanged|force-unknown|600bpx5cm
      (default: default) (bp)
  --threshold=
      min color for 1 in 8->1 bit conv  (default: 128)

   Options for debugging and changing internals
  --(no)tmpunlink
      Unlink temporary files (default: yes).  Use B<--notmpunklink> if you want
      to inspect intermediate files.
  --gs-cmd=path
      path to Ghostscript program (default: gs or gswin32c)
  --gs-ccmd=path
      path to Ghostscript for BoundingBox calculation (default: gs or gswin32c)
  --gsextra=GS_ARGS
      Pass extra arguments to gs
  --extra=
      Pass extra arguments to external program (i.e pdftops)

TIPS AND TRICKS
  · If  your  EPS  contains  a  wrong  bounding  box, you can fix it by running
    "a2ping.pl -v --bboxfrom=compute-gs thefile.eps --"

  · You can specify - as inputfile to  get  stdin  and  as  outputfile  to  get
    stdout.  This  works  even  for PDF files (which must be seekable), because
    a2ping copies them to a temporary file automatically.

  · If inputfile and outputfile are the same, a2ping copies the inputfile to  a
    temporary  location first. However, this usage is recommended only if there
    is a backup of the file to be restored in case a2ping doesn't  produce  the
    desired result.

  · If you specify -- as outputfile, it will be the same as inputfile.

  · a2ping respects --Duplex for FileFormat PCL5, even though GS doesn't.

  · If  you  have  an  incompatible PS that GS can read but your printer cannot
    print, just run "a2ping.pl foo.ps PDF: - | a2ping.pl - PS: foo.ps"

  · If you have a PS coming from Win32 (often with extension  ".prn"),  run  it
    through a2ping. It will remove the resolution changes and the progress text
    printed to the terminal (which confuses gv(1) and makes some filters in the
    print queue emit incorrect output).

  · a2ping  does  antialiasing (--antialias=scale3no) of glyphs and curves when
    emitting a sampled image (FileFormats such as PGM and PPM).  This  improves
    readability  of  the glyphs. =yes instructs GS to do internal antialiasing,
    but it usually doesn't  improve  much.  =scale3no  turns  off  GS  internal
    antialiasing, but makes it render everything 3x3 as big, and then scales it
    back  down.  =scale3no  turns  on  both  3x3  scaling   and   GS   internal
    antialiasing, which results in thicker lines and worse quality in general.

  · When creating a PBM file, antialiasing usually doesn't improve the quality,
    so it is switched off by default. But if you  set  --antialias=scale3no  or
    --antialias=scale3yes,  GS  will  render  a  PGM  file,  and  the  value of
    --threshold determines the minimum intensity for white in the final PBM.

  · If you need a bigger sampled output file, specify  a  larger  --Resolution.
    The  default is --Resolution=72. If your sampled output file is going to be
    really big, you should  specify  --AntiAlias=yes  instead  of  the  default
    --AntiAlias=scale3no to speed up conversion.

  · To  make  sure  fonts  are  included  in a PDF file generated from eps, use
    --gsextra='-dEmbedAllFonts=true -dPDFSETTINGS=/printer'.

MISC
  · Doesn't depend on the filename or extension of the input file.

  · Conversion from EPS to PDF: fixes glitches etc., calls gs -sDEVICE=pdfwrite

  · Conversion from EPS to EPS: fixes  various  glitches,  moves  (llx,lly)  to
    (0,0), removes binary junk from the beginning of the EPS etc.

  · Conversion from PDF to PDF: keeps the file intact

  · Conversion from PDF to EPS: calls pdftops -eps (of the xpdf package)

  · Conversion from PS to EPS: keeps 1st page only, removes setpagedevice etc.

AUTHORS
  The  author  of B<a2ping> is PÃ©ter SzabÃ³ <F<pts@fazekas.hu>>.  B<a2ping> is
  inspired by and historically based on the B<epstopdf> Perl script modified by
  Thomas  Esser,  Sept.  1998,  but  his  modifications  have been removed from
  B<a2ping>, and also B<a2ping>  and  B<epstopdf>  do  not  share  common  code
  anymore.   B<epstopdf>  is  written by Sebastian Rahtz, for Elsevier Science.
  B<epstopdf> contained extra tricks  from  Hans  Hagen's  texutil.   B<a2ping>
  contains  contributions  from several people, see the file F<HISTORY.txt> for
  details. Thank you all for contributing!

a2ping                                                                                  2018-03-08                                                                              A2PING(1)
