scrot(1)                                                      General Commands Manual                                                     scrot(1)

NAME
       scrot - capture a screenshot using imlib2

SYNOPSIS
       scrot [options] [file]

DESCRIPTION
       scrot  is  a  screen  capture utility using the imlib2 library to aquire and save images.  scrot has a few options, detailed below. Specify
       [file] as the filename to save the screenshot to.  If [file] is not specified, a date-stamped file will be dropped in  the  current  direc‐
       tory.

OPTIONS
       -h, --help
            display help output and exit.

       -v, --version
            output version information and exit.

       -b, --border
            When selecting a window, grab wm border too

       -c, --count
            Display a countdown when used with delay.

       -d, --delay NUM
            Wait NUM seconds before taking a shot.

       -e, --exec APP
            Exec APP on the saved image.

       -q, --quality NUM
            Image quality (1-100) high value means high size, low compression. Default: 75. (Effect differs depending on file format chosen).

       -m, --multidisp
            For multiple heads, grab shot from each and join them together.

       -s, --select
            Interactively select a window or rectangle with the mouse.

       -u, --focused
            Use the currently focused window.

       -t, --thumb NUM
            generate thumbnail too. NUM is the percentage of the original size for the thumbnail to be.

       -z, --silent
            prevent beeping.

SPECIAL STRINGS
       Both  the  --exec  and  filename parameters can take format specifiers that are expanded by scrot when encountered.  There are two types of
       format specifier. Characters preceded by a '%' are interpretted by strftime(2). See man strftime for examples.  These options may  be  used
       to  refer  to the current date and time.  The second kind are internal to scrot and are prefixed by '$' The following specifiers are recog‐
       nised:

       $f image path/filename (ignored when used in the filename)
       $n image name (ignored when used in the filename)
       $s image size (bytes) (ignored when used in the filename)
       $p image pixel size
       $w image width
       $h image height
       $t image format
       $$ prints a literal '$'
       \n prints a newline (ignored when used in the filename)

EXAMPLE
       scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/shots/'
       This would create a file called something like 2000-10-30_2560x1024.png and move it to your shots directory.

BUGS
       None known.

LICENSE
       Copyright Tom Gilbert 2000

       Permission is hereby granted, free of charge, to any person obtaining a copy of this  software  and  associated  documentation  files  (the
       "Software"),  to  deal  in  the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
       distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do  so,  subject  to
       the following conditions:

       The  above  copyright  notice and this permission notice shall be included in all copies of the Software, its documentation and marketing &
       publicity materials, and acknowledgment shall be given in the documentation, materials and software packages that this Software was used.

       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO  THE  WARRANTIES  OF  MER‐
       CHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
       LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
       DEALINGS IN THE SOFTWARE.

       Email bugs and feature requests to
       <scrot_sucks@linuxbrit.co.uk>

                                                                   Oct 26, 2000                                                           scrot(1)
