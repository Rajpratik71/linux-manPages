FWUPDMGR(1)                                  User Commands                                 FWUPDMGR(1)

NAME
       fwupdmgr - fwupd

DESCRIPTION
   Usage:
              fwupdmgr [OPTION?]

       activate [DEVICE-ID]
              Activate devices

       clear-history
              Erase all firmware update history

       clear-offline
              Clears any updates scheduled to be updated offline

       clear-results DEVICE_ID
              Clears the results from the last update

       disable-remote REMOTE-ID
              Disables a given remote

       downgrade [DEVICE_ID]
              Downgrades the firmware on a device

       enable-remote REMOTE-ID
              Enables a given remote

       get-approved-firmware
              Gets the list of approved firmware.

       get-details FILE
              Gets details about a firmware file

       get-devices
              Get all devices that support firmware updates

       get-history
              Show history of firmware updates

       get-releases [DEVICE_ID]
              Gets the releases for a device

       get-remotes
              Gets the configured remotes

       get-results DEVICE_ID
              Gets the results from the last update

       get-topology
              Get all devices according to the system topology

       get-updates
              Gets the list of updates for connected hardware

       install FILE [ID]
              Install a firmware file on this hardware

       modify-config KEY,VALUE
              Modifies a daemon configuration value.

       modify-remote REMOTE-ID KEY VALUE
              Modifies a given remote

       refresh [FILE FILE_SIG REMOTE_ID]
              Refresh metadata from remote server

       report-history
              Share firmware history with the developers

       set-approved-firmware CHECKSUM1[,CHECKSUM2][,CHECKSUM3]
              Sets the list of approved firmware.

       unlock DEVICE_ID
              Unlocks the device for firmware access

       update Updates all firmware to latest versions available

       verify [DEVICE_ID]
              Gets the cryptographic hash of the dumped firmware

       verify-update [DEVICE_ID]
              Update the stored metadata with current ROM contents

   Help Options:
       -h, --help
              Show help options

   Application Options:
       -v, --verbose
              Show extra debugging information

       --version
              Show client and daemon versions

       --offline
              Schedule installation for next reboot when possible

       --allow-reinstall
              Allow re-installing existing firmware versions

       --allow-older
              Allow downgrading firmware versions

       --force
              Override warnings and force the action

       -y, --assume-yes
              Answer yes to all questions

       --sign Sign the uploaded data with the client certificate

       --no-unreported-check
              Do not check for unreported history

       --no-metadata-check
              Do not check for old metadata

       --no-reboot-check
              Do not check for reboot after update

       --no-history
              Do not write to the history database

       --show-all-devices
              Show devices that are not updatable

       This  tool allows an administrator to query and control the fwupd daemon, allowing them to per‐
       form actions such as installing or downgrading firmware.

fwupdmgr 1.2.10                              November 2019                                 FWUPDMGR(1)
