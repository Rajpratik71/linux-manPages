driverless(1)                                                   driverless(1)

NAME
       driverless - PPD generator utility for driverless printing

SYNOPSIS
       driverless [-h | --help | --version] [-d | -v | --debug] [list] | [cat driver URI] | [IPP printer URI]

DESCRIPTION
       driverless  generates  PPD  files  for printers which are designed for
       driverless printing (currently IPP Everywhere and  AirPrint  printers)
       by polling capability information from the printers via IPP. it can be
       either called for listing suitable printers in  the  network  and  for
       actually  generating  the PPD. It can also be called by CUPS when CUPS
       is listing available PPDs/drivers or creating print queues, making the
       setup  of  driverless  printers with printer setup tools transparently
       working.

       driverless is placed in /usr/lib/cups/driver/  for  listing  available
       driverless-capable  printers  and  generating PPDs for them. It should
       also be put in /usr/lib/cups/backend/ (preferably by a symbolic  link)
       to  list  IPP  device  URIs for suitable printers. Printer setup tools
       like system-config-printer, the CUPS web  interface  at  http://local‐
       host:631/,  and  CUPS'  command line utilities can use driverless with
       CUPS to list available driverless-capable  printers,  determine  their
       IPP device URIs and generate PPDs for them. The printers will be auto‐
       matically and correctly set up  for  driverless  printing.  Note  that
       driverless printing requires IPP communication with the printer.

       A   second   symbolic  link  to  /usr/lib/cups/driver/driverless  from
       /usr/bin/ allows driverless to be called directly by a user.

OPTIONS
       -h, --help, --version
              Show help page, including version number.

       -v, -d, --debug
              Debug mode, verbose logging to stderr.

       list   List the driver URIs and metadata for all available IPP  print‐
              ers  suitable for driverless PPD file generation (to be used by
              CUPS).

       cat driver URI
              Generate the PPD file for the supplied driver URI from the out‐
              put of "list" (to be used by CUPS).

       IPP printer URI
              Generate  the  PPD file for the supplied IPP printer URI (suit‐
              able URIs are listed when calling driverless without options).

       When called without options, the IPP printer URIs of all available IPP
       printers will be listed.

SEE ALSO
       cups-browsed(8), ippfind(1)

AUTHOR
       The  authors  of  driverless  are  listed  in /usr/share/doc/cups-fil‐
       ters/AUTHORS.

                                 27 Dec 2016                    driverless(1)
