
RAS-MC-CTL(8)                                                                        RAS memory controller admin utility                                                                        RAS-MC-CTL(8)



NAME
       ras-mc-ctl - RAS memory controller admin utility


SYNOPSIS
       ras-mc-ctl [OPTION]...


DESCRIPTION
       The ras-mc-ctl program is a perl(1) script which performs some useful RAS administration tasks on EDAC (Error Detection and Correction) drivers.


OPTIONS
       --help Display a brief usage message.

       --mainboard
              Print mainboard vendor and model for this hardware, if available.  The method used by ras-mc-ctl to obtain the mainboard vendor and model information for the current system is described below
              in the MAINBOARD CONFIGURATION section.

       --status
              Print the status of EDAC drivers (loaded or unloaded).

       --quiet
              Be less verbose when executing an operation.

       --register-labels
              Register motherboard DIMM labels into EDAC driver sysfs files.  This option uses the detected mainboard manufacturer and model number in combination with a "labels database" found in  any  of
              the  files  under  /etc/ras/dimm_labels.d/* or in the labels.db file at /etc/ras/dimm_labels.db. An entry for the current hardware must exist in the labels database for this option to do any‐
              thing.

       --print-labels
              Display the configured labels for the current hardware, as well as the current labels registered with EDAC.

       --guess-labels
              Print DMI labels, when bank locator is available in the DMI table.  It helps to fill the labels database at /etc/ras/dimm_labels.d/.

       --labeldb=DB
              Specify an alternate location for the labels database.

       --delay=time
              Specify a delay of time seconds before registering DIMM labels.  Only meaninful if used together with --register-labels.

       --layout
              Prints the memory layout as detected by the EDAC driver. Useful to check if the EDAC driver is properly detecting the memory controller architecture.


MAINBOARD CONFIGURATION
       The ras-mc-ctl script uses the following method to determine the current system's mainboard vendor and model information:


       1.  If the config file /etc/edac/mainboard exists, then it is parsed by ras-mc-ctl. The mainboard config file has the following simple syntax:

                  vendor = <mainboard vendor string>
                  model =  <mainboard model string>
                  script = <script to gather mainboard information>

           Where anything after a '#' character on a line is considered a comment.  If the keyword script is specified, then that script or executable is run by ras-mc-ctl to gather  the  mainboard  vendor
           and model information. The script should write the resulting information on stdout in the same format as the mainboard config file.


       2.  If no mainboard config file exists, then ras-mc-ctl will attempt to read DMI information from the sysfs files

                /sys/class/dmi/id/board_vendor
                /sys/class/dmi/id/board_name



       3.  If the sysfs files above do not exist, then ras-mc-ctl will fall back to parsing output of the dmidecode(8) utility. Use of this utility will most often require that ras-mc-ctl be run as root.


SEE ALSO
       rasdaemon(1)



                                                                                                                                                                                                RAS-MC-CTL(8)
