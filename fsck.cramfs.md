FSCK.CRAMFS(8)                                                 System Administration                                                FSCK.CRAMFS(8)

NAME
       fsck.cramfs - fsck compressed ROM file system

SYNOPSIS
       fsck.cramfs [options] file

DESCRIPTION
       fsck.cramfs is used to check the cramfs file system.

OPTIONS
       -v, --verbose
              Enable verbose messaging.

       -b, --blocksize blocksize
              Use this blocksize, defaults to page size. Must be equal to what was set at creation time. Only used for --extract.

       --extract[=directory]
              Test to uncompress the whole file system. Optionally extract contents of the file to directory.

       -a     This option is silently ignored.

       -y     This option is silently ignored.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXIT STATUS
              0      success
              4      file system was left uncorrected
              8      operation error, such as unable to allocate memory
              16     usage information was printed

SEE ALSO
       mount(8), mkfs.cramfs(8)

AVAILABILITY
       The  example  command  is part of the util-linux package and is available from Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                                                          April 2013                                                      FSCK.CRAMFS(8)
