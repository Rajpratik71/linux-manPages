MIN12XXW(1)                             General Commands Manual                            MIN12XXW(1)

NAME
       min12xxw - Convert pbmraw streams to Minolta PagePro 12xxW languages

SYNOPSIS
       min12xxw [options]

DESCRIPTION
       Min12xxw  is  a  filter which converts pbmraw streams (produced by ghostscript, for example) to
       the printer language of Minolta PagePro 1[234]xxW printers.

COMMAND-LINE OPTIONS
       -h, --help
            Gives usage information (help)

       -v, --version
            Displays the version number and exit

       -e, --ecomode
            Enables economic mode which saves toner by leaving every other scanline  blank.  This  de‐
            grades  the printout's resolution a little, the effect is most easily seen (and looks par‐
            ticularly bad) when printing in 300 dpi mode.

       -s, --status
            Query the printer status, page counter and whatever  information  can  be  retrieved.  The
            printer  status  is basically an unprocessed dump of what the printer sends, so unexpected
            things may happen if the printer sends funny data because it got confused somehow...  This
            might however still be useful. The page counter and other information is heavily processed
            and should be more reliable. Note that for queries  to  be  made,  the  printer  must  (of
            course) be switched on, with all cables connected, and not be busy printing (or your print
            job may be truncated). See the -d option below which sets the device file to use. This has
            so far only been tested on 1200W, 1350W and 1400W printers. Send mail if it works for oth‐
            ers as well.

       -d dev, --device dev
            Sets the device file to use for queries. The default is /dev/lp0.

            Please note that this option is only meaningful with the "-s" or "--status" option. If you
            intend  to send a document to the printer, you have to redirect min12xxw's standard output
            to the device file in question. See the documentation that came with your shell on how  to
            do that.

       -n, --nomargins
            Disables the enforcement of the 0.17 inch margins on all sides of the paper. The converter
            discards the equivalent of this length of its input because  ghostscript  outputs  a  full
            page  with  margins.  If  you arranged in some way for the input to be marginless, or have
            slightly larger paper, you can give this option to include the full  input  with  margins.
            Please  note that for very small page dimensions, min12xxw might need to disable enforcing
            the page margins for all pages following the offending page to make the job printable.  In
            that  case,  a  warning message will be printed on the standard error stream to inform the
            user.

       -m model, --model model
            Sets which printer model to produce output for. Currently, no  checks  for  features  only
            available  to  specific models are made (available paper trays differ from model to model,
            for example). Let me know if this causes problems. Available  models  are:  1200W,  1250W,
            1300W,  1350W,  1400W. 1200W is the default. As an alternative, you can also symlink, link
            or rename your executable to min1200w, min1250w, min1300w, min1350w or min1400w, thus mak‐
            ing  the model specified in the filename the default model. This saves you from typing the
            model selection option again and again and again...  Please note that you must supply  the
            model  option correctly if you drive any other model than what is the default. If you fail
            to do so, your printer will not produce any output or react to  status  queries  from  the
            host.

       -r resolution, --res resolution
            Sets  the resolution to either 300, 600 or 1200 dpi (600 dpi is the default). Keep in mind
            that you need to produce your output accordingly. It is also possible to specify the reso‐
            lution  as  (horizontal)x(vertical) resolution (e.g. -r 1200x600) where horizontal resolu‐
            tion may be once or twice the vertical resolution. The maximum resolution is 1200  dpi  in
            both  vertical and horizontal direction. The minimum vertical resolution for mixed resolu‐
            tion printing seems to be 600 dpi. 300 dpi printing has only been tested on  1200W,  1350W
            and  1400W models. Mixed resolution printing was seen for 13xxW and 1400W models only, but
            tests show that the 1200W is capable of handling it as well, so  chances  are  that  1250W
            printers won't have trouble, either.

       -t tray, --tray tray
            Sets  the  paper  tray  to be used. Valid values for tray are "auto", "tray1", "tray2" and
            "manual", with "auto" being the default. Not all printer models have all  sorts  of  paper
            trays.  "auto" should be safe on all of them, I think. In fact, the PagePro 1400W seems to
            have only this kind of paper tray.

       -p type, --papertype type
            Sets the type of paper used. Type can be one of "normal", "thick", "transparency",  "enve‐
            lope" or "postcard". "normal" is the default.

       -f fmt, --paperformat fmt
            This  sets  the  paper  format  to be used for the print job. The default value for fmt is
            "a4". Valid values are given below.

       a4
         A4 paper (210 mm x 297 mm)

       b5
         B5 envelope (176 mm x 250 mm)

       a5
         A5 paper (148 mm x 210 mm)

       jpost
         Post card (100 mm x 148 mm)

       corpost
         Correspondence Postcard (148 mm x 200 mm)

       jisy6
         JIS Yokei 6-gou paper (98 mm x 190 mm)

       jisy0
         JIS Yokei 0-gou paper (120 mm x 235 mm)

       chinese16k
         Chinese 16K paper (185 mm x 260 mm)

       chinese32k
         Chinese 32K paper (130 mm x 185 mm)

       legal
         Legal paper (8.5" x 14")

       glegal
         G. Legal paper (8.5" x 13")

       letter
         Letter paper (8.5" x 11")

       gletter
         G. Letter paper (8.5" x 10.5")

       executive
         Executive paper (7.25" x 10.5")

       halfletter
         Halfletter paper (5.5" x 8.5")

       envmonarch
         Envelope Monarch (3.875" x 7.5")

       env10
         Envelope COM-10 (8.125" x 9.5")

       envdl
         Envelope DL (110 mm x 220 mm)

       envc5
         Envelope C5 (162 mm x 229 mm)

       envc6
         Envelope C6 (114 mm x 162 mm)

       envb5
         Envelope B5 (176 mm x 250 mm)

       Choukei-3Gou
         Choukei-3Gou paper (120mm x 235 mm)

       Choukei-4Gou
         Choukei-4Gou paper (90 mm x 205 mm)

       custom
         Custom paper size

       envb6
         Envelope 6 3/4 (3.625" x 6.5")

       folio
         F4/Folio paper (210 mm x 330 mm)

       jisy1
         JIS Yokei 1-gou (120 mm x 176 mm)

       jisy2
         JIS Yokei 2-gou (105 mm x 235 mm)

       quadpost
         Quad postcard (200 mm x 296 mm)

EXAMPLES
       gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE -sPAPERSIZE=a4 -r1200 -sDEVICE=pbmraw -sOutputFile=-  -
       < test.ps | min12xxw -r 1200 > test.min
            This  would  convert  a postscript file test.ps to a file test.min which could be sent di‐
            rectly to the printer, a 1200W to be exact. The output is rendered at  1200  dpi.  If  you
            have to drive some other model, see the model selection option (-m) above.

PORTABILITY
       Min12xxw  should  run  on most *nix-like workstations without major problems. Library functions
       which are known to be missing on non-Linux systems such as getline or getopt_long may  have  to
       be  replaced by an appropriate substitute.  In case of getline and getopt_long this has already
       been done. The query options may or may not work on other systems, depending on the  character‐
       istics  of  the  printer  driver and the interface used (USB, very old style parallel port or a
       more recent one...).

BUGS/LIMITATIONS/CONTRIBUTORS
       Min12xxw was written without any documentation from the manufacturer. The  description  of  the
       printer language may be inaccurate or even wrong because it was obtained by looking at the out‐
       put of the windoof driver only. The code dealing with the compression of raster data is in  its
       spirit heavily based on an initial driver by Adam Bocim <beetman@seznam.cz> who managed to find
       out how things are done (thanks, Adam, you did a great job!).  This new version is considerably
       faster, implemented more cleanly and (hopefully) well documented.

       It  also  features  querying  the  printer  status and page counter, a suggestion made by Bruno
       Schoedlbauer <bruno.schoedlbauer@gmx.de>, who also pointed me to a nice USB sniffer  by  Benoit
       Papillault  for Windoof 98 and up, see http://benoit.papillault.free.fr/usbsnoop.  (That little
       program may prove very helpful on similar occasions.  Happy USB sniffing...)

       David Hamilton <dhamilto@angel.homeip.net> has helped a lot in testing and developing the  sup‐
       port for the PagePro 1350W.

       Even  though  this  program  has been designed with care and much thought, no-one can guarantee
       that this program will not damage your printer, computer or even your neighbour's car,  because
       it was built without knowing exactly how things work, it's only a (hopefully) reasonable guess.
       (However, my printer does still work, even after the testing phase when a lot  of  wrong  stuff
       was sent to it. And my neighbour hasn't complained either...)

       Most  of  the available paper sizes have not actually been verified to work as advertised - re‐
       ports about successes or problems are welcome.  Also the code for querying the printer  is  not
       heavily  tested.  If  you have comments to make or know more about the format than I do, please
       share your thoughts and your knowledge.

       13xxW series support seems to be relatively well tested by now. Send mail with feedback if  you
       have such a printer and you experience problems.

       1400W support is pretty new - please send e-mail if it works or if you run into problems. Feed‐
       back on models for which support has just been completed is very important to improve and  sta‐
       bilise this support.

       Bugs  and problems reports are generally welcome because I just don't have the time to test ev‐
       erything out. I needed a filter and here it is. If it does not work - complain ;-)

AUTHOR
       Min12xxw was written by Manuel Tobias Schiller (mala@hinterbergen.de).

Local Utilities                              December 2005                                 MIN12XXW(1)
