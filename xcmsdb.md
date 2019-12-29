XCMSDB(1)                               General Commands Manual                              XCMSDB(1)

NAME
       xcmsdb - Device Color Characterization utility for X Color Management System

SYNOPSIS
       xcmsdb [ -query ] [ -remove ] [ -format 32|16|8 ] [ -help ] [ -version ] [ filename ]

DESCRIPTION
       xcmsdb  is  used to load, query, or remove Device Color Characterization data stored in proper‐
       ties on the root window of the screen as specified in section 7, Device Color Characterization,
       of  the ICCCM.  Device Color Characterization data (also called the Device Profile) is an inte‐
       gral part of Xlib's X Color Management System (Xcms), necessary for proper conversion of  color
       specification  between  device-independent  and device-dependent forms.  Xcms uses 3x3 matrices
       stored in the XDCCC_LINEAR_RGB_MATRICES property to convert color specifications between CIEXYZ
       and RGB Intensity (XcmsRGBi, also referred to as linear RGB).  Xcms then uses display gamma in‐
       formation stored in the XDCCC_LINEAR_RGB_CORRECTION property to  convert  color  specifications
       between RGBi and RGB device (XcmsRGB, also referred to as device RGB).

       Note  that  Xcms  allows clients to register function sets in addition to its built-in function
       set for CRT color monitors.  Additional function sets may store their device  profile  informa‐
       tion  in  other  properties  in function set specific format.  This utility is unaware of these
       non-standard properties.

       The ASCII readable contents of filename (or the standard input if no input file is  given)  are
       appropriately transformed for storage in properties, provided the -query or -remove options are
       not specified.

OPTIONS
       xcmsdb program accepts the following options:

       -query  This option attempts to read the XDCCC properties off the  screen's  root  window.   If
               successful,  it transforms the data into a more readable format, then sends the data to
               standard out.

       -remove This option attempts to remove the XDCCC properties on the screen's root window.

       -format 32|16|8
               Specifies the property format (32,  16,  or  8  bits  per  entry)  for  the  XDCCC_LIN‐
               EAR_RGB_CORRECTION property.  Precision of encoded floating point values increases with
               the increase in bits per entry.  The default is 32 bits per entry.

       -help   This option prints a summary of the available options and exits.

       -version
               This option prints the program version and exits.

SEE ALSO
       xprop(1), Xlib documentation

ENVIRONMENT
       DISPLAY to figure out which display and screen to use.

AUTHOR
       Chuck Adams, Tektronix Inc.  Al Tabayoyon, SynChromatics Inc. (added multi-visual support)

X Version 11                                 xcmsdb 1.0.5                                    XCMSDB(1)
