forensics-colorize(1)                           show differences between files using color graphics                          forensics-colorize(1)

NAME
       forensics-colorize - show differences between files using color graphics

SYNOPSIS
       filecompare [-b size[bkmgpe]] [-Vh] FILE1 FILE2

       colorize [-h|-V] [-w <num>] [-ovd] FILES

DESCRIPTION
       forensics-colorize  is  a  set  of  tools to visually compare large files, as filesystem images, creating graphics of them. It is intuitive
       because the produced graphics provide a quick and perfect sense about the percentage of changes between two files.

       Comparing large textual files using a simple diff can produce a very big result in lines, causing confusion. On the  other  hand,  diff  is
       improper to compare binary files.

       forensics-colorize  uses two command line programs: filecompare and colorize.  The filecompare command is used to create a special and aux‐
       iliary input file for colorize. The colorize command will generate an intuitive graphic that will make easier  to  perceive  the  level  of
       changes between the files. In other words, you can use the filecompare command to generate a graphic to be analyzed by colorize command.

OPTIONS FOR FILECOMPARE
       -b     Set  block  size  with optional suffix b, k, m, g, p, or e. Note that the program will output at least one complete block. Make sure
              that you have enough disk space!

       -t     Use transitional colors instead of default red or green.

       -V     Display version number and exit.

       -h     Display this help message.

OPTIONS FOR COLORIZE
       -d     Change direction data flows. Default is down or right.

       -o     Change image orientation. Default is vertical.

       -v     Verbose mode.

       -w     Set output image width, defaults to 100.

       -V     Display version number and exit.

       -h     Display this help message and exit.

EXAMPLES
       To generate an initial graphic between 'test1' and 'test2' files to be analyzed by colorize:

           $ filecompare test1 test2 > test.fc

       To analyze the result:

           $ colorize test.fc

       The last command will generate the test.fc.bmp file. You can open it using a trivial image viewer, as sxiv or  similar.  If  using  default
       parameters  for  the  both  commands (filecompare and colorize), unchanged parts will be shown as green and changed parts will be colorized
       with red.

       To get larger or smaller final graphics, use the -b option for the 'filecompare' command. As an example, the following command will produce
       a result greater than the default:

           $ filecompare -b 64 test1 test2 > test.fc

NOTE
       In  most  cases,  the  default block size is the same of the logical disk sector value (now a days, 512 bytes). Try 'fdisk -l' or 'gdisk -l
       /dev/<disk>' to find the right value.

AUTHOR
       The forensics-colorize was written by Jesse Kornblum <research@jessekornblum.com>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

FORENSICS-COLORIZE 1.1                                               Sep 2015                                                forensics-colorize(1)
