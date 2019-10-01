GSF-OFFICE-THUMBNAILER(1)                                                                           GNOME                                                                           GSF-OFFICE-THUMBNAILER(1)



NAME
       gsf-office-thumbnailer - office files thumbnailer for the GNOME desktop


SYNOPSIS
       gsf-office-thumbnailer [OPTIONS] infile outfile


DESCRIPTION
       This manual page briefly documents the gsf-office-thumbnailer command.

       gsf-office-thumbnailer  is  used internally by GNOME applications such as nautilus to generate thumbnails of several types of office application files. While it is possible to invoke it manually, it
       is usually invoked automatically by nautilus.


OPTIONS
       This program follows the usual GNU command line syntax, with single letter options starting with a single dash (`-') and longer options starting with two dashes (`--').


   Main options
       -i, --input=filename
              Name of file for which to create a thumbnail

       -o, --output=filename
              Name of the file in which to store the thumbnail

       -s, --size=N
              Size of thumbnail in pixels; the thumbnail will be at most N*N pixels large.


   Help options
       -?, --help
              Display a brief usage message



LICENSE
       gsf-office-thumbnailer is licensed under the terms of version 2.1 of the GNU Lesser General Public License (LGPL) as published by the Free Software Foundation. For information on this  license  look
       at the source code that came with the software or see the GNU project page ⟨http://www.gnu.org/⟩.


AUTHOR
       gsf-office-thumbnailer's primary author is Federico Mena-Quintero <federico@novell.com>.

       The initial version of this manpage was written by J.H.M. Dassen (Ray) <jdassen@debian.org>.





gsf                                                                                            August 17, 2005                                                                      GSF-OFFICE-THUMBNAILER(1)
