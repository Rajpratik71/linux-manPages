UNRAR(1)                                                                                        User Commands                                                                                        UNRAR(1)



NAME
       unrar - extract, test, and view RAR archives


SYNOPSIS
       unrar command [option1] [optionN] archive [files...] [@listfiles...] [path_to_extract/]


DESCRIPTION
       The unrar utility is a freeware program distributed with source code and developed for extracting, testing, and viewing the contents of archives created with the RAR archiver.


COMMANDS
       e      Extract files without archived paths.

       l[t[a],b]
              List archive [technical[all],bare].

       p      Print file to stdout.

       t      Test archive files.

       v[t[a],b]
              Verbosely list archive [technical[all],bare].

       x      Extract files with full path.


OPTIONS
       -      Stop switches scanning.

       -@[+]  Disable [enable] file lists.

       -ad    Append archive name to destination path.

       -ai    Ignore file attributes.

       -appath
              Set path inside archive.

       -c-    Disable comments show.

       -cfg-  Disable read configuration.

       -cl    Convert names to lower case.

       -cu    Convert names to upper case.

       -dh    Open shared files.

       -ep    Exclude paths from names.

       -ep3   Expand paths to full including the drive letter.

       -f     Freshen files.

       -id[c,d,p,q]
              Disable messages.

       -ierr  Send all messages to stderr.

       -inul  Disable all messages.

       -kb    Keep broken extracted files.

       -nfile Additionally filter included files.

       -n@    Read additional filter masks from stdin.

       -n@list
              Read additional filter masks from list file.

       -o[+|-]
              Set the overwrite mode [yes|no].

       -or    Rename files automatically.

       -ow    Save or restore file owner and group.

       -p[password]
              Set password.

       -p-    Do not query password.

       -r     Recurse subdirectories.

       -slsize
              Process files with size less than specified.

       -smsize
              Process files with size more than specified.

       -tadate
              Process files modified after date in YYYYMMDDHHMMSS format.

       -tbdate
              Process files modified before date in YYYYMMDDHHMMSS format.

       -tntime
              Process files newer than time.

       -totime
              Process files older than time.

       -ts[m,c,a][N]
              Save or restore file time [modification, creation, access].

       -u     Update files.

       -v     List all volumes.

       -ver[n]
              File version control.

       -vp    Pause before each volume.

       -xfile Exclude specified file.

       -x@    Read file names to exclude from stdin.

       -x@list
              Exclude files listed in specified list file.

       -y     Assume Yes on all queries.


EXIT STATUS
       0      Successful operation.

       1      Warning. Non fatal error(s) occurred.

       2      A fatal error occurred.

       3      Invalid checksum. Data is damaged.

       5      Write error.

       6      File open error.

       7      Wrong command line option.

       8      Not enough memory.

       9      File create error.

       10     No files matching the specified mask and options were found.

       11     Wrong password.

       255    User break.


FILES
       unrar reads configuration from the ~/.rarrc file.

   File syntax:
       switches= option1 option2 ... optionN


SEE ALSO
       rar(1)



unrar 5.0                                                                                         2013-05-28                                                                                         UNRAR(1)
