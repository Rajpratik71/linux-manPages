GRUB-FILE(1)                                                                               General Commands Manual                                                                               GRUB-FILE(1)



NAME
       grub-file — Check if FILE is of specified type.


SYNOPSIS
       grub-file (--is-i386-xen-pae-domu | --is-x86_64-xen-domu |
                  --is-x86-xen-dom0 | --is-x86-multiboot |
                  --is-x86-multiboot2 | --is-arm-linux | --is-arm64-linux |
                  --is-ia64-linux | --is-mips-linux | --is-mipsel-linux |
                  --is-sparc64-linux | --is-powerpc-linux | --is-x86-linux |
                  --is-x86-linux32 | --is-x86-kfreebsd | --is-i386-kfreebsd |
                  --is-x86_64-kfreebsd | --is-x86-knetbsd |
                  --is-i386-knetbsd | --is-x86_64-knetbsd | --is-i386-efi |
                  --is-x86_64-efi | --is-ia64-efi | --is-arm64-efi |
                  --is-arm-efi | --is-hibernated-hiberfil | --is-x86_64-xnu |
                  --is-i386-xnu | --is-xnu-hibr | --is-x86-bios-bootsector)
                  FILE


DESCRIPTION
       grub-file is used to check if FILE is of a specified type.


OPTIONS
       --is-i386-xen-pae-domu
              Check if FILE can be booted as i386 PAE Xen unprivileged guest kernel


       --is-x86_64-xen-domu
              Check if FILE can be booted as x86_64 Xen unprivileged guest kernel


       --is-x86-xen-dom0
              Check if FILE can be used as Xen x86 privileged guest kernel


       --is-x86-multiboot
              Check if FILE can be used as x86 multiboot kernel


       --is-x86-multiboot2
              Check if FILE can be used as x86 multiboot2 kernel


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


       --is-x86_64-knetbsd
              Check if FILE is x86_64 kNetBSD


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


SEE ALSO
       info grub



                                                                                               Web Feb 26 2014                                                                                   GRUB-FILE(1)
