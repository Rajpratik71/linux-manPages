BRLTTY(1)                                                                                BRLTTY User's Manual                                                                                BRLTTY(1)

NAME
       brltty - refreshable braille display driver for Linux/Unix

SYNOPSIS
       brltty [option ...]

DESCRIPTION
       brltty is a background process (daemon) which provides access to the console screen (when in text mode) for a blind person using a refreshable braille display.  It drives the braille display,
       and provides complete screen review functionality.  Some speech capability has also been incorporated.

OPTIONS
       Options can be passed to brltty in a number of ways.  From most to least influential, these are:

       1.  Command Line Options

       2.  Boot Parameters

       3.  Environment Variables (if the -E (--environment-variables) option is in effect)

       4.  The Configuration File

       5.  Built-in Defaults

   Command Line Options
       The options are processed sequentially from left to right.  If an option is specified more than once, or in case of a conflict, the rightmost specification takes precedence.

       The following options are supported:

       -a table (--attributes-table=)
              The path to the attributes table.  Relative paths are anchored at /etc/brltty/Attributes.  The .atb extension is optional.  The built-in default is left_right.atb.

       -b driver,...|auto (--braille-driver=)
              The driver for the braille display (see Driver Specification).  The built-in default is auto.

       -c table (--contraction-table=)
              The path to the contraction table.  Relative paths are anchored at /etc/brltty/Contraction.  The .ctb extension is optional.

       -d device,... (--braille-device=)
              The device to which the braille display is connected.  The built-in default is usb:,bluetooth:.

              The general form of a braille device specification is qualifier:data.  For backward compatibility with earlier releases, if the qualifier is omitted then serial: is assumed.  The  fol‐
              lowing device types are supported:

              Bluetooth
                     For a bluetooth device, specify bluetooth:address.  The address must be six two-digit hexadecimal numbers separated by colons, e.g.  01:23:45:67:89:AB.

              Serial For  a serial device, specify serial:device.  The serial: qualifier is optional (for backward compatibility).  If a relative path is given then it's anchored at /dev/ (the usual
                     location where devices are defined on a Unix-like system).  The following device specifications all refer to the primary serial device on Linux: serial:ttyS0, serial:/dev/ttyS0,
                     ttyS0, /dev/ttyS0.

              USB    For  a  USB device, specify usb:.  brltty will search for the first USB device which matches the braille display driver being used.  If this is inadequate, e.g. if you have more
                     than one USB braille display which requires the same driver, then you can refine the device specification by appending the serial number of the display to it,  e.g.   usb:12345.
                     N.B.: The "identification by serial number" feature doesn't work for some models because some manufacturers either don't set the USB serial number descriptor at all or do set it
                     but not to a unique value.

              A comma-delimited list of braille devices may be specified.  If this is done then autodetection is performed on each listed device in sequence.  This feature is particularly useful  if
              you have a braille display with more than one interface, e.g. both a serial and a USB port.

       -e (--standard-error)
              Write logs to standard error rather than to the system log (useful for debugging).

       -f file (--configuration-file=)
              The path to the configuration file.  Relative paths are anchored at the current working directory.  The built-in default is /etc/brltty.conf.

       -h (--help)
              Print a command line usage summary (commonly used options only), and then exit.

       -i name (--speech-input=)
              The  file  system  object (FIFO, named pipe, named socket, etc) which gives other applications access to brltty's speech driver for text-to-speech conversion.  It's created at start-up
              and removed at termination.  Relative paths are anchored at the current working directory.  The built-in default is that the file system object is not created.

       -k table (--keyboard-table=)
              The path to the keyboard table.  Relative paths are anchored at /etc/brltty/Keyboard.  The .ktb extension is optional.

       -l level (--log-level=)
              The minimum severity level for messages written to the log.  Any of the following numbers, or any abbreviation of their corresponding names, may be specified:

              0   emergency

              1   alert

              2   critical

              3   error

              4   warning

              5   notice

              6   information

              7   debug

       The built-in default is notice.

       -m device (--midi-device=)
              The device to use for the Musical Instrument Digital Interface.  For ALSA it's client:port, where each may be either a number or a case-sensitive substring  of  its  name.   For  other
              interfaces it's the full path to an appropriate system device.  The built-in default is:

              Linux/ALSA  the first available MIDI output port

              Linux/OSS   /dev/sequencer

       -n (--no-daemon)
              Remain in the foreground (useful for debugging).

       -p device (--pcm-device=)
              The device to use for digital audio.  For ALSA it's name[:argument,...].  For other interfaces it's the full path to an appropriate system device.  The built-in default is:

              FreeBSD     /dev/dsp

              Linux/ALSA  hw:0,0

              Linux/OSS   /dev/dsp

              NetBSD      /dev/audio

              OpenBSD     /dev/audio

              Qnx         the preferred PCM output device

              Solaris     /dev/audio

       -q (--quiet)
              Suppress  the start-up messages.  This is done by reducing the default log level (see the -l (--log-level=) option) to warning (information if either -v (--verify) or -V (--version) is
              also specified).

       -r (--release-device)
              Release the device to which the braille display is connected when the current screen or window can't be read.

       -s driver,...|auto (--speech-driver=)
              The driver for the speech synthesizer (see Driver Specification).  The built-in default is auto.

       -t table (--text-table=)
              The path to the text table.  Relative paths are anchored at /etc/brltty/Text.  The .ttb extension is optional.  The built-in default is en-nabcc.ttb (the North  American  Braille  Com‐
              puter Code).

       -v (--verify)
              Print  the  start-up  messages  and  then  exit.  This always includes the versions of brltty itself, the server side of its application programming interface, and each of the selected
              braille and speech drivers.  If the -q (--quiet) option isn't also specified then it also includes the values of the options after all sources have been considered.  If more  than  one
              braille  driver  and/or  more than one braille device has been specified then braille display autodetection is performed.  If more than one speech driver has been specified then speech
              synthesizer autodetection is performed.

       -x driver (--screen-driver=)
              The screen driver.  The built-in default is operating system appropriate.

       -A name=value,... (--api-parameters=)
              Parameters for the application programming interface.  If the same parameter is specified more than once then the rightmost specification is used.  Parameter names may be abbreviated.

       -B [driver:]name=value,... (--braille-parameters=)
              Parameters for the braille display driver.  If the same parameter is specified more than once then the rightmost specification is used.  Parameter  names  may  be  abbreviated.   If  a
              parameter assignment is qualified with a driver identification code then it's only processed if that braille display driver is being used.

       -D directory (--drivers-directory=)
              The path to the directory which contains the dynamically loadable driver objects.  The built-in default is /lib/brltty.

       -E (--environment-variables)
              Recognize environment variables.

       -F file (--preferences-file=)
              The path to the preferences file.  Relative paths are anchored at /var/lib/brltty.  The built-in default is brltty.prefs.

       -H (--full-help)
              Print a command line usage summary (all options), and then exit.

       -I (--install-service)
              (Windows  only)  Install brltty as the BrlAPI service so that it will be automatically started when the system is booted, and so that applications can know that a BrlAPI server is run‐
              ning.

       -K arg (--keyboard-properties=)
              Properties of the keyboard.

       -L file (--log-file=)
              The file to which log messages are written.  Relative paths are anchored at the current working directory.  The default is to send log messages to the system log.

       -M csecs (--message-delay=)
              The message hold time in hundredths of a second.  The built-in default is 400 (4 seconds).

       -N (--no-api)
              Don't start the application programming interface.

       -P file (--pid-file=)
              The full path to the process identifier file.  If this option is supplied, brltty writes its process identifier (pid) into the specified file at start-up.  The  file  is  removed  when
              brltty terminates.

       -R (--remove-service)
              (Windows only) Remove the BrlAPI service so that brltty will not be automatically started when the system is booted, and so that applications can know that no BrlAPI server is running.

       -S [driver:]name=value,... (--speech-parameters=)
              Parameters  for  the  speech synthesizer driver.  If the same parameter is specified more than once then the rightmost specification is used.  Parameter names may be abbreviated.  If a
              parameter assignment is qualified with a driver identification code then it's only processed if that speech synthesizer driver is being used.

       -T directory (--tables-directory=)
              The path to the directory which contains the text, attributes, contraction, keyboard, and input tables.  The built-in default is /etc/brltty.

       -U directory (--updatable-directory=)
              The path to a directory which contains files that can be updated.  The built-in default is /var/lib/brltty.

       -V (--version)
              Print the versions of brltty itself, the server side of its application programming interface, and those drivers which were configured in at build-time,  and  then  exit.   If  the  -q
              (--quiet) option isn't also specified then also print copyright information.

       -W directory (--writable-directory=)
              The path to a directory which can be written to.  The built-in default is /var/run/brltty.

       -X name=value,... (--screen-parameters=)
              Parameters for the screen driver.  If the same parameter is specified more than once then the rightmost specification is used.  Parameter names may be abbreviated.

   Environment Variables
       The following environment variables are recognized if the -E (--environment-variables) option is specified:

       BRLTTY_API_PARAMETERS=name=value,...
              Parameters for the application programming interface.  See the -A (--api-parameters=) option for details.

       BRLTTY_ATTRIBUTES_TABLE=table
              The attributes table.  See the -a (--attributes-table=) option for details.

       BRLTTY_BRAILLE_DEVICE=device,...
              The device to which the braille display is connected.  See the -d (--braille-device=) option for details.

       BRLTTY_BRAILLE_DRIVER=driver,...|auto
              The driver for the braille display.  See the -b (--braille-driver=) option for details.

       BRLTTY_BRAILLE_PARAMETERS=[driver:]name=value,...
              Parameters for the braille display driver.  See the -B (--braille-parameters=) option for details.

       BRLTTY_CONFIGURATION_FILE=file
              The configuration file.  See the -f (--configuration-file=) option for details.

       BRLTTY_CONTRACTION_TABLE=table
              The contraction table.  See the -c (--contraction-table=) option for details.

       BRLTTY_MIDI_DEVICE=device
              The device to use for the Musical Instrument Digital Interface.  See the -m (--midi-device=) option for details.

       BRLTTY_PCM_DEVICE=device
              The device to use for digital audio.  See the -p (--pcm-device=) option for details.

       BRLTTY_PREFERENCES_FILE=file
              The preferences file.  See the -F (--preferences-file=) option for details.

       BRLTTY_RELEASE_DEVICE=on|off
              Release the device to which the braille display is connected when the current screen or window can't be read.  See the -r (--release-device) option for details.

       BRLTTY_SCREEN_DRIVER=driver
              The screen driver.  See the -x (--screen-driver=) option for details.

       BRLTTY_SCREEN_PARAMETERS=name=value,...
              Parameters for the screen driver.  See the -X (--screen-parameters=) option for details.

       BRLTTY_SPEECH_DRIVER=driver,...|auto
              The driver for the speech synthesizer.  See the -s (--speech-driver=) option for details.

       BRLTTY_SPEECH_INPUT=name
              The file system object which gives other applications access to brltty's speech driver for text-to-speech conversion.  See the -i (--speech-input=) option for details.

       BRLTTY_SPEECH_PARAMETERS=[driver:]name=value,...
              Parameters for the speech synthesizer driver.  See the -S (--speech-parameters=) option for details.

       BRLTTY_TEXT_TABLE=table
              The text table.  See the -t (--text-table=) option for details.

   The Configuration File
       Blank lines are ignored.  If the character # occurs on any line then all characters from it to the end of that line are treated as a comment.

       The following configuration directives are supported:

       api-parameters name=value,...
              Parameters for the application programming interface.  See the -A (--api-parameters=) option for details.

       attributes-table table
              The attributes table.  See the -a (--attributes-table=) option for details.

       braille-device device,...
              The device to which the braille display is connected.  See the -d (--braille-device=) option for details.

       braille-driver driver,...|auto
              The driver for the braille display.  See the -b (--braille-driver=) option for details.

       braille-parameters [driver:]name=value,...
              Parameters for the braille display driver.  See the -B (--braille-parameters=) option for details.

       contraction-table table
              The contraction table.  See the -c (--contraction-table=) option for details.

       midi-device device
              The device to use for the Musical Instrument Digital Interface.  See the -m (--midi-device=) option for details.

       pcm-device device
              The device to use for digital audio.  See the -p (--pcm-device=) option for details.

       preferences-file file
              The preferences file.  See the -F (--preferences-file=) option for details.

       release-device on|off
              Release the device to which the braille display is connected when the current screen or window can't be read.  See the -r (--release-device) option for details.

       screen-driver driver
              The screen driver.  See the -x (--screen-driver=) option for details.

       screen-parameters name=value,...
              Parameters for the screen driver.  See the -X (--screen-parameters=) option for details.

       speech-driver driver,...|auto
              The driver for the speech synthesizer.  See the -s (--speech-driver=) option for details.

       speech-input 0me
              The file system object which gives other applications access to brltty's speech driver for text-to-speech conversion.  See the -i (--speech-input=) option for details.

       speech-parameters [driver:]name=value,...
              Parameters for the speech synthesizer driver.  See the -S (--speech-parameters=) option for details.

       text-table table
              The text table.  See the -t (--text-table=) option for details.

   Driver Specification
       A braille display or speech synthesizer driver must be specified via its identification code:

              al  Alva

              an  Android

              at  Albatross

              ba  BrlAPI

              bc  BrailComm

              bd  Braudi

              bg  B2G

              bl  BrailleLite

              bm  Baum

              bn  BrailleNote

              cb  CombiBraille

              ec  EcoBraille

              es  eSpeak

              eu  EuroBraille

              fl  FestivalLite

              fs  FreedomScientific

              fv  Festival

              gs  GenericSay

              hd  Hedo

              hm  HIMS

              ht  HandyTech

              hw  HumanWare

              ir  Iris

              lb  Libbraille

              lt  LogText

              mb  MultiBraille

              md  MDV

              mm  BrailleMemo

              mn  MiniBraille

              mp  Mikropuhe

              mt  Metec

              no  no driver

              np  NinePoint

              pg  Pegasus

              pm  Papenmeier

              sd  SpeechDispatcher

              sk  Seika

              sw  Swift

              th  Theta

              tn  TechniBraille Systems Inc.

              ts  Telesensory Systems Inc.

              tt  TTY

              vd  VideoBraille

              vo  Voyager, Part232 (serial adapter), BraillePen/EasyLink

              vr  Virtual

              vs  VisioBraille

              vv  ViaVoice

              xs  ExternalSpeech

              xw  XWindow

              A  comma-delimited  list  of  drivers  may  be specified.  If this is done then autodetection is performed using each listed driver in sequence.  You may need to experiment in order to
              determine the most reliable order since some drivers autodetect better than others.

              If the single word auto is specified then autodetection is performed using only those drivers which are known to be reliable for this purpose.

SEE ALSO
       For full documentation, see brltty's on-line manual at [http://brltty.com/documentation.html].

brltty 5.5                                                                                    2017-04-18                                                                                     BRLTTY(1)
