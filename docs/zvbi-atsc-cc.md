zvbi-atsc-cc(1)                                               General Commands Manual                                              zvbi-atsc-cc(1)

NAME
       zvbi-atsc-cc - ATSC Closed Caption decoder

SYNOPSIS
       zvbi-atsc-cc [ options ] [-n] station name

DESCRIPTION
       zvbi-atsc-cc  captures ATSC TV transmissions using a Linux DVB device and decodes the enclosed Closed Caption data. It can record both NTSC
       caption (EIA 608-B) and DTVCC caption (CEA 708-C).

OPTIONS
       -? -h --help --usage
              Print a short usage message.

       -q --quiet
              Suppress all progress and error messages.

       -v --verbose
              Increase verbosity.

   Device options
       -a number
       --adapter-num number
              Select a different DVB device to capture the signal (/dev/dvb/adapterN). The default is adapter 0.

       -i number
       --frontend-id number
              Select a different frontend on the DVB device (/dev/dvb/adapterN/frontendM). Most devices have only one frontend.   The  default  is
              frontend 0.

       -d number
       --demux-id number
              Select  a  different  demultiplexer  on  the  DVB  device (/dev/dvb/adapterN/demuxM). Most devices have only one demultiplexer.  The
              default is demultiplexer 0.

       -r number
       --dvr-id number
              Select a different DVR interface on the DVB device (/dev/dvb/adapterN/dvrM). Most devices have only one DVR interface.  The  default
              is DVR interface 0.

       -T
       --ts   Decode an MPEG-2 Transport Stream on standard input instead of opening a DVB device. This option is mainly intended for debugging.

              Since Transport Streams can contain multiple programs you must still specify one or more station names, which zvbi-atsc-cc will look
              up in a channel configuration file to determine the Program ID of the video elementary stream or  streams  it  should  extract.  You
              should  also  add  the  --atsc option to clarify that this is an ATSC TS and the program should expect an azap channel configuration
              file, which is otherwise inferred from the DVB device capabilities.

   Tuning options
       -e file name
       --channel-conf file name
              To tune in a TV station zvbi-atsc-cc needs a channel configuration file. We use the config file of the azap  tuning  tool  from  the
              linuxtv-dvb-apps package. You can create it with the scan tool from the same package.

              The  azap  channel  configuration file is a text file which lists one station per line. Each line contains six fields separated by a
              colon: The station name, the transponder frequency in Hz, the modulation used (8VSB, 16VSB, QAM_64, QAM_256), the video stream  PID,
              the audio stream PID, and the service ID. Empty lines and lines starting with a number sign will be ignored.

              This option selects a different channel configuration file.  The default is
              $HOME/.azap/channels.conf

       -L --list
              List all stations in the channel configuration file and their transponder frequency.

       -n station name
       --station station name
              The station to tune in. Usually the -n can be omitted.

              zvbi-atsc-cc  can record caption from multiple stations at once if they share a transponder frequency. Just specify multiple station
              names on the command line to enable this.

   Caption options
       With the caption and XDS options you specify which data zvbi-atsc-cc should extract. If multiple station  names  are  given  these  options
       apply to the succeeding station name. You must specify at least one of these options for each station.

       -c --cc
              Print any received caption on standard output.

       -C file name
       --cc-file file name
              Append any received caption to the specified file.

       -l number
       --channel number
              Print NTSC Closed Caption channel 1, 2, 3 or 4 on standard output.

       -1 ... -4 file name
       --cc1-file ... --cc4-file file name
              Filter  out NTSC Closed Caption channel CC1 ... CC4 and append the text to the specified file. CC1 is the primary, CC3 the secondary
              caption service. If both services are transmitted CC1 usually carries English, CC3 Spanish caption.

       -5 ... -8 file name
       --t1-file ... --t4-file file name
              Filter out NTSC Text service T1 ... T4 and append the text to the specified file.

       -9 ... -0 file name
       --s1-file ... --s2-file file name
              Filter out DTVCC service 1 or 2 and append the text to the specified file. Service 1 is the primary, service 2 the secondary caption
              service. If both services are transmitted service 1 usually carries English, service 2 Spanish caption.

              Digital TV stations are supposed to transmit language codes and other information about the available caption services but these are
              not presently evaluated.  zvbi-atsc-cc filters out text which does not appear to be caption, such as tickers or  vertically  printed
              text.

       -b --no-webtv
              Do not print WebTV links.

       -m --timestamps
              Prepend timestamps (YYYYMMDDHHMMSS) to caption lines.

       -s --sentences
              Print caption one sentence at a time.

       -j type
       --format type
              When  type is "plain" zvbi-atsc-cc prints caption and XDS text without any markup. When type is "vt100" it faithfully reproduces the
              caption foreground and background color, italic and underline attributes by inserting  VT.100  terminal  control  codes.  With  type
              "ntsc-cc" it mimics the output of the ntsc-cc and zvbi-ntsc-cc tool. The default is "ntsc-cc".

              zvbi-atsc-cc supports all Closed Caption character sets and converts to the encoding of the current locale, usually UTF-8.

       -p --plain
              Same as -j plain

   XDS options
       -x --xds
              Print all received XDS data on standard output.

       -X file name
       --xds-file file name
              Filter out eXtended Data Service data (station name, program name, program rating etc.) and append it as text to the specified file.

       -f type[,type]*
       --filter type[,type]*
              Filter  out  specific  XDS information: all, call (station call sign), desc (program synopsis), length, network, rating, time, time‐
              code, timezone, title. Multiple -f options accumulate. The default is "all".

EXAMPLES
       zvbi-atsc-cc -c NJN-HD

       zvbi-atsc-cc --cc1-file wnyw.txt WNYW-DT --cc1-file wwor.txt WWOR-DT

       (NJN-HD, WNYW-DT and WWOR-DT are TV stations in New York. WNYW-DT
       and WWOR-DT can be captured simultaneously because they share a
       transponder frequency.)

FILES
       $HOME/.azap/channels.conf

SEE ALSO
       zvbi-ntsc-cc, azap

       http://zapping.sourceforge.net

AUTHORS
       Michael H. Schimek (mschimek AT users.sourceforge.net)
       timecop@japan.co.jp
       Mike Baker
       Mark K. Kim

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free  Software  Foundation,
       Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

                                                                                                                                   zvbi-atsc-cc(1)
