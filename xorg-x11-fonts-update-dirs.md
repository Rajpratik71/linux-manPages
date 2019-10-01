XORG-X11-FONTS-UPDATE-DIRS(1)                                                              General Commands Manual                                                              XORG-X11-FONTS-UPDATE-DIRS(1)



NAME
       xorg-x11-fonts-update-dirs - update X11 font directories

SYNOPSIS
       xorg-x11-fonts-update-dirs [--skip-fontscale] [--need-ttmkfdir] path

DESCRIPTION
       The  xorg-x11-fonts-* rpm packages call xorg-x11-fonts-update-dirs during %post and %postun to update the X11 font indices.  This script may change in incompatible ways without notice and you should
       not run this script manually or rely on it otherwise.  To manually update the font indices invoke mkfontscale and ttmkfdir directly as required.

SEE ALSO
       mkfontscale(1) ttmkfdir(1)



                                                                                                 25 July 2014                                                                   XORG-X11-FONTS-UPDATE-DIRS(1)
