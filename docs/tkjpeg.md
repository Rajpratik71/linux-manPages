TKJPEG(1p)                                                     perl/Tk Documentation                                                    TKJPEG(1p)

NAME
       tkjpeg - simple JPEG viewer using perl/Tk

SYNOPSIS
         tkjpeg imagefile.jpg

DESCRIPTION
       Very simplistic image viewer that loads JPEG image, (well actually anything for which Photo has a handler) and puts it into a Label for
       display.

       It tries to find a fullcolour visual to use if display is deeper than 8-bit. (On 8-bit it uses a 4/4/4 palette.)

AUTHOR
       Nick Ing-Simmons <nick@ing-simmons.net>

Tk4.003                                                             2013-11-15                                                          TKJPEG(1p)
