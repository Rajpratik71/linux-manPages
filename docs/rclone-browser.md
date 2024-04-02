rclone-browser(1)                                             General Commands Manual                                            rclone-browser(1)

NAME
       rclone-browser - cross platfrom GUI for rclone command line tool

SYNOPSIS
       rclone-browser

DESCRIPTION
       This manual page documents briefly the rclone-browser command.

FEATURES
       Allows to browse and modify any rclone remote, including encrypted ones

       Uses same configuration file as rclone, no extra configuration required

       Supports custom location and encryption for .rclone.conf configuration file

       Simultaneously navigate multiple repositories in separate tabs

       Lists files hierarchically with file name, size and modify date

       All rclone commands are executed asynchronously, no freezing GUI

       File hierarchy is lazily cached in memory, for faster traversal of folders

       Allows to upload, download, create new folders, rename or delete files and folders

       Allows to calculate size of folder, export list of files and copy rclone copmmand to clipboard

       Can process multiple upload or download jobs in background

       Drag & drop support for dragging files from local file explorer for uploading

       Streaming media files for playback in player like mpv or similar

       Mount and unmount folders on macOS and GNU/Linux

       Optionally minimizes to tray, with notifications when upload/download finishes

       Supports portable mode (create .ini file next to executable with same name), rclone and .rclone.conf path now can be relative to executable

SEE ALSO
       rclone(1).

                                                                  January 22 2019                                                rclone-browser(1)
