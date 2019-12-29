hp-scan(1)                                   User Manuals                                   hp-scan(1)

NAME
       hp-scan - Scan Utility

DESCRIPTION
       SANE-based scan utility for HPLIP supported all-in-one/mfp devices.

SYNOPSIS
       hp-scan [DEVICE_URI|PRINTER_NAME] [MODE] [OPTIONS]

PRINTER|DEVICE-URI
       To specify a device-URI:
              -d<device-uri> or --device=<device-uri>

       To specify a CUPS printer:
              -p<printer> or --printer=<printer>

MODE
       Run in interactive mode:
              -i or --interactive

OPTIONS
       Set the logging level:
              -l<level> or --logging=<level> <level>: none, info*, error, warn, debug (*default)

       Run in debug mode:
              -g (same as option: -ldebug)

       This help information:
              -h or --help

OPTIONS (GENERAL)
       Scan destinations:
              -s<dest_list> or --dest=<dest_list> where <dest_list> is a comma separated list contain‐
              ing one or more of: 'file' , 'viewer', 'editor', 'pdf', or 'print'. Use only commas  be‐
              tween values, no spaces.

       Scan mode:
              -m<mode> or --mode=<mode>. Where <mode> is 'gray'*, 'color' or 'lineart'.

       Scanning resolution:
              -r<resolution_in_dpi>  or  --res=<resolution_in_dpi> or --resolution=<resolution_in_dpi>
              where 300 is default.

       Image resize:
              --resize=<scale_in_%> (min=1%, max=400%, default=100%)

       Color Dropout Red :
              -color_dropout_red_value=<color_dropout_red_value>                                    or
              --color_dropout_red_value=<color_dropout_red_value>

       Color Dropout Green :
              -color_dropout_green_value=<color_dropout_green_value>                                or
              --color_dropout_green_value=<color_dropout_green_value>

       Color Dropout Blue :
              -color_dropout_blue_value=<color_dropout_blue_value>                                  or
              --color_dropout_blue_value=<color_dropout_blue_value>

       Color Dropout Range :
              -color_range=<color_range> or --color_range=<color_range>

       Image contrast:
              -c=<contrast> or --contrast=<contrast> The contrast range varies from device to device.

       Image brightness:
              -b=<brightness>  or --brightness=<brightness> The brightness range varies from device to
              device.

       ADF mode:
              --adf (Note, only PDF output is supported when using the ADF) --duplex or --dup for  du‐
              plex scanning using ADF.

OPTIONS (SCAN AREA)
       Specify the units for area/box measurements:
              -t<units>  or --units=<units> where <units> is 'mm'*, 'cm', 'in', 'px', or 'pt' ('mm' is
              default).

       Scan area:
              -a<tlx>,<tly>,<brx>,<bry> or --area=<tlx>,<tly>,<brx>,<bry> Coordinates are relative  to
              the  upper left corner of the scan area.  Units for tlx, tly, brx, and bry are specified
              by -t/--units (default is 'mm').  Use only commas between values, no spaces.

       Scan box:
              --box=<tlx>,<tly>,<width>,<height> tlx and tly coordinates are  relative  to  the  upper
              left  corner  of  the scan area.  Units for tlx, tly, width, and height are specified by
              -t/--units (default is 'mm').  Use only commas between values, no spaces.

       Top left x of the scan area:
              --tlx=<tlx> Coordinates are relative to the upper left corner of the scan  area.   Units
              are specified by -t/--units (default is 'mm').

       Top left y of the scan area:
              --tly=<tly>  Coordinates  are relative to the upper left corner of the scan area.  Units
              are specified by -t/--units (default is 'mm').

       Bottom right x of the scan area:
              --brx=<brx> Coordinates are relative to the upper left corner of the scan  area.   Units
              are specified by -t/--units (default is 'mm').

       Bottom right y   of the scan area:
              --bry=<bry>  Coordinates  are relative to the upper left corner of the scan area.  Units
              are specified by -t/--units (default is 'mm').

       Specify the scan area based on a paper size:
              --size=<paper size name> where <paper size name> is one of: 3x5, 4x6, 5x7,  a2_env,  a3,
              a4, a5, a6, b4, b5, c6_env, dl_env, exec, flsa, higaki, japan_env_3, japan_env_4, legal,
              letter, no_10_env, oufufu-hagaki, photo, super_b

OPTIONS ('FILE' DEST)
       Filename for 'file' destination:
              -o<file> or -f<file> or --file=<file> or --output=<file>

OPTIONS ('PDF' DEST)
       PDF viewer application:
              --pdf=<pdf_viewer>

OPTIONS ('VIEWER' DEST)
       Image viewer application:
              -v<viewer> or --viewer=<viewer>

OPTIONS ('EDITOR' DEST)
       Image editor application:
              -e<editor> or --editor=<editor>

OPTIONS ('EMAIL' DEST)
       From: address for 'email' dest:
              --email-from=<email_from_address> (required for 'email' dest.)

       To: address for 'email' dest:
              --email-to=<email__to_address> (required for 'email' dest.)

       Email subject for 'email' dest:
              --email-subject="<subject>" or --subject="<subject>" Use double quotes  (")  around  the
              subject if it contains space characters.

       Note or message for the 'email' dest:
              --email-msg="<msg>"  or --email-note="<note>" Use double quotes (") around the note/mes‐
              sage if it contains space characters.

OPTIONS ('PRINTER' DEST)
       Printer queue/printer dest:
              --dp=<printer_name> or --dest-printer=<printer_name>

       Printer device-URI dest:
              --dd=<device-uri> or --dest-device=<device-uri>

OPTIONS (ADVANCED)
       Set the scanner compression mode:
              -x<mode> or --compression=<mode>, <mode>='raw', 'none' or  'jpeg'  ('jpeg'  is  default)
              ('raw' and 'none' are equivalent)

SEE ALSO
AUTHOR
       HPLIP  (HP  Linux Imaging and Printing) is an HP developed solution for printing, scanning, and
       faxing with HP inkjet and laser based printers in Linux.

REPORTING BUGS
       The HPLIP Launchpad.net site https://launchpad.net/hplip is available to get help, report bugs,
       make suggestions, discuss the HPLIP project or otherwise contact the HPLIP Team.

COPYRIGHT
       Copyright (c) 2001-18 HP Development Company, L.P.

       This software comes with ABSOLUTELY NO WARRANTY.  This is free software, and you are welcome to
       distribute it under certain conditions. See COPYING file for more details.

Linux                                             2.2                                       hp-scan(1)
