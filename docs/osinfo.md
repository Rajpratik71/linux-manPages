osinfo(1)                                                                                                                                                                                           osinfo(1)



NAME
       osinfo - gather information regarding the running operating system

SYNOPSIS
       osinfo [ -s ] [ -h hostname ] [ -p portnumber ]
              [ -u username ] [ -w password ] [ -t timeout ]
              [ -c ] [ --help ] [ --version ]

DESCRIPTION
       The  osinfo  command  displays  information regarding the operating system, gathered via WBEM using the PG_OperatingSystem class supported by the OperatingSystem Provider (bundled with OpenPegasus).
       osinfo requires the CIM Server to be installed and running.

       By default, the information is formatted for display, converting CIMDateTime strings into a more user-readable format (see Examples), and converting the total number of seconds of  uptime  into  the
       appropriate number of days, hours, minutes, and seconds.

       If a property value is unavailable, it will be shown as "Unknown"

   Options
       osinfo recognizes the following options:

              -c             Use  the  CIM formats for DateTime and SystemUpTime values (not the formatting done by default).  As specified by the DMTF, the CIMDateTime format is yyyymmddhhmmss.mmmmmmsutc,
                             where yyyy is a 4-digit year, mm is the month, dd is the day, hh is the hour on a 24-hour clock, mm is the minute, ss is the second, mmmmmm is the number of microseconds, s  is
                             a  "+" or "-" indicating the sign of the UTC (Universal Time Code) correction field (since the DateTime is returned in the local time zone of the system), and utc is the offset
                             from UTC in minutes.

              -h hostname    Connect to the CIM Server on the specified host.  If this option is not specified, osinfo connects to the localhost.

              --help         Display command usage information.

              -p portnumber  Connect to the CIM Server on the specified port number.  If this option is not specified, osinfo connects to the default port for the wbem-http service, or if the -s option  is
                             specified, to the default port for the wbem-https service.

              -s             Enable  the use of the SSL protocol between osinfo and the CIM server.  The -s option should be specified if the CIM Server on the specified hostname/portnumber expects clients
                             to connect using HTTPS.

              -t timeout     Wait the specified number of milliseconds on sending a request, before timing out if no response has been received.  The timeout value must be an integer value greater than 0.

              -u username    Connect as the specified R username .  If username is not specified, the current logged in user is used for authentication.  This option is  ignored  if  neither  hostname  nor
                             portnumber is specified.

              --version      Display CIM Server version.

              -w password    Authenticate the connection using the specified password .  This option is ignored if neither hostname nor portnumber is specified.  WARNING: A password should not be specified
                             on the command line on a multi-user system, since command-line options are typically world-readable for a short window of time.  If the remote host requests authentication  and
                             this option is not specified, osinfo will prompt for the password.

EXIT STATUS
       When an error occurs, an error message is written to stderr and an appropriate value is returned.  The following values are returned:

              0      Success
              1      Error

USAGE NOTE
       The osinfo command requires that the CIM Server is running.

DIAGNOSTICS
       osinfo error: Cannot connect

              The CIMOM is not running.  Start the CIMOM with the cimserver command and re-run osinfo .

EXAMPLES
       Run the default osinfo command.


       OperatingSystem Information
         Host: myserver.hp.com
         Name: HP-UX
         Version: B.11.00
         UserLicense: Unlimited user license
         OSCapability: 32 bit
         LastBootTime: Sep 24, 2001  9:16:18 (-0700)
         LocalDateTime: May 23, 2002  10:55:54 (-0700)
         SystemUpTime: 20828377 seconds = 241 days, 1 hr, 39 mins, 37 secs

       The system myserver.hp.com is running version B.11.00 of HP-UX, has an unlimited user license, and is 32-bit capable.  The Operating System was last booted on Sept 24, 2001 and the local date
       and time are given.  All time values are offset from GMT by -7 hours.

       Run osinfo , with the values displayed in their CIM format

       osinfo -c

       OperatingSystem Information
         Host: rushmore.cup.hp.com
         Name: HP-UX
         Version: B.11.00
         UserLicense: Unlimited user license
         OSCapability: 32 bit
         LastBootTime: 20010924091618.000000-420
         LocalDateTime: 20020523105801.000000-420
         SystemUpTime: 20828504

       The same rushmore.cup.hp.com system is displayed, but in this output the LastBootTime and LocalDateTime values are in the CIM format.  The SystemUpTime value is in total seconds (as specified
       by CIM).  Other fields do not change, as their CIM specification is the strings themselves.

SEE ALSO
       cimserver(1).

STANDARDS CONFORMANCE
       osinfo : DMTF WBEM (Web-Based Enterprise Management) and CIM (Common Information Model)



                                                                                                                                                                                                    osinfo(1)
