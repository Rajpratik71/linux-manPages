pmt-ehd(8)                                                                                        pam_mount                                                                                        pmt-ehd(8)



Name
       pmt-ehd - create an encrypted disk image

Syntax
       pmt-ehd [-DFx] [-c fscipher] [-h hash] [-k fscipher_keybits] [-t fstype] -f container_path -s size_in_mb

Options
       Mandatory options that are absent are inquired interactively, and pmt-ehd will exit if stdin is not a terminal.

       -D     Turn on debugging strings.

       -F     Force operation that would otherwise ask for interactive confirmation. Multiple -F can be specified to apply more force.

       -c cipher
              The  cipher to be used for the filesystem. This can take any value that cryptsetup(8) recognizes, usually in the form of "cipher-mode[-extras]".  Recommended are aes-cbc-essiv:sha256 (this is
              the default) or aes-xts-essiv:sha256.

       -f path
              Store the new disk image at path. If the file already exists, pmt-ehd will prompt before overwriting unless -F is given. If path refers to a symlink, pmt-ehd will act even more cautious.

       -h hash
              Message digest/hash used for key derivation in the PBKDF2 stage. The default is sha512.

       -i cipher
              (This option had been removed in pam_mount/pmt_ehd 2.11.)

       -k keybits
              The keysize for the cipher specified with -c. Some ciphers support multiple keysizes, AES for example is available with at least the keysizes 192 and 256.  Defaults to 256 (to match  aes-cbc-
              essiv). Note that XTS uses two keys, but drawn from the same key material, so aes-cbc-256 is equivalent to aes-xts-512, and aes-cbc-128 is to aes-xts-256.

       -p path
              (This option had been removed in pam_mount/pmt_ehd 2.11.)

       -s size
              The initial size of the encrypted filesystem, in megabytes. This option is ignored when the filesystem is created on a block device.

       -t fstype
              Filesystem to use for the encrypted filesystem. Defaults to xfs.

       -u user
              Give the container and fskey files to user (because the program is usually runs as root, and the files would otherwise retain root ownership).

       -x     Do not initialize the container with random bytes. This may impact secrecy.

   Description
       pmt-ehd  can be used to create a new encrypted container, and replaces the previous mkehd script as well as any HOWTOs that explain how to do it manually.  Without any arguments, pmt-ehd will inter-
       actively ask for all missing parameters. To create a container with a size of 256 MB, use:

       pmt-ehd -f /home/user.cont -s 256



pam_mount                                                                                        2011-Aug-05                                                                                       pmt-ehd(8)
