AMIDI(1)                                                                                 General Commands Manual                                                                                 AMIDI(1)

NAME
       amidi - read from and write to ALSA RawMIDI ports

SYNOPSIS
       amidi [-p port] [-s file | -S data] [-r file] [-d] [-t seconds] [-a]

DESCRIPTION
       amidi is a command-line utility which allows one to receive and send SysEx (system exclusive) data from/to external MIDI devices.  It can also send any other MIDI commands.

       amidi handles only files containing raw MIDI commands, without timing information.  amidi does not support Standard MIDI (.mid) files, but aplaymidi(1) and arecordmidi(1) do.

OPTIONS
       Use the -h, -V, -l, or -L options to display information; or use at least one of the -s, -r, -S, or -d options to specify what data to send or receive.

       -h, --help
              Help: prints a list of options.

       -V, --version
              Prints the current version.

       -l, --list-devices
              Prints a list of all hardware MIDI ports.

       -L, --list-rawmidis
              Prints all RawMIDI definitions.  (used when debugging configuration files)

       -p, --port=name
              Sets  the  name  of the ALSA RawMIDI port to use.  If this is not specified, amidi uses the default port defined in the configuration file (the default for this is port 0 on card 0, which
              may not exist).

       -s, --send=filename
              Sends the contents of the specified file to the MIDI port.  The file must contain raw MIDI commands (e.g. a .syx file); for Standard MIDI (.mid) files, use aplaymidi(1).

       -r, --receive=filename
              Writes data received from the MIDI port into the specified file.  The file will contain raw MIDI commands (such as in a .syx file); to record a Standard MIDI  (.mid)  file,  use  arecord‐
              midi(1).

              amidi will filter out any Active Sensing bytes (FEh), unless the -a option has been given.

       -S, --send-hex="..."
              Sends the bytes specified as hexadecimal numbers to the MIDI port.

       -d, --dump
              Prints data received from the MIDI port as hexadecimal bytes.  Active Sensing bytes (FEh) will not be shown, unless the -a option has been given.

              This option is useful for debugging.

       -t, --timeout=seconds
              Stops receiving data when no data has been received for the specified amount of time.

              If this option has not been given, you must press Ctrl+C (or kill amidi) to stop receiving data.

       -a, --active-sensing
              Does not ignore Active Sensing bytes (FEh) when saving or printing received MIDI commands.

EXAMPLES
       amidi -p hw:0 -s my_settings.syx
              will send the MIDI commands in my_settings.syx to port hw:0.

       amidi -S 'F0 43 10 4C 00 00 7E 00 F7'
              sends an XG Reset to the default port.

       amidi -p hw:1,2 -S F0411042110C000000000074F7 -r dump.syx -t 1
              sends  a  “Parameter  Dump  Request”  to  a  GS device, saves the received parameter data to the file dump.syx, and stops after the device has finished sending data (when no data has been
              received for one second).

       amidi -p virtual -d
              creates a virtual RawMIDI port and prints all data sent to this port.

FILES
       /usr/share/alsa/alsa.conf default rawmidi definitions
       /etc/asound.conf system-wide rawmidi definitions
       ~/.asoundrc user specific rawmidi definitions

SEE ALSO
       aplaymidi(1)
       arecordmidi(1)

AUTHOR
       Clemens Ladisch <clemens@ladisch.de>

                                                                                               26 Jun 2006                                                                                       AMIDI(1)
