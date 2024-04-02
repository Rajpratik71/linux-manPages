MSTFLINT,(1)                                                                                    User Commands                                                                                    MSTFLINT,(1)



NAME
       mstflint, - manual page for mstflint, mstflint 4.11.0, built on Nov 21 2018, 16:13:21. Git SHA Hash: N/A

DESCRIPTION
       NAME

              MstFlint - Flash Interface

       SYNOPSIS

              MstFlint [OPTIONS] <command> [Parameters]

              [-d|--device  <device>]  [-i|--image  <image>]  [-h|--help]  [--hh]  [-y|--yes]  [--no]  [--guid  <GUID>]  [--guids  <GUIDS...>] [--mac <MAC>] [--macs <MACs...>] [--uid <UID>] [--blank_guids]
              [--clear_semaphore] [--qq] [--nofs] [--allow_rom_change] [--override_cache_replacement] [--no_flash_verify] [--use_fw]  [-s|--silent]  [--vsd  <string>]  [--use_image_ps]  [--use_image_guids]
              [--use_image_rom]  [--use_dev_rom]  [--ignore_dev_data]  [--no_fw_ctrl]  [--dual_image] [--striped_image] [--banks <bank>] [--log <log_file>] [--flash_params <type, log2size, num_of_flashes>]
              [-v|--version] [--private_key <key_file>] [--key_uuid <uuid_file>] [--private_key2 <key_file>] [--hmac_key <hmac_key>] [--key_uuid2 <uuid_file>]

       DESCRIPTION

              flint is a FW (firmware) burning and flash memory operations tool for Mellanox Infiniband HCAs,Ethernet NIC cards, and switch devices.

       OPTIONS

              MstFlint [OPTIONS] <command> [Parameters]

       -d|--device <device>
              : Device flash is connected to.  Commands affected: all

       -i|--image <image>
              : Binary image file.  Commands affected: burn, verify

       -h|--help
              : Prints this message and exits

       --hh   : Prints extended command help

       -y|--yes
              : Non interactive mode - assume answer "yes" to all questions.  Commands affected: all

       --no   : Non interactive mode - assume answer "no" to all questions.  Commands affected: all

       --guid <GUID>
              : GUID base value. 4 GUIDs are automatically assigned to the following values:

       guid   -> node GUID

              guid+1 -> port1 guid+2 -> port2 guid+3 -> system image GUID.

              Note: port2 guid will be assigned even for a single port HCA - The HCA ignores this value.

              Commands affected: burn, sg

       --guids <GUIDS...>
              : 4 GUIDs must be specified here.  The specified GUIDs are assigned to the following fields, respectively: node, port1, port2 and system image GUID.

              Note: port2 guid must be specified even for a single port HCA - The HCA ignores this value.  It can be set to 0x0.

              Commands affected: burn, sg

       --mac <MAC>
              : MAC address base value. 2 MACs are automatically assigned to the following values:

       mac    -> port1

       mac+1  -> port2

              Commands affected: burn, sg

       --macs <MACs...>
              : 2 MACs must be specified here.  The specified MACs are assigned to port1, port2, respectively.  Commands affected: burn, sg

              Note: -mac/-macs flags are applicable only for Mellanox

              Technologies ethernet products.

       --uid <UID>
              : ConnectIB/SwitchIB only. Derive and set the device UIDs (GUIDs, MACs, WWNs).  UIDs are derived from the given base UID according to Mellanox Methodology Commands affected: burn, sg

       --blank_guids
              : Burn the image with blank GUIDs and MACs (where applicable). These values can be set later using the "sg" command (see details below).

              Commands affected: burn

       --clear_semaphore
              : Force clear the flash semaphore on the device.  No command is allowed when this flag is used.  NOTE: May result in system instability or flash corruption if the device or  another  applica‐
              tion is currently using the flash.  Exercise caution.

       --qq   :  Run  a  quick query. When specified, flint will not perform full image integrity checks during the query operation. This may shorten execution time when running over slow interfaces (e.g.,
              I2C, MTUSB-1).  Commands affected: query

       --nofs : Burn image in a non failsafe manner.

       --allow_rom_change
              : Allow burning/removing a ROM to/from FW image when product version is present.  Use only if you know what you are doing

       --override_cache_replacement
              : On SwitchX/ConnectIB devices: Allow accessing the flash even if the cache replacement mode is enabled.  NOTE: This flag is intended for advanced users only.  Running in this mode may  cause
              the firmware to hang.

       --no_flash_verify
              : Do not verify each write on the flash.

       --use_fw
              : Flash access will be done using FW (ConnectX-3/ConnectX-3Pro only).

       -s|--silent
              : Do not print burn progress flyer.  Commands affected: burn

       --vsd <string>
              : Write this string, of up to 208 characters, to VSD when burn.

       --use_image_ps
              : Burn vsd as appears in the given image - do not keep existing VSD on flash.  Commands affected: burn

       --use_image_guids
              : Burn (guids/macs) as appears in the given image.  Commands affected: burn

       --use_image_rom
              : Do not save the ROM which exists in the device.  Commands affected: burn

       --use_dev_rom
              : Save the ROM which exists in the device.  Commands affected: burn

       --ignore_dev_data
              : Do not attempt to take device data sections from device(sections will be taken from the image. FS3 Only).  Commands affected: burn

       --no_fw_ctrl
              : Do not attempt to work with the FW Ctrl update commands

       --dual_image
              :  Make  the  burn process burn two images on flash (previously default algorithm).  Current default failsafe burn process burns a single image (in alternating locations).  Commands affected:
              burn

       --striped_image
              : Use this flag to indicate that the given image file is in a "striped image" format.  Commands affected: query verify

       --banks <bank>
              : Set the number of attached flash devices (banks)

       --log <log_file>
              : Print the burning status to the specified log file

       --flash_params <type, log2size,

       num_of_flashes>
              : Use the given parameters to access the flash

              instead of reading them from the flash.  Supported parameters: Type: The type of the flash, such as:M25PXxx,  M25Pxx,  N25Q0XX,  SST25VFxx,  W25QxxBV,  W25Xxx,  W25Qxxx,  W25Qxxx,  AT25DFxxx,
              S25FLXXXP, S25FL11xx, MX25L16xxx, MX25Lxxx, S25FLxxx, IS25LPxxx.  log2size: The log2 of the flash size.num_of_flashes: the number of the flashes connected to the device.

       -v|--version
              : Version info.

       --private_key <key_file>
              : path to PEM formatted private key to be used by the sign command

       --key_uuid <uuid_file>
              : UUID matching the given private key to be used by the sign command

       --private_key2 <key_file>
              : path to PEM formatted private key to be used by the sign command

       --hmac_key <hmac_key>
              : path to file containing key (For FS4 image only).

       --key_uuid2 <uuid_file>
              : UUID matching the given private key to be used by the sign command

       COMMANDS SUMMARY

       burn|b : Burn flash

       query|q [full]
              : Query misc. flash/firmware characteristics,

              use "full" to get more information.

       verify|v [showitoc]
              : Verify entire flash, use "showitoc" to see

              ITOC headers in FS3/FS4 image only.

       swreset
              : SW reset the target switch device.This

              command is supported only in the In-Band access method.

       brom   <ROM-file>                            : Burn the specified ROM file on the flash.

       drom   : Remove the ROM section from the flash.

       rrom   <out-file>                            : Read the ROM section from the flash.

       bb     : Burn Block - Burns the given image as is. No

              checks are done.

       sg     [guids_num=<num|num_port1,num_port2>

              step_size=<size|size_port1,size_port2>]   |   [nocrc]                                       :  Set  GUIDs.   sv                                            :  Set  the  VSD.   ri    <out-file>
              : Read the fw image on the flash.  dc   [out-file]                              : Dump Configuration: print fw configuration

              file for the given image.

       dh     [out-file]                              : Dump Hash: dump the hash if it is integrated

              in the FW image

       set_key
              [key]                              : Set/Update the HW access key which is used to

              enable/disable access to HW.  The key can be provided in the command line or interactively typed after the command is given NOTE: The new key is activated only after the device is reset.

       hw_access
              <enable|disable> [key]           : Enable/disable the access to the HW.

              The key can be provided in the command line or interactively typed after the command is given

       hw     query                                   : Query HW info and flash attributes.

       erase|e <addr>
              : Erases sector.

       rw     <addr>                                  : Read one dword from flash

       ww     <addr> <data>                           : Write one dword to flash

       wwne   <addr> <data>                         : Write one dword to flash without sector

              erase

       wbne   <addr> <size> <data ...>              : Write a data block to flash without sector

              erase.

       wb     <data-file> <addr>                      : Write a data block to flash.

       rb     <addr> <size> [out-file]                : Read  a data block from flash

       clear_semaphore
              : Clear flash semaphore.

       qrom   : query ROM image.

       checksum|cs
              : perform MD5 checksum on FW.

              timestamp|ts <set|query|reset> [timestamp] [FW version]                                 : FW time stamping.  cache_image|ci                               : cache FW image(Windows only).  sign
              :  Sign  firmware  image  file  sign_with_hmac                                :  Sign  image with HMAC set_public_keys   [public keys binary file]  : Set Public Keys (For FS3/FS4 image only).
              set_forbidden_versions   [forbidden versions binary file]                                 : Set Forbidden Versions (For FS3/FS4 image

              only).

       RETURN VALUES

       0      : Successful completion.

       1      : An error has occurred.

       7      : For burn command - FW already updated - burn

              was aborted.

SEE ALSO
       The full documentation for mstflint, is maintained as a Texinfo manual.  If the info and mstflint, programs are properly installed at your site, the command

              info mstflint,

       should give you access to the complete manual.



mstflint, mstflint 4.11.0, built on Nov 21 2018, 16:13:21. Git SHA Hash: N/A                    November 2018                                                                                    MSTFLINT,(1)
