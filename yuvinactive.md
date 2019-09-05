yuvinactive(1)                                                  MJPEG tools manual                                                  yuvinactive(1)

NAME
       yuvinactive - Set a part of the video to a defined state

SYNOPSIS
       yuvinactive [options] </dev/stdin >/dev/stdout

DESCRIPTION
       yuvinactive  operates  with  a  area  (rectangle)  you define.  By default is sets it to really black. But you can tell tell yuvinactive to
       darken the area, or fill it with a certain color. It can also make the content of the area unreadable, like extreme softening of the  area.
       Or  copy  the surrounding area into the the specified area.  You usually have to use the -i option which sets the area in which yuvinactive
       will work. If no additional option is given yuvinactive stet the area to black.  But you can use the -d -s -a -c options to  tell  yuvinac‐
       tive  that it shall do something different with that area. You can only use one additional option. yuvinactive was built to remove unwanted
       things like a logo, from the movie.

OPTIONS
       lav2yuv accepts the following options:

       -h   Some help output

       -iXxY+XOFF+YOFF
            Specifies the area yuvinactive shall work with. With this option the area is set to black. There are no restrictions because of inter‐
            lacing.

       -d num
            How  much  darker the area should be compared to the original color.  This is done by setting a lower value for the luma. The value is
            in percent from the original luma.

       -s num
            Here you specify a certain color in the yuv format.

       -a num
            With this option the program uses on pixel and averages the surrounding pixels with the same color to make the original less readable.
            The  number tells the the program how much pixels around the original pixel should be overwritten with the same color. You have to use
            a even number here

       -c num
            Sets the number of surrounding pixels yuvinactive should use to copy them into the given area. You have to use  a  even  number  here.
            yuvinactive uses the lines above and below the specified area for copying them into the area.

BUGS
       Right,  there are bugs hidden. The thing is not well tested, and not every option might work. yuvinactive is in the first state of becoming
       a useful program.

AUTHOR
       This man page was originally written by Bernhard Praschinger.
       If you have questions, remarks, problems or you just want to contact the developers, the main mailing list for the MJPEG-tools is:
         mjpeg-users@lists.sourceforge.net

       For more info, see our website at
              http://mjpeg.sourceforge.net

SEE ALSO
       mjpegtools(1), lav2yuv(1), mpeg2enc(1), yuvscaler(1), yuv2lav(1), yuvdenoise(1), yuvplay(1), yuvmedianfilter(1)

MJPEG Tools Team                                                  30 October 2003                                                   yuvinactive(1)
