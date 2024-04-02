MSTCONFIG,(1)                                                                                   User Commands                                                                                   MSTCONFIG,(1)



NAME
       mstconfig, - manual page for mstconfig, mstflint 4.11.0, built on Nov 21 2018, 16:13:05. Git SHA Hash: N/A

DESCRIPTION
              NAME:

              mstconfig

              SYNOPSIS:

              mstconfig [Options] <Commands> [Parameters]

              OPTIONS:

       -d|--dev <device>
              : Perform operation for a specified MST device.

       -b|--db <filename>
              : Use a specific database file.

       -f|--file <conf_file>
              : raw configuration file.

       -h|--help
              : Display help message.

       -v|--version
              : Display version info.

       -e|--enable_verbosity
              : Show default and current configurations.

       -y|--yes
              : Answer yes in prompt.

       -a|--all_attrs
              : Show all attributes in the XML template

       -p|--private_key
              : pem file for private key

       -u|--key_uuid
              : keypair uuid

              COMMANDS:

       clear_semaphore
              : clear the tool semaphore.

       i[show_confs]
              : display information about all configurations.

       q[uery]
              : query supported configurations.

       r[eset]
              : reset all configurations to their default value.

       s[et]  : set configurations to a specific device.

       set_raw
              : set raw configuration file.(only Connect-IB/Connect-X4/LX.)

       backup : backup configurations to a file (only Connect-IB/Connect-X4/LX.). Use set_raw command to restore file.

       gen_tlvs_file
              : Generate List of all TLVs. TLVs output file name must be specified. (*)

       g[en_xml_template]
              : Generate XML template. TLVs input file name and XML output file name must be specified. (*)

       xml2raw
              : Generate Raw file from XML file. XML input file name and raw output file name must be specified. (*)

       raw2xml
              : Generate XML file from Raw file. raw input file name and XML output file name must be specified. (*)

       xml2bin
              : Generate Bin file from XML file. XML input file name and bin output file name must be specified. (*)

       create_conf
              : Generate Configuration file from XML file. XML input file name and bin output file name must be specified. (*)

       apply  : Apply a Configuration file. bin input file name must be specified. (*)

              (*) These commands do not require MST device

              To show supported configurations by device type, run show_confs command

              Examples:

       To query configurations
              : mstconfig -d 04:00.0 query

       To set configuration
              : mstconfig -d 04:00.0 set SRIOV_EN=1 NUM_OF_VFS=16 WOL_MAGIC_EN_P1=1

       To set raw configuration
              : mstconfig -d 05:00.0 -f conf_file set_raw

       To reset configuration
              : mstconfig -d 04:00.0 reset

              Supported devices:

              4th Generation devices: ConnectX3, ConnectX3-Pro (FW 2.31.5000 and above).  5th Generation devices: ConnectIB, ConnectX4, ConnectX4-LX, ConnectX5.

              Note: query device to view supported configurations by Firmware.

SEE ALSO
       The full documentation for mstconfig, is maintained as a Texinfo manual.  If the info and mstconfig, programs are properly installed at your site, the command

              info mstconfig,

       should give you access to the complete manual.



mstconfig, mstflint 4.11.0, built on Nov 21 2018, 16:13:05. Git SHA Hash: N/A                   November 2018                                                                                   MSTCONFIG,(1)
