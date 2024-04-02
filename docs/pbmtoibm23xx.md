Pbmtoibm23xx User Manual(0)                                                                                                                                                       Pbmtoibm23xx User Manual(0)



NAME
       pbmtoibm23xx - convert a PBM image to IBM 23XX printer stream


SYNOPSIS
       pbmtoibm23xxx [-xres=dpi] [-yres=dpi] [pbmfile ...]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtoibm23xx reads one or more PBM files as input and writes an IBM 23XX printer command stream to generate all the images in all the files to Standard Output.

       If you don't specify any file names, pbmtoibm23xx reads from Standard Input.


OPTIONS
       -xres=dpi
              This option specifies the horizontal resolution in dots per inch.  Valid values are 60, 120, and 240.


       -yres=dpi
              This option specifies the vertical resolution in dots per inch.  Valid values are 60, 120, and 240.


       -slow  Use the slower printing mode where two modes with the same resolution are available.  This usually produces better quality prints.  This affects only modes with horizontal resolution 120, but
              might affect other modes in future versions of the program.




LIMITATIONS
       There are probably better ways to control the IBM 23XX printers.  Let me know if you find any.


HISTORY
       pbmtoibm23xx was new in Netpbm 10.25 (October 2004).


SEE ALSO
       pbm(5) , Ghostscript (gs).


AUTHOR
       Copyright (C) 2004 Jorrit Fahlke <jorrit@jorrit.de>.  Copying policy: GNU GPL version 2



netpbm documentation                                                                           October 16, 2004                                                                   Pbmtoibm23xx User Manual(0)
