GFXBOOT(1)                                                     System configuration                                                     GFXBOOT(1)

NAME
       gfxboot - graphical boot screen test and config tool

SYNOPSIS
       gfxboot [ OPTIONS ] ARGS

DESCRIPTION
       gfxboot modifies and tests graphical boot loader configuration.

OPTIONS
   General options
       -a, --archive FILE|DIRECTORY
              Use  FILE  as  gfxboot  archive  (default  is  /boot/message).   If  it points to a directory, assume it is an expanded archive (see
              --expand-archive option below).

       -v, --verbose
              Increase verbosity.

       --save-temp
              Keep temporary files.

       --version
              Show gfxboot version.

       --help Print usage.

   Switching themes
       --new-theme THEME
              Activate THEME. Theme files are stored in /etc/bootsplash/themes/THEME/bootloader.

       --update-theme THEME
              Activate THEME but keep language settings from current gfxboot archive.

   Changing gfxboot config
       --show-config
              Show gfxboot config file (gfxboot.cfg).

       --change-config [SECTION1::]OPTION1=FOO1 [SECTION2::]OPTION2=FOO2 ...
              Change gfxboot config options. If sections are omitted, section "base" is used.

       --rm-config [SECTION1::]OPTION1 [SECTION2::]OPTION2 ...
              Delete gfxboot config options. If sections are omitted, section "base" is used.

       --rm-section SECTION1 SECTION2 ...
              Delete sections in gfxboot config file.

       --default-language LANG
              Make LANG the default language. LANG is a locale string (e.g. en_US).

       --add-languages LANG1 LANG2 ...
              Add translation files.

       --rm-languages LANG1 LANG2 ...
              Remove translation files.

       --config-file FILE
              Don't work on gfxboot.cfg from gfxboot archive but on FILE. NOTE: FILE will be modified even with "--test".

   Preview/test gfxboot setup
       -p, --preview
              Try current config (needs some virtual machine).

       -t, --test
              Test only (don't actually change any files).

       -b, --bootloader BOOTLOADER
              Use BOOTLOADER (grub, lilo, isolinux, syslinux, pxelinux) for preview.

       -m, --vm VM
              Use virtual machine VM (bochs, qemu, qemu32, qemu64, vbox, vbox64, vmplayer, vmware) for preview.

       --grub DIRECTORY|RPM
              Use grub from DIRECTORY or RPM (default is /).

       --lilo DIRECTORY|RPM
              Use lilo from DIRECTORY or RPM (default is /).

       --syslinux DIRECTORY|RPM
              Use syslinux from DIRECTORY or RPM (default is /).

       --isolinux DIRECTORY|RPM
              Use isolinux from DIRECTORY or RPM (default is /).

       --pxelinux DIRECTORY|RPM
              Use pxelinux from DIRECTORY or RPM (default is /).

       --password PASSWORD
              Create test config with PASSWORD for preview.

       --32   Create 32 bit test image.

       --64   Create 64 bit test image.

       --biarch
              Create biarch test image (same as using --32 and --64).

       --cdrom, --dvd
              Create iso image for preview.

       --disk Create harddisk image for preview.

       --floppy
              Create floppy image for preview.

       --net  Create tftp directory for preview.

       --save-image FILE
              Copy preview image to FILE.

       --test-add-files FILE1 FILE2 ...
              Add files to test directory.

       --test-rm-files FILE1 FILE2 ...
              Delete files from test directory.

   Adding/removing files from gfxboot archive
       --ls, --list-files
              List gfxboot archive files.

       --add-files FILE1 FILE2 ...
              Add files to gfxboot archive.

       --rm-files FILE1 FILE2 ...
              Delete files from gfxboot archive.

       --extract-files FILE1 FILE2 ...
              Copy files from gfxboot archive to current working directory.

       --show-file FILE
              Print FILE.

       --expand-archive DIRECTORY
              Create expanded gfxboot archive version in DIRECTORY. That is, only files that cannot be read directly from file system are kept  in
              a cpio archive. All others are unpacked.  Use only for isolinux, syslinux, or pxelinux.

       --pack-archive FILE
              Pack all gfxboot files into cpio archive FILE.

   Modifying help files
       --help-show FILE
              Print FILE (internal help file format) as HTML.

       --help-create FILE
              Convert HTML files passed as ARGS to FILE (internal format).

       --used-pages LINK1 LINK2 ...
              Mark pages as referenced.

       --navi FILE
              Use FILE as template for navigation links.

       --define ENTITY1=VALUE1 ENTITY2=VALUE2 ...
              Define ENTITYx with VALUEx.

FILES
       /boot/message     bootloader graphics archive (actually a cpio achive)

       /etc/bootsplash/themes
                         theme directory

       /etc/sysconfig/bootsplash
                         default theme

BUGS
       None.

AUTHOR
       Written by Steffen Winterfeldt.

SEE ALSO
       If you want to create your own theme look at the gfxboot-devel package.

gfxboot                                                              July 2008                                                          GFXBOOT(1)
