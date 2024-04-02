mount.crypt(8)                                                                                    pam_mount                                                                                    mount.crypt(8)



Name
       mount.crypt - mount a dm-crypt encrypted volume

Syntax
       mount.crypt [-nrv] [-o options] device directory

Options
       -o options
              Set further mount options. mount.crypt will take out its own options it recognizes and passes any remaining options on to the underlying mount program. See below for possible options.

       -n     Do not update /etc/mtab. Note that this makes it impossible to unmount the volume by naming the container - you will have to pass the mountpoint to umount.crypt.

       -r     Set  up  the loop device (if necessary) and crypto device in read-only mode.  (The mount itself will necessarily also be read-only.) Note that doing a remount using `mount /mnt -o remount,rw`
              will not make the mount readwrite. The crypto and loop devices will have to be disassociated first.

       -v     Turn on debugging and be a bit more verbose.

Mount options
       allow_discard
              Enables discard passthrough support. This option does not cause the filesystem to be mounted with discard enabled, but does allow fstrim to be manually run.

       cipher The cryptsetup cipher used for the encrypted volume. This option is mandatory for PLAIN (non-LUKS) volumes. pmt-ehd(8) defaults to creating volumes with "aes-cbc-essiv:sha256" as a cipher.

       crypto_name
              Select the name for the crypto device (optional). This option is currently only usable with dm-crypt systems.

       fsck   Run fsck on the container before mounting it.

       fsk_cipher
              The OpenSSL cipher used for the filesystem key. The special keyword "none" can be used to bypass decryption and pass the file contents directly to libcryptsetup.

       fsk_hash
              The OpenSSL hash used for producing key and IV.

       fstype The exact type of filesystem in the encrypted container. The default is to let the kernel autodetect.

       hash   The cryptsetup hash used for the encrypted volume. This defaults to no hashing, because pam_mount assumes EHD volumes with strong and simple fskey generation.

       keyfile
              The path to the key file. This option is mandatory for "normal" crypto volumes and should not be used for LUKS volumes.

       remount
              Causes the filesystem to be remounted with new options. Note that mount.crypt cannot switch the underlying loop device (if applies) or the crypto device between read-only and read-write  once
              it  is  created;  only  the  actual filesystem mount can be changed, with limits. If the loop device is read-only, the crypto device will be read-only, and changing the mount to read-write is
              impossible.  Similarly, going from rw to ro will only mark the mount read-only, but not the crypto or loop device, thus making it impossible to set the  filesystem  the  crypto  container  is
              located on to read-only.

       ro     Same as the -r option.

       verbose
              Same as the -v option.

Obsolete mount options
       This section is provided for reference.

       loop   This option used to set up a loop device, because cryptsetup(8) expects a block device. The option is ignored because mount.crypt can figure this out on its own.



pam_mount                                                                                         2011-12-15                                                                                   mount.crypt(8)
