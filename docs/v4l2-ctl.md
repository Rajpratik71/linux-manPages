V4L2-CTL(1)                                                        User Commands                                                       V4L2-CTL(1)

NAME
       v4l2-ctl - An application to control video4linux drivers

SYNOPSIS
       v4l2-ctl [-h] [-d <dev>] [many other options]

DESCRIPTION
       The v4l2-ctl tool is used to control video4linux devices, either video, vbi, radio or swradio, both input and output. It is able to control
       almost any aspect of such devices covering the full V4L2 API.

OPTIONS
       -d, --device <dev>
              Use device <dev> as the V4L2 device.  if <dev> starts with a digit, then /dev/video<dev> is used Otherwise if -z was specified  ear‐
              lier,  then <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the bus
              info string as specified by the -z option.

       -v, --verbose
              Turn on verbose reporting.

       -w, --wrapper
              Use the libv4l2 wrapper library for all V4L2 device accesses. By default v4l2-ctl will directly access the  V4L2  device,  but  with
              this option all access will go via this wrapper library.

       -h, --help
              Prints the help message.

       --help-io
              Prints the help message for all options that get/set/list inputs and outputs, both video and audio.

       --help-misc
              Prints the help message for miscellaneous options.

       --help-overlay
              Prints the help message for all options that get/set/list overlay and framebuffer formats.

       --help-sdr
              Prints the help message for all options that get/set/list software defined radio formats.

       --help-selection
              Prints the help message for all options that deal with selections (cropping and composing).

       --help-stds
              Prints the help message for all options that deal with SDTV standards and Digital Video timings.

       --help-streaming
              Prints the help message for all options that deal with streaming.

       --help-subdev
              Prints the help message for all options that deal with v4l-subdevX devices.

       --help-tuner
              Prints the help message for all options that deal with tuners and modulators.

       --help-vbi
              Prints the help message for all options that get/set/list VBI formats.

       --help-vidcap
              Prints the help message for all options that get/set/list video capture formats.

       --help-vidout
              Prints the help message for all options that get/set/list video output formats.

       --help-edid
              Prints the help message for all options that get/set EDIDs.

       --help-all
              Prints the help message for all options.

       --all  Display all information available.

       -C, --get-ctrl <ctrl>[,<ctrl>...]
              Get the value of the controls [VIDIOC_G_EXT_CTRLS].

       -c, --set-ctrl <ctrl>=<val>[,<ctrl>=<val>...]
              Set the value of the controls [VIDIOC_S_EXT_CTRLS].

       -D, --info
              Show driver info [VIDIOC_QUERYCAP].

       -e, --out-device <dev>
              Use  device  <dev>  for  output  streams  instead  of  the  default  device as set with --device. If <dev> starts with a digit, then
              /dev/video<dev> is used.  Otherwise if -z was specified earlier, then <dev> is the entity name or interface ID (if prefixed with 0x)
              as found in the topology of the media device with the bus info string as specified by the -z option.

       -E, --export-device <dev>
              Use device <dev> for exporting DMA buffers.  If <dev> starts with a digit, then /dev/video<dev> is used.  Otherwise if -z was speci‐
              fied earlier, then <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device  with
              the bus info string as specified by the -z option.

       -z, --media-bus-info <bus-info>
              Find  the  media device with the given <bus-info> string. If set, then -d, -e and -E options can use the entity name or interface ID
              to refer to the device nodes. Example: v4l2-ctl -z platform:vivid-000 -d vivid-000-vid-cap

       -k, --concise
              Be more concise if possible.

       -l, --list-ctrls
              Display all controls and their values [VIDIOC_QUERYCTRL].

       -L, --list-ctrls-menus
              Display all controls and their menus [VIDIOC_QUERYMENU].

       -r, --subset <ctrl>[,<offset>,<size>]+
              The subset of the N-dimensional array to get/set for control <ctrl>, for every dimension an (<offset>, <size>) tuple is given.

       --list-devices
              List all v4l devices. If -z was given, then list just the devices of the media device with the bus info string as specified  by  the
              -z option.

       --log-status
              Log the board status in the kernel log [VIDIOC_LOG_STATUS].

       --get-priority
              Query the current access priority [VIDIOC_G_PRIORITY].

       --set-priority <prio>
              Set the new access priority [VIDIOC_S_PRIORITY].  <prio> is 1 (background), 2 (interactive) or 3 (record).

       --silent
              Only set the result code, do not print any messages.

       --sleep <secs>
              Sleep <secs>, call QUERYCAP and close the file handle.

EXIT STATUS
       On success, it returns 0. Otherwise, it will return the error code.

EXAMPLES
       Query the device information of /dev/video1:

            v4l2-ctl -d1 -D

       Stream video using MMAP stream I/O from /dev/video0:

            v4l2-ctl -d0 --stream-mmap

       Stream one frame of video from /dev/video0 and store it in a file:

            v4l2-ctl --stream-mmap --stream-count=1 --stream-to=file.raw

       Stream video from /dev/video0 and stream it over the network:

            v4l2-ctl --stream-mmap --stream-to-host <hostname>

       Use 'qvidcap -p' on the host to view the video.

       Stream video from /dev/video0 using DMABUFs exported from /dev/video2:

            v4l2-ctl --stream-dmabuf --export-device /dev/video2

       Stream video from a memory-to-memory device:

            v4l2-ctl --stream-mmap --stream-out-mmap

       Stream video from a capture video device (/dev/video1) to an output video device (/dev/video2):

            v4l2-ctl -d1 --stream-mmap --out-device /dev/video2 --stream-out-dmabuf

BUGS
       This manual page is a work in progress.

       Bug reports or questions about this utility should be sent to the linux-media@vger.kernel.org mailinglist.

v4l-utils 1.18.0                                                    March 2015                                                         V4L2-CTL(1)
