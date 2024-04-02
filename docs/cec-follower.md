CEC-FOLLOWER(1)                                                    User Commands                                                   CEC-FOLLOWER(1)

NAME
       cec-follower - An application to emulate CEC followers

SYNOPSIS
       cec-follower [-h] [-d <dev>] [other options]

DESCRIPTION
       The  cec-follower  tool is used to emulate CEC followers. Based on the configured logical address(es) of the CEC device it will emulate the
       CEC behavior accordingly.

       Configuring the CEC device is done using cec-ctl. Certain CEC functionalities are only emulated if the corresponding Device  Features  flag
       is set (these are set when configuring with cec-ctl). These are:

           - Audio Return Channel (RX and TX)
           - Audio Rate Control
           - Deck Control
           - Record TV screen

       cec-follower  is basically a message loop, waiting for messages to arrive and taking the appropriate action for each message (incoming mes‐
       sages can be shown with the --show-msgs option). The follower maintains an internal state with appropriate parameters such as volume,  cur‐
       rent active source, power state and so on (state changes can be shown with the --show-state option).

       It also aims to be a reference implementation on how a follower should behave.

       cec-follower will keep track of incoming messages and look for violations of the CEC specification with regards to timings. For example, it
       will warn if it receives the same message again within 200ms after it replied <Feature Abort> ["Unrecognized Opcode"] to that message,  and
       it will check that press and hold behavior is done properly.

       cec-follower  will periodically send out polling messages to discover when a remote device is removed or a new one has appeared. When a de‐
       vice is removed, the recorded information about it is cleared. Each logical address is polled about  once  every  15  seconds.  In  between
       polls, removing a remote device or replacing it with a new one is not detected.

       When  running  compliance tests with cec-compliance, cec-follower should be run on the same device to act on incoming messages that are not
       replies to messages sent by the compliance tool. Before each test-run cec-follower should be restarted if it is running, to initialize  the
       emulated device with a clean and known initial state.

OPTIONS
       -d, --device <dev>
              Use device <dev> as the CEC device. If <dev> is a number, then /dev/cec<dev> is used.

       -D, --driver <drv>
              Use  a  cec  device  that  has  driver name <drv>, as returned by the CEC_ADAP_G_CAPS ioctl.  This option can be combined with -a to
              uniquely identify a CEC device without having to rely on the device node number.

       -a, --adapter <adap-name>
              Use a cec device that has adapter name <adap-name>, as returned by the CEC_ADAP_G_CAPS ioctl.  This option can be combined  with  -D
              to uniquely identify a CEC device without having to rely on the device node number.

       -v, --verbose
              Turn on verbose reporting.

       -w, --wall-clock
              Show timestamps as wall-clock time. This also turns on verbose reporting.

       -T, --trace
              Trace all called ioctls. Useful for debugging.

       -h, --help
              Prints the help message.

       -n, --no-warnings
              Turn off warning messages.

       -m, --show-msgs
              Show received messages.

       -s, --show-state
              Show state changes from the emulated device.

EXIT STATUS
       On success, it returns 0. Otherwise, it will return the error code.

BUGS
       This manual page is a work in progress.

       Bug reports or questions about this utility should be sent to the linux-media@vger.kernel.org mailinglist.

SEE ALSO
       cec-compliance(1), cec-ctl(1)

v4l-utils 1.18.0                                                    August 2016                                                    CEC-FOLLOWER(1)
