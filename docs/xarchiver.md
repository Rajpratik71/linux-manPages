XARCHIVER(1)                                                       User Commands                                                      XARCHIVER(1)

NAME
       xarchiver - GTK+ frontend for most used compression formats

SYNOPSIS
       xarchiver [OPTION...][archivename]

DESCRIPTION
       Xarchiver  is  a lightweight desktop environment independent GTK+ 2 frontend for manipulating 7z, arj, bzip2, gzip, rar, tar, zip, rpm, and
       deb files. It allows you to create archives and add, extract, and delete files from them. Password protected archives in the arj, 7z,  rar,
       and zip formats are supported.

OPTIONS
   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ Options

   Application Options:
       -x, --extract-to=destination archive
              Extract archive to the destination directory and quits.

       -e, --extract=archive
              Extract archive by asking the extraction directory and quits.

       -m, --multi-extract=filenames
              Multi-extract archives

       -d, --add-to=file1 file2 file3 ... fileN
              Add the given files by asking the name of the archive and quits.

       -a, --add=archive
              Add files to archive by asking their filenames and quits.

       -V, --version
              Show version and exit

       --display=DISPLAY
              X display to use

xarchiver                                                            May 2014                                                         XARCHIVER(1)
