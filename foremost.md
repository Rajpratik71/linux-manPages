FOREMOST(8)                                                   System Manager's Manual                                                  FOREMOST(8)

NAME
       foremost - Recover files using their headers, footers, and data structures

SYNOPSIS
       foremost [-h] [-V] [-d] [-vqwQT] [-b <blocksize>] [-o <dir>] [-t <type>] [-s <num>] [-i <file>]

BUILTIN FORMATS
       Recover files from a disk image based on file types specified by the user using the -t switch.

       jpg    Support for the JFIF and Exif formats including implementations used in modern digital cameras.

       gif

       png

       bmp    Support for windows bmp format.

       avi

       exe    Support for Windows PE binaries, will extract DLL and EXE files along with their compile times.

       mpg    Support for most MPEG files (must begin with 0x000001BA)

       wav

       riff   This will extract AVI and RIFF since they use the same file format (RIFF). note faster than running each separately.

       wmv    Note may also extract wma files as they have similar format.

       mov

       pdf

       ole    This will grab any file using the OLE file structure.  This includes PowerPoint, Word, Excel, Access, and StarWriter

       doc    Note it is more efficient to run OLE as you get more bang for your buck.  If you wish to ignore all other ole files then use this.

       zip    Note  is  will  extract .jar files as well because they use a similar format.  Open Office docs are just zip'd XML files so they are
              extracted as well.  These include SXW, SXC, SXI, and SX? for undetermined OpenOffice files.  Office 2007 files are  also  XML  based
              (PPTX,DOCX,XLSX)

       rar

       htm

       cpp    C source code detection, note this is primitive and may generate documents other than C code.

       mp4    Support for MP4 files.

       all    Run all pre-defined extraction methods. [Default if no -t is specified]

DESCRIPTION
       Recover files from a disk image based on headers and footers specified by the user.

       -h     Show a help screen and exit.

       -V     Show copyright information and exit.

       -d     Turn on indirect block detection, this works well for Unix file systems.

       -T     Time stamp the output directory so you don't have to delete the output dir when running multiple times.

       -v     Enables  verbose mode. This causes more information regarding the current state of the program to be displayed on the screen, and is
              highly recommended.

       -q     Enables quick mode. In quick mode, only the start of each sector is searched for matching headers. That is, the header  is  searched
              only  up  to the length of the longest header. The rest of the sector, usually about 500 bytes, is ignored. This mode makes foremost
              run considerably faster, but it may cause you to miss files that are embedded in other files. For example, using quick mode you will
              not be able to find JPEG images embedded in Microsoft Word documents.

              Quick  mode  should  not be used when examining NTFS file systems. Because NTFS will store small files inside the Master File Table,
              these files will be missed during quick mode.

       -Q     Enables Quiet mode. Most error messages will be suppressed.

       -w     Enables write audit only mode.  No files will be extracted.

       -a     Enables write all headers, perform no error detection in terms of corrupted files.

       -b number
              Allows you to specify the block size used in foremost.  This is relevant for file naming and quick searches.  The  default  is  512.
                   ie.  foremost -b 1024 image.dd

       -k number
              Allows  you  to  specify  the  chunk  size used in foremost.  This can improve speed if you have enough RAM to fit the image in.  It
              reduces the checking that occurs between chunks of the buffer.  For example if you had > 500MB of RAM.        ie.  foremost  -k  500
              image.dd

       -i file
              The file is used as the input file.  If no input file is specified or the input file cannot be read then stdin is used.

       -o directory
              Recovered files are written to the directory directory.

       -c file
              Sets  the  configuration  file  to  use.  If none is specified, the file "foremost.conf" from the current directory is used, if that
              doesn't exist then "/etc/foremost.conf" is used. The format for the configuration file is described  in  the  default  configuration
              file included with this program. See the CONFIGURATION FILE section below for more information.

       -s number
              Skips number blocks in the input file before beginning the search for headers.       ie.  foremost -s 512 -t jpeg -i /dev/hda1

       CONFIGURATION FILE
              The  configuration file is used to control what types of files foremost searches for. A sample configuration file, foremost.conf, is
              included with this distribution. For each file type, the configuration file describes the file's extension, whether the  header  and
              footer  are case sensitive, the maximum file size, and the header and footer for the file. The footer field is optional, but header,
              size, case sensitivity, and extension are not!

              Any line that begins with a pound sign is considered a comment and ignored. Thus, to skip a file type just put a pound sign  at  the
              beginning of that line

              Headers  and footers are decoded before use. To specify a value in hexadecimal use \x[0-f][0-f], and for octal use \[1-9][1-9][1-9].
              Spaces can be represented by \s. Example: "\x4F\123\I\sCCI" decodes to "OSI CCI".

              To match any single character (aka a wildcard) use a ?. If you need to search for the ? character, you will need to change the wild‐
              card  line *and* every occurrence of the old wildcard character in the configuration file. Do not forget those hex and octal values!
              ? is equal to \x3f and \063.

              There is a sample set of headers in the README file.

EXAMPLES
       Search for jpeg format skipping the first 100 blocks
              foremost -s 100 -t jpg -i image.dd

       Only generate an audit file, and print to the screen (verbose mode)
              foremost -av image.dd

       Search all defined types
              foremost -t all -i image.dd

       Search for gif and pdf's
              foremost -t gif,pdf -i image.dd

       Search for office documents and jpeg files in a Unix file system in verbose mode.
              foremost -vd -t ole,jpeg -i image.dd

       Run the default case
              foremost image.dd

AUTHORS
       Original Code written by Special Agent Kris Kendall and Special Agent Jesse Kornblum of the United  States  Air  Force  Office  of  Special
       Investigations.

       Modification  by  Nick  Mikus  a  Research  Associate  at the Naval Postgraduate School Center for Information Systems Security Studies and
       Research.  The modification of Foremost was part of a masters thesis at NPS.

BUGS
       When compiling foremost on systems with versions of glibc 2.1.x or older, you will get some  (harmless)  compiler  warnings  regarding  the
       implicit declaration of fseeko and ftello. You can safely ignore these warnings.

REPORTING BUGS
       Because  Foremost  could be used to obtain evidence for criminal prosecutions, we take all bug reports very seriously. Any bug that jeopar‐
       dizes the forensic integrity of this program could have serious consequenses. When submitting a bug report, please include a description of
       the problem, how you found it, and your contact information.

       Send bug reports to:
       namikus AT users d0t sf d0t net

COPYRIGHT
       This  program  is  a work of the US Government. In accordance with 17 USC 105, copyright protection is not available for any work of the US
       Government.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       There is more information in the README file.

       Foremost  was  originally designed to imitate the functionality of CarvThis, a DOS program written by the Defense Computer Forensics Lab in
       in 1999.

                                                                  v1.5 - May 2009                                                      FOREMOST(8)
