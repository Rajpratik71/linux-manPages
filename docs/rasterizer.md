
RASTERIZER(1)                                                      User Commands                                                     RASTERIZER(1)

NAME
       rasterizer - SVG conversion

SYNOPSIS
       rasterizer [options] files

DESCRIPTION
       Rasterizer is a program to convert SVG files to various formats, namely PNG, JPEG and PDF.

OPTIONS
       -d <dir|file>

              output directory. If there is a single input file, this can be a file.

       -m <mimeType>

              output mime type. Should be one of image/jpg, image/jpeg, image/jpe, image/png, image/tiff or application/pdf.

       -w <width>

              output width. This is a floating point value.

       -h <height>

              output height. This is a floating point value.

       -maxw <width>

              Maximum output width. This is a floating point value.

       -maxh <height>

              Maximum output height. This is a floating point value.

       -a <area>

              output area. The format for <area> is x,y,w,h, where x, y, w and h are floating point values.

       -bg <color>

              output color. The format for <color> is a.r.g.b, where a, r, g and b are integer values.

       -cssMedia <media>

              CSS media type for which the source SVG files should be converted.

       -cssAlternate <alternate>

              CSS alternate stylesheet to use when converting the source SVG files.

       -cssUser <userStylesheet>

              CSS user stylesheet URI to apply to converted SVG documents in addition to any other referened or embedded stylesheets.

       -font-family <defaultFontFamily>

              Value used as a default when no font-family value is specified.

       -lang <userLanguage>

              User language to use when converting SVG documents.

       -q <quality>

              Quality for the output image. This is only relevant for the image/jpeg mime type.

       -indexed (1|2|4|8)

              Reduces  the  image  to  given number of bits per pixel using an adaptive palette, resulting in an Indexed image.  This is currently
              only supported for PNG conversion.

       -dpi <resolution>

              Resolution for the output image.

       -validate

              Controls whether the source SVG files should be validated.

       -onload

              Controls if the source SVG files must be rasterize after dispatching the 'onload' event.

       -scriptSecurityOff removes any security check on the scripts running

              as a result of dispatching the onload event.

       -anyScriptOrigin controls whether scripts can be loaded from

              any location. By default, scripts can only be loaded from

              the same location as the document referencing them.

       -scripts <listOfAllowedScripts> List of script types (i.e.,

              values for the type attribute in the <script> tag) which should be loaded.

       -d <dir|file>

              output directory. If there is a single input file, this can be a file.

       -m <mimeType>

              output mime type.

       -w <width>

              output width. This is a floating point value.

       -h <height>

              output height. This is a floating point value.

       -maxw <width>

              Maximum output width. This is a floating point value.

       -maxh <height>

              Maximum output height. This is a floating point value.

       -a <area>

              output area. The format for <area> is x,y,w,h, where x, y, w and h are floating point values.

       -bg <color>

              output color. The format for <color> is a.r.g.b, where a, r, g and b are integer values.

       -cssMedia <media>

              CSS media type for which the source SVG files should be converted.

       -cssAlternate <alternate>

              CSS alternate stylesheet to use when converting the source SVG files.

       -cssUser <userStylesheet>

              CSS user stylesheet URI to apply to converted SVG documents in addition to any other referened or embedded stylesheets.

       -font-family <defaultFontFamily>

              Value used as a default when no font-family value is specified.

       -lang <userLanguage>

              User language to use when converting SVG documents.

       -q <quality>

              Quality for the output image. This is only relevant for the image/jpeg mime type.

       -indexed (1|2|4|8)

              Reduces the image to given number of bits per pixel using an adaptive palette, resulting in an Indexed  image.   This  is  currently
              only supported for PNG conversion.

       -dpi <resolution>

              Resolution for the output image.

       -validate

              Controls whether the source SVG files should be validated.

       -onload

              Controls if the source SVG files must be rasterize after dispatching the 'onload' event.

       -scriptSecurityOff
              removes  any  security  check  on the scripts running as a result of dispatching the onload event. Always enabled, as in most cases,
              rasterizer just fails to run without this option. See -scriptSecurityOn

       -scriptSecurityOn
              If this is the first argument on the command-line, turn security back on. You'll most likely be hit by the  possible  bug  mentioned
              below.

       -anyScriptOrigin
              controls whether scripts can be loaded from any location. By default, scripts can only be loaded from the same location as the docu‐
              ment referencing them.

       -scripts <listOfAllowedScripts>
              List of script types (i.e., values for the type attribute in the <script> tag) which should be loaded.

BUGS
       If rasterizer fails with an error in the spirit of:

       Exception in thread "main" java.security.AccessControlException: access denied (java.util.PropertyPermission java.security.policy write)
               at java.security.AccessControlContext.checkPermission(AccessControlContext.java:323)
               at java.security.AccessController.checkPermission(AccessController.java:546)
               at java.lang.SecurityManager.checkPermission(SecurityManager.java:532)
               at java.lang.System.setProperty(System.java:727)

       Run it with the -scriptSecurityOff option on. It seems in some cases the security design is slighlty too strong. This might become the  de‐
       fault some day.

JAVA-WRAPPERS NOTE
       This  program  is a shell script wrapper based on java-wrappers(7).  You therefore benefit from several features; please see the java-wrap‐
       pers(7) manual page for more information about them.

AUTHORS
       rasterizer is part of batik, written by the Apache Software Foundation.

       This manual page was written by Vincent Fourmond <fourmond@debian.org> for the Debian Project, but may be used by others.

SEE ALSO
       The web page of batik, http://xml.apache.org/batik

       java-wrappers(7)

SVG conversion                                                     January 2008                                                      RASTERIZER(1)
