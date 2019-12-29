UPDATE-GRUB-GFXPAYLOAD(8)             BSD System Manager's Manual            UPDATE-GRUB-GFXPAYLOAD(8)

NAME
     update-grub-gfxpayload — update /boot/grub/gfxblacklist.txt

SYNOPSIS
     update-grub-gfxpayload

DESCRIPTION
     update-grub-gfxpayload updates /boot/grub/gfxblacklist.txt from source files in
     /usr/share/grub-gfxpayload-lists/blacklist/, which disables GRUB's gfxpayload=keep facility with
     certain graphics cards.  It should normally only need to be called internally by packages.

     If you need to disable gfxpayload=keep locally (perhaps because your system starts up with a
     black or corrupt screen), then you do not need this program.  Instead, add this line to
     /etc/default/grub:

           GRUB_GFXPAYLOAD_LINUX=text

AUTHOR
     Colin Watson <cjwatson@ubuntu.com>

Ubuntu                                     December 16, 2010                                    Ubuntu
