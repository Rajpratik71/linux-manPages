QMICLI(1)                                                                                       User Commands                                                                                       QMICLI(1)



NAME
       qmicli - Control QMI devices

DESCRIPTION
   Usage:
              lt-qmicli [OPTION...] - Control QMI devices

   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-dms
              Show Device Management Service options

       --help-nas
              Show Network Access Service options

       --help-wds
              Show Wireless Data Service options

       --help-pbm
              Show Phonebook Management options

       --help-pdc
              Show platform device configurations options

       --help-uim
              Show User Identity Module options

       --help-wms
              Show Wireless Messaging Service options

       --help-wda
              Show Wireless Data Administrative options

       --help-voice
              Show Voice Service options

       DMS options

       --dms-get-ids
              Get IDs

       --dms-get-capabilities
              Get capabilities

       --dms-get-manufacturer
              Get manufacturer

       --dms-get-model
              Get model

       --dms-get-revision
              Get revision

       --dms-get-msisdn
              Get MSISDN

       --dms-get-power-state
              Get power state

       --dms-uim-set-pin-protection=[(PIN|PIN2),(disable|enable),(current PIN)]
              Set PIN protection in the UIM

       --dms-uim-verify-pin=[(PIN|PIN2),(current PIN)]
              Verify PIN

       --dms-uim-unblock-pin=[(PIN|PIN2),(PUK),(new PIN)]
              Unblock PIN

       --dms-uim-change-pin=[(PIN|PIN2),(old PIN),(new PIN)]
              Change PIN

       --dms-uim-get-pin-status
              Get PIN status

       --dms-uim-get-iccid
              Get ICCID

       --dms-uim-get-imsi
              Get IMSI

       --dms-uim-get-state
              Get UIM State

       --dms-uim-get-ck-status=[(pn|pu|pp|pc|pf)]
              Get CK Status

       --dms-uim-set-ck-protection=[(pn|pu|pp|pc|pf),(disable),(key)]
              Disable CK protection

       --dms-uim-unblock-ck=[(pn|pu|pp|pc|pf),(key)]
              Unblock CK

       --dms-get-hardware-revision
              Get the HW revision

       --dms-get-operating-mode
              Get the device operating mode

       --dms-set-operating-mode=[(Operating mode)]
              Set the device operating mode

       --dms-get-time
              Get the device time

       --dms-get-prl-version
              Get the PRL version

       --dms-get-activation-state
              Get the state of the service activation

       --dms-activate-automatic=[Activation Code]
              Request automatic service activation

       --dms-activate-manual=[SPC,SID,MDN,MIN]
              Request manual service activation

       --dms-get-user-lock-state
              Get the state of the user lock

       --dms-set-user-lock-state=[(disable|enable),(current lock code)]
              Set the state of the user lock

       --dms-set-user-lock-code=[(old lock code),(new lock code)]
              Change the user lock code

       --dms-read-user-data
              Read user data

       --dms-write-user-data=[(User data)]
              Write user data

       --dms-read-eri-file
              Read ERI file

       --dms-restore-factory-defaults=[(Service Programming Code)]
              Restore factory defaults

       --dms-validate-service-programming-code=[(Service Programming Code)]
              Validate the Service Programming Code

       --dms-set-firmware-id
              Set firmware id

       --dms-get-band-capabilities
              Get band capabilities

       --dms-get-factory-sku
              Get factory stock keeping unit

       --dms-list-stored-images
              List stored images

       --dms-select-stored-image=[modem#,pri#] where # is the index
              Select stored image

       --dms-delete-stored-image=[modem#|pri#] where # is the index
              Delete stored image

       --dms-get-firmware-preference
              Get firmware preference

       --dms-set-firmware-preference=[(fwver),(config),(carrier)]
              Set firmware preference

       --dms-get-boot-image-download-mode
              Get boot image download mode

       --dms-set-boot-image-download-mode=[normal|boot-and-recovery]
              Set boot image download mode

       --dms-get-software-version
              Get software version

       --dms-set-fcc-authentication
              Set FCC authentication

       --dms-get-supported-messages
              Get supported messages

       --dms-hp-change-device-mode=[fastboot]
              Change device mode (HP specific)

       --dms-swi-get-current-firmware
              Get Current Firmware (Sierra Wireless specific)

       --dms-reset
              Reset the service state

       --dms-noop
              Just allocate or release a DMS client. Use with `--client-no-release-cid' and/or `--client-cid'

       NAS options

       --nas-get-signal-strength
              Get signal strength

       --nas-get-signal-info
              Get signal info

       --nas-get-tx-rx-info=[(Radio Interface)]
              Get TX/RX info

       --nas-get-home-network
              Get home network

       --nas-get-serving-system
              Get serving system

       --nas-get-system-info
              Get system info

       --nas-get-technology-preference
              Get technology preference

       --nas-get-system-selection-preference
              Get system selection preference

       --nas-set-system-selection-preference=[cdma-1x|cdma-1xevdo|gsm|umts|lte|td-scdma]
              Set system selection preference

       --nas-network-scan
              Scan networks

       --nas-get-cell-location-info
              Get Cell Location Info

       --nas-force-network-search
              Force network search

       --nas-get-operator-name
              Get operator name data

       --nas-get-lte-cphy-ca-info
              Get LTE Cphy CA Info

       --nas-get-rf-band-info
              Get RF Band Info

       --nas-get-supported-messages
              Get supported messages

       --nas-reset
              Reset the service state

       --nas-noop
              Just allocate or release a NAS client. Use with `--client-no-release-cid' and/or `--client-cid'

       WDS options

       --wds-start-network=["key=value,..."]
              Start network (allowed keys: apn, 3gpp-profile, 3gpp2-profile, auth (PAP|CHAP|BOTH), username, password, autoconnect=yes, ip-type (4|6))

       --wds-follow-network
              Follow the network status until disconnected. Use with `--wds-start-network'

       --wds-stop-network=[Packet data handle] OR [disable-autoconnect]
              Stop network

       --wds-get-current-settings
              Get current settings

       --wds-get-packet-service-status
              Get packet service status

       --wds-get-packet-statistics
              Get packet statistics

       --wds-get-data-bearer-technology
              Get data bearer technology

       --wds-get-current-data-bearer-technology
              Get current data bearer technology

       --wds-go-dormant
              Make the active data connection go dormant

       --wds-go-active
              Make the active data connection go active

       --wds-get-dormancy-status
              Get the dormancy status of the active data connection

       --wds-get-profile-list=[3gpp|3gpp2]
              Get profile list

       --wds-get-default-settings=[3gpp|3gpp2]
              Get default settings

       --wds-get-autoconnect-settings
              Get autoconnect settings

       --wds-set-autoconnect-settings=[(enabled|disabled|paused)[,(roaming-allowed|home-only)]]
              Set autoconnect settings (roaming settings optional)

       --wds-get-supported-messages
              Get supported messages

       --wds-reset
              Reset the service state

       --wds-bind-mux-data-port=["key=value,..."]
              Bind qmux data port to controller device (allowed keys: mux-id, ep-iface-number) to be used with `--client-no-release-cid'

       --wds-noop
              Just allocate or release a WDS client. Use with `--client-no-release-cid' and/or `--client-cid'

       PBM options

       --pbm-get-all-capabilities
              Get all phonebook capabilities

       --pbm-noop
              Just allocate or release a PBM client. Use with `--client-no-release-cid' and/or `--client-cid'

       PDC options

       --pdc-list-configs=[(platform|software)]
              List all configs

       --pdc-delete-config=[(platform|software),ConfigId]
              Delete config

       --pdc-activate-config=[(platform|software),ConfigId]
              Activate config

       --pdc-deactivate-config=[(platform|software),ConfigId]
              Deactivate config

       --pdc-load-config=[Path to config]
              Load config to device

       --pdc-noop
              Just allocate or release a PDC client. Use with `--client-no-release-cid' and/or `--client-cid'

       UIM options

       --uim-set-pin-protection=[(PIN1|PIN2|UPIN),(disable|enable),(current PIN)]
              Set PIN protection

       --uim-verify-pin=[(PIN1|PIN2|UPIN),(current PIN)]
              Verify PIN

       --uim-unblock-pin=[(PIN1|PIN2|UPIN),(PUK),(new PIN)]
              Unblock PIN

       --uim-change-pin=[(PIN1|PIN2|UPIN),(old PIN),(new PIN)]
              Change PIN

       --uim-read-transparent=[0xNNNN,0xNNNN,...]
              Read a transparent file given the file path

       --uim-get-file-attributes=[0xNNNN,0xNNNN,...]
              Get the attributes of a given file

       --uim-get-card-status
              Get card status

       --uim-get-supported-messages
              Get supported messages

       --uim-sim-power-on=[(slot number)]
              Power on SIM card

       --uim-sim-power-off=[(slot number)]
              Power off SIM card

       --uim-reset
              Reset the service state

       --uim-noop
              Just allocate or release a UIM client. Use with `--client-no-release-cid' and/or `--client-cid'

       WMS options

       --wms-get-supported-messages
              Get supported messages

       --wms-reset
              Reset the service state

       --wms-noop
              Just allocate or release a WMS client. Use with `--client-no-release-cid' and/or `--client-cid'

       WDA options

       --wda-set-data-format=["key=value,..."]
              Set data format (allowed keys: link-layer-protocol (802-3|raw-ip), ul-protocol (tlp|qc-ncm|mbim|rndis|qmap), dl-protocol (tlp|qc-ncm|mbim|rndis|qmap), dl-datagrams-max-size, dl-max-datagrams,
              ep-type (undefined|hsusb), ep-iface-number)

       --wda-get-data-format
              Get data format

       --wda-get-supported-messages
              Get supported messages

       --wda-noop
              Just allocate or release a WDA client. Use with `--client-no-release-cid' and/or `--client-cid'

       VOICE options

       --voice-get-config
              Get Voice service configuration

       --voice-get-supported-messages
              Get supported messages

       --voice-noop
              Just allocate or release a VOICE client. Use with `--client-no-release-cid' and/or `--client-cid'

   Application Options:
       -d, --device=[PATH]
              Specify device path

       -w, --get-wwan-iface
              Get the WWAN iface name associated with this control port

       -e, --get-expected-data-format
              Get the expected data format in the WWAN iface

       -E, --set-expected-data-format=[802-3|raw-ip]
              Set the expected data format in the WWAN iface

       --get-service-version-info
              Get service version info

       --device-set-instance-id=[Instance ID]
              Set instance ID

       --device-open-version-info
              Run version info check when opening device

       --device-open-sync
              Run sync operation when opening device

       -p, --device-open-proxy
              Request to use the 'qmi-proxy' proxy

       --device-open-qmi
              Open a cdc-wdm device explicitly in QMI mode

       --device-open-mbim
              Open a cdc-wdm device explicitly in MBIM mode

       --device-open-auto
              Open a cdc-wdm device in either QMI or MBIM mode (default)

       --device-open-net=[net-802-3|net-raw-ip|net-qos-header|net-no-qos-header]
              Open device with specific link protocol and QoS flags

       --client-cid=[CID]
              Use the given CID, don't allocate a new one

       --client-no-release-cid
              Do not release the CID when exiting

       -v, --verbose
              Run action with verbose logs, including the debug ones

       --silent
              Run action with no logs; not even the error/warning ones

       -V, --version
              Print version

       qmicli 1.18.0 Copyright © 2012-2017 Aleksander Morgado License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html> This is free software: you are  free  to  change  and  redis‐
       tribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for qmicli is maintained as a Texinfo manual.  If the info and qmicli programs are properly installed at your site, the command

              info qmicli

       should give you access to the complete manual.



qmicli                                                                                            March 2017                                                                                        QMICLI(1)
