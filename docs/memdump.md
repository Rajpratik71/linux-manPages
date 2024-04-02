MEMDUMP(1)                                                    General Commands Manual                                                   MEMDUMP(1)

NAME
       memdump - memory dumper

SYNOPSIS
       memdump [-kv] [-b buffer_size] [-d dump_size] [-m map_file] [-p page_size]

DESCRIPTION
       This program dumps system memory to the standard output stream, skipping over holes in memory maps.  By default, the program dumps the con‐
       tents of physical memory (/dev/mem).

       Output is in the form of a raw dump; if necessary, use the -m option to capture memory layout information.

       Output should be sent off-host over the network, to avoid changing all the memory in  the  file  system  cache.  Use  netcat,  stunnel,  or
       openssl, depending on your requirements.

       The size arguments below understand the k (kilo) m (mega) and g (giga) suffixes. Suffixes are case insensitive.

       Options

       -k     Attempt to dump kernel memory (/dev/kmem) rather than physical memory.

              Warning: this can lock up the system to the point that you have to use the power switch (for example, Solaris 8 on 64-bit SPARC).

              Warning: this produces bogus results on Linux 2.2 kernels.

              Warning: this is very slow on 64-bit machines because the entire memory address range has to be searched.

              Warning:  kernel  virtual  memory  mappings change frequently. Depending on the operating system, mappings smaller than page_size or
              buffer_size may be missed or may be reported incorrectly.

       -b buffer_size (default: 0)
              Number of bytes per memory read operation. By default, the program uses the page_size value.

              Warning: a too large read buffer size causes memory to be missed on FreeBSD or Solaris.

       -d dump-size (default: 0)
              Number of memory bytes to dump. By default, the program runs until the memory device reports an end-of-file (Linux), or until it has
              dumped from /dev/mem as much memory as reported present by the kernel (FreeBSD, Solaris), or until pointer wrap-around happens.

              Warning: a too large value causes the program to spend a lot of time skipping over non-existent memory on Solaris systems.

              Warning: a too large value causes the program to copy non-existent data on FreeBSD systems.

       -m map_file
              Write  the  memory map to map_file, one entry per line.  Specify -m- to write to the standard error stream.  Each map entry consists
              of a region start address and the first address beyond that region. Addresses are separated by space, and are printed as hexadecimal
              numbers (0xhhhh).

       -p page_size (default: 0)
              Use page_size as the memory page size. By default the program uses the system page size.

              Warning: a too large page size causes memory to be missed while skipping over holes in memory.

       -v     Enable verbose logging for debugging purposes. Multiple -v options make the program more verbose.

BUGS
       On many hardware platforms the firmware (boot PROM, BIOS, etc.)  takes away some memory. This memory is not accessible through /dev/mem.

       This program should produce output in a format that supports structure information such as ELF.

LICENSE
       This software is distributed under the IBM Public License.

AUTHOR
       Wietse Venema
       IBM T.J. Watson Research
       P.O. Box 704
       USA

                                                                                                                                        MEMDUMP(1)
