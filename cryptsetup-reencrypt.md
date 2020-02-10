CRYPTSETUP-REENCRYPT(8)                                                                    Maintenance Commands                                                                   CRYPTSETUP-REENCRYPT(8)

NAME
       cryptsetup-reencrypt - tool for offline LUKS device re-encryption

SYNOPSIS
       cryptsetup-reencrypt <options> <device>

DESCRIPTION
       Cryptsetup-reencrypt can be used to change reencryption parameters which otherwise require full on-disk data change (re-encryption).

       You can regenerate volume key (the real key used in on-disk encryption unclocked by passphrase), cipher, cipher mode.

       Cryptsetup-reencrypt reencrypts data on LUKS device in-place. During reencryption process the LUKS device is marked unavailable.

       WARNING: The cryptsetup-reencrypt program is not resistant to hardware or kernel failures during reencryption (you can lose you data in this case).

       ALWAYS BE SURE YOU HAVE RELIABLE BACKUP BEFORE USING THIS TOOL.
       THIS TOOL IS EXPERIMENTAL.

       The  reencryption can be temporarily suspended (by TERM signal or by using ctrl+c) but you need to retain temporary files named LUKS-<uuid>.[log|org|new].  LUKS device is unavailable until reen‐
       cryption is finished though.

       Current working directory must by writable and temporary files created during reencryption must be present.

       For more info about LUKS see cryptsetup(8).

OPTIONS
       To start (or continue) re-encryption for <device> use:

       cryptsetup-reencrypt <device>

       <options> can be [--block-size, --cipher, --hash, --iter-time, --use-random | --use-urandom, --key-file,  --key-slot,  --keyfile-offset,  --keyfile-size,  --tries,  --use-directio,  --use-fsync,
       --write-log]

       For detailed description of encryption and key file options see cryptsetup(8) man page.

       --verbose, -v
              Print more information on command execution.

       --debug
              Run in debug mode with full diagnostic logs. Debug output lines are always prefixed by '#'.

       --cipher, -c <cipher-spec>
              Set the cipher specification string.

       --key-size, -s <bits>
              Set key size in bits. The argument has to be a multiple of  8.

              The possible key-sizes are limited by the cipher and mode used.

              If you are increasing key size, there must be enough space in the LUKS header for enlarged keyslots (data offset must be large enough) or reencryption cannot be performed.

              If there is not enough space for keyslots with new key size, you can destructively shrink device with --reduce-device-size option.

       --hash, -h <hash-spec>
              Specifies the hash used in the LUKS key setup scheme and volume key digest.

              NOTE: if this parameter is not specified, default hash algorithm is always used for new device header.

       --iter-time, -i <milliseconds>
              The number of milliseconds to spend with PBKDF2 passphrase processing for the new LUKS header.

       --use-random

       --use-urandom
              Define which kernel random number generator will be used to create the volume key.

       --key-file, -d name
              Read the passphrase from file.

              WARNING:  --key-file  option  can  be used only if there only one active keyslot, or alternatively, also if --key-slot option is specified (then all other keyslots will be disabled in new
              LUKS device).

              If this option is not used, cryptsetup-reencrypt will ask for all active keyslot passphrases.

       --key-slot, -S <0-7>
              Specify which key slot is used.

              WARNING: All other keyslots will be disabled if this option is used.

       --keyfile-offset value
              Skip value bytes at the beginning of the key file.

       --keyfile-size, -l
              Read a maximum of value bytes from the key file.  Default is to read the whole file up to the compiled-in maximum.

       --keep-key
              Do not change encryption key, just reencrypt the LUKS header and keyslots.

              This option can be combined only with --hash or --iter-time options.

       --tries, -T
              Number of retries for invalid passphrase entry.

       --block-size, -B value
              Use re-encryption block size of <value> in MiB.

              Values can be between 1 and 64 MiB.

       --device-size size[units]
              Instead of real device size, use specified value.

              It means that only specified area (from the start of the device to the specified size) will be reencrypted.

              WARNING: This is destructive operation.

              If no unit suffix is specified, the size is in bytes.

              Unit suffix can be S for 512 byte sectors, K/M/G/T (or KiB,MiB,GiB,TiB) for units with 1024 base or KB/MB/GB/TB for 1000 base (SI scale).

              WARNING: This is destructive operation.

       --reduce-device-size size[units]
              Enlarge data offset to specified value by shrinking device size.

              This means that last sectors on the original device will be lost, ciphertext data will be effectively shifted by specified number of sectors.

              It can be useful if you e.g. added some space to underlying partition (so last sectors contains no data).

              For units suffix see --device-size parameter description.

              WARNING: This is destructive operation and cannot be reverted.  Use with extreme care - shrinked filesystems are usually unrecoverable.

              You cannot shrink device more than by 64 MiB (131072 sectors).

       --new, N
              Create new header (encrypt not yet encrypted device).

              This option must be used together with --reduce-device-size.

              WARNING: This is destructive operation and cannot be reverted.

       --use-directio
              Use direct-io (O_DIRECT) for all read/write data operations.

              Useful if direct-io operations perform better than normal buffered operations (e.g. in virtual environments).

       --use-fsync
              Use fsync call after every written block.

       --write-log
              Update log file after every block write. This can slow down reencryption but will minimize data loss in the case of system crash.

       --batch-mode, -q
              Suppresses all warnings and reencryption progress output.

       --version
              Show the program version.

RETURN CODES
       Cryptsetup-reencrypt returns 0 on success and a non-zero value on error.

       Error codes are: 1 wrong parameters, 2 no permission, 3 out of memory, 4 wrong device specified, 5 device already exists or device is busy.

EXAMPLES
       Reencrypt /dev/sdb1 (change volume key)
              cryptsetup-reencrypt /dev/sdb1

       Reencrypt and also change cipher and cipher mode
              cryptsetup-reencrypt /dev/sdb1 -c aes-xts-plain64

       Add LUKS encryption to not yet encrypted device

              First, be sure you have space added to disk.

              Or alternatively shrink filesystem in advance.
              Here we need 4096 512-bytes sectors (enough for 2x128 bit key).

              fdisk -u /dev/sdb # move sdb1 partition end + 4096 sectors (or use resize2fs or tool for your filesystem and shrink it)

              cryptsetup-reencrypt /dev/sdb1 --new --reduce-device-size 4096S

REPORTING BUGS
       Report bugs, including ones in the documentation, on the cryptsetup mailing list at <dm-crypt@saout.de> or in the 'Issues' section on LUKS website.  Please attach the output of the  failed  com‐
       mand with the --debug option added.

AUTHORS
       Cryptsetup-reencrypt was written by Milan Broz <gmazyland@gmail.com>.

COPYRIGHT
       Copyright © 2012-2014 Milan Broz
       Copyright © 2012-2013 Red Hat, Inc.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       The project website at http://code.google.com/p/cryptsetup/

cryptsetup-reencrypt                                                                          December 2013                                                                       CRYPTSETUP-REENCRYPT(8)
