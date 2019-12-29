GRUB-FILE(1)                                 User Commands                                GRUB-FILE(1)

NAME
       grub-file - check file type

SYNOPSIS
       file OPTIONS FILE

DESCRIPTION
       Check if FILE is of specified type.

       --is-i386-xen-pae-domu
              Check if FILE can be booted as i386 PAE Xen unprivileged guest kernel

       --is-x86_64-xen-domu
              Check if FILE can be booted as x86_64 Xen unprivileged guest kernel

       --is-x86-xen-dom0
              Check if FILE can be used as Xen x86 privileged guest kernel

       --is-x86-multiboot
              Check if FILE can be used as x86 multiboot kernel

       --is-x86-multiboot2 Check if FILE can be used as x86 multiboot2 kernel

       --is-arm-linux
              Check if FILE is ARM Linux

       --is-arm64-linux
              Check if FILE is ARM64 Linux

       --is-ia64-linux
              Check if FILE is IA64 Linux

       --is-mips-linux
              Check if FILE is MIPS Linux

       --is-mipsel-linux
              Check if FILE is MIPSEL Linux

       --is-sparc64-linux
              Check if FILE is SPARC64 Linux

       --is-powerpc-linux
              Check if FILE is POWERPC Linux

       --is-x86-linux
              Check if FILE is x86 Linux

       --is-x86-linux32
              Check if FILE is x86 Linux supporting 32-bit protocol

       --is-x86-kfreebsd
              Check if FILE is x86 kFreeBSD

       --is-i386-kfreebsd
              Check if FILE is i386 kFreeBSD

       --is-x86_64-kfreebsd
              Check if FILE is x86_64 kFreeBSD

       --is-x86-knetbsd
              Check if FILE is x86 kNetBSD

       --is-i386-knetbsd
              Check if FILE is i386 kNetBSD

       --is-x86_64-knetbsd Check if FILE is x86_64 kNetBSD

       --is-i386-efi
              Check if FILE is i386 EFI file

       --is-x86_64-efi
              Check if FILE is x86_64 EFI file

       --is-ia64-efi
              Check if FILE is IA64 EFI file

       --is-arm64-efi
              Check if FILE is ARM64 EFI file

       --is-arm-efi
              Check if FILE is ARM EFI file

       --is-riscv32-efi
              Check if FILE is RISC-V 32bit EFI file

       --is-riscv64-efi
              Check if FILE is RISC-V 64bit EFI file

       --is-hibernated-hiberfil
              Check if FILE is hiberfil.sys in hibernated state

       --is-x86_64-xnu
              Check if FILE is x86_64 XNU (Mac OS X kernel)

       --is-i386-xnu
              Check if FILE is i386 XNU (Mac OS X kernel)

       --is-xnu-hibr
              Check if FILE is XNU (Mac OS X kernel) hibernated image

       --is-x86-bios-bootsector
              Check if FILE is BIOS bootsector

       -h,  --help              Display this help and exit.  -u, --usage             Display the usage
       of this command and exit.

SEE ALSO
       The full documentation for grub-file is maintained as a Texinfo manual.  If the info and  grub-
       file programs are properly installed at your site, the command

              info grub-file

       should give you access to the complete manual.

grub-file (GRUB) 2.04-1ubuntu12.1            November 2019                                GRUB-FILE(1)
