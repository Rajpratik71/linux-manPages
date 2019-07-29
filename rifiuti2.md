
RIFIUTI2(1)                                            MS Windows recycle bin analysis tool                                            RIFIUTI2(1)

NAME
       rifiuti2 - MS Windows recycle bin analysis tool

SYNOPSIS
       rifiuti [-hvz] [-x | [-8n] [-t delim]] [-l codepage] [-o outfile] filename

       rifiuti-vista [-hvz] [-x | [-8n] [-t delim]] [-o outfile] file_or_directory

DESCRIPTION
       Rifiuti2  analyse recycle bin files from Windows. Analysis of Windows recycle bin is usually carried out during Windows computer forensics.
       Rifiuti2 can extract file deletion time, original path and size of deleted files and whether the deleted files have been moved out from the
       recycle bin since they are trashed.

       Rifiuti2  supports a wide range of Windows versions, from Windows 98 to Windows 10. The command used for analysis depends on the version of
       Windows producing the recycle bin (not the version of users´ system!), which uses vastly different format before and after Vista:

       ·      rifiuti-vista: For Vista or later, which is located in \$Recycle.bin\<SID>\.  Each deleted file has its own accompanied  index  file
              remembering the original path, file size and deletion time.  If original file is permanentsly deleted, so is the index file.

       ·      rifiuti:  For Windows 98 to XP, which uses a single index file named INFO2 under either \RECYCLED\ or \RECYCLER\<SID>\ (depending on
              filesystem).  This file keeps track record for deletion status and info for all deleted items, including those  permanently  removed
              or restored.

       By  default,  both programs dump tab-delimited fields on screen, which can be viewed on screen or imported into spreadsheet program. -x op‐
       tion instructs program to dump XML formatted content instead.

       Index field has different meaning for pre-Vista and post-Vista versions.  INFO2 has an index number for each of  deletion  item  indicating
       the  chronological order of items. For Vista version, it means the index file name instead, which matches pattern “$Ixxxxxx.<ext>”, where x
       is random alphanumeric character.

       Deleted time is represented in UTC time by default. Under tab-delimited mode, the original date/time format is preserved, while in XML mode
       ISO 8601 date/time format is used.  For example, 3PM at 2014 X´mas represented in these modes would be respectively:
              2014-12-25 15:00:00
              2014-12-25T15:00:00Z
       It would be easier for spreadsheet programs to interpret first format.

       File  size  and file path are self-explanatory, but there are some special notes.  File size can mean the real size of deleted file, or the
       cluster size it occupies on filesystem, depending on recycle bin format. File path might not always be displayable on local system  because
       it might contain characters from other localized version of Windows.

OPTIONS
       -o, --output=FILE
              Write output to FILE.

       -x, --xml
              Output in XML format instead of tab-delimited values.  With XML mode, all plain text options are disallowed, and result is always in
              UTF-8 encoding.  See below for plain text options.

       -l, --legacy-filename=CODEPAGE
              Show legacy filename if available (like “D:\Progra~1\”), and specify the CODEPAGE used in the Windows system  producing  this  INFO2
              file.  Any encodings supported by iconv(1) can be used, though for maximum accuracy of file name results, it is better to stick with
              Microsoft codepages (such as CP850 or CP1252 for west European version, CP932 for Japanese, etc).

              Note: This option is mandatory if INFO2 file is created by Windows 98. This option does not exist in rifiuti-vista.

       -z, --localtime
              Present deletion time in numeric time zone of local system running the program.  By default, UTC time is  displayed,  which  is  the
              time  value  recorded  in  index  files.  Using the X´mas example above, the time for Berlin (without daylight saving time) would be
              2014-12-25T16:00:00+0100 in ISO 8601 format.

              Note: It is possible to use any timezone of users´ choice by setting $TZ environment variable, though not recommended.  See ENVIRON‐
              MENT VARIABLE section below.

   PLAIN TEXT OUTPUT OPTIONS
       -t, --delimiter=STRING
              String  to  use  as  delimiter  (TAB by default). Several escaped characters are recognised: \r (CARRIAGE RETURN), \n (NEW LINE), \t
              (TAB), \f (FORM FEED), \v (VERTICAL TAB), \e (ESCAPE)

       -n, --no-heading
              Don´t show recycle bin path name, version and header for each field

       -8, --always-utf8
              Always display result in UTF-8 encoding

   MISCELLANEOUS OPTIONS
       -v, --version
              Print version information and exit.

       -h, --help
              Show help options and exit.

       --help-all
              Show all help options and exit.

       --help-text
              Show plain text output options and exit.

EXAMPLES
       rifiuti-vista -x -z -o result.xml \case\S-1-2-3\
              Scan for index files under \case\S-1-2-3\, adjust all deletion time for local time zone, and write XML output to result.xml

       rifiuti-vista -n -8 \case\S-1-2-3\
              Show tab-delimited result on screen in UTF-8 encoding without header

       rifiuti-vista -t '\r\n' \case\S-1-2-3\$IF96NJ3.rtf
              Only analyse a single index file and print each field in its own line

       rifiuti -t ',' -o result.csv INFO2
              Change tab-delimited result to comma-delimited and write to result.csv

       rifiuti -l CP1255 -8 -n INFO2
              Read INFO2 from Hebrew version of Windows, display 8.3 file names on screen in UTF-8 encoding without header

ENVIRONMENT VARIABLES
       The following environment variables affect execution of program:

       CHARSET, LC_CTYPE
              If recycle bin path contains non-ASCII character, these variables affect how they are displayed. UTF-8 capable  systems  are  recom‐
              mended  to set CHARSET=UTF-8 or use appropriate UTF-8 values for LC_CTYPE explicitly, otherwise path might be displayed in Universal
              Character Name sequences like \u1234.

       RIFIUTI_DEBUG
              Setting it to any non-empty value would cause programs to print more debugging output to stderr.

       TZ
              If non-empty, indicate user-specified time zone when -z option is used. Normally the time zone information is obtained  from  system
              and there is no need to set this variable. However, it can be used as a facility to temporarily override timezone for some programs,
              which can be used for situations like constructing timeline event.

              This value is OS dependent. For example, for timezone in Los Angeles, the value for Windows is “PST8PDT”, while corresponding  value
              on Linux would be “America/Los_Angeles”. Please consult manual for your operating system for more info.

              Please see BUGS section below for problems when using this variable.

EXIT STATUS
       Both programs return 0 on success, and >0 if error occurs.

       However rifiuti-vista is more permissive: it still returns success if some (not all) of index files are invalid.

HISTORY
       Rifiuti2  is  a rewrite of rifiuti, a tool of identical purpose written by Foundstone which was later purchased by McAfee. Quoting from the
       original FoundStone page:

              Many computer crime investigations require the reconstruction of a subject´s Recycle Bin. Since this analysis technique is  executed
              regularly,  we  researched  the  structure of the data found in the Recycle Bin repository files (INFO2 files). Rifiuti, the Italian
              word meaning "trash", was developed to examine the contents of the INFO2 file in the Recycle Bin. ... Rifiuti is built  to  work  on
              multiple platforms and will execute on Windows (through Cygwin), Mac OS X, Linux, and *BSD platforms.

       However, since the original rifiuti (last updated 2004) can´t analyze recycle bin from any localized version of Windows (restricted to Eng‐
       lish), this rewrite effort is born to overcome the limitation. Later rifiuti2 was improved to add support for Vista format recycle bin, XML
       output and other extra features not available from original version.

BUGS
       In  very  special  circumstance  (which  author  can´t reproduce now), index file of certain deleted item can be corrupt, causing incorrect
       deleted file size to be stored. There is no way to report correct size.  This problem shouldn´t happen after Vista though.

       Handling of non-ASCII file argument is not satisfactory; it may not work in certain case under MinGW bash.

       Non-ASCII deleted item path name may not be always displayed appropriately, especially on systems with non-UTF-8 locale  (such  as  Windows
       cmd,  where  output is restricted to ANSI codepages).  Storing UTF-8 result into file with -8 or -x option and then opening it with Unicode
       capable editor could be a solution.

       The calculation of local time might not be correct. For example, documentation of _tzset() function on Windows has this statement:
              The C run-time library assumes the United States´ rules for implementing the calculation of daylight saving time (DST).
       Therefore the time might not be correct in case the files inside recycle bin are produced on Windows using other countries as  region  set‐
       tings. Besides, the difference between standard time and DST is hardcoded to be one hour, which is incorrect for a few selected regions.

       So it is always better to use UTC time whenever possible.

REPORTING BUGS
       Report bugs to

              https://github.com/abelcheung/rifiuti2/issues

       Information about rifiuti2 can be found on

              https://abelcheung.github.io/rifiuti2/

SEE ALSO
       Open Digital Evidence Search and Seizure Architecture project, which contains the original rifiuti tool
              http://odessa.sourceforge.net/

       Forensics tools and other security related utilities originally written by FoundStone are now available under McAfee´s own license.
              http://www.mcafee.com/us/downloads/free-tools/index.aspx

       Vista recycle bin file structure, by Abel Cheung
              http://me.abelcheung.org/wp-content/uploads/2007/09/vista-recycle-bin-sample.pdf

       INFO2 recycle bin file example, by Steve Hailey
              http://www.csisite.net/downloads/INFO2.pdf

COPYRIGHT
       Part of the work of rifiuti2 is derived from Rifiuti.  Both pieces of software are licensed under the simplified BSD license.

AUTHOR
       The main author of rifiuti2 is Abel Cheung <abelcheung@gmail.com>

       The original author of rifiuti is Keith J. Jones <keith.jones@foundstone.com>

       Anthony Wong <ypwong@debian.org> helped in Debian packaging and was author of the original manpage.

0.6.1                                                                May 2015                                                          RIFIUTI2(1)
