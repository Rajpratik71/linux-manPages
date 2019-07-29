XRANDR(1)                                                                               General Commands Manual                                                                              XRANDR(1)

NAME
       xrandr - primitive command line interface to RandR extension

SYNOPSIS
       xrandr   [--help]    [--display   display]   [-q]   [-v]   [--verbose]  [--dryrun]  [--screen  snum]  [--q1]  [--q12]  [--current]  [--noprimary]  [--panning  widthxheight[+x+y[/track_widthx‐
       track_height+track_x+track_y[/border_left/border_top/border_right/border_bottom]]]] [--scale xxy] [--scale-from wxh] [--transform a,b,c,d,e,f,g,h,i] [--primary] [--prop]  [--fb  widthxheight]
       [--fbmm  widthxheight]  [--dpi  dpi]  [--newmode  name mode] [--rmmode name] [--addmode output name] [--delmode output name] [--output output] [--auto] [--mode mode] [--preferred] [--pos xxy]
       [--rate rate] [--reflect reflection] [--rotate orientation] [--left-of output] [--right-of output] [--above output] [--below output] [--same-as output] [--set property value] [--off]  [--crtc
       crtc] [--gamma red:green:blue] [--brightness brightness] [-o orientation] [-s size] [-r rate] [-x] [-y] [--listproviders] [--setprovideroutputsource provider source] [--setprovideroffloadsink
       provider sink]

DESCRIPTION
       Xrandr is used to set the size, orientation and/or reflection of the outputs for a screen. It can also set the screen size.

       If invoked without any option, it will dump the state of the outputs, showing the existing modes for each of them, with a '+' after the preferred modes and a '*' after the current mode.

       There are a few global options. Other options modify the last output that is specified in earlier parameters in the command line. Multiple outputs may be modified at the same time by  passing
       multiple --output options followed immediately by their corresponding modifying options.

       --help Print out a summary of the usage and exit.

       -v, --version
              Print out the RandR version reported by the X server and exit.

       --verbose
              Causes  xrandr  to be more verbose. When used with -q (or without other options), xrandr will display more information about the server state. Please note that the gamma and brightness
              informations are only approximations of the complete color profile stored in the server. When used along with options that reconfigure the system, progress will be reported while  exe‐
              cuting the configuration changes.

       -q, --query
              When this option is present, or when no configuration changes are requested, xrandr will display the current state of the system.

       --dryrun
              Performs all the actions specified except that no changes are made.

       --nograb
              Apply  the  modifications  without  grabbing  the screen. It avoids to block other applications during the update but it might also cause some applications that detect screen resize to
              receive old values.

       -d, --display name
              This option selects the X display to use. Note this refers to the X screen abstraction, not the monitor (or output).

       --screen snum
              This option selects which screen to manipulate. Note this refers to the X screen abstraction, not the monitor (or output).

       --q1   Forces the usage of the RandR version 1.1 protocol, even if a higher version is available.

       --q12  Forces the usage of the RandR version 1.2 protocol, even if the display does not report it as supported or a higher version is available.

RandR version 1.4 options
       Options for RandR 1.4 are used as a superset of the options for RandR 1.3.

       --listproviders
              Report information about the providers available.

       --setprovideroutputsource provider source
              Set source as the source of display output images for provider.  This is only possible if source and provider have the Source Output and Sink  Output  capabilities,  respectively.   If
              source is 0x0, then provider is disconnected from its current output source.

       --setprovideroffloadsink provider sink
              Set provider as a render offload device for sink.  This is only possible if provider and sink have the Source Offload and Sink Offload capabilities, respectively.  If sink is 0x0, then
              provider is disconnected from its current render offload sink.

RandR version 1.3 options
       Options for RandR 1.3 are used as a superset of the options for RandR 1.2.

       --current
              Return the current screen configuration, without polling for hardware changes.

       --noprimary
              Don't define a primary output.

       Per-output options

       --panning widthxheight[+x+y[/track_widthxtrack_height+track_x+track_y[/border_left/border_top/border_right/border_bottom]]]
              This option sets the panning parameters.  As soon as panning is enabled, the CRTC position can change with every pointer move.  The first four  parameters  specify  the  total  panning
              area,  the  next  four the pointer tracking area (which defaults to the same area). The last four parameters specify the border and default to 0. A width or height set to zero disables
              panning on the according axis. You typically have to set the screen size with --fb simultaneously.

       --transform a,b,c,d,e,f,g,h,i
              Specifies a transformation matrix to apply on the output. Automatically a bilinear filter is selected.  The mathematical form corresponds to:
                     a b c
                     d e f
                     g h i
              The transformation is based on homogeneous coordinates. The matrix multiplied by the coordinate vector of a pixel of the output gives the transformed coordinate vector of  a  pixel  in
              the  graphic  buffer.   More  precisely,  the  vector (x y) of the output pixel is extended to 3 values (x y w), with 1 as the w coordinate and multiplied against the matrix. The final
              device coordinates of the pixel are then calculated with the so-called homogenic division by the transformed w coordinate.  In other words, the device coordinates (x' y') of the trans‐
              formed pixel are:
                     x' = (ax + by + c) / w'   and
                     y' = (dx + ey + f) / w'   ,
                     with  w' = (gx + hy + i)  .
              Typically,  a  and  e  corresponds to the scaling on the X and Y axes, c and f corresponds to the translation on those axes, and g, h, and i are respectively 0, 0 and 1. The matrix can
              also be used to express more complex transformations such as keystone correction, or rotation.  For a rotation of an angle T, this formula can be used:
                     cos T  -sin T   0
                     sin T   cos T   0
                      0       0      1
              As a special argument, instead of passing a matrix, one can pass the string none, in which case the default values are used (a unit matrix without filter).

       --scale xxy
              Changes the dimensions of the output picture. Values superior to 1 will lead to a compressed screen (screen dimension bigger than the dimension of the output mode), and values below  1
              leads to a zoom in on the output. This option is actually a shortcut version of the --transform option.

       --scale-from wxh
              Specifies the size in pixels of the area of the framebuffer to be displayed on this output.  This option is actually a shortcut version of the --transform option.

       --primary
              Set the output as primary.  It will be sorted first in Xinerama and RANDR geometry requests.

RandR version 1.2 options
       These options are only available for X server supporting RandR version 1.2 or newer.

       --prop, --properties
              This option causes xrandr to display the contents of properties for each output. --verbose also enables --prop.

       --fb widthxheight
              Reconfigures  the  screen to the specified size. All configured monitors must fit within this size. When this option is not provided, xrandr computes the smallest screen size that will
              hold the set of configured outputs; this option provides a way to override that behaviour.

       --fbmm widthxheight
              Sets the reported values for the physical size of the screen. Normally, xrandr resets the reported physical size values to keep the DPI constant.  This overrides that computation.

       --dpi dpi
              This also sets the reported physical size values of the screen, it uses the specified DPI value to compute an appropriate physical size using whatever pixel size will be set.

       --newmode name mode
              New modelines can be added to the server and then associated with outputs.  This option does the former. The mode is specified using the ModeLine  syntax  for  xorg.conf:  clock  hdisp
              hsyncstart  hsyncend  htotal  vdisp vsyncstart vsyncend vtotal flags. flags can be zero or more of +HSync, -HSync, +VSync, -VSync, Interlace, DoubleScan, CSync, +CSync, -CSync. Several
              tools permit to compute the usual modeline from a height, width, and refresh rate, for instance you can use cvt.

       --rmmode name
              This removes a mode from the server if it is otherwise unused.

       --addmode output name
              Add a mode to the set of valid modes for an output.

       --delmode output name
              Remove a mode from the set of valid modes for an output.

       Per-output options

       --output output
              Selects an output to reconfigure. Use either the name of the output or the XID.

       --auto For connected but disabled outputs, this will enable them using their first preferred mode (or, something close to 96dpi if they have no preferred mode). For disconnected  but  enabled
              outputs, this will disable them.

       --mode mode
              This selects a mode. Use either the name or the XID for mode

       --preferred
              This selects the same mode as --auto, but it doesn't automatically enable or disable the output.

       --pos xxy
              Position the output within the screen using pixel coordinates. In case reflection or rotation is applied, the translation is applied after the effects.

       --rate rate
              This marks a preference for refresh rates close to the specified value, when multiple modes have the same name, this will select the one with the nearest refresh rate.

       --reflect reflection
              Reflection can be one of 'normal' 'x', 'y' or 'xy'. This causes the output contents to be reflected across the specified axes.

       --rotate rotation
              Rotation  can be one of 'normal', 'left', 'right' or 'inverted'. This causes the output contents to be rotated in the specified direction. 'right' specifies a clockwise rotation of the
              picture and 'left' specifies a counter-clockwise rotation.

       --left-of, --right-of, --above, --below, --same-as another-output
              Use one of these options to position the output relative to the position of another output. This allows convenient tiling of outputs within the screen.  The position is always computed
              relative to the new position of the other output, so it is not valid to say --output a --left-of b --output b --left-of a.

       --set property value
              Sets  an output property. Integer properties may be specified as a valid (see --prop) comma-separated list of decimal or hexadecimal (with a leading 0x) values.  Atom properties may be
              set to any of the valid atoms (see --prop).  String properties may be set to any value.

       --off  Disables the output.

       --crtc crtc
              Uses the specified crtc (either as an index in the list of CRTCs or XID).  In normal usage, this option is not required as xrandr tries to make sensible choices about which crtc to use
              with each output. When that fails for some reason, this option can override the normal selection.

       --gamma red:green:blue
              Set the specified floating point values as gamma correction on the crtc currently attached to this output. Note that you cannot get two different values for cloned outputs (i.e.: which
              share the same crtc) and that switching an output to another crtc doesn't change the crtc gamma corrections at all.

       --brightness brightness
              Multiply the gamma values on the crtc currently attached to the output to specified floating value. Useful for overly bright or overly dim outputs.  However, this is  a  software  only
              modification, if your hardware has support to actually change the brightness, you will probably prefer to use xbacklight.

RandR version 1.1 options
       These  options  are  available  for X servers supporting RandR version 1.1 or older. They are still valid for newer X servers, but they don't interact sensibly with version 1.2 options on the
       same command line.

       -s, --size size-index or --size widthxheight
              This sets the screen size, either matching by size or using the index into the list of available sizes.

       -r, --rate, --refresh rate
              This sets the refresh rate closest to the specified value.

       -o, --orientation rotation
              This specifies the orientation of the screen, and can be one of normal, inverted, left or right.

       -x     Reflect across the X axis.

       -y     Reflect across the Y axis.

EXAMPLES
       Sets an output called LVDS to its preferred mode, and on its right put an output called VGA to preferred mode of a screen which has been physically rotated clockwise:
              xrandr --output LVDS --auto --rotate normal --pos 0x0 --output VGA --auto --rotate left --right-of LVDS

       Forces to use a 1024x768 mode on an output called VGA:
              xrandr --newmode "1024x768" 63.50  1024 1072 1176 1328  768 771 775 798 -hsync +vsync
              xrandr --addmode VGA 1024x768
              xrandr --output VGA --mode 1024x768

       Enables panning on a 1600x768 desktop while displaying 1024x768 mode on an output called VGA:
              xrandr --fb 1600x768 --output VGA --mode 1024x768 --panning 1600x0

       Have one small 1280x800 LVDS screen showing a small version of a huge 3200x2000 desktop, and have a big VGA screen display the surrounding of the mouse at normal size.
              xrandr --fb 3200x2000 --output LVDS --scale 2.5x2.5 --output VGA --pos 0x0 --panning 3200x2000+0+0/3200x2000+0+0/64/64/64/64

       Displays the VGA output in trapezoid shape so that it is keystone corrected when the projector is slightly above the screen:
              xrandr --fb 1024x768 --output VGA --transform 1.24,0.16,-124,0,1.24,0,0,0.000316,1

SEE ALSO
       Xrandr(3), cvt(1), xkeystone(1), xbacklight(1)

AUTHORS
       Keith Packard, Open Source Technology Center, Intel Corporation.  and Jim Gettys, Cambridge Research Laboratory, HP Labs, HP.

X Version 11                                                                                 xrandr 1.5.0                                                                                    XRANDR(1)
