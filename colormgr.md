COLORMGR(1)                                                       COLORMGR(1)

NAME
       colormgr - Color Manager Testing Tool

SYNOPSIS
       colormgr [ --verbose ]  [ --version ]

DESCRIPTION
       This manual page documents briefly the colormgr command.

       colormgr  allows  an administrator to view and change color profile to
       device mappings.

OPTIONS
       This program follows the usual GNU  command  line  syntax,  with  long
       options  starting  with  two  dashes  (`-').  A  summary of options is
       included below.

       --help Show summary of options.

COMMANDS
       This program takes commands with a variable number of arguments.

       create-device
              Create a device

       create-profile
              Create a profile

       delete-device
              Deletes a device

       delete-profile
              Deletes a profile

       device-add-profile
              Add a profile to a device that already exists

       device-get-default-profile
              Gets the default profile for a device

       device-get-profile-for-qualifier
              Returns all the profiles that match a qualifier

       device-inhibit
              Inhibits colour profiles for this device

       device-make-profile-default
              Makes a profile default for a device

       device-set-enabled
              Enables or disables the device

       device-set-kind
              Sets the device kind

       device-set-model
              Sets the device model

       device-set-serial
              Sets the device serial

       device-set-vendor
              Sets the device vendor

       find-device
              Find a device from the device ID

       find-device-by-property
              Find a device with a given property value

       find-profile
              Find a profile from the profile ID

       find-profile-by-filename
              Find a profile by filename

       get-devices
              Gets all the color managed devices

       get-devices-by-kind
              Gets all the color managed devices of a specific kind

       get-profiles
              Gets all the available color profiles

       get-sensor-reading
              Gets a reading from a sensor

       get-sensors
              Gets all the available colour sensors

       get-standard-space
              Get a standard colourspace

       import-profile
              Copies an .icc file into the  correct  per-user  directory  and
              shows information about the imported profile.

       profile-set-property
              Sets extra properties on the profile

       sensor-lock
              Locks the colour sensor

       sensor-set-options
              Sets one or more sensor options

AUTHOR
       This manual page was written by Richard Hughes <richard@hughsie.com>.

                                 18 June,2013                     COLORMGR(1)
