UGET-GTK(1)                                  User Commands                                 UGET-GTK(1)

NAME
       uget-gtk - a download manager that uses gtk+2, and libcurl

SYNOPSIS
       uget-gtk [options] [URL]

DESCRIPTION
   Help Options:
       -?, --help
              Show help options.

       --help-all
              Show all help options.

       --help-gtk
              Show GTK+ Options

   Application Options:
       --quiet
              add download directly. Don't show dialog.

       --category-index=N
              add download to Nth category. (default -1)

       --folder=FOLDER
              placed download file in FOLDER.

       --filename=FILE
              set download filename to FILE.

       --user=USER
              set both ftp and http user to USER.

       --password=PASS
              set both ftp and http password to PASS.

       --proxy-type=N
              set proxy type to N. (0=Don't use)

       --proxy-host=HOST
              set proxy host to HOST.

       --proxy-port=PORT
              set proxy port to PORT.

       --proxy-user=USER
              set USER as proxy username.

       --proxy-password=PASS
              set PASS as proxy password.

       --http-user=USER
              set http user to USER.

       --http-password=PASS
              set http password to PASS.

       --http-referer=URL
              include `Referer: URL' header in HTTP request.

       --http-cookie-data=STRING
              load cookies from STRING.

       --http-cookie-file=FILE
              load cookies from FILE.

       --http-post-data=STRING
              use the POST method; send STRING as the data.

       --http-post-file=FILE
              use the POST method; send contents of FILE

       --ftp-user=USER
              set ftp user to USER.

       --ftp-password=PASS
              set ftp password to PASS.

       --display=DISPLAY
              X display to use

AUTHOR
       uget was written by Raymond Huang <plushuang at users.sourceforge.net>,and this manual page was
       originally written by Dennis Craven <dcraven@gmail.com>

uget-gtk 1.4.9                                 July 2009                                   UGET-GTK(1)
