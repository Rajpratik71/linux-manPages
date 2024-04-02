SG_GET_CONFIG(8)                                                                                  SG3_UTILS                                                                                  SG_GET_CONFIG(8)



NAME
       sg_get_config - send SCSI GET CONFIGURATION command (MMC-4 +)

SYNOPSIS
       sg_get_config [--brief] [--current] [--help] [--hex] [--inner-hex] [--list] [--raw] [--readonly] [--rt=RT] [--starting=FC] [--verbose] [--version] DEVICE

DESCRIPTION
       Sends  a SCSI GET CONFIGURATION command to DEVICE and decodes the response. The response includes the features and profiles of the device.  Typically these devices are CD, DVD, HD-DVD and BD players
       that may (but not necessarily) have media in them. These devices may well be connected via ATAPI, USB or IEEE 1394 transports. In such cases they are "SCSI" devices only in the sense that  they  use
       the "Multi-Media command" set (MMC).  MMC is a specialized SCSI command set whose definition can be found at http://www.t10.org .

       This  utility  is  based on the MMC-4 and later draft standards. See section 5 on "Features and Profile for Multi_Media devices" for more information on specific feature parameters and profiles. The
       manufacturer's product manual may also be useful.

       Since modern DVD and BD writers support many features and profiles, the decoded output from this utility can be large. There are various ways to cut down the output. If the --brief  option  is  used
       only the feature names are shown and the feature parameters are not decoded. Alternatively if only one feature is of interest then this combination of options is appropriate: "--rt=2 --starting=FC".
       Another possibility is to show only the features that are relevant to the media in the drive (i.e. "current") with the "--rt=1" option.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -b, --brief
              show the feature names but don't decode the parameters of those features.  When used with --list outputs known feature names but not known profile names.

       -c, --current
              output features marked as current. This option is equivalent to '--rt=1'.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output the response in hex (don't decode response).

       -i, --inner-hex
              decode to the feature name level then output each feature's data in hex.

       -l, --list
              list all known feature and profile names. Ignore the device name (if given).  Simply lists the feature names and profiles (followed by their hex values) that  this  utility  knows  about.  If
              --brief is also given then only feature names are listed.

       -q, --readonly
              opens the DEVICE read-only rather than read-write which is the default. The Linux sg driver needs read-write access for the SCSI GET CONFIGURATION command but other access methods may require
              read-only access.

       -r, --rt=RT
              where RT is the field of that name in the GET CONFIGURATION cdb.  Allowable values are 0, 1, 2, or 3 . The command's action also depends on the value given to the  --starting=FC  option.  The
              default  value is 0.  When RT is 0 then all features, regardless of currency, are returned (whose feature code is greater than or equal to FC given to --starting=). When RT is 1 then all cur-
              rent features are returned (whose feature code is greater than or equal to FC). When RT is 2 then the feature whose feature code is equal to FC, if  any,  is  returned.   When  RT  is  3  the
              response is reserved (probably yields an "illegal field in cdb" error). To simplify the meanings of the RT values are:
                0 : all features, current on not
                1 : only current features
                2 : only feature whose code is FC
                3 : reserved

       -R, --raw
              output response in binary (to stdout). Note that the short form is -R unlike most other utilities in this package that use -r for this action.

       -s, --starting=FC
              where  FC  is  the  feature code value. This option works closely with the --rt=RT option. The FC value is in the range 0 to 65535 (0xffff) inclusive. Its default value is 0. A value prefixed
              with "0x" (or a trailing 'h') is interpreted as hexadecimal.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       There are multiple versions of the MMC (draft) standards: MMC [1997], MMC-2 [2000],  MMC-3 [2002], MMC-4 and MMC-5. The first three are now ANSI INCITS standards with the year they became  standards
       shown in brackets. The draft immediately prior to standardization can be found at http://www.t10.org . In the initial MMC standard there was no GET CONFIGURATION command and the relevant information
       was obtained from the "CD capabilities and mechanical status mode page" (mode page 0x2a). It was later renamed the "MM capabilities and mechanical status mode page" and has  been  made  obsolete  in
       MMC-4  and MMC-5. The GET CONFIGURATION command was introduced in MMC-2 and has become a replacement for that mode page. New features such as support for "BD" (blue ray) media type can only be found
       by using the GET CONFIGURATION command. Hence older CD players may not support the GET CONFIGURATION command in which case the "MM capabilities  ..."   mode  page  can  be  checked  with  sdparm(8),
       sginfo(8) or sg_modes(8).

       In  the  2.4  series  of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices can also be specified. For example "sg_get_config /dev/hdc" will work in the 2.6
       series kernels as long as /dev/hdc is an ATAPI device. In the 2.6 series external DVD writers attached via USB could be queried with "sg_get_config /dev/scd1" for example.

EXIT STATUS
       The exit status of sg_get_config is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2012 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sginfo(8), sg_modes(8), sg_inq(8), sg_prevent(8), sg_start(8) [all in sg3_utils], sdparm(8)



sg3_utils-1.35                                                                                  December 2012                                                                                SG_GET_CONFIG(8)
