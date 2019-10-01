EXAMPLE(8)                                                                                  System Administration                                                                                  EXAMPLE(8)



NAME
       fsck.cramfs - fsck compressed ROM file system

SYNOPSIS
       mkfs.cramfs [options] file

DESCRIPTION
       mkfs.cramfs is used to check the cramfs file system.

OPTIONS
       -v, --verbose
              Enable verbose messaging.

       -x, --destination [directory]
              Extract contents of the file to directory.

       -a     This option is silently ignored.

       -y     This option is silently ignored.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help and exit.

EXIT STATUS
              0      success
              4      file system was left uncorrected
              8      operation error, such as unable to allocate memory
              16     usage information was printed

SEE ALSO
       mount(8), fsck.cramfs(8)

AVAILABILITY
       The example command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        April 2013                                                                                       EXAMPLE(8)
