XVATTR(1)                                                          User Commands                                                         XVATTR(1)

NAME
       xvattr - Query/Set X11 XVideo Setting(s)

SYNOPSIS
       xvattr [options...]

       This program is used for getting and setting X11 Xv attributes such as XV_BRIGHTNESS, XV_CONTRAST, XV_SATURATION, XV_HUE, XV_COLORKEY, ...

       For this program to work, you must have a version of X11 with the XVideo extension and a graphics card that has Xv graphics acceleration.

       Note: On some cards XV_BRIGHTNESS and XV_CONTRAST are not listed among the available attributes, but they can still be set/changed.

   OPTIONS
       With no options, all parameters are displayed.

       Long options are handled by GNU getopts and follow those rules. In particular, options that are specified with a double dash (--) rather
       than a single dash (-), can be abbreviated as long as they are unique. Long parameters that need a value specified may have the parameter
       and the value separated with blank space or an optional equals sign (and no intervening space).

       For example the following are all equivalent:

       xvattr -a XV_BRIGHTNESS xvattr --attribute XV_BRIGHTNESS xvattr --att XV_BRIGHTNESS xvattr --att=XV_BRIGHTNESS

       Example:

         > xvattr
         Adaptor: 0
         Name: Matrox G-Series Backend Scaler
          Port: 46
           Name: XV_COLORKEY
            Flags: XvGettable XvSettable
            Min value: 0
            Max value: 16777215
            Current value: 66046

       {-a | --attribute} attribute name
           Show value of attribute attribute name

           Example:

             > xvattr -a XV_BRIGHTNESS
             XV_BRIGHTNESS = 24

       {-a | --attribute} attribute name [-v | --value] value
           Set attribute attribute name to value value.

           Example:

             > xvattr -a XV_COLORKEY -v 10
             XV_COLORKEY set to 10

       {-p | --port} port number
           Get the attribute on the specified port.  If -p is not set, the first available port is used.

           Example:

             > xvattr -p 66
             Found Xv 2.2
             Adaptor: 0
             Name: SIS Video Overlay
              Port: 66
               Name: XV_COLORKEY
                Flags: XvGettable XvSettable
                Min value: 0
                Max value: 16777215
                Current value: 66046
               Name: XV_BRIGHTNESS
                Flags: XvGettable XvSettable
                Min value: -128
                Max value: 127
                Current value: 0
               Name: XV_CONTRAST
                Flags: XvGettable XvSettable
                Min value: 0
                Max value: 255
                Current value: 128

AUTHOR
       Bjoern Englund. Send bug reports to "d4bjorn@dtek.chalmers.se" "rocky@panix.com" turned the README into this document.

SEE ALSO
       See also xvinfo and XvQueryAdaptors, XvSetPortAttribute, and XvGetPortAttribute.

COPYRIGHT
         Copyright (C) 2001-2002 Bjoern Englund

         This program is free software; you can redistribute it and/or modify
         it under the terms of the GNU General Public License as published by
         the Free Software Foundation; either version 2 of the License, or
         (at your option) any later version.

         This program is distributed in the hope that it will be useful,
         but WITHOUT ANY WARRANTY; without even the implied warranty of
         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
         GNU General Public License for more details.

         You should have received a copy of the GNU General Public License
         along with this program; if not, write to the Free Software
         Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

perl v5.14.2                                                        2012-09-17                                                           XVATTR(1)
