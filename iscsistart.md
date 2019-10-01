ISCSISTART(8)                                                                            Linux Administrator's Manual                                                                           ISCSISTART(8)



NAME
       iscsistart - iSCSI boot tool

SYNOPSIS
       iscsistart [OPTION]

DESCRIPTION
       iscsistart will start a session using the settings passed in, or using the iBFT or Open Firmware [OF] boot information. This program should not be run to manage sessions. Its primary use is to start
       sessions used for iSCSI root boot.

OPTIONS
       [-i|--initiatorname=]name
              Set InitiatorName to name (Required if not using iBFT or OF)

       [-t|--targetname=]name
              Set TargetName to name (Required if not using iBFT or OF)

       [-g|--tgpt=]N
              Set target portal group tag to N (Required if not using iBFT or OF)

       [-a|--address=]A.B.C.D
              Set IP address to A.B.C.D (Required if not using iBFT or OF)

       [-p|--port=]N
              Set port to N (Optional. Default 3260)

       [-u|--username=]N
              Set username to N (Optional)

       [-w|--password=]N
              Set password to N (Optional)

       [-U|-username_in=]N
              Set incoming username to N (Optional)

       [-W|--password_in=]N
              Set incoming password to N (Optional)

       [-d|--debug=]debug_level
              Print debugging information

       [-b|--fwparam_connect]
              Create a session to the target using the iBFT or OF info

       [-N|--fwparam_network]
              Bring up the network as specified by iBFT or OF

       [-f|--fwparam_print]
              Print the iBFT or OF info to STDOUT

       [-P|--param=]NAME=VALUE
              Set the parameter with the name NAME to VALUE. NAME is one of the settings in the node record or iscsid.conf. Multiple params can be passed in.

       [-h|--help]
              Display this help and exit

       [-v|--version]
              Display version and exit



SEE ALSO
       iscsiadm(8)


AUTHORS
       Open-iSCSI project <http://www.open-iscsi.com/>
       Mike Christie <mchristi@redhat.com>



                                                                                                   Jan 2010                                                                                     ISCSISTART(8)
