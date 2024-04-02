INKSCAPE(1)                                                                                Inkscape Commands Manual                                                                               INKSCAPE(1)



NAME
       Inkscape - an SVG (Scalable Vector Graphics) editing program.

SYNOPSIS
       "inkscape [options] [filename ...]"

       options:

           -?, --help
               --usage
           -V, --version

           -f, --file=FILENAME

           -e, --export-png=FILENAME
           -a, --export-area=x0:y0:x1:y1
           -C, --export-area-page
           -D, --export-area-drawing
               --export-area-snap
           -i, --export-id=ID
           -j, --export-id-only
           -t, --export-use-hints
           -b, --export-background=COLOR
           -y, --export-background-opacity=VALUE
           -d, --export-dpi=DPI
           -w, --export-width=WIDTH
           -h, --export-height=HEIGHT

           -P, --export-ps=FILENAME
           -E, --export-eps=FILENAME
           -A, --export-pdf=FILENAME
               --export-pdf-version=VERSION-STRING
               --export-latex

           --export-ps-level {2,3}

           -T, --export-text-to-path
               --export-ignore-filters

           -l, --export-plain-svg=FILENAME

           -p, --print=PRINTER

           -I, --query-id=ID
           -X, --query-x
           -Y, --query-y
           -W, --query-width
           -H, --query-height
           -S, --query-all

           -x, --extension-directory

               --verb-list
               --verb=VERB-ID
               --select=OBJECT-ID

               --shell

           -g, --with-gui
           -z, --without-gui

               --vacuum-defs

               --g-fatal-warnings

DESCRIPTION
       Inkscape is a GUI editor for Scalable Vector Graphics (SVG) format drawing files, with capabilities similar to Adobe Illustrator, CorelDraw, Xara Xtreme, etc. Inkscape features include versatile
       shapes, bezier paths, freehand drawing, multi-line text, text on path, alpha blending, arbitrary affine transforms, gradient and pattern fills, node editing, many export and import formats including
       PNG and PDF, grouping, layers, live clones, and a lot more.  The interface is designed to be comfortable and efficient for skilled users, while remaining conformant to GNOME standards so that users
       familiar with other GNOME applications can learn its interface rapidly.

       SVG is a W3C standard XML format for 2D vector drawing. It allows defining objects in the drawing using points, paths, and primitive shapes.  Colors, fonts, stroke width, and so forth are specified
       as `style' attributes to these objects.  The intent is that since SVG is a standard, and since its files are text/xml, it will be possible to use SVG files in a sizeable number of programs and for a
       wide range of uses.

       Inkscape uses SVG as its native document format, and has the goal of becoming the most fully compliant drawing program for SVG files available in the Open Source community.

OPTIONS
       -?, --help
               Show help message

       -V, --version
               Show Inkscape version and build date.

       -a x0:y0:x1:y1, --export-area=x0:y0:x1:y1
               In PNG export, set the exported area in SVG user units (anonymous length units normally used in Inkscape SVG).  The default is to export the entire document page.  The point (0,0) is the
               lower-left corner.

       -C, --export-area-page
               In PNG, PDF, PS, and EPS export, exported area is the page. This is the default for PNG, PDF, and PS, so you don't need to specify this unless you are using --export-id to export a specific
               object. In EPS, however, this is not the default; moreover, for EPS, the specification of the format does not allow its bounding box to extend beyond its content.  This means that when
               --export-area-page is used with EPS export, the page bounding box will be trimmed inwards to the bounding box of the content if it is smaller.

       -D, --export-area-drawing
               In PNG, PDF, PS, and EPS export, exported area is the drawing (not page), i.e. the bounding box of all objects of the document (or of the exported object if --export-id is used).  With this
               option, the exported image will display all the visible objects of the document without margins or cropping. This is the default export area for EPS. For PNG, it can be used in combination
               with --export-use-hints.

       --export-area-snap
               For PNG export, snap the export area outwards to the nearest integer SVG user unit (px) values. If you are using the default export resolution of 96 dpi and your graphics are pixel-snapped
               to minimize antialiasing, this switch allows you to preserve this alignment even if you are exporting some object's bounding box (with --export-id or --export-area-drawing) which is itself
               not pixel-aligned.

       -b COLOR, --export-background=COLOR
               Background color of exported PNG.  This may be any SVG supported color string, for example "#ff007f" or "rgb(255, 0, 128)".  If not set, then the page color set in Inkscape in the Document
               Options dialog will be used (stored in the pagecolor= attribute of sodipodi:namedview).

       -d DPI, --export-dpi=DPI
               The resolution used for PNG export.  It is also used for fallback rasterization of filtered objects when exporting to PS, EPS, or PDF (unless you specify --export-ignore-filters to suppress
               rasterization). The default is 96 dpi, which corresponds to 1 SVG user unit (px, also called "user unit") exporting to 1 bitmap pixel.  This value overrides the DPI hint if used with
               --export-use-hints.

       -e FILENAME, --export-png=FILENAME
               Specify the filename for PNG export.  If it already exists, the file will be overwritten without asking.

       -f FILENAME, --file=FILENAME
               Open specified document(s).  Option string may be omitted, i.e. you can list the filenames without -f.

       -g, --with-gui
               Try to use the GUI (on Unix, use the X server even if $DISPLAY is not set).

       -h HEIGHT, --export-height=HEIGHT
               The height of generated bitmap in pixels.  This value overrides the --export-dpi setting (or the DPI hint if used with --export-use-hints).

       -i ID, --export-id=ID
               For PNG, PS, EPS, PDF and plain SVG export, the id attribute value of the object that you want to export from the document; all other objects are not exported.  By default the exported area
               is the bounding box of the object; you can override this using --export-area (PNG only) or --export-area-page.

       -j, --export-id-only
               For PNG and plain SVG, only export the object whose id is given in --export-id. All other objects are hidden and won't show in export even if they overlay the exported object.  Without
               --export-id, this option is ignored. For PDF export, this is the default, so this option has no effect.

       -l, --export-plain-svg=FILENAME
               Export document(s) to plain SVG format, without sodipodi: or inkscape: namespaces and without RDF metadata.

       -x, --extension-directory
               Lists the current extension directory that Inkscape is configured to use and then exits.  This is used for external extension to use the same configuration as the original Inkscape
               installation.

       --verb-list
               Lists all the verbs that are available in Inkscape by ID.  This ID can be used in defining keymaps or menus.  It can also be used with the --verb command line option.

       --verb=VERB-ID, --select=OBJECT-ID
               These two options work together to provide some basic scripting for Inkscape from the command line.  They both can occur as many times as needed on the command line and are executed in order
               on every document that is specified.

               The --verb command will execute a specific verb as if it was called from a menu or button.  Dialogs will appear if that is part of the verb.  To get a list of the verb IDs available, use the
               --verb-list command line option.

               The --select command will cause objects that have the ID specified to be selected.  This allows various verbs to act upon them.  To remove all the selections use "--verb=EditDeselect".  The
               object IDs available are dependent on the document specified to load.

       -p PRINTER, --print=PRINTER
               Print document(s) to the specified printer using `lpr -P PRINTER'.  Alternatively, use `| COMMAND' to specify a different command to pipe to, or use `> FILENAME' to write the PostScript
               output to a file instead of printing.  Remember to do appropriate quoting for your shell, e.g.

                   inkscape --print='| ps2pdf - mydoc.pdf' mydoc.svg

       -t, --export-use-hints
               Use export filename and DPI hints stored in the exported object (only with --export-id).  These hints are set automatically when you export selection from within Inkscape.  So, for example,
               if you export a shape with id="path231" as /home/me/shape.png at 300 dpi from document.svg using Inkscape GUI, and save the document, then later you will be able to reexport that shape to
               the same file with the same resolution simply with

                   inkscape -i path231 -t document.svg

               If you use --export-dpi, --export-width, or --export-height with this option, then the DPI hint will be ignored and the value from the command line will be used.  If you use --export-png
               with this option, then the filename hint will be ignored and the filename from the command line will be used.

       -w WIDTH, --export-width=WIDTH
               The width of generated bitmap in pixels.  This value overrides the --export-dpi setting (or the DPI hint if used with --export-use-hints).

       -y VALUE, --export-background-opacity=VALUE
               Opacity of the background of exported PNG.  This may be a value either between 0.0 and 1.0 (0.0 meaning full transparency, 1.0 full opacity) or greater than 1 up to 255 (255 meaning full
               opacity).  If not set and the -b option is not used, then the page opacity set in Inkscape in the Document Options dialog will be used (stored in the inkscape:pageopacity= attribute of
               sodipodi:namedview).  If not set but the -b option is used, then the value of 255 (full opacity) will be used.

       -P FILENAME, --export-ps=FILENAME
               Export document(s) to PostScript format. Note that PostScript does not support transparency, so any transparent objects in the original SVG will be automatically rasterized. Used fonts are
               subset and embedded. The default export area is page; you can set it to drawing by --export-area-drawing. You can specify --export-id to export a single object (all other are hidden); in
               that case export area is that object's bounding box, but can be set to page by --export-area-page.

       -E FILENAME, --export-eps=FILENAME
               Export document(s) to Encapsulated PostScript format. Note that PostScript does not support transparency, so any transparent objects in the original SVG will be automatically rasterized.
               Used fonts are subset and embedded. The default export area is drawing; you can set it to page, however see --export-area-page for applicable limitation. You can specify --export-id to
               export a single object (all other are hidden).

       -A FILENAME, --export-pdf=FILENAME
               Export document(s) to PDF format. This format preserves the transparency in the original SVG. Used fonts are subset and embedded.  The default export area is page; you can set it to drawing
               by --export-area-drawing. You can specify --export-id to export a single object (all other are hidden); in that case export area is that object's bounding box, but can be set to page by
               --export-area-page.

       --export-pdf-version=PDF-VERSION
               Select the PDF version of the exported PDF file. This option basically exposes the PDF version selector found in the PDF-export dialog of the GUI. You must provide one of the versions from
               that combo-box, e.g. "1.4". The default pdf export version is "1.4".

       --export-latex
               (for PS, EPS, and PDF export) Used for creating images for LaTeX documents, where the image's text is typeset by LaTeX.  When exporting to PDF/PS/EPS format, this option splits the output
               into a PDF/PS/EPS file (e.g. as specified by --export-pdf) and a LaTeX file. Text will not be output in the PDF/PS/EPS file, but instead will appear in the LaTeX file. This LaTeX file
               includes the PDF/PS/EPS. Inputting (\input{image.tex}) the LaTeX file in your LaTeX document will show the image and all text will be typeset by LaTeX. See the resulting LaTeX file for more
               information.  Also see GNUPlot's `epslatex' output terminal.

       -T, --export-text-to-path
               Convert text objects to paths on export, where applicable (for PS, EPS, PDF and SVG export).

       --export-ignore-filters
               Export filtered objects (e.g. those with blur) as vectors, ignoring the filters (for PS, EPS, and PDF export).  By default, all filtered objects are rasterized at --export-dpi (default 96
               dpi), preserving the appearance.

       -I, --query-id
               Set the ID of the object whose dimensions are queried. If not set, query options will return the dimensions of the drawing (i.e. all document objects), not the page or viewbox

       -X, --query-x
               Query the X coordinate of the drawing or, if specified, of the object with --query-id. The returned value is in px (SVG user units).

       -Y, --query-y
               Query the Y coordinate of the drawing or, if specified, of the object with --query-id. The returned value is in px (SVG user units).

       -W, --query-width
               Query the width of the drawing or, if specified, of the object with --query-id. The returned value is in px (SVG user units).

       -H, --query-height
               Query the height of the drawing or, if specified, of the object with --query-id. The returned value is in px (SVG user units).

       -S, --query-all
               Prints a comma delimited listing of all objects in the SVG document with IDs defined, along with their x, y, width, and height values.

       --shell With this parameter, Inkscape will enter an interactive command line shell mode. In this mode, you type in commands at the prompt and Inkscape executes them, without you having to run a new
               copy of Inkscape for each command. This feature is mostly useful for scripting and server uses: it adds no new capabilities but allows you to improve the speed and memory requirements of any
               script that repeatedly calls Inkscape to perform command line tasks (such as export or conversions). Each command in shell mode must be a complete valid Inkscape command line but without the
               Inkscape program name, for example:

                   file.svg --export-pdf=file.pdf

       --vacuum-defs
               Remove all unused items from the <lt>defs<gt> section of the SVG file.  If this option is invoked in conjunction with --export-plain-svg, only the exported file will be affected.  If it is
               used alone, the specified file will be modified in place.

       -z, --without-gui
               Do not open the GUI (on Unix, do not use X server); only process the files from console.  This is assumed for -p, -e, -l, and --vacuum-defs options.

       --g-fatal-warnings
               This standard GTK option forces any warnings, usually harmless, to cause Inkscape to abort (useful for debugging).

       --usage Display a brief usage message.

CONFIGURATION
       The main configuration file is located in ~/.config/inkscape/preferences.xml; it stores a variety of customization settings that you can change in Inkscape (mostly in the Inkscape Preferences
       dialog).  Also in the subdirectories there, you can place your own:

       $HOME/.config/inkscape/extensions/ - extension effects.

       $HOME/.config/inkscape/icons/ - icons.

       $HOME/.config/inkscape/keys/ - keyboard maps.

       $HOME/.config/inkscape/templates/ - new file templates.

DIAGNOSTICS
       The program returns zero on success or non-zero on failure.

       A variety of error messages and warnings may be printed to STDERR or STDOUT.  If the program behaves erratically with a particular SVG file or crashes, it is useful to look at this output for clues.

EXAMPLES
       While obviously Inkscape is primarily intended as a GUI application, it can be used for doing SVG processing on the command line as well.

       Open an SVG file in the GUI:

           inkscape filename.svg

       Print an SVG file from the command line:

           inkscape filename.svg -p '| lpr'

       Export an SVG file into PNG with the default resolution of 96 dpi (one SVG user unit translates to one bitmap pixel):

           inkscape filename.svg --export-png=filename.png

       Same, but force the PNG file to be 600x400 pixels:

           inkscape filename.svg --export-png=filename.png -w600 -h400

       Same, but export the drawing (bounding box of all objects), not the page:

           inkscape filename.svg --export-png=filename.png --export-area-drawing

       Export to PNG the object with id="text1555", using the output filename and the resolution that were used for that object last time when it was exported from the GUI:

           inkscape filename.svg --export-id=text1555 --export-use-hints

       Same, but use the default 96 dpi resolution, specify the filename, and snap the exported area outwards to the nearest whole SVG user unit values (to preserve pixel-alignment of objects and thus
       minimize aliasing):

           inkscape filename.svg --export-id=text1555 --export-png=text.png --export-area-snap

       Convert an Inkscape SVG document to plain SVG:

           inkscape filename1.svg --export-plain-svg=filename2.svg

       Convert an SVG document to EPS, converting all texts to paths:

           inkscape filename.svg --export-eps=filename.eps --export-text-to-path

       Query the width of the object with id="text1555":

           inkscape filename.svg --query-width --query-id text1555

       Duplicate the object with id="path1555", rotate the duplicate 90 degrees, save SVG, and quit:

           inkscape filename.svg --select=path1555 --verb=EditDuplicate --verb=ObjectRotate90 --verb=FileSave --verb=FileClose

ENVIRONMENT
       DISPLAY to get the default host and display number.

       TMPDIR to set the default path of the directory to use for temporary files.  The directory must exist.

       INKSCAPE_PROFILE_DIR to set the path of the directory to use for the user profile.

THEMES
       To load different icons sets instead of the default /usr/share/inkscape/icons/icons.svg file, the directory $HOME/.config/inkscape/icons/ is used.  Icons are loaded by name (e.g. fill_none.svg), or
       if not found, then from icons.svg.  If the icon is not loaded from either of those locations, it falls back to the default system location.

       The needed icons are loaded from SVG files by searching for the SVG id with the matching icon name.  (For example, to load the "fill_none" icon from a file, the bounding box seen for SVG id
       "fill_none" is rendered as the icon, whether it comes from fill_none.svg or icons.svg.)

OTHER INFO
       The canonical place to find Inkscape info is at <http://www.inkscape.org/>.  The website has news, documentation, tutorials, examples, mailing list archives, the latest released version of the
       program, bugs and feature requests databases, forums, and more.

SEE ALSO
       potrace, cairo, rsvg, batik, ghostscript, pstoedit.

       SVG compliance test suite: <http://www.w3.org/Graphics/SVG/Test/>

       SVG validator: <http://jiggles.w3.org/svgvalidator/>

       Scalable Vector Graphics (SVG) 1.1 Specification W3C Recommendation 14 January 2003 <http://www.w3.org/TR/SVG11/>

       Scalable Vector Graphics (SVG) 1.2 Specification W3C Working Draft 13 November 2003 <http://www.w3.org/TR/SVG12/>

       SVG 1.1/1.2/2.0 Requirements W3C Working Draft 22 April 2002 <http://www.w3.org/TR/SVG2Reqs/>

       Document Object Model (DOM): Level 2 Core Arnaud Le Hors et al editors, W3C <http://www.w3.org/TR/DOM-Level-2-Core/>

GUI NOTES
       To learn Inkscape's GUI operation, read the tutorials in Help > Tutorials.

       Apart from SVG, Inkscape can import (File > Import) most bitmap formats (PNG, BMP, JPG, XPM, GIF, etc.), plain text (requires Perl), PS and EPS (requires Ghostscript), PDF and AI format (AI version
       9.0 or newer).

       Inkscape exports 32-bit PNG images (File > Export PNG Image) as well as AI, PS, EPS, PDF, DXF, and several other formats via File > Save as.

       Inkscape can use the pressure and tilt of a graphic tablet pen for width, angle, and force of action of several tools, including the Calligraphic pen.

       Inkscape includes a GUI front-end to the Potrace bitmap tracing engine (<http://potrace.sf.net>) which is embedded into Inkscape.

       Inkscape can use external scripts (stdin-to-stdout filters) that are represented by commands in the Extensions menu. A script can have a GUI dialog for setting various parameters and can get the IDs
       of the selected objects on which to act via the command line. Inkscape comes with an assortment of effects written in Python.

KEYBINDINGS
       To get a complete list of keyboard and mouse shortcuts, view doc/keys.html, or use the Keys and Mouse command in Help menu.

BUGS
       Many bugs are known; please refer to the website (<http://www.inkscape.org>) for reviewing the reported ones and to report newly found issues.  See also the Known Issues section in the Release Notes
       for your version (file `NEWS').

AUTHORS
       This codebase owes its existence to a large number of contributors throughout its various incarnations.  The following list is certainly incomplete, but serves to recognize the many shoulders on
       which this application sits:

       Maximilian Albert, Joshua A. Andler, Tavmjong Bah, Pierre Barbry-Blot, Jean-François Barraud, Campbell Barton, Bill Baxter, John Beard, John Bintz, Arpad Biro, Nicholas Bishop, Joshua L. Blocher,
       Hanno Böck, Tomasz Boczkowski, Henrik Bohre, Boldewyn, Daniel Borgmann, Bastien Bouclet, Hans Breuer, Gustav Broberg, Christopher Brown, Marcus Brubaker, Luca Bruno, Brynn
       (brynn@inkscapecommunity.com), Nicu Buculei, Bulia Byak, Pierre Caclin, Ian Caldwell, Gail Carmichael, Ed Catmur, Chema Celorio, Jabiertxo Arraiza Cenoz, Johan Ceuppens, Zbigniew Chyla, Alexander
       Clausen, John Cliff, Kees Cook, Ben Cromwell, Robert Crosbie, Jon Cruz, Aurélie De-Cooman, Kris De Gussem, Milosz Derezynski, Daniel Díaz, Bruno Dilly, Larry Doolittle, Nicolas Dufour, Tim Dwyer,
       Maxim V. Dziumanenko, Johan Engelen, Miklos Erdelyi, Ulf Erikson, Noé Falzon, Frank Felfe, Andrew Fitzsimon, Edward Flick, Marcin Floryan, Fred, Ben Fowler, Cedric Gemy, Steren Giannini, Olivier
       Gondouin, Ted Gould, Toine de Greef, Michael Grosberg, Bryce Harrington, Dale Harvey, Aurélio Adnauer Heckert, Carl Hetherington, Jos Hirth, Hannes Hochreiner, Thomas Holder, Joel Holdsworth,
       Christoffer Holmstedt, Alan Horkan, Karl Ove Hufthammer, Richard Hughes, Nathan Hurst, inductiveload, Thomas Ingham, Jean-Olivier Irisson, Bob Jamison, Ted Janeczko, Marc Jeanmougin, jEsuSdA, Lauris
       Kaplinski, Lynn Kerby, Niko Kiirala, James Kilfiger, Nikita Kitaev, Jason Kivlighn, Adrian Knoth, Krzysztof Kosiński, Petr Kovar, Benoît Lavorata, Alex Leone, Julien Leray, Raph Levien, Diederik van
       Lierop, Nicklas Lindgren, Vitaly Lipatov, Ivan Louette, Fernando Lucchesi Bastos Jurema, Pierre-Antoine Marc, Aurel-Aimé Marmion, Colin Marquardt, Craig Marshall, Ivan Masár, Dmitry G. Mastrukov,
       David Mathog, Matiphas, Michael Meeks, Federico Mena, MenTaLguY, Aubanel Monnier, Vincent Montagne, Tim Mooney, Derek P. Moore, Chris Morgan, Peter Moulder, Jörg Müller, Yukihiro Nakai, Victor
       Navez, Christian Neumair, Nick, Andreas Nilsson, Mitsuru Oka, Vinícius dos Santos Oliveira, Martin Owens, Alvin Penner, Matthew Petroff, Jon Phillips, Zdenko Podobny, Alexandre Prokoudine, Jean-René
       Reinhard, Alexey Remizov, Frederic Rodrigo, Hugo Rodrigues, Juarez Rudsatz, Xavier Conde Rueda, Felipe Corrêa da Silva Sanches, Christian Schaller, Marco Scholten, Tom von Schwerdtner, Danilo Šegan,
       Abhishek Sharma, Shivaken, Michael Sloan, John Smith, Boštjan Špetič, Aaron Spike, Kaushik Sridharan, Ralf Stephan, Dariusz Stojek, Martin Sucha, ~suv, Pat Suwalski, Adib Taraben, Hugh Tebby, Jonas
       Termeau, David Turner, Andre Twupack, Aleksandar Urošević, Alex Valavanis, Joakim Verona, Lucas Vieites, Daniel Wagenaar, Liam P. White, Sebastian Wüst, Michael Wybrow, Gellule Xg, Daniel Yacob,
       David Yip, Masatake Yamato, Moritz Eberl, Sebastian Faubel

       This man page was put together by Bryce Harrington <bryce@bryceharrington.org>.

HISTORY
       The codebase that would become Inkscape began life in 1999 as the program Gill, the GNOME Illustrator application, created by Raph Levien.  The stated objective for Gill was to eventually support
       all of SVG.  Raph implemented the PostScript bezier imaging model, including stroking and filling, line cap style, line join style, text, etc.  Raph's Gill page is at <http://www.levien.com/svg/>.
       Work on Gill appears to have slowed or ceased in 2000.

       The next incarnation of the codebase was to become the highly popular program Sodipodi, led by Lauris Kaplinski.  The codebase was turned into a powerful illustration program over the course of
       several year's work, adding several new features, multi-lingual support, porting to Windows and other operating systems, and eliminating dependencies.

       Inkscape was formed in 2003 by four active Sodipodi developers, Bryce Harrington, MenTaLguY, Nathan Hurst, and Ted Gould, wanting to take a different direction with the codebase in terms of focus on
       SVG compliance, interface look-and-feel, and a desire to open development opportunities to more participants.  The project progressed rapidly, gaining a number of very active contributors and
       features.

       Much work in the early days of the project focused on code stabilization and internationalization.  The original renderer inherited from Sodipodi was laced with a number of mathematical corner cases
       which led to unexpected crashes when the program was pushed beyond routine uses; this renderer was replaced with Livarot which, while not perfect either, was significantly less error prone.  The
       project also adopted a practice of committing code frequently, and encouraging users to run developmental snapshots of the program; this helped identify new bugs swiftly, and ensure it was easy for
       users to verify the fixes.  As a result, Inkscape releases have generally earned a reputation for being robust and reliable.

       Similarly, efforts were taken to internationalize and localize the interface, which has helped the program gain contributors worldwide.

       Inkscape has had a beneficial impact on the visual attractiveness of Open Source in general, by providing a tool for creating and sharing icons, splash screens, website art, and so on.  In a way,
       despite being "just an drawing program", Inkscape has played an important role in making Open Source more visually stimulating to larger audiences.

COPYRIGHT AND LICENSE
       Copyright (C) 1999–2016 by Authors.

       Inkscape is free software; you can redistribute it and/or modify it under the terms of the GPL version 2 or later.



0.92.2                                                                                            2018-04-11                                                                                      INKSCAPE(1)
