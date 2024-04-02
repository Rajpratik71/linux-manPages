kvm(1)                                                                Debian                                                                kvm(1)

NAME
       kvm - kvm-enabling wrapper for qemu-system-x86_64

DESCRIPTION
       The kvm wrapper script is used to provide compatibility with old qemu-kvm package which has been merged into qemu as of version 1.3.

       The script executes
              qemu-system-x86_64 -enable-kvm
       passing  all  other  command-line  arguments  to the qemu binary.  This is not the same as old kvm binary, which was using less strict con‐
       struct, similar to
              qemu-system-x86_64 -machine accel=kvm:tcg
       New wrapper ensures that kvm mode is enabled, or the VM will not start, while old code falled back to emulation (tcg)  mode  if  kvm  isn't
       available.

SEE ALSO
       qemu-system(1).

AUTHOR
       This manual page was written by Michael Tokarev <mjt@tls.msk.ru>.

1.7                                                                   2013-11                                                               kvm(1)
