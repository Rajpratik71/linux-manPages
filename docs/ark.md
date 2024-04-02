ARK(1)                                                                                        KDE User's Manual                                                                                        ARK(1)



NAME
       ark - KDE archiving tool

SYNOPSIS
       ark [-b] [-a] [-e] [-c] [-f suffix] [-p] [-t file] [-d] [-o directory] [KDE Generic Options] [Qt(TM) Generic Options]

DESCRIPTION
       Ark is a program for managing various compressed file formats within KDE. Archives can be viewed, extracted, created and modified with Ark. The program can handle various formats such as tar, gzip,
       bzip2, zip, rar (when the appropriate libraries or command-line programs are installed).

OPERATION MODES
       Ark can be used either as a stand-alone GUI program as well as a command-line program in order to perform some specific tasks.

       If invoked without the -b (--batch) or -c (--add) options, Ark is started as a normal GUI program.

       When the -b (--batch) option is used, Ark can be used to extract the contents of one or more files directly from the command-line, without launching its GUI.

       When the -c (--add) option is used, Ark prompts for files that should be added to a new archive or to an existing archive.

OPTIONS
       -d, --dialog
           Show a dialog for specifying the options for a batch or add operation.

       -o, --destination directory
           Default the extraction directory to directory. If not passed, the current path is used.

   Options for adding files
       -c, --add
           Query the user for an archive filename and add specified files to it. Quit when finished.

       -t, --add-to filename
           Add the specified files to filename. Create archive if it does not exist. Quit when finished.

       -p, --changetofirstpath
           Change the current directory to the first entry and add all other entries relative to this one.

       -f, --autofilename suffix
           Automatically choose a filename, with the selected suffix (for example rar, tar.gz, zip or any other supported types).

   Options for batch extraction
       b, --batch
           Use the batch interface instead of the usual dialog. This option is implied if more than one url is specified.

       -e, --autodestination
           The destination argument will be set to the path of the first file supplied.

       -a, --autosubfolder
           Archive contents will be read, and if detected to not be a single folder archive, a subfolder by the name of the archive will be created.

EXAMPLES
       ark --batch archive.tar.bz2
           Will extract archive.tar.bz2 into the current directory without showing any GUI.

       ark -b -d archive.tar.bz2 archive2.zip
           Will first show an extraction options dialog and then extract both archive.tar.bz2 and archive2.zip into the directory chosen in the dialog.

       ark --add-to my-archive.zip photo1.jpg text.txt
           Will create my-archive.zip if does not exist and then add photo1.jpg and text.txt to it.

AUTHORS
       Ark is currently maintained by Harald Hvaal<haraldhv@stud.ntnu.no> and Raphael Kubo da Costa<kubito@gmail.com>.

       This man page was first written by Lauri Watts<lauri@kde.org> in 2005 for KDE 3.4, and was later updated in 2009 by Raphael Kubo da Costa<kubito@gmail.com>.

AUTHORS
       Lauri Watts <lauri@kde.org>
           Author.

       Raphael Kubo da Costa <kubito@gmail.com>
           Author.



K Desktop Environment 2.13 (KD                                                                    2009-09-10                                                                                           ARK(1)
