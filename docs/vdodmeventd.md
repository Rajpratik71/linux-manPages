VDODMEVENTD(8)                                                                             System Manager's Manual                                                                             VDODMEVENTD(8)



NAME
       vdodmeventd - register/unregister a VDO device with dmeventd

SYNOPSIS
       vdodmeventd [options...]  vdo

DESCRIPTION
       vdodmeventd handles registration/unregistration by specifying vdo which is the name of a VDO device.

OPTIONS
       --help Print this help message and exit.

       --register
              Register a VDO device with dmeventd.

       --unregister
              Unregister a VDO device with dmeventd.

       --version
              Show the version of vdodmevent.

EXAMPLES
       vdodmeventd --register is used to register VDO devices.
              vdodmeventd --register vdo0

       vdodmeventd --unregister is used to unregister VDO devices.
              vdodmeventd --unregister vdo0

SEE ALSO
       vdo(8).



Red Hat                                                                                           2018-06-12                                                                                   VDODMEVENTD(8)
