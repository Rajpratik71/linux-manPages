V4L2-COMPLIANCE(1)                                                 User Commands                                                V4L2-COMPLIANCE(1)

NAME
       v4l2-compliance - An application to test video4linux drivers

SYNOPSIS
       v4l2-compliance [-h] [-d <dev>] [many other options]

DESCRIPTION
       The  v4l2-compliance  tool  is used to test video4linux devices, either video, vbi, radio or swradio, both input and output. It attempts to
       test almost all aspects of a V4L2 device and it covers almost all V4L2 ioctls. It has very good support for video capture and  output,  VBI
       capture and output and (software) radio tuning and transmitting.

       The support for memory-to-memory devices is limited at the moment.

       If you have questions about v4l2-compliance then mail those to the linux-media@vger.kernel.org mailinglist.

       When  testing a driver always compile the utility from the latest source code from the git repository (http://git.linuxtv.org/cgit.cgi/v4l-
       utils.git/). The version supplied by linux distributions is almost certainly too old.

       In addition, if a test fails then it will output the source and line where the failure occurred, so you often need  access  to  the  source
       code to see what that test is all about.

       Note  that  v4l2-compliance not only tests for compliance against the V4L2 API, but also whether the driver is using all the correct frame‐
       works. These frameworks often automatically provide ioctls that are strictly speaking optional, but that come for free  if  you  use  those
       frameworks. By requiring their presence the v4l2-compliance utility will enforce their use.

       If  you want to submit a new V4L2 driver, then that driver must pass the v4l2-compliance tests without fails. The best method of using this
       tool to test your driver is to first test without any streaming options and fix any failures from the first reported failure to  the  last.
       Sometimes earlier failures can generate later failures, so just start fixing them in order and test again after each fix.

       Next test your driver with the -s option to do the basic streaming tests. This requires that there is a valid input or output.

       Whenever  you  run  v4l2-compliance it will save the current driver state and restore it after all tests are done (including when you press
       Ctrl-C). All the streaming tests are performed using the saved configuration. This makes it possible to prepare for the streaming tests  by
       configuring the device before calling v4l2-compliance.

       Finally you should test your driver using the -f and -c options to verify that all video pixel formats are correctly supported. You need to
       perform all three streaming tests for all inputs and outputs. You can use the -a option to automate that if that is possible for your hard‐
       ware.

       If your driver passes all tests, then your can be confident that your driver is in very good shape!

OPTIONS
       -d, --device <dev>
              Use  device  <dev>  as the video device. If <dev> is a number, then /dev/video<dev> is used.  Otherwise if -z was specified earlier,
              then <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the  bus  info
              string as specified by the -z option.

       -V, --vbi-device <dev>
              Use  device  <dev> as the vbi device. If <dev> is a number, then /dev/vbi<dev> is used.  Otherwise if -z was specified earlier, then
              <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the bus info string
              as specified by the -z option.

       -r, --radio-device <dev>
              Use  device  <dev>  as the radio device. If <dev> is a number, then /dev/radio<dev> is used.  Otherwise if -z was specified earlier,
              then <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the  bus  info
              string as specified by the -z option.

       -S, --sdr-device <dev>
              Use  device  <dev>  as the SDR device. If <dev> is a number, then /dev/swradio<dev> is used.  Otherwise if -z was specified earlier,
              then <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the  bus  info
              string as specified by the -z option.

       -t, --touch-device <dev>
              Use  device  <dev>  as the touch device. If <dev> is a number, then /dev/v4l-touch<dev> is used.  Otherwise if -z was specified ear‐
              lier, then <dev> is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the  bus
              info string as specified by the -z option.

       -u, --subdev-device <dev>
              Use  device <dev> as the v4l-subdevX device. If <dev> is a number, then /dev/v4l-subdev<dev> is used.  Otherwise if -z was specified
              earlier, then <dev> is the entity name -e, --exp-buf-device <dev> Use device <dev> as the video device used to export DMABUFfers for
              doing DMABUF streaming tests. If <dev> is a number, then /dev/video<dev> is used.  Otherwise if -z was specified earlier, then <dev>
              is the entity name or interface ID (if prefixed with 0x) as found in the topology of the media device with the bus  info  string  as
              specified by the -z option.  If this option is not specified, then the DMABUF streaming tests will be skipped.

       -z, --media-bus-info <bus-info>
              Find  the media device with the given bus info string. If set, then the options above can use the entity name or interface ID to re‐
              fer to the device nodes. Example: v4l2-compliance -z platform:vivid-000 -d vivid-000-vid-cap

       -m, --media-device <dev>
              Use device <dev> as the media controller device. Besides this device it also tests all interfaces it finds.  If <dev> starts with  a
              digit,  then  /dev/media<dev>  is used.  If <dev> doesn't exist, then attempt to find a media device with a bus info string equal to
              <dev>. Example: v4l2-compliance -m platform:vivid-000

       -M, --media-device-only <dev>
              Use device <dev> as the media controller device. Only test this device, don't walk over all the interfaces.  If <dev> starts with  a
              digit,  then  /dev/media<dev>  is used.  If <dev> doesn't exist, then attempt to find a media device with a bus info string equal to
              <dev>. Example: v4l2-compliance -M platform:vivid-000

       --stream-from [<pixelformat>=]<file>, --stream-from-hdr [<pixelformat>=]<file>
              Use the contents of the file to fill in output buffers.  If the fourcc of the pixelformat is given, then use  the  file  for  output
              buffers  using  that  pixelformat only.  The --stream-from-hdr variant uses the format written by v4l2-ctl --stream-to-hdr where the
              payload sizes for each buffer are stored in a header. Useful for compressed formats.

       -s, --streaming <count>
              Enable the streaming tests. Set <count> to the number of frames to stream (default 60).  This requires that  before  v4l2-compliance
              is  called  the  device  has  been configured with a valid input (or output) and frequency (when the device has a tuner). For DMABUF
              testing --expbuf-device needs to be set as well.

              The configuration of the driver at the time v4l2-compliance was called will be used for the streaming tests.

       -f, --stream-all-formats [<count>]
              Test whether all available formats can be streamed. This attempts to stream using MMAP mode or read/write  (if  V4L2_MEMORY_MMAP  is
              not  available) for one second for all formats, at all sizes, at all intervals and with all field values. In addition, if the driver
              supports scaling, cropping or composing it will test that as well in various combinations. If the driver supports a lot of  combina‐
              tions then this test can take a long time. If <count> is given, then stream for that many frames instead of for one second.

              The configuration of the driver at the time v4l2-compliance was called will be used for the streaming tests.

       -c, --stream-all-color color=red|green|blue,skip=<skip>,perc=<perc>
              For all supported, non-compressed formats stream <skip + 1> frames. For the last frame go over all pixels and calculate which of the
              R, G and B color components of a pixel has the highest value and count that as a red, green or blue pixel.  The test succeeds if  at
              least  perc  percent of the frame has the given color.  This requires that a valid and predominantly red, green or blue video signal
              is present on the input(s). If skip is not specified, then just capture the first frame. A non-zero skip value is useful if it takes
              a few frames for the device to calibrate. If perc is not specified, then this defaults to 90%.

              Most signal generators are able to generate pure red, blue or green video. For cameras you can print a completely red, green or blue
              picture and hold it before the camera.

              The goal of this test is to determine if all pixel formats will interpret the red, green and blue colors correctly and that no color
              components are swapped.

              The configuration of the driver at the time v4l2-compliance was called will be used for the streaming tests.

       -a, --stream-all-io
              Do  the  -s,  -c  and -f streaming tests for all inputs or outputs instead of just the current input or output. This requires that a
              valid video signal is present on all inputs or that all outputs are hooked up.

       -E, --exit-on-fail
              Exit this application when the first failure occurs instead of continuing with a possible inconsistent state.

       -C, --color <when>
              Highlight OK/warn/fail/FAIL strings with colors. OK is marked green, warn is marked bold, and fail/FAIL are marked bright red if en‐
              abled. <when> can be always, never, or auto (the default).

       -n, --no-warnings
              Turn off warning messages. They are still counted in the summary, but you won't see them.

       -P, --no-progress
              Turn off progress messages. Useful when redirecting the output to a file.

       -T, --trace
              Trace all called ioctls.

       -v, --verbose
              Turn on verbose reporting.

       -w, --wrapper
              Use the libv4l2 wrapper library for all V4L2 device accesses. Note that doing this will cause some tests to fail because the libv4l2
              library isn't fully V4L2 compliant. By default v4l2-compliance will bypass libv4l2 and access the V4L2 devices directly.

       -W, --exit-on-warn
              Exit this application when the first warning occurs instead of continuing.

       -h, --help
              Prints the help message.

EXIT STATUS
       On success, it returns 0. Otherwise, it will return the error code.

BUGS
       This is a work in progress, and every so often it turns out that some tests done by v4l2-compliance are too strict or plain wrong.  If  you
       suspect that might be the case, then report such bugs to the linux-media@vger.kernel.org mailinglist.

v4l-utils 1.18.0                                                    March 2015                                                  V4L2-COMPLIANCE(1)
