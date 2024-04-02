ncftpbookmarks(1)                      General Commands Manual                      ncftpbookmarks(1)

NAME
       ncftpbookmarks - full screen bookmarks editor for ncftp

SYNOPSIS
       ncftpbookmarks

DESCRIPTION
       ncftpbookmarks is a full-screen bookmark editor for the File Transfer Protocol client ncftp.

       ncftp  can bookmark server name, login name and password of your favorite ftp servers.  ncftp‐
       bookmarks is used to handle these bookmarks.

       This full-screen editor can also be launched from the ncftp prompt with the bookmarks command.

       While using ncftpbookmarks, the screen is divided into two parts.  The left one gives a  brief
       description  of  keyboard  controls.  The right one lists all existing bookmarks.  Up and down
       arrows (or "u" and "d" keys) are used to move the cursor in this list.  The "x" key is used to
       quit the editor.  Other commands have to be typed in full (e.g. /ed, /del).

FILES
       $HOME/.ncftp/bookmarks
              Saves bookmark and host information.

AUTHORS
       Mike Gleason, NcFTP Software (mgleason@ncftp.com).

       This  man page was written by Nicolas Duboc (nicolas@duboc.net) for the Debian distribution of
       the ncftp package.

SEE ALSO
       ncftp(1)

NcFTP Software                                2003-07-09                            ncftpbookmarks(1)
