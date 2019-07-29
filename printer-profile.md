printer-profile(1)                                            General Commands Manual                                           printer-profile(1)

NAME
       printer-profile - Profile using X-Rite ColorMunki and Argyll CMS

SYNOPSIS
       printer-profile [options] manuf model [rgb|cmyk] [patches] [ink-limit]

DESCRIPTION
       printer-profile prints a test chart, uses the ColorMunki instrument to scan it in, then computes an ICM profile using the Argyll Color Man‐
       agement System.

       Manuf is "sam".  Model is "clp-300", "clp-315", "clp-325" or "clp-365".
       Manuf is "hp".  Model is "2600" or "cp1215".
       Manuf is "km".  Model is "2300" or "2530".
       Manuf is "dell". Model is "1355".

       "rgb" is the usual setting.  "patches" is a multiple 196 per page.

       Edit the script for additional models.

OPTIONS
           -b 1|2        Bits per pixel (1)
           -r XRESxYRES  Resolution. Default=''. ()
           -P rem-print  Remote print (64-bit) machine, or none (amd)
           -S rem-scan   Remote scan (ColorMunki) machine, or none (mac)
           -D lvl        Debug level

EXAMPLES
       Profile the Samsung clp-315:

       $ printer-profile sam 315 rgb 196

BUGS
       gs 8.64 and before has problems with 32-bit machines and color profile data.  Don't use!

       You need Argyll_V1.5.1 or later.

FILES
       /usr/bin/printer-profile, /usr/share/foo2*/icm/testing.icm

SEE ALSO
       firefox http://www.xritephoto.com/html/colormunkisplash.htm
       firefox http://www.argyllcms.com/
       firefox http://www.argyllcms.com/Argyll_V1.5.1_src.zip

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2zjs.rkkda.com/

