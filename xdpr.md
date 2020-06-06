XDPR(1)                                                                                    General Commands Manual                                                                                    XDPR(1)



NAME
       xdpr - dump an X window directly to a printer

SYNOPSIS
       xdpr [ filename ] [ -display host:display ] [ -Pprinter ] [ -device devtype ] [ option ...  ]


DESCRIPTION
       Xdpr uses the commands xwd, xpr, and lpr or lp to dump an X window, process it for a particular printer type, and print it out on the printer of your choice.  This is the easiest way to get a print‐
       out of a window.  Xdpr by default will print the largest possible representation of the window on the output page.

       The options for xdpr are the same as those for xpr, xwd, and lpr or lp.  The most commonly-used options are described below; see the manual pages for these commands for more detailed descriptions of
       the many options available.

OPTIONS
       filename
              Specifies a file containing a window dump (created by xwd) to be printed instead of selecting an X window.

       -Pprinter
              Specifies  a  printer to send the output to.  If a printer name is not specified here, xdpr (really, lpr or lp) will send your output to the printer specified by the PRINTER environment vari‐
              able.  Be sure that type of the printer matches the type specified with the -device option.

       -display host:display[.screen]
              Normally, xdpr gets the host and display number to use from the environment variable ``DISPLAY.''  One can, however, specify them explicitly; see X(1).

       -device devtype
              Specifies the device on which the file will be printed.  Currently supported:
                   la100  Digital LA100
                   ljet   HP LaserJet series and other monochrome PCL devices such as ThinkJet, QuietJet, RuggedWriter, HP2560 series, and HP 2930 series printers
                   ln03   Digital LN03
                   pjet   HP PaintJet (color mode)
                   pjetxl HP HP PaintJet XL Color Graphics Printer (color mode)
                   pp     IBM PP3812
                   ps     PostScript printer

              The default is PostScript.  -device lw (LaserWriter) is equivalent to -device ps and is provided only for backwards compatibility.

       -help  This option displays the list of options known to xdpr.

       Any other arguments will be passed to the xwd, xpr, and lpr or lp commands as appropriate for each.

SEE ALSO
       xwd(1), xpr(1), lpr(1), lp(1), xwud(1), X(1)

ENVIRONMENT
       DISPLAY   which display to use by default.

       PRINTER   which printer to use by default.

COPYRIGHT
       Copyright X Consortium
       See X(1) for a full statement of rights and permissions.

AUTHORS
       Paul Boutin, MIT Project Athena
       Michael R. Gretzinger, MIT Project Athena
       Jim Gettys, MIT Project Athena



X Version 11                                                                                      Release 6                                                                                           XDPR(1)
