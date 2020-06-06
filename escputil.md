ESCPUTIL(1)                                                                                Gutenprint Manual Pages                                                                                ESCPUTIL(1)



NAME
       escputil - maintain Epson Stylus inkjet printers

SYNOPSIS
       escputil [ -P printer | -r device ] [ -m model ] [ -S ] [ -C ] [ -p ] [ -u ] [ -c | -n | -a | -i | -d | -o | -s | -l | -M | -h ] [ -q ]

DESCRIPTION
       escputil is a command line utility to perform various maintenance tasks on Epson Stylus inkjet printers.  These tasks include head alignment, head cleaning, nozzle check, printer identification, and
       retrieval of ink level from the printer.

OPTIONS
       escputil accepts the following options:

       -P, --printer-name=printer
              Specify the name of the printer to operate on.  The default is the default system printer.

       -r, --raw-device=device
              Specify the name of the device to write to directly rather than going through a printer queue. You must use this (rather than specifying a printer) when retrieving ink levels  or  identifying
              the printer, or if you wish to perform head alignment without specifying the printer model.

       -m, --model=model
              Specify the precise printer model for head alignment.

       -u, --new
              The printer is a new printer (Stylus Color 740 or newer).

       -S, --short-name
              Print the short name of the printer with --identify.

       -C, --choices
              Specify the number of pattern choices for alignment.

       -p, --patterns
              Specify the number of sets of patterns for alignment.

       -c, --clean-head
              Clean the print head.  This can also be performed from the printer front panel.

       -n, --nozzle-check
              Print a nozzle test pattern.  Dirty or clogged nozzles will show as gaps in the pattern.  If you see any gaps, you should run a head cleaning pass or two.

       -a, --align-head
              Align  the print head.  CAUTION: Misuse of this option may result in poor print quality and/or damage to the printer.  You must either specify the printer model with the -m option, or use the
              raw printer device to allow escputil to detect the printer model.

       -i, --ink-level
              Obtain the ink level from the printer.  This requires read/write access to the raw printer device.

       -d, --identify
              Query the printer for make and model information.  This requires read/write access to the raw printer device.

       -o, --align-color
              Align the color print head (used by Stylus Color 480 and 580 only).  CAUTION: Misuse of this option may result in poor print quality and/or damage to the printer.

       -s, --status
              Retrieve printer status.

       -l, --license
              Display the license/warranty terms of this program.

       -M, --list-models
              List the supported printer models.

       -h, --help
              Display a list of all command line options.

       -q, --quiet
              Suppress the banner.

BUGS
       USB-connected printers sometimes fail to identify or return ink levels.  You may have to repeat the command.  This is probably a timing issue in escputil, not a flaw in the printer.

       Anything requiring bidirectional communication with the printer (identify, ink levels, or head alignment without specifying the printer model) requires read/write access to  the  printer  port  (for
       example  /dev/lp0).  This may require these operations to be performed as root.  In addition, kernel support is required for bidirectional communication.  For Linux version 2.2, CONFIG_PRINTER_READ‐
       BACK should be enabled; this is called CONFIG_PARPORT_1284 on 2.4 and later kernels.

       If the printer is performing self-test or head cleaning on power up, the identify and ink level commands will time out, although the printer successfully receives the command.  The command will need
       to be reissued when the printer is quiescent.

AUTHORS
       Robert Krawitz.

COPYRIGHT
       Copyright ©  2000 Robert Krawitz (rlk@alum.mit.edu)

       This  program  is  free  software;  you  can  redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the
       License, or (at your option) any later version.

OTHER INFORMATION
       The homepage of the Gutenprint project from which this utility was contributed is located at http://gimp-print.sourceforge.net/.

SEE ALSO
       lp(4), tunelp(8).



Version 5.2.9                                                                                    07 Jul 2012                                                                                      ESCPUTIL(1)
