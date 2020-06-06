totem-video-thumbnailer(1)                                                                                                                                                     totem-video-thumbnailer(1)

NAME
       totem-video-thumbnailer - video thumbnailer for the GNOME desktop

SYNOPSYS
       totem-video-thumbnailer [-j|--jpeg] [-l|--no-limit] [-g num|--gallery num] [-s size] input output [backend options]

DESCRIPTION
       This manual page documents briefly the totem-video-thumbnailer command. This manual page was written for the Debian Project because  the original program does not have a manual page.

       totem-video-thumbnailer is used internally by GNOME applications such as nautilus to generate PNG thumbnails of video files. While it is possible to invoke it manually, it is usually done
       automatically by nautilus.

ARGUMENTS
       input   The input filename. This can be in any format that totem can play.

       output  The output filename, output in PNG format.

       backend options
               Options to be passed to the backend (i.e. gstreamer).

OPTIONS
       -j --jpeg
               Switch the output format to JPEG. The default is PNG.

       -g num --gallery num
               Output a gallery of the given number (0 is the default) of screenshots.

       -l --no-limit
               Don't limit the thumbnailing time to 30 seconds. For debugging purposes.

       -s size The size of the thumbnail. Example: "64x64". The default is "128x96".

AUTHOR
       totem-video-thumbnailer was written by Bastien Nocera <hadess@hadess.net>.

       This manual page was written by Zack Cerza <zcerza@coe.neu.edu> for the Debian Project (but may be used by others).

SEE ALSO
       totem, nautilus

GNOME                                                                                           2009-05-06                                                                     totem-video-thumbnailer(1)
